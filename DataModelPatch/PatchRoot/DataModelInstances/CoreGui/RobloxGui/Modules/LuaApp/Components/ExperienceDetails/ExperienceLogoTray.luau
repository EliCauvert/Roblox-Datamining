local CorePackages = game:GetService("CorePackages")
local Modules = game:GetService("CoreGui").RobloxGui.Modules
local RoactModule = require(CorePackages.Packages.Roact)
local TModule = require(CorePackages.Packages.t)
local DiscoveryAnalyticsModule = require(CorePackages.Workspace.Packages.DiscoveryAnalytics)
local SendSocialLinkClickEventFunction = DiscoveryAnalyticsModule.Events.sendSocialLinkClickEvent
local SendOpenLeavingRobloxModalEventFunction = DiscoveryAnalyticsModule.Events.sendOpenLeavingRobloxModalEvent
local SocialMediaTypeModule = require(Modules.LuaApp.Enum.SocialMediaType)
local LogoTrayModule = require(script.Parent.LogoTray)
local Images = require(CorePackages.Packages.UIBlox).App.ImageSet.Images
local FFlagLuaAppAddSocialLinkImpressionsTelemetryToEdp = require(CorePackages.Workspace.Packages.SharedFlags).FFlagLuaAppAddSocialLinkImpressionsTelemetryToEdp
local FFlagLuaAppAddSocialLinkClickTelemetryToEdp = require(CorePackages.Workspace.Packages.SharedFlags).FFlagLuaAppAddSocialLinkClickTelemetryToEdp
local config = {
	[SocialMediaTypeModule.Twitter] = Images["icons/brands/x"],
	[SocialMediaTypeModule.Facebook] = Images["icons/brands/facebook"],
	[SocialMediaTypeModule.Discord] = Images["icons/brands/discord"],
	[SocialMediaTypeModule.RobloxGroup] = Images["icons/logo/block"],
	[SocialMediaTypeModule.YouTube] = Images["icons/brands/youtube"],
	[SocialMediaTypeModule.Twitch] = Images["icons/brands/twitch"],
	[SocialMediaTypeModule.Guilded] = Images["icons/brands/guilded"],
	[SocialMediaTypeModule.Amazon] = if require(Modules.Personalization.Flags.FFlagLuaAppAmazonSocialLinkEdp) then Images["icons/brands/amazon_simple"] else nil
}

local function CloseAlert() end

local ExperienceLogoTray = RoactModule.PureComponent:extend("ExperienceLogoTray")
ExperienceLogoTray.validateProps = TModule.strictInterface({
	layoutOrder = TModule.optional(TModule.integer),
	socialLinks = TModule.table,
	linking = TModule.table,
	openLeaveRobloxAlertUIBlox = TModule.callback,
	closeAlert = TModule.callback,
	impressionsTag = if FFlagLuaAppAddSocialLinkImpressionsTelemetryToEdp then TModule.string else nil,
	onAbsolutePositionChanged = if FFlagLuaAppAddSocialLinkImpressionsTelemetryToEdp then TModule.optional(TModule.callback) else nil,
	forwardRef = if FFlagLuaAppAddSocialLinkImpressionsTelemetryToEdp then TModule.optional(TModule.table) else nil,
	universeId = if FFlagLuaAppAddSocialLinkClickTelemetryToEdp then TModule.string else nil
})
ExperienceLogoTray.defaultProps = {
	openLeaveRobloxAlertUIBlox = CloseAlert,
	closeAlert = CloseAlert
}

