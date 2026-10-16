local CoreGui = game:GetService("CoreGui")
local ContextActionService = game:GetService("ContextActionService")
local RobloxGui = CoreGui:WaitForChild("RobloxGui")
local GuiService = game:GetService("GuiService")
local RunService = game:GetService("RunService")
local CorePackages = game:GetService("CorePackages")
local LocalizationService = game:GetService("LocalizationService")
local Players = game:GetService("Players")
local SharedFlags = CorePackages.Workspace.Packages.SharedFlags
local GetFFlagGateEducationalPopupVisibilityViaGUACFunction = require(SharedFlags).GetFFlagGateEducationalPopupVisibilityViaGUAC
local InExperienceCapabilities = require(CorePackages.Workspace.Packages.InExperienceCapabilities).InExperienceCapabilities
local IsSideSheetEnabledModule = require(CorePackages.Workspace.Packages.InExperienceSideSheetUtils.isSideSheetEnabled)
local FFlagSurvBloxEventTypeEnabled = require(SharedFlags).FFlagSurvBloxEventTypeEnabled
local ToggleSideSheet = if IsSideSheetEnabledModule then require(CorePackages.Workspace.Packages.InExperienceSideSheet).toggleSideSheet else nil
local NotificationTypeList = GuiService:GetNotificationTypeList()
local RoactModule = require(CorePackages.Packages.Roact)
local LinkingProtocol = require(CorePackages.Workspace.Packages.LinkingProtocol).LinkingProtocol
local Localization = require(CorePackages.Workspace.Packages.InExperienceLocales).Localization
local SendAnalyticsModule = require(RobloxGui.Modules.InGameMenu.Utility.SendAnalytics)
local UserLocalStoreModule = require(RobloxGui.Modules.InGameMenu.Utility.UserLocalStore)
local GetDefaultQualityLevelFunction = require(CorePackages.Workspace.Packages.AppCommonLib).GetDefaultQualityLevel
local SurveyEventPublisherModule = require(CorePackages.Workspace.Packages.OnPlatformSurveys.SurveyEventPublisher)
local WebViewEventTypeModule = require(CorePackages.Workspace.Packages.OnPlatformSurveys.WebViewEventType)
local MessageBus = require(CorePackages.Workspace.Packages.MessageBus).MessageBus
local UIBlox = require(CorePackages.Packages.InGameMenuDependencies).UIBlox
local Images = UIBlox.App.ImageSet.Images
local EducationalModal = UIBlox.App.Dialog.Modal.EducationalModal
local RenderWithCoreScriptsStyleProviderModule = require(RobloxGui.Modules.Common.renderWithCoreScriptsStyleProvider)
local v1 = nil
local ConstantsModule = require(RobloxGui.Modules:WaitForChild("InGameMenu"):WaitForChild("Resources"):WaitForChild("Constants"))
local GetFIntEducationalPopupDisplayMaxCountModule = require(RobloxGui.Modules.Flags.GetFIntEducationalPopupDisplayMaxCount)
v1 = (function() --[[ Line: 79 | Named "Initialize" ]]
	-- upvalues: RobloxGui (copy), GuiService (copy), SendAnalyticsModule (copy), RunService (copy), GetDefaultQualityLevelFunction (copy), NotificationTypeList (copy), LinkingProtocol (copy), v1 (ref), UserLocalStoreModule (copy), GetFIntEducationalPopupDisplayMaxCountModule (copy), Localization (copy), LocalizationService (copy), RoactModule (copy), EducationalModal (copy), Images (copy), CoreGui (copy), FFlagSurvBloxEventTypeEnabled (copy), SurveyEventPublisherModule (copy), WebViewEventTypeModule (copy), Players (copy), MessageBus (copy), ConstantsModule (copy), RenderWithCoreScriptsStyleProviderModule (copy)
	local NewPage = require(RobloxGui.Modules.Settings.SettingsPageFactory):CreateNewPage()
	
	function NewPage.LeaveAppFunc(p1) --[[ Line: 83 ]]
		-- upvalues: GuiService (upval), SendAnalyticsModule (upval), RunService (upval), GetDefaultQualityLevelFunction (upval), NotificationTypeList (upval)
		GuiService.SelectedCoreObject = nil
		SendAnalyticsModule("educational_popup", "educational_close_app", { source = if p1 then "Native" else "Button" })
		RunService.RenderStepped:wait()
		RunService.RenderStepped:wait()
		settings().Rendering.QualityLevel = GetDefaultQualityLevelFunction()
		GuiService:BroadcastNotification("", NotificationTypeList.NATIVE_EXIT)
	end
	
	function NewPage.LeaveGameFunc(IsUserInputTypeMatch) --[[ Line: 100 ]]
		-- upvalues: GuiService (upval), SendAnalyticsModule (upval), LinkingProtocol (upval), RunService (upval), GetDefaultQualityLevelFunction (upval)
		GuiService.SelectedCoreObject = nil
		SendAnalyticsModule("educational_popup", "educational_confirmed", {
			source = if IsUserInputTypeMatch then "Gamepad" else "Button"
		})
		LinkingProtocol.default:detectURL("roblox://navigation/home")
		RunService.RenderStepped:wait()
		RunService.RenderStepped:wait()
		game:Shutdown()
		settings().Rendering.QualityLevel = GetDefaultQualityLevelFunction()
	end
	
	function NewPage:LeaveGameFromHotkey(UserInputState, Input) --[[ Line: 119 ]]
		-- upvalues: NewPage (copy)
		if UserInputState == Enum.UserInputState.Begin then
			NewPage.LeaveGameFunc(Input.UserInputType == Enum.UserInputType.Gamepad1 or (Input.UserInputType == Enum.UserInputType.Gamepad2 or (Input.UserInputType == Enum.UserInputType.Gamepad3 or Input.UserInputType == Enum.UserInputType.Gamepad4)))
		end
	end
	
	function NewPage.DontLeaveFunc(IsUserInputTypeMatch) --[[ Line: 129 ]]
		-- upvalues: v1 (upval), NewPage (copy)
		v1.dismissedFrom = if IsUserInputTypeMatch then "Gamepad" else "Button"
		
		if NewPage.HubRef then
			NewPage.HubRef:PopMenu(IsUserInputTypeMatch, true)
		end
	end
	
	function NewPage:DontLeaveFromHotkey(UserInputState, Input) --[[ Line: 136 ]]
		-- upvalues: NewPage (copy)
		if UserInputState == Enum.UserInputState.Begin then
			NewPage.DontLeaveFunc(Input.UserInputType == Enum.UserInputType.Gamepad1 or (Input.UserInputType == Enum.UserInputType.Gamepad2 or (Input.UserInputType == Enum.UserInputType.Gamepad3 or Input.UserInputType == Enum.UserInputType.Gamepad4)))
		end
	end
	
	function NewPage.DontShowAgain() --[[ Line: 147 ]]
		-- upvalues: UserLocalStoreModule (upval)
		local NewUserLocalStore = UserLocalStoreModule.new()
		NewUserLocalStore:SetItem("NativeCloseLuaPromptDisplayCount", (tostring(1e999)))
		NewUserLocalStore:Flush()
	end
	
	function NewPage.ShouldShow(): boolean --[[ Line: 154 ]]
		-- upvalues: UserLocalStoreModule (upval), GetFIntEducationalPopupDisplayMaxCountModule (upval)
		local NewUserLocalStore = UserLocalStoreModule.new()
		local Number: number? = tonumber(NewUserLocalStore:GetItem("NativeCloseLuaPromptDisplayCount"))
		
		if GetFIntEducationalPopupDisplayMaxCountModule() < Number then
			return false
		else
			NewUserLocalStore:SetItem("NativeCloseLuaPromptDisplayCount", (tostring(Number + 1)))
			NewUserLocalStore:Flush()
			
			return true
		end
	end
	
	NewPage.TabHeader = nil
	NewPage.Page.Name = "ExitModalPage"
	NewPage.ShouldShowBottomBar = false
	NewPage.ShouldShowHubBar = false
	NewPage.IsPageClipped = false
	NewPage.Page.Size = UDim2.new(1, 0, 0, 1)
	local NewLocalization = Localization.new(LocalizationService.RobloxLocaleId)
	
	local function ExitModal() --[[ Line: 182 ]]
		-- upvalues: NewLocalization (copy), LocalizationService (upval), RoactModule (upval), EducationalModal (upval), Images (upval), CoreGui (upval), NewPage (copy), FFlagSurvBloxEventTypeEnabled (upval), SurveyEventPublisherModule (upval), WebViewEventTypeModule (upval), Players (upval), MessageBus (upval), ConstantsModule (upval), RenderWithCoreScriptsStyleProviderModule (upval)
		NewLocalization:SetLocale(LocalizationService.RobloxLocaleId)
		local config = {
			title = NewLocalization:Format("CoreScripts.InGameMenu.ExitModal.Title"),
			subtitle = NewLocalization:Format("CoreScripts.InGameMenu.ExitModal.Subtitle"),
			bodyTextOpenMenu = NewLocalization:Format("CoreScripts.InGameMenu.ExitModal.BodyTextOpenMenu"),
			bodyTextClickHome = NewLocalization:Format("CoreScripts.InGameMenu.ExitModal.BodyTextClickHome"),
			optionDontShow = NewLocalization:Format("CoreScripts.InGameMenu.ExitModal.OptionDontShow"),
			actionExit = NewLocalization:Format("CoreScripts.InGameMenu.ExitModal.ActionExit"),
			actionHome = NewLocalization:Format("CoreScripts.InGameMenu.ExitModal.ActionHome")
		}
		
		return RenderWithCoreScriptsStyleProviderModule({
			RoactModule.createElement(EducationalModal, {
				hasDoNotShow = true,
				bodyContents = {
					{ isSystemMenuIcon = true, text = config.bodyTextOpenMenu },
					{
						icon = Images["icons/menu/home_off"],
						text = config.bodyTextClickHome
					}
				},
				cancelText = config.actionExit,
				confirmText = config.actionHome,
				doNotShowText = config.optionDontShow,
				titleBackgroundImageProps = {
					image = "rbxasset://textures/ui/LuaApp/graphic/Auth/GridBackground_05202026.jpg",
					imageHeight = 200,
					text = "<font face=\"GothamBlack\" size=\"42\">" .. config.title .. "</font><font size=\"4\"><br /></font><br />" .. config.subtitle
				},
				screenSize = CoreGui.RobloxGui.AbsoluteSize,
				onDismiss = function() --[[ Line: 218 ]]
					-- upvalues: NewPage (upval)
					NewPage.DontLeaveFunc(false)
				end,
				onCancel = function(p1) --[[ Line: 221 ]]
					-- upvalues: NewPage (upval)
					if p1 then
						NewPage.DontShowAgain()
					end
					NewPage.LeaveAppFunc(false)
				end,
				onConfirm = function(p1) --[[ Line: 227 ]]
					-- upvalues: NewPage (upval), FFlagSurvBloxEventTypeEnabled (upval), SurveyEventPublisherModule (upval), WebViewEventTypeModule (upval), Players (upval), MessageBus (upval), ConstantsModule (upval)
					if p1 then
						NewPage.DontShowAgain()
					end
					NewPage.LeaveGameFunc(false)
					
					if FFlagSurvBloxEventTypeEnabled then
						SurveyEventPublisherModule.publishSurveyEvent(WebViewEventTypeModule.LeaveButtonClick)
						
						return
					else
						MessageBus.publish(ConstantsModule.OnSurveyEventDescriptor, {
							eventType = ConstantsModule.SurveyEventType,
							userId = tostring(Players.LocalPlayer.UserId),
							customProps = { chromeSeenCount = tostring(0) }
						})
					end
				end
			})
		})
	end
	
	local ExitModal1 = RoactModule.mount(ExitModal(), NewPage.Page, "ExitModal")
	local Flag = false
	
	local function Callback() --[[ Line: 255 ]]
		-- upvalues: Flag (ref), ExitModal1 (ref), RoactModule (upval), ExitModal (copy)
		if not Flag then
			Flag = true
			task.delay(1, function() --[[ Line: 258 ]]
				-- upvalues: Flag (upval), ExitModal1 (upval), RoactModule (upval), ExitModal (upval)
				Flag = false
				ExitModal1 = RoactModule.update(ExitModal1, ExitModal())
			end)
		end
	end
	
	LocalizationService:GetPropertyChangedSignal("RobloxLocaleId"):Connect(Callback)
	CoreGui.RobloxGui:GetPropertyChangedSignal("AbsoluteSize"):Connect(Callback)
	
	return NewPage
end)()
v1.Displayed.Event:connect(function() --[[ Line: 273 ]]
	-- upvalues: v1 (ref), GetFFlagGateEducationalPopupVisibilityViaGUACFunction (copy), InExperienceCapabilities (copy), ContextActionService (copy), IsSideSheetEnabledModule (copy), ToggleSideSheet (ref)
	if not v1.ShouldShow() or GetFFlagGateEducationalPopupVisibilityViaGUACFunction() and not InExperienceCapabilities.canViewEducationalPopup then
		v1.LeaveAppFunc(true)
	end
	v1.dismissedFrom = "Menu"
	ContextActionService:BindCoreAction("LeaveGameAction", v1.LeaveGameFromHotkey, false, Enum.KeyCode.ButtonA)
	ContextActionService:BindCoreAction("DontLeaveAction", v1.DontLeaveFromHotkey, false, Enum.KeyCode.ButtonB)
	
	if IsSideSheetEnabledModule then
		ToggleSideSheet(false)
	end
end)
v1.Hidden.Event:connect(function() --[[ Line: 300 ]]
	-- upvalues: v1 (ref), SendAnalyticsModule (copy), ContextActionService (copy)
	if v1.dismissedFrom then
		SendAnalyticsModule("educational_popup", "educational_dismiss_prompt", { source = v1.dismissedFrom })
		v1.dismissedFrom = nil
	end
	ContextActionService:UnbindCoreAction("LeaveGameAction")
	ContextActionService:UnbindCoreAction("DontLeaveAction")
end)

return v1