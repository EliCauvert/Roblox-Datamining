local _ = {
	EventContext = "educational_popup",
	ConfirmName = "educational_confirmed",
	CancelName = "educational_close_app",
	DismissName = "educational_dismiss_prompt"
}
local coreGuiService = game:GetService("CoreGui")
local contextActionService = game:GetService("ContextActionService")
local robloxGui = coreGuiService:WaitForChild("RobloxGui")
local guiService = game:GetService("GuiService")
local runService = game:GetService("RunService")
local corePackagesService = game:GetService("CorePackages")
local localizationService = game:GetService("LocalizationService")
local playersService = game:GetService("Players")
local sharedFlags = corePackagesService.Workspace.Packages.SharedFlags
local getFFlagGateEducationalPopupVisibilityViaGUAC = require(sharedFlags).GetFFlagGateEducationalPopupVisibilityViaGUAC
local inExperienceCapabilities = require(corePackagesService.Workspace.Packages.InExperienceCapabilities).InExperienceCapabilities
local fFlagEnableSideSheet = require(sharedFlags).FFlagEnableSideSheet
local fFlagSurvBloxEventTypeEnabled = require(sharedFlags).FFlagSurvBloxEventTypeEnabled
local var8 = if fFlagEnableSideSheet then require(corePackagesService.Workspace.Packages.InExperienceSideSheet).toggleSideSheet else nil
local notificationTypeList = guiService:GetNotificationTypeList()
local roactModule = require(corePackagesService.Packages.Roact)
local linkingProtocol = require(corePackagesService.Workspace.Packages.LinkingProtocol).LinkingProtocol
local localization = require(corePackagesService.Workspace.Packages.InExperienceLocales).Localization
local sendAnalyticsModule = require(robloxGui.Modules.InGameMenu.Utility.SendAnalytics)
local userLocalStoreModule = require(robloxGui.Modules.InGameMenu.Utility.UserLocalStore)
local getDefaultQualityLevel = require(corePackagesService.Workspace.Packages.AppCommonLib).GetDefaultQualityLevel
local surveyEventPublisherModule = require(corePackagesService.Workspace.Packages.OnPlatformSurveys.SurveyEventPublisher)
local webViewEventTypeModule = require(corePackagesService.Workspace.Packages.OnPlatformSurveys.WebViewEventType)
local messageBus = require(corePackagesService.Workspace.Packages.MessageBus).MessageBus
local UIBlox = require(corePackagesService.Packages.InGameMenuDependencies).UIBlox
local images = UIBlox.App.ImageSet.Images
local educationalModal = UIBlox.App.Dialog.Modal.EducationalModal
local renderWithCoreScriptsStyleProviderModule = require(robloxGui.Modules.Common.renderWithCoreScriptsStyleProvider)
local var16 = nil
local constantsModule = require(robloxGui.Modules:WaitForChild("InGameMenu"):WaitForChild("Resources"):WaitForChild("Constants"))
local getFIntEducationalPopupDisplayMaxCountModule = require(robloxGui.Modules.Flags.GetFIntEducationalPopupDisplayMaxCount)
var16 = (function() --[[ line: 79 | named "Initialize" ]]
	-- upvalues: robloxGui (ref), guiService (ref), sendAnalyticsModule (ref), runService (ref), getDefaultQualityLevel (ref), notificationTypeList (ref), linkingProtocol (ref), var16 (write), userLocalStoreModule (ref), getFIntEducationalPopupDisplayMaxCountModule (ref), localization (ref), localizationService (ref), roactModule (ref), educationalModal (ref), images (ref), coreGuiService (ref), fFlagSurvBloxEventTypeEnabled (ref), surveyEventPublisherModule (ref), webViewEventTypeModule (ref), playersService (ref), messageBus (ref), constantsModule (ref), renderWithCoreScriptsStyleProviderModule (ref)
	local exitModalPage = require(robloxGui.Modules.Settings.SettingsPageFactory):CreateNewPage()
	
	function exitModalPage.LeaveAppFunc(p0) --[[ line: 83 ]]
		-- upvalues: guiService (copy), sendAnalyticsModule (copy), runService (copy), getDefaultQualityLevel (copy), notificationTypeList (copy)
		guiService.SelectedCoreObject = nil
		sendAnalyticsModule("educational_popup", "educational_close_app", { source = if p0 then "Native" else "Button" })
		runService.RenderStepped:wait()
		runService.RenderStepped:wait()
		settings().Rendering.QualityLevel = getDefaultQualityLevel()
		guiService:BroadcastNotification("", notificationTypeList.NATIVE_EXIT)
	end
	
	function exitModalPage.LeaveGameFunc(p1) --[[ line: 100 ]]
		-- upvalues: guiService (copy), sendAnalyticsModule (copy), linkingProtocol (copy), runService (copy), getDefaultQualityLevel (copy)
		guiService.SelectedCoreObject = nil
		sendAnalyticsModule("educational_popup", "educational_confirmed", { source = if p1 then "Gamepad" else "Button" })
		linkingProtocol.default:detectURL("roblox://navigation/home")
		runService.RenderStepped:wait()
		runService.RenderStepped:wait()
		game:Shutdown()
		settings().Rendering.QualityLevel = getDefaultQualityLevel()
	end
	
	function exitModalPage.LeaveGameFromHotkey(_, p2, p3) --[[ line: 119 ]]
		-- upvalues: exitModalPage (ref)
		if p2 == Enum.UserInputState.Begin then
			exitModalPage.LeaveGameFunc(if p3.UserInputType ~= Enum.UserInputType.Gamepad1 then if p3.UserInputType ~= Enum.UserInputType.Gamepad2 then if p3.UserInputType ~= Enum.UserInputType.Gamepad3 then p3.UserInputType == Enum.UserInputType.Gamepad4 else true else true else true)
		end
	end
	
	function exitModalPage.DontLeaveFunc(p4) --[[ line: 129 ]]
		-- upvalues: var16 (copy), exitModalPage (ref)
		var16.dismissedFrom = if p4 then "Gamepad" else "Button"
		
		if exitModalPage.HubRef then
			exitModalPage.HubRef:PopMenu(p4, true)
		end
	end
	
	function exitModalPage.DontLeaveFromHotkey(_, p5, p6) --[[ line: 136 ]]
		-- upvalues: exitModalPage (ref)
		if p5 == Enum.UserInputState.Begin then
			exitModalPage.DontLeaveFunc(if p6.UserInputType ~= Enum.UserInputType.Gamepad1 then if p6.UserInputType ~= Enum.UserInputType.Gamepad2 then if p6.UserInputType ~= Enum.UserInputType.Gamepad3 then p6.UserInputType == Enum.UserInputType.Gamepad4 else true else true else true)
		end
	end
	
	function exitModalPage.DontShowAgain() --[[ line: 147 ]]
		-- upvalues: userLocalStoreModule (copy)
		local var25 = userLocalStoreModule.new()
		var25:SetItem("NativeCloseLuaPromptDisplayCount", tostring(1e999))
		var25:Flush()
	end
	
	function exitModalPage.ShouldShow() --[[ line: 154 ]]
		-- upvalues: userLocalStoreModule (copy), getFIntEducationalPopupDisplayMaxCountModule (copy)
		local var26 = userLocalStoreModule.new()
		local var27 = tonumber(var26:GetItem("NativeCloseLuaPromptDisplayCount"))
		
		if getFIntEducationalPopupDisplayMaxCountModule() < var27 then
			return false
		end
		var26:SetItem("NativeCloseLuaPromptDisplayCount", tostring(var27 + 1))
		var26:Flush()
		
		return true
	end
	
	exitModalPage.TabHeader = nil
	exitModalPage.Page.Name = "ExitModalPage"
	exitModalPage.ShouldShowBottomBar = false
	exitModalPage.ShouldShowHubBar = false
	exitModalPage.IsPageClipped = false
	exitModalPage.Page.Size = UDim2.new(1, 0, 0, 1)
	local var20 = localization.new(localizationService.RobloxLocaleId)
	
	local function ExitModal() --[[ line: 182 ]]
		-- upvalues: var20 (ref), localizationService (copy), roactModule (copy), educationalModal (copy), images (copy), coreGuiService (copy), exitModalPage (ref), fFlagSurvBloxEventTypeEnabled (copy), surveyEventPublisherModule (copy), webViewEventTypeModule (copy), playersService (copy), messageBus (copy), constantsModule (copy), renderWithCoreScriptsStyleProviderModule (copy)
		var20:SetLocale(localizationService.RobloxLocaleId)
		local t = {
			title = var20:Format("CoreScripts.InGameMenu.ExitModal.Title"),
			subtitle = var20:Format("CoreScripts.InGameMenu.ExitModal.Subtitle"),
			bodyTextOpenMenu = var20:Format("CoreScripts.InGameMenu.ExitModal.BodyTextOpenMenu"),
			bodyTextClickHome = var20:Format("CoreScripts.InGameMenu.ExitModal.BodyTextClickHome"),
			optionDontShow = var20:Format("CoreScripts.InGameMenu.ExitModal.OptionDontShow"),
			actionExit = var20:Format("CoreScripts.InGameMenu.ExitModal.ActionExit"),
			actionHome = var20:Format("CoreScripts.InGameMenu.ExitModal.ActionHome")
		}
		
		return renderWithCoreScriptsStyleProviderModule({
			roactModule.createElement(educationalModal, {
				hasDoNotShow = true,
				bodyContents = {
					{ isSystemMenuIcon = true, text = t.bodyTextOpenMenu },
					{
						icon = images["icons/menu/home_off"],
						text = t.bodyTextClickHome
					}
				},
				cancelText = t.actionExit,
				confirmText = t.actionHome,
				doNotShowText = t.optionDontShow,
				titleBackgroundImageProps = {
					image = "rbxasset://textures/ui/LuaApp/graphic/Auth/GridBackground_05202026.jpg",
					imageHeight = 200,
					text = "<font face=\"GothamBlack\" size=\"42\">" .. t.title .. "</font><font size=\"4\"><br /></font><br />" .. t.subtitle
				},
				screenSize = coreGuiService.RobloxGui.AbsoluteSize,
				onDismiss = function() --[[ line: 218 ]]
					-- upvalues: exitModalPage (copy)
					exitModalPage.DontLeaveFunc(false)
				end,
				onCancel = function(p7) --[[ line: 221 ]]
					-- upvalues: exitModalPage (copy)
					if p7 then
						exitModalPage.DontShowAgain()
					end
					exitModalPage.LeaveAppFunc(false)
				end,
				onConfirm = function(p8) --[[ line: 227 ]]
					-- upvalues: exitModalPage (copy), fFlagSurvBloxEventTypeEnabled (copy), surveyEventPublisherModule (copy), webViewEventTypeModule (copy), playersService (copy), messageBus (copy), constantsModule (copy)
					if p8 then
						exitModalPage.DontShowAgain()
					end
					exitModalPage.LeaveGameFunc(false)
					
					if fFlagSurvBloxEventTypeEnabled then
						surveyEventPublisherModule.publishSurveyEvent(webViewEventTypeModule.LeaveButtonClick)
						
						return
					end
					messageBus.publish(constantsModule.OnSurveyEventDescriptor, {
						eventType = constantsModule.SurveyEventType,
						userId = tostring(playersService.LocalPlayer.UserId),
						customProps = { chromeSeenCount = tostring(0) }
					})
				end
			})
		})
	end
	
	local exitModal = roactModule.mount(ExitModal(), exitModalPage.Page, "ExitModal")
	local var23 = false
	
	local var24 = function() --[[ line: 255 ]]
		-- upvalues: var23 (write), exitModal (write), roactModule (copy), ExitModal (ref)
		if not var23 then
			var23 = true
			task.delay(1, function() --[[ line: 258 ]]
				-- upvalues: var23 (copy), exitModal (copy), roactModule (copy), ExitModal (copy)
				var23 = false
				exitModal = roactModule.update(exitModal, ExitModal())
			end)
		end
	end
	
	localizationService:GetPropertyChangedSignal("RobloxLocaleId"):Connect(var24)
	coreGuiService.RobloxGui:GetPropertyChangedSignal("AbsoluteSize"):Connect(var24)
	
	return exitModalPage
end)()
var16.Displayed.Event:connect(function() --[[ line: 273 ]]
	-- upvalues: var16 (write), getFFlagGateEducationalPopupVisibilityViaGUAC (ref), inExperienceCapabilities (ref), contextActionService (ref), fFlagEnableSideSheet (ref), var8 (write)
	if not var16.ShouldShow() or getFFlagGateEducationalPopupVisibilityViaGUAC() and not inExperienceCapabilities.canViewEducationalPopup then
		var16.LeaveAppFunc(true)
	end
	var16.dismissedFrom = "Menu"
	contextActionService:BindCoreAction("LeaveGameAction", var16.LeaveGameFromHotkey, false, Enum.KeyCode.ButtonA)
	contextActionService:BindCoreAction("DontLeaveAction", var16.DontLeaveFromHotkey, false, Enum.KeyCode.ButtonB)
	
	if fFlagEnableSideSheet then
		var8(false)
	end
end)
var16.Hidden.Event:connect(function() --[[ line: 300 ]]
	-- upvalues: var16 (write), sendAnalyticsModule (ref), contextActionService (ref)
	if var16.dismissedFrom then
		sendAnalyticsModule("educational_popup", "educational_dismiss_prompt", { source = var16.dismissedFrom })
		var16.dismissedFrom = nil
	end
	contextActionService:UnbindCoreAction("LeaveGameAction")
	contextActionService:UnbindCoreAction("DontLeaveAction")
end)

return var16