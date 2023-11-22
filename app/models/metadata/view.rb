class Metadata::View
  def self.retrieve_from(user_agent)
    new(user_agent)
  end

  def initialize(user_agent)
    @browser = Browser.new(user_agent)
  end

  def attributes
    {
      browser: @browser.name,
      browser_version: @browser.version,
      device: @browser.device.name,
      platform: @browser.platform.name,
      platform_version: @browser.platform.version,
      bot: @browser.bot?
    }
  end
end
