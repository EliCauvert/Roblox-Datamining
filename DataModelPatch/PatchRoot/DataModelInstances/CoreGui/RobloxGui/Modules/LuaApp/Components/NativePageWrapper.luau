local HttpService = game:GetService("HttpService")
local CorePackages = game:GetService("CorePackages")
local Modules = game:GetService("CoreGui").RobloxGui.Modules
local RoactModule = require(CorePackages.Packages.Roact)
local WithStyleFunction = require(CorePackages.Packages.UIBlox).Style.withStyle
local ArgCheckModule = require(Modules.LuaApp.ArgCheck)
local AppEventIngestServiceModule = require(Modules.LuaApp.Services.AppEventIngestService)
local ConstantsModule = require(Modules.LuaApp.Constants)
local RoactServices = require(CorePackages.Workspace.Packages.RoactServices).RoactServices
local AppGuiService = require(CorePackages.Workspace.Packages.RoactServiceTags).AppGuiService
local TopBarModule = require(Modules.LuaApp.Components.TopBar.TopBar)
local RoactAppPolicy = require(CorePackages.Workspace.Packages.UniversalAppPolicy).RoactAppPolicy
local RoactNavigationModule = require(CorePackages.Packages.RoactNavigation)
local AppNotificationService = require(CorePackages.Workspace.Packages.RoactServiceTags).AppNotificationService
local IsVRAppBuildFunction = require(CorePackages.Workspace.Packages.AppCommonLib).IsVRAppBuild
local WithLocalizationFunction = require(CorePackages.Workspace.Packages.Localization).withLocalization
local GetFFlagEnableLocalizedWebViewFallbackTextModule = require(Modules.LuaApp.Flags.GetFFlagEnableLocalizedWebViewFallbackText)
local config = {
	canNativeWrapperParentHandleBackNavigation = require(Modules.LuaApp.Flags.GetFFlagLuaAppCanNativeWrapperParentHandleBackNavigation)
}
local NativePageWrapper = RoactModule.PureComponent:extend("NativePageWrapper")
NativePageWrapper.defaultProps = { DisplayOrder = 0 }

function NativePageWrapper.init(p1)
	-- upvalues: config (copy)
	p1._appInputEventConnection = p1.props.appNotificationService.RobloxEventReceived:Connect(function(EventData)
		-- upvalues: p1 (copy), config (upval)
		local Navigation = p1.props.navigation
		
		if p1._isMounted and Navigation ~= nil and EventData.namespace == "AppInput" and EventData.detailType == "Focused" then
			if config.canNativeWrapperParentHandleBackNavigation() and p1.props.backNavigationHandledByParent then return end
			Navigation.goBack()
		end
	end)
end

function NativePageWrapper.render(p1)
	-- upvalues: ArgCheckModule (copy), GetFFlagEnableLocalizedWebViewFallbackTextModule (copy), WithLocalizationFunction (copy), WithStyleFunction (copy), ConstantsModule (copy), RoactModule (copy), HttpService (copy), TopBarModule (copy), IsVRAppBuildFunction (copy)
	local NotificationData = p1.props.notificationData
	ArgCheckModule.isNonNegativeNumber(p1.props.DisplayOrder, "NativePageWrapper:DisplayOrder")
	
	return if GetFFlagEnableLocalizedWebViewFallbackTextModule() then WithLocalizationFunction({
		warningText = "CommonUI.Messages.Label.ActionNotAvailableOnVRHeadsetDevice"
	})(function(p2)
		-- upvalues: WithStyleFunction (upval), ConstantsModule (upval), p1 (copy), RoactModule (upval), HttpService (upval), NotificationData (copy), TopBarModule (upval), IsVRAppBuildFunction (upval)
		return WithStyleFunction(function(p3)
			-- upvalues: ConstantsModule (upval), p1 (upval), RoactModule (upval), HttpService (upval), NotificationData (upval), TopBarModule (upval), IsVRAppBuildFunction (upval), p2 (copy)
			local GRAY1 = ConstantsModule.Color.GRAY1
			local Transparency = 0.5
			
			if p3 then
				GRAY1 = p3.Theme.Overlay.Color
				Transparency = p3.Theme.Overlay.Transparency
			end
			if p1.props.allowWebviews then
				return RoactModule.createElement("Frame", {
					BackgroundColor3 = GRAY1,
					BackgroundTransparency = Transparency
				}, {
					button = RoactModule.createElement("TextButton", {
						Text = "press",
						Size = UDim2.fromScale(0.5, 0.5),
						Position = UDim2.fromScale(0.5, 0.5),
						AnchorPoint = Vector2.new(0.5, 0.5)
					})
				})
			end
			local Success, Result = pcall(function()
				-- upvalues: HttpService (upval), NotificationData (upval)
				return HttpService:JSONDecode(NotificationData)
			end)
			local Title = Success and typeof(Result) == "table" and Result.title or p1.props.titleText
			local GRAY4 = ConstantsModule.Color.GRAY4
			local Transparency1 = 0.5
			
			if p3 then
				GRAY4 = p3.Theme.BackgroundDefault.Color
				Transparency1 = p3.Theme.BackgroundDefault.Transparency
			end
			p1.props.eventIngest:sendEventDeferred("open_disabled_web_view", "open_disabled_web_view_action", { pageName = Title })
			
			return RoactModule.createElement("Frame", {
				Size = UDim2.new(1, 0, 1, 0),
				BackgroundColor3 = GRAY4,
				BackgroundTransparency = Transparency1
			}, {
				TopBar = RoactModule.createElement(TopBarModule.Container, {
					titleText = Title,
					leftItem = if IsVRAppBuildFunction() then TopBarModule.makeBackButton(nil, true) else TopBarModule.BackButton
				}),
				WarningText = RoactModule.createElement("TextLabel", {
					TextWrapped = true,
					Text = p2.warningText,
					Size = UDim2.new(1, 0, 1, 0),
					TextColor3 = p3.Theme.TextDefault.Color,
					TextSize = p3.Font.BaseSize,
					BackgroundColor3 = p3.Theme.BackgroundUIDefault.Color
				})
			})
		end)
	end) else WithStyleFunction(function(p2)
		-- upvalues: ConstantsModule (upval), p1 (copy), RoactModule (upval), HttpService (upval), NotificationData (copy), TopBarModule (upval), IsVRAppBuildFunction (upval)
		local GRAY1 = ConstantsModule.Color.GRAY1
		local Transparency = 0.5
		
		if p2 then
			GRAY1 = p2.Theme.Overlay.Color
			Transparency = p2.Theme.Overlay.Transparency
		end
		if p1.props.allowWebviews then
			return RoactModule.createElement("Frame", {
				BackgroundColor3 = GRAY1,
				BackgroundTransparency = Transparency
			}, {
				button = RoactModule.createElement("TextButton", {
					Text = "press",
					Size = UDim2.fromScale(0.5, 0.5),
					Position = UDim2.fromScale(0.5, 0.5),
					AnchorPoint = Vector2.new(0.5, 0.5)
				})
			})
		end
		local Success, Result = pcall(function()
			-- upvalues: HttpService (upval), NotificationData (upval)
			return HttpService:JSONDecode(NotificationData)
		end)
		local Title = Success and typeof(Result) == "table" and Result.title or p1.props.titleText
		local GRAY4 = ConstantsModule.Color.GRAY4
		local Transparency1 = 0.5
		
		if p2 then
			GRAY4 = p2.Theme.BackgroundDefault.Color
			Transparency1 = p2.Theme.BackgroundDefault.Transparency
		end
		p1.props.eventIngest:sendEventDeferred("open_disabled_web_view", "open_disabled_web_view_action", { pageName = Title })
		
		return RoactModule.createElement("Frame", {
			Size = UDim2.new(1, 0, 1, 0),
			BackgroundColor3 = GRAY4,
			BackgroundTransparency = Transparency1
		}, {
			TopBar = RoactModule.createElement(TopBarModule.Container, {
				titleText = Title,
				leftItem = if IsVRAppBuildFunction() then TopBarModule.makeBackButton(nil, true) else TopBarModule.BackButton
			}),
			WarningText = RoactModule.createElement("TextLabel", {
				Text = "Error: this functionality is currently unavailable on your device.",
				TextWrapped = true,
				Size = UDim2.new(1, 0, 1, 0),
				TextColor3 = p2.Theme.TextDefault.Color,
				TextSize = p2.Font.BaseSize,
				BackgroundColor3 = p2.Theme.BackgroundUIDefault.Color
			})
		})
	end)
end

function NativePageWrapper.didUpdate(p1, p2)
	if not p2.isVisible then
		p1:broadcastNotification()
	end
end

function NativePageWrapper.didMount(p1)
	p1._isMounted = true
	p1:broadcastNotification()
end

function NativePageWrapper.willUnmount(p1)
	p1._isMounted = false
	
	if p1._appInputEventConnection then
		p1._appInputEventConnection:disconnect()
		p1._appInputEventConnection = nil
	end
	if p1.props.onClose ~= nil then
		p1.props.onClose()
	end
end

function NativePageWrapper.broadcastNotification(p1)
	-- upvalues: HttpService (copy)
	if not p1.props.allowWebviews then return end
	local IsVisible = p1.props.isVisible
	local NotificationData = p1.props.notificationData
	
	if game:GetEngineFeature("SetWebViewTitle") and NotificationData == nil then
		NotificationData = HttpService:JSONEncode({
			title = p1.props.titleText,
			url = p1.props.url,
			transitionAnimation = p1.props.transitionAnimation,
			animated = p1.props.animated
		})
	end
	local NotificationType = p1.props.notificationType
	local GuiService = p1.props.guiService
	
	if IsVisible and NotificationData ~= nil and NotificationType ~= nil then
		GuiService:BroadcastNotification(NotificationData, NotificationType)
	end
end

return RoactAppPolicy.connect(function(p1, _)
	return { allowWebviews = p1.getWebViewSupport() }
end)((RoactNavigationModule.withNavigation((RoactServices.connect({
	guiService = AppGuiService,
	appNotificationService = AppNotificationService,
	eventIngest = AppEventIngestServiceModule
})(NativePageWrapper)))))