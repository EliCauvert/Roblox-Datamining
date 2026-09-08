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
local isSideSheetEnabledModule = require(corePackagesService.Workspace.Packages.InExperienceSideSheetUtils.isSideSheetEnabled)
local fFlagSurvBloxEventTypeEnabled = require(sharedFlags).FFlagSurvBloxEventTypeEnabled
local var1 = if isSideSheetEnabledModule then require(corePackagesService.Workspace.Packages.InExperienceSideSheet).toggleSideSheet else nil
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
local var2 = nil
local constantsModule = require(robloxGui.Modules:WaitForChild("InGameMenu"):WaitForChild("Resources"):WaitForChild("Constants"))
local getFIntEducationalPopupDisplayMaxCountModule = require(robloxGui.Modules.Flags.GetFIntEducationalPopupDisplayMaxCount)
var2 = (function()
	-- upvalues: robloxGui (ref), guiService (ref), sendAnalyticsModule (ref), runService (ref), getDefaultQualityLevel (ref), notificationTypeList (ref), linkingProtocol (ref), var2 (write), userLocalStoreModule (ref), getFIntEducationalPopupDisplayMaxCountModule (ref), localization (ref), localizationService (ref), roactModule (ref), educationalModal (ref), images (ref), coreGuiService (ref), fFlagSurvBloxEventTypeEnabled (ref), surveyEventPublisherModule (ref), webViewEventTypeModule (ref), playersService (ref), messageBus (ref), constantsModule (ref), renderWithCoreScriptsStyleProviderModule (ref)
	local exitModalPage = require(robloxGui.Modules.Settings.SettingsPageFactory):CreateNewPage()
	
	function exitModalPage.LeaveAppFunc(p1)
		-- upvalues: guiService (copy), sendAnalyticsModule (copy), runService (copy), getDefaultQualityLevel (copy), notificationTypeList (copy)
		guiService.SelectedCoreObject = nil
		sendAnalyticsModule("educational_popup", "educational_close_app", { source = if p1 then "Native" else "Button" })
		runService.RenderStepped:wait()
		runService.RenderStepped:wait()
		settings().Rendering.QualityLevel = getDefaultQualityLevel()
		guiService:BroadcastNotification("", notificationTypeList.NATIVE_EXIT)
	end
	
	function exitModalPage.LeaveGameFunc(p1)
		-- upvalues: guiService (copy), sendAnalyticsModule (copy), linkingProtocol (copy), runService (copy), getDefaultQualityLevel (copy)
		guiService.SelectedCoreObject = nil
		sendAnalyticsModule("educational_popup", "educational_confirmed", { source = if p1 then "Gamepad" else "Button" })
		linkingProtocol.default:detectURL("roblox://navigation/home")
		runService.RenderStepped:wait()
		runService.RenderStepped:wait()
		game:Shutdown()
		settings().Rendering.QualityLevel = getDefaultQualityLevel()
	end
	
	function exitModalPage.LeaveGameFromHotkey(_, p1, p2)
		-- upvalues: exitModalPage (ref)
		if p1 == Enum.UserInputState.Begin then
			exitModalPage.LeaveGameFunc(if p2.UserInputType ~= Enum.UserInputType.Gamepad1 then if p2.UserInputType ~= Enum.UserInputType.Gamepad2 then if p2.UserInputType ~= Enum.UserInputType.Gamepad3 then p2.UserInputType == Enum.UserInputType.Gamepad4 else true else true else true)
		end
	end
	
	function exitModalPage.DontLeaveFunc(p1)
		-- upvalues: var2 (copy), exitModalPage (ref)
		var2.dismissedFrom = if p1 then "Gamepad" else "Button"
		
		if exitModalPage.HubRef then
			exitModalPage.HubRef:PopMenu(p1, true)
		end
	end
	
	function exitModalPage.DontLeaveFromHotkey(_, p1, p2)
		-- upvalues: exitModalPage (ref)
		if p1 == Enum.UserInputState.Begin then
			exitModalPage.DontLeaveFunc(if p2.UserInputType ~= Enum.UserInputType.Gamepad1 then if p2.UserInputType ~= Enum.UserInputType.Gamepad2 then if p2.UserInputType ~= Enum.UserInputType.Gamepad3 then p2.UserInputType == Enum.UserInputType.Gamepad4 else true else true else true)
		end
	end
	
	function exitModalPage.DontShowAgain()
		-- upvalues: userLocalStoreModule (copy)
		local var3 = userLocalStoreModule.new()
		var3:SetItem("NativeCloseLuaPromptDisplayCount", tostring(1e999))
		var3:Flush()
	end
	
	function exitModalPage.ShouldShow()
		-- upvalues: userLocalStoreModule (copy), getFIntEducationalPopupDisplayMaxCountModule (copy)
		local var3 = userLocalStoreModule.new()
		local var4 = tonumber(var3:GetItem("NativeCloseLuaPromptDisplayCount"))
		
		if getFIntEducationalPopupDisplayMaxCountModule() < var4 then
			return false
		end
		var3:SetItem("NativeCloseLuaPromptDisplayCount", tostring(var4 + 1))
		var3:Flush()
		
		return true
	end
	
	exitModalPage.TabHeader = nil
	exitModalPage.Page.Name = "ExitModalPage"
	exitModalPage.ShouldShowBottomBar = false
	exitModalPage.ShouldShowHubBar = false
	exitModalPage.IsPageClipped = false
	exitModalPage.Page.Size = UDim2.new(1, 0, 0, 1)
	local var3 = localization.new(localizationService.RobloxLocaleId)
	
	local function ExitModal()
		-- upvalues: var3 (ref), localizationService (copy), roactModule (copy), educationalModal (copy), images (copy), coreGuiService (copy), exitModalPage (ref), fFlagSurvBloxEventTypeEnabled (copy), surveyEventPublisherModule (copy), webViewEventTypeModule (copy), playersService (copy), messageBus (copy), constantsModule (copy), renderWithCoreScriptsStyleProviderModule (copy)
		var3:SetLocale(localizationService.RobloxLocaleId)
		local t = {
			title = var3:Format("CoreScripts.InGameMenu.ExitModal.Title"),
			subtitle = var3:Format("CoreScripts.InGameMenu.ExitModal.Subtitle"),
			bodyTextOpenMenu = var3:Format("CoreScripts.InGameMenu.ExitModal.BodyTextOpenMenu"),
			bodyTextClickHome = var3:Format("CoreScripts.InGameMenu.ExitModal.BodyTextClickHome"),
			optionDontShow = var3:Format("CoreScripts.InGameMenu.ExitModal.OptionDontShow"),
			actionExit = var3:Format("CoreScripts.InGameMenu.ExitModal.ActionExit"),
			actionHome = var3:Format("CoreScripts.InGameMenu.ExitModal.ActionHome")
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
				onDismiss = function()
					-- upvalues: exitModalPage (copy)
					exitModalPage.DontLeaveFunc(false)
				end,
				onCancel = function(p1)
					-- upvalues: exitModalPage (copy)
					if p1 then
						exitModalPage.DontShowAgain()
					end
					exitModalPage.LeaveAppFunc(false)
				end,
				onConfirm = function(p1)
					-- upvalues: exitModalPage (copy), fFlagSurvBloxEventTypeEnabled (copy), surveyEventPublisherModule (copy), webViewEventTypeModule (copy), playersService (copy), messageBus (copy), constantsModule (copy)
					if p1 then
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
	local var4 = false
	
	local var5 = function()
		-- upvalues: var4 (write), exitModal (write), roactModule (copy), ExitModal (ref)
		if not var4 then
			var4 = true
			task.delay(1, function()
				-- upvalues: var4 (copy), exitModal (copy), roactModule (copy), ExitModal (copy)
				var4 = false
				exitModal = roactModule.update(exitModal, ExitModal())
			end)
		end
	end
	
	localizationService:GetPropertyChangedSignal("RobloxLocaleId"):Connect(var5)
	coreGuiService.RobloxGui:GetPropertyChangedSignal("AbsoluteSize"):Connect(var5)
	
	return exitModalPage
end)()
var2.Displayed.Event:connect(function()
	-- upvalues: var2 (write), getFFlagGateEducationalPopupVisibilityViaGUAC (ref), inExperienceCapabilities (ref), contextActionService (ref), isSideSheetEnabledModule (ref), var1 (write)
	if not var2.ShouldShow() or getFFlagGateEducationalPopupVisibilityViaGUAC() and not inExperienceCapabilities.canViewEducationalPopup then
		var2.LeaveAppFunc(true)
	end
	var2.dismissedFrom = "Menu"
	contextActionService:BindCoreAction("LeaveGameAction", var2.LeaveGameFromHotkey, false, Enum.KeyCode.ButtonA)
	contextActionService:BindCoreAction("DontLeaveAction", var2.DontLeaveFromHotkey, false, Enum.KeyCode.ButtonB)
	
	if isSideSheetEnabledModule then
		var1(false)
	end
end)
var2.Hidden.Event:connect(function()
	-- upvalues: var2 (write), sendAnalyticsModule (ref), contextActionService (ref)
	if var2.dismissedFrom then
		sendAnalyticsModule("educational_popup", "educational_dismiss_prompt", { source = var2.dismissedFrom })
		var2.dismissedFrom = nil
	end
	contextActionService:UnbindCoreAction("LeaveGameAction")
	contextActionService:UnbindCoreAction("DontLeaveAction")
end)

return var2