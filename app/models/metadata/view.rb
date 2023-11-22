class Metadata::View
  def self.retrieve_from(view)
    new(view)
  end

  def initialize(view)
    @browser = Browser.new(view.user_agent)
    @ip      = view.ip
  end

  def attributes
    browser_attributes.merge(ip_attributes)
  end

  def browser_attributes
    {
      browser: @browser.name,
      browser_version: @browser.version,
      device: @browser.device.name,
      platform: @browser.platform.name,
      platform_version: @browser.platform.version,
      bot: @browser.bot?
    }
  end

  def ip_attributes
    data = Geocoder.search(@ip).first&.data
    {
      city: data["city"],
      region: data["region"],
      country: data["country"],
      loc: data["loc"],
      timezone: data["timezone"]
    }
  end
end