function ExperienceLogoTray.init(p1)
	-- upvalues: config (copy), FFlagLuaAppAddSocialLinkClickTelemetryToEdp (copy), SendSocialLinkClickEventFunction (copy), SocialMediaTypeModule (copy), SendOpenLeavingRobloxModalEventFunction (copy)
	function p1.createItems(SocialLinks)
		-- upvalues: config (upval)
		local List = {}
		local Urls = {}
		
		for _, socialLink in ipairs(SocialLinks) do
			local Type = socialLink.type
			
			if config[Type] ~= nil then
				table.insert(List, { key = Type, logo = config[Type] })
				Urls[Type] = socialLink.url
			end
		end
		return List, Urls
	end
	
	local function _(Social_link_type, Social_link_url)
		-- upvalues: FFlagLuaAppAddSocialLinkClickTelemetryToEdp (upval), SendSocialLinkClickEventFunction (upval), p1 (copy), SocialMediaTypeModule (upval)
		return function()
			-- upvalues: FFlagLuaAppAddSocialLinkClickTelemetryToEdp (upval), SendSocialLinkClickEventFunction (upval), p1 (upval), Social_link_type (copy), Social_link_url (copy), SocialMediaTypeModule (upval)
			if FFlagLuaAppAddSocialLinkClickTelemetryToEdp then
				SendSocialLinkClickEventFunction({
					assignment_type = "game",
					social_link_display_type = "badge",
					assignment_id = tonumber(p1.props.universeId),
					social_link_type = Social_link_type,
					social_link_url = Social_link_url
				})
			end
			local Social_link_url: string = Social_link_url
			
			if Social_link_type == SocialMediaTypeModule.Twitter then
				local v1 = Social_link_url:match("twitter.com/+([a-zA-Z0-9_]+)/*")
				
				if v1 ~= nil then
					Social_link_url = "twitter://user?screen_name=" .. v1
				end
			end
			local Linking = p1.props.linking
			Linking:openURL(Social_link_url):andThen(function(Enabled)
				-- upvalues: Linking (copy), Social_link_url (upval)
				if Enabled == false then
					Linking:openURL(Social_link_url)
				end
			end)
			p1.props.closeAlert()
		end
	end
	
	function p1.getItemClickCallback(p2)
		-- upvalues: FFlagLuaAppAddSocialLinkClickTelemetryToEdp (upval), SendOpenLeavingRobloxModalEventFunction (upval), p1 (copy), SendSocialLinkClickEventFunction (upval), SocialMediaTypeModule (upval)
		return function(Social_link_type)
			-- upvalues: p2 (copy), FFlagLuaAppAddSocialLinkClickTelemetryToEdp (upval), SendOpenLeavingRobloxModalEventFunction (upval), p1 (upval), SendSocialLinkClickEventFunction (upval), SocialMediaTypeModule (upval)
			local Social_link_url = p2[Social_link_type]
			
			if FFlagLuaAppAddSocialLinkClickTelemetryToEdp then
				SendOpenLeavingRobloxModalEventFunction({
					assignment_type = "game",
					social_link_display_type = "badge",
					assignment_id = tonumber(p1.props.universeId),
					social_link_type = Social_link_type
				})
			end
			p1.props.openLeaveRobloxAlertUIBlox(function()
				-- upvalues: FFlagLuaAppAddSocialLinkClickTelemetryToEdp (upval), SendSocialLinkClickEventFunction (upval), p1 (upval), Social_link_type (copy), Social_link_url (copy), SocialMediaTypeModule (upval)
				if FFlagLuaAppAddSocialLinkClickTelemetryToEdp then
					SendSocialLinkClickEventFunction({
						assignment_type = "game",
						social_link_display_type = "badge",
						assignment_id = tonumber(p1.props.universeId),
						social_link_type = Social_link_type,
						social_link_url = Social_link_url
					})
				end
				local Social_link_url: string = Social_link_url
				
				if Social_link_type == SocialMediaTypeModule.Twitter then
					local v1 = Social_link_url:match("twitter.com/+([a-zA-Z0-9_]+)/*")
					
					if v1 ~= nil then
						Social_link_url = "twitter://user?screen_name=" .. v1
					end
				end
				local Linking = p1.props.linking
				Linking:openURL(Social_link_url):andThen(function(Enabled)
					-- upvalues: Linking (copy), Social_link_url (upval)
					if Enabled == false then
						Linking:openURL(Social_link_url)
					end
				end)
				p1.props.closeAlert()
			end)
		end
	end
end

function ExperienceLogoTray.render(p2)
	-- upvalues: RoactModule (copy), LogoTrayModule (copy), FFlagLuaAppAddSocialLinkImpressionsTelemetryToEdp (copy)
	local Items, Items2 = p2.createItems(p2.props.socialLinks)
	
	return RoactModule.createElement(LogoTrayModule, {
		layoutOrder = 1,
		itemList = Items,
		handleItemClick = p2.getItemClickCallback(Items2),
		impressionsTag = if FFlagLuaAppAddSocialLinkImpressionsTelemetryToEdp then p2.props.impressionsTag else nil,
		onAbsolutePositionChanged = if FFlagLuaAppAddSocialLinkImpressionsTelemetryToEdp then p2.props.onAbsolutePositionChanged else nil,
		forwardRef = if FFlagLuaAppAddSocialLinkImpressionsTelemetryToEdp then p2.props.forwardRef else nil
	})
end

return ExperienceLogoTray