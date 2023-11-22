class Metadata::View
  def self.retrieve_from(view)
    new(view)
  end

  def initialize(view)
    @browser = Browser.new(view.user_agent)
    @ip      = view.ip
  end

  def attributes
    {
      browser: @browser.name,
      browser_version: @browser.version,
      device: @browser.device.name,
      platform: @browser.platform.name,
      platform_version: @browser.platform.version,
      bot: @browser.bot?,
      ip_data: ip_data
    }
  end

  def ip_data
    Geocoder.search(@ip).first&.data
  rescue
    {}
  end
end
