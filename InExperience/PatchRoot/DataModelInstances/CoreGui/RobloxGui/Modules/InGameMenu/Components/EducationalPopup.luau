local GuiService = game:GetService("GuiService")
local RbxAnalyticsService = game:GetService("RbxAnalyticsService")
local InGameMenuDependenciesModule = require(game:GetService("CorePackages").Packages.InGameMenuDependencies)
local Roact = InGameMenuDependenciesModule.Roact
local RoactRodux = InGameMenuDependenciesModule.RoactRodux
local T = InGameMenuDependenciesModule.t
local Images = InGameMenuDependenciesModule.UIBlox.App.ImageSet.Images
local Parent = script.Parent.Parent
local WithLocalizationModule = require(Parent.Localization.withLocalization)
local CloseNativeClosePromptModule = require(Parent.Actions.CloseNativeClosePrompt)
local LeaveGameModule = require(Parent.Utility.LeaveGame)
local EducationalPopupDialogModule = require(script.Parent.EducationalPopupDialog)
local SendAnalyticsModule = require(Parent.Utility.SendAnalytics)
local NotificationTypeList = GuiService:GetNotificationTypeList()
local EducationalPopup = Roact.PureComponent:extend("EducationalPopup")
EducationalPopup.validateProps = T.strictInterface({
	screenSize = T.Vector2,
	onDismiss = T.callback,
	onConfirm = T.callback,
	isClosingApp = T.boolean
})

function EducationalPopup.init(p1) --[[ Line: 39 ]]
	-- upvalues: SendAnalyticsModule (copy), GuiService (copy), NotificationTypeList (copy)
	function p1.onCancel() --[[ Line: 40 ]]
		-- upvalues: SendAnalyticsModule (upval), GuiService (upval), NotificationTypeList (upval)
		SendAnalyticsModule("educational_popup", "educational_close_app", {})
		GuiService:BroadcastNotification("", NotificationTypeList.NATIVE_EXIT)
	end
end

function EducationalPopup.render(p1) --[[ Line: 46 ]]
	-- upvalues: WithLocalizationModule (copy), Roact (copy), EducationalPopupDialogModule (copy), Images (copy)
	return WithLocalizationModule({
		title = "CoreScripts.InGameMenu.ExitModal.Title",
		subtitle = "CoreScripts.InGameMenu.ExitModal.Subtitle",
		bodyTextOpenMenu = "CoreScripts.InGameMenu.ExitModal.BodyTextOpenMenu",
		bodyTextClickHome = "CoreScripts.InGameMenu.ExitModal.BodyTextClickHome",
		actionExit = "CoreScripts.InGameMenu.ExitModal.ActionExit",
		actionHome = "CoreScripts.InGameMenu.ExitModal.ActionHome"
	})(function(p2) --[[ Line: 54 ]]
		-- upvalues: Roact (upval), EducationalPopupDialogModule (upval), Images (upval), p1 (copy)
		return Roact.createElement(EducationalPopupDialogModule, {
			blurBackground = true,
			bodyContents = {
				{ isSystemMenuIcon = true, text = p2.bodyTextOpenMenu },
				{
					icon = Images["icons/menu/home_off"],
					text = p2.bodyTextClickHome
				}
			},
			cancelText = p2.actionExit,
			confirmText = p2.actionHome,
			titleBackgroundImageProps = {
				image = "rbxasset://textures/ui/LuaApp/graphic/Auth/GridBackground_05202026.jpg",
				imageHeight = 200,
				text = "<font face=\"GothamBlack\" size=\"42\">" .. p2.title .. "</font><font size=\"4\"><br /></font><br />" .. p2.subtitle
			},
			screenSize = p1.props.screenSize,
			onDismiss = p1.props.onDismiss,
			onCancel = p1.onCancel,
			onConfirm = p1.props.onConfirm,
			visible = p1.props.isClosingApp
		})
	end)
end

function EducationalPopup.didUpdate(p1) --[[ Line: 86 ]]
	-- upvalues: GuiService (copy)
	GuiService:SetMenuIsOpen(p1.props.isClosingApp, "EducationalPopup")
end

return RoactRodux.UNSTABLE_connect2(function(p1, _) --[[ Line: 91 ]]
	return {
		isClosingApp = p1.nativeClosePrompt.closingApp,
		screenSize = p1.screenSize
	}
end, function(Callback) --[[ Line: 96 ]]
	-- upvalues: CloseNativeClosePromptModule (copy), RbxAnalyticsService (copy), SendAnalyticsModule (copy), LeaveGameModule (copy)
	return {
		onDismiss = function() --[[ Line: 98 ]]
			-- upvalues: Callback (copy), CloseNativeClosePromptModule (upval), RbxAnalyticsService (upval), SendAnalyticsModule (upval)
			Callback(CloseNativeClosePromptModule())
			RbxAnalyticsService:ReportCounter("EducationalPopup_Dismiss", 1)
			SendAnalyticsModule("educational_popup", "educational_dismiss_prompt", {})
		end,
		onConfirm = function() --[[ Line: 103 ]]
			-- upvalues: RbxAnalyticsService (upval), SendAnalyticsModule (upval), LeaveGameModule (upval)
			RbxAnalyticsService:ReportCounter("EducationalPopup_Confirm", 1)
			SendAnalyticsModule("educational_popup", "educational_confirmed", {})
			LeaveGameModule()
		end
	}
end)(EducationalPopup)