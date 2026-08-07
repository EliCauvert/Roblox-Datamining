local guiService = game:GetService("GuiService")
local rbxAnalyticsService = game:GetService("RbxAnalyticsService")
local inGameMenuDependenciesModule = require(game:GetService("CorePackages").Packages.InGameMenuDependencies)
local roact = inGameMenuDependenciesModule.Roact
local roactRodux = inGameMenuDependenciesModule.RoactRodux
local t = inGameMenuDependenciesModule.t
local images = inGameMenuDependenciesModule.UIBlox.App.ImageSet.Images
local parent = script.Parent.Parent
local withLocalizationModule = require(parent.Localization.withLocalization)
local closeNativeClosePromptModule = require(parent.Actions.CloseNativeClosePrompt)
local leaveGameModule = require(parent.Utility.LeaveGame)
local educationalPopupDialogModule = require(script.Parent.EducationalPopupDialog)
local sendAnalyticsModule = require(parent.Utility.SendAnalytics)
local notificationTypeList = guiService:GetNotificationTypeList()
local _ = {
	EventContext = "educational_popup",
	ConfirmName = "educational_confirmed",
	CancelName = "educational_close_app",
	DismissName = "educational_dismiss_prompt"
}
local educationalPopup = roact.PureComponent:extend("EducationalPopup")
educationalPopup.validateProps = t.strictInterface({
	screenSize = t.Vector2,
	onDismiss = t.callback,
	onConfirm = t.callback,
	isClosingApp = t.boolean
})

function educationalPopup.init(p0) --[[ line: 39 ]]
	-- upvalues: sendAnalyticsModule (ref), guiService (ref), notificationTypeList (ref)
	function p0.onCancel() --[[ line: 40 ]]
		-- upvalues: sendAnalyticsModule (copy), guiService (copy), notificationTypeList (copy)
		sendAnalyticsModule("educational_popup", "educational_close_app", {})
		guiService:BroadcastNotification("", notificationTypeList.NATIVE_EXIT)
	end
end

function educationalPopup.render(p1) --[[ line: 46 ]]
	-- upvalues: withLocalizationModule (ref), roact (ref), educationalPopupDialogModule (ref), images (ref)
	return withLocalizationModule({
		title = "CoreScripts.InGameMenu.ExitModal.Title",
		subtitle = "CoreScripts.InGameMenu.ExitModal.Subtitle",
		bodyTextOpenMenu = "CoreScripts.InGameMenu.ExitModal.BodyTextOpenMenu",
		bodyTextClickHome = "CoreScripts.InGameMenu.ExitModal.BodyTextClickHome",
		actionExit = "CoreScripts.InGameMenu.ExitModal.ActionExit",
		actionHome = "CoreScripts.InGameMenu.ExitModal.ActionHome"
	})(function(p2) --[[ line: 54 ]]
		-- upvalues: roact (copy), educationalPopupDialogModule (copy), images (copy), p1 (ref)
		return roact.createElement(educationalPopupDialogModule, {
			blurBackground = true,
			bodyContents = {
				{ isSystemMenuIcon = true, text = p2.bodyTextOpenMenu },
				{
					icon = images["icons/menu/home_off"],
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

function educationalPopup.didUpdate(p3) --[[ line: 86 ]]
	-- upvalues: guiService (ref)
	guiService:SetMenuIsOpen(p3.props.isClosingApp, "EducationalPopup")
end

return roactRodux.UNSTABLE_connect2(function(p4, _) --[[ line: 91 ]]
	return {
		isClosingApp = p4.nativeClosePrompt.closingApp,
		screenSize = p4.screenSize
	}
end, function(p5) --[[ line: 96 ]]
	-- upvalues: closeNativeClosePromptModule (ref), rbxAnalyticsService (ref), sendAnalyticsModule (ref), leaveGameModule (ref)
	return {
		onDismiss = function() --[[ line: 98 ]]
			-- upvalues: p5 (ref), closeNativeClosePromptModule (copy), rbxAnalyticsService (copy), sendAnalyticsModule (copy)
			p5(closeNativeClosePromptModule())
			rbxAnalyticsService:ReportCounter("EducationalPopup_Dismiss", 1)
			sendAnalyticsModule("educational_popup", "educational_dismiss_prompt", {})
		end,
		onConfirm = function() --[[ line: 103 ]]
			-- upvalues: rbxAnalyticsService (copy), sendAnalyticsModule (copy), leaveGameModule (copy)
			rbxAnalyticsService:ReportCounter("EducationalPopup_Confirm", 1)
			sendAnalyticsModule("educational_popup", "educational_confirmed", {})
			leaveGameModule()
		end
	}
end)(educationalPopup)