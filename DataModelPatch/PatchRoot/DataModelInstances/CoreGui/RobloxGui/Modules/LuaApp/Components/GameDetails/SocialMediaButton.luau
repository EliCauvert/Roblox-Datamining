local CorePackages = game:GetService("CorePackages")
local Modules = game:GetService("CoreGui").RobloxGui.Modules
local AppLinking = require(CorePackages.Workspace.Packages.RoactServiceTags).AppLinking
local RoactServices = require(CorePackages.Workspace.Packages.RoactServices).RoactServices
local UseDesignTokens = require(CorePackages.Workspace.Packages.Style).useDesignTokens
local CryoModule = require(CorePackages.Packages.Cryo)
local DiscoveryAnalyticsModule = require(CorePackages.Workspace.Packages.DiscoveryAnalytics)
local SendSocialLinkClickEventFunction = DiscoveryAnalyticsModule.Events.sendSocialLinkClickEvent
local SendOpenLeavingRobloxModalEventFunction = DiscoveryAnalyticsModule.Events.sendOpenLeavingRobloxModalEvent
local SocialMediaTypeModule = require(Modules.LuaApp.Enum.SocialMediaType)
local OpenCentralOverlayForLeaveRobloxAlertModule = require(Modules.LuaApp.Thunks.OpenCentralOverlayForLeaveRobloxAlert)
local CloseCentralOverlayModule = require(Modules.LuaApp.Thunks.CloseCentralOverlay)
local Common = Modules.Common
local ReactModule = require(CorePackages.Packages.React)
local RoactModule = require(Common.Roact)
local RoactRoduxModule = require(Common.RoactRodux)
local WithThemeDEPRECATEDModule = require(Modules.LuaApp.withTheme_DEPRECATED)
local UIBloxModule = require(CorePackages.Packages.UIBlox)
local FFlagRenameDeprecatedUIBloxTokens = require(CorePackages.Workspace.Packages.SharedFlags).FFlagRenameDeprecatedUIBloxTokens
local Images = UIBloxModule.App.ImageSet.Images
local ImageSetButton = UIBloxModule.Core.ImageSet.ImageSetButton
local ImpressionsTagUtility = require(CorePackages.Workspace.Packages.Impressions).ImpressionsTagUtility
local FFlagLuaAppAmazonSocialLinkEdpModule = require(Modules.Personalization.Flags.FFlagLuaAppAmazonSocialLinkEdp)
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
	[SocialMediaTypeModule.Amazon] = if FFlagLuaAppAmazonSocialLinkEdpModule then Images["icons/brands/amazon_simple"] else nil
}
local SocialMediaButton = RoactModule.PureComponent:extend("SocialMediaButton")

function SocialMediaButton.init(p1)
	-- upvalues: FFlagLuaAppAddSocialLinkClickTelemetryToEdp (copy), SendOpenLeavingRobloxModalEventFunction (copy), SocialMediaTypeModule (copy), SendSocialLinkClickEventFunction (copy)
	p1.state = { buttonPressed = false }
	
	function p1:onInputBegan(Input)
		-- upvalues: p1 (copy)
		if Input.UserInputState == Enum.UserInputState.Begin and (Input.UserInputType == Enum.UserInputType.Touch or Input.UserInputType == Enum.UserInputType.MouseButton1) and not p1.state.buttonPressed then
			p1:setState({ buttonPressed = true })
		end
	end
	
	function p1.onInputEnded()
		-- upvalues: p1 (copy)
		if p1.state.buttonPressed then
			p1:setState({ buttonPressed = false })
		end
	end
	
	function p1.onActivated()
		-- upvalues: FFlagLuaAppAddSocialLinkClickTelemetryToEdp (upval), SendOpenLeavingRobloxModalEventFunction (upval), p1 (copy)
		if FFlagLuaAppAddSocialLinkClickTelemetryToEdp then
			SendOpenLeavingRobloxModalEventFunction({
				assignment_type = "game",
				social_link_display_type = "badge",
				assignment_id = tonumber(p1.props.universeId),
				social_link_type = p1.props.socialType
			})
		end
		p1.props.openLeaveRobloxAlertUIBlox(p1.openUrl)
	end
	
	function p1.getUriParams()
		-- upvalues: p1 (copy), SocialMediaTypeModule (upval)
		if p1.props.socialType == SocialMediaTypeModule.Twitter then
			local v1 = p1.props.socialUrl:match("twitter.com/+([a-zA-Z0-9_]+)/*")
			
			if v1 ~= nil then
				return {
					app_uri = "twitter://user?screen_name=" .. v1,
					web_uri = p1.props.socialUrl
				}
			end
		end
		return {
			app_uri = p1.props.socialUrl,
			web_uri = p1.props.socialUrl
		}
	end
	
	function p1.openUrl()
		-- upvalues: FFlagLuaAppAddSocialLinkClickTelemetryToEdp (upval), SendSocialLinkClickEventFunction (upval), p1 (copy)
		if FFlagLuaAppAddSocialLinkClickTelemetryToEdp then
			SendSocialLinkClickEventFunction({
				assignment_type = "game",
				social_link_display_type = "badge",
				assignment_id = tonumber(p1.props.universeId),
				social_link_type = p1.props.socialType,
				social_link_url = p1.props.socialUrl
			})
		end
		local UriParams = p1.getUriParams()
		p1.props.linking:openURL(UriParams.app_uri):andThen(function(Enabled)
			-- upvalues: p1 (upval), UriParams (copy)
			if Enabled == false then
				p1.props.linking:openURL(UriParams.web_uri)
			end
		end)
		p1.props.closeAlert()
	end
end

function SocialMediaButton.render(p1)
	-- upvalues: RoactModule (copy), ImageSetButton (copy), config (copy), FFlagRenameDeprecatedUIBloxTokens (copy), FFlagLuaAppAmazonSocialLinkEdpModule (copy)
	local SocialMediaButton = p1.props.appTheme.GameDetails.SocialMediaButton
	
	return RoactModule.createElement(ImageSetButton, {
		Size = p1.props.Size,
		LayoutOrder = p1.props.LayoutOrder,
		Image = config[p1.props.socialType],
		ImageTransparency = p1.state.buttonPressed and SocialMediaButton.OnPressTransparency or SocialMediaButton.Transparency,
		ImageColor3 = (if FFlagRenameDeprecatedUIBloxTokens then p1.props.designTokens.Color.Shift.Shift_400 else p1.props.designTokens.Semantic.Color.Ui.Emphasis).Color3,
		BorderSizePixel = 0,
		BackgroundTransparency = 1,
		[RoactModule.Event.Activated] = p1.onActivated,
		[RoactModule.Event.InputBegan] = p1.onInputBegan,
		[RoactModule.Event.InputEnded] = p1.onInputEnded,
		[RoactModule.Ref] = if FFlagLuaAppAmazonSocialLinkEdpModule then p1.props.forwardRef else nil
	})
end

local v1 = RoactRoduxModule.connect(function(_) end, function(Callback)
	-- upvalues: OpenCentralOverlayForLeaveRobloxAlertModule (copy), CloseCentralOverlayModule (copy)
	return {
		openLeaveRobloxAlertUIBlox = function(p1)
			-- upvalues: Callback (copy), OpenCentralOverlayForLeaveRobloxAlertModule (upval)
			Callback(OpenCentralOverlayForLeaveRobloxAlertModule(p1))
		end,
		closeAlert = function()
			-- upvalues: Callback (copy), CloseCentralOverlayModule (upval)
			Callback(CloseCentralOverlayModule())
		end
	}
end)((WithThemeDEPRECATEDModule(SocialMediaButton)))

return RoactServices.connect({ linking = AppLinking })(function(p1)
	-- upvalues: UseDesignTokens (copy), FFlagLuaAppAddSocialLinkImpressionsTelemetryToEdp (copy), ReactModule (copy), ImpressionsTagUtility (copy), CryoModule (copy), RoactModule (copy), v1 (copy)
	local DesignTokens = UseDesignTokens()
	local UseRefResult = nil
	
	if FFlagLuaAppAddSocialLinkImpressionsTelemetryToEdp then
		UseRefResult = ReactModule.useRef(nil)
		ReactModule.useEffect(function()
			-- upvalues: ImpressionsTagUtility (upval), UseRefResult (ref), p1 (copy)
			ImpressionsTagUtility.AddTag(UseRefResult, p1.impressionsTag, p1.index)
			
			return function()
				-- upvalues: ImpressionsTagUtility (upval), UseRefResult (upval), p1 (upval)
				ImpressionsTagUtility.RemoveTag(UseRefResult, p1.impressionsTag, p1.index)
			end
		end, { UseRefResult, p1.impressionsTag, p1.index })
	end
	return RoactModule.createElement(v1, (CryoModule.Dictionary.join(p1, {
		designTokens = DesignTokens,
		forwardRef = if FFlagLuaAppAddSocialLinkImpressionsTelemetryToEdp then UseRefResult else nil
	})))
end)