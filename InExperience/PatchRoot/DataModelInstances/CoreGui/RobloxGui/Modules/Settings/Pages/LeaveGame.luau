local CorePackages = game:GetService("CorePackages")
local ContextActionService = game:GetService("ContextActionService")
local RobloxGui = game:GetService("CoreGui"):WaitForChild("RobloxGui")
local RbxAnalyticsService = game:GetService("RbxAnalyticsService")
local LocalizationService = game:GetService("LocalizationService")
local UtilityModule = require(RobloxGui.Modules.Settings.Utility)
local LeaveGameModule = require(RobloxGui.Modules.Settings.leaveGame)
local ReactModule = require(CorePackages.Packages.React)
local ReactRobloxModule = require(CorePackages.Packages.ReactRoblox)
local ReactFocusNavigationModule = require(CorePackages.Packages.ReactFocusNavigation)
local UseFocusGuiObjectFunction = ReactFocusNavigationModule.useFocusGuiObject
local ResponsiveModule = require(CorePackages.Workspace.Packages.Responsive)
local Input = ResponsiveModule.Input
local UseLastInputFunction = ResponsiveModule.useLastInput
local Localization = require(CorePackages.Workspace.Packages.InExperienceLocales).Localization
local LocalizationModule = require(CorePackages.Workspace.Packages.Localization)
local LocalizationProvider = LocalizationModule.LocalizationProvider
local UseLocalizationFunction = LocalizationModule.Hooks.useLocalization
local FoundationModule = require(CorePackages.Packages.Foundation)
local EnabledResult = require(CorePackages.Workspace.Packages.Chrome).Enabled()
local ServiceModule = if EnabledResult then require(RobloxGui.Modules.Chrome.Service) else nil
local ConstantsModule = if EnabledResult then require(RobloxGui.Modules.Chrome.ChromeShared.Unibar.Constants) else nil
local SharedFlagsModule = require(CorePackages.Workspace.Packages.SharedFlags)
local v1 = nil
RobloxGui:WaitForChild("Modules"):WaitForChild("TenFootInterface")
local FFlagResponsiveUnitsDeprecateTenFoot = SharedFlagsModule.FFlagResponsiveUnitsDeprecateTenFoot
local NoFFlagResponsiveUnitsDeprecateTenFoot: boolean = require(RobloxGui.Modules.TenFootInterface):IsEnabled() and not FFlagResponsiveUnitsDeprecateTenFoot
local RbxAnalyticsServiceExposePlaySessionIdEngineFeature = game:GetEngineFeature("RbxAnalyticsServiceExposePlaySessionId")
local FFlagEnableConsoleExpControls = SharedFlagsModule.FFlagEnableConsoleExpControls
local FFlagChromeShortcutRemoveRespawnOnLeavePage = SharedFlagsModule.FFlagChromeShortcutRemoveRespawnOnLeavePage
local IsPioneerLaunchFunction = require(CorePackages.Workspace.Packages.PioneerUtils).isPioneerLaunch
local PioneerLeaveReason = require(CorePackages.Workspace.Packages.PioneerUtils).PioneerLeaveReason
local FFlagPioneerLeaveLogsOut = SharedFlagsModule.FFlagPioneerLeaveLogsOut
local FFlagConfirmationButtonsUseGreyButtonsModule = require(RobloxGui.Modules.Settings.Flags.FFlagConfirmationButtonsUseGreyButtons)
local FFlagLeaveGameButtonKeepsFocusWhileLeavingModule = require(RobloxGui.Modules.Settings.Flags.FFlagLeaveGameButtonKeepsFocusWhileLeaving)
local ConstantsModule1 = require(RobloxGui.Modules:WaitForChild("InGameMenu"):WaitForChild("Resources"):WaitForChild("Constants"))
local InExperienceSideSheetModule = require(CorePackages.Workspace.Packages.InExperienceSideSheet)
local LocalizationKeys = InExperienceSideSheetModule.Constants.LocalizationKeys
local FFlagPioneerLogoutButtonLabel = InExperienceSideSheetModule.Flags.FFlagPioneerLogoutButtonLabel
local NewResult = ReactFocusNavigationModule.FocusNavigationService.new(ReactFocusNavigationModule.EngineInterface.CoreGui)
local FoundationProvider = FoundationModule.FoundationProvider
local Button = FoundationModule.Button
local ButtonVariant = FoundationModule.Enums.ButtonVariant
local InputSize = FoundationModule.Enums.InputSize
local Text = FoundationModule.Text
local View = FoundationModule.View

local function LeaveButtonsContainer(p1)
	-- upvalues: ReactModule (copy), FFlagLeaveGameButtonKeepsFocusWhileLeavingModule (copy), UseLastInputFunction (copy), UseFocusGuiObjectFunction (copy), UseLocalizationFunction (copy), IsPioneerLaunchFunction (copy), FFlagPioneerLeaveLogsOut (copy), LocalizationKeys (copy), FFlagPioneerLogoutButtonLabel (copy), ConstantsModule1 (copy), Input (copy), LeaveGameModule (copy), PioneerLeaveReason (copy), UtilityModule (copy), View (copy), NoFFlagResponsiveUnitsDeprecateTenFoot (copy), Text (copy), Button (copy), InputSize (copy), FFlagConfirmationButtonsUseGreyButtonsModule (copy), ButtonVariant (copy)
	local UseRefResult = ReactModule.useRef(nil)
	local v2 = nil
	local Callback = nil
	
	if FFlagLeaveGameButtonKeepsFocusWhileLeavingModule then
		v2, Callback = ReactModule.useState(false)
	end
	local UseRefResult1 = if FFlagLeaveGameButtonKeepsFocusWhileLeavingModule then ReactModule.useRef(false) else nil
	
	local function _(Current)
		-- upvalues: UseRefResult1 (copy), Callback (ref)
		UseRefResult1.current = Current
		Callback(Current)
	end
	
	local UseLastInputResult = UseLastInputFunction()
	local UseFocusGuiObjectResult = UseFocusGuiObjectFunction()
	local UseLocalizationResult = UseLocalizationFunction({
		ConfirmLeaveGame = if IsPioneerLaunchFunction() and not FFlagPioneerLeaveLogsOut then LocalizationKeys.QuitConfirmation elseif FFlagPioneerLogoutButtonLabel and IsPioneerLaunchFunction() and FFlagPioneerLeaveLogsOut then LocalizationKeys.LogoutConfirmation else ConstantsModule1.ConfirmLeaveGameLocalizedKey,
		LeaveGame = if IsPioneerLaunchFunction() and not FFlagPioneerLeaveLogsOut then LocalizationKeys.QuitButton elseif FFlagPioneerLogoutButtonLabel and IsPioneerLaunchFunction() and FFlagPioneerLeaveLogsOut then LocalizationKeys.LogoutButton else ConstantsModule1.LeaveGameLocalizedKey,
		DontLeaveGame = if IsPioneerLaunchFunction() and not FFlagPioneerLeaveLogsOut then LocalizationKeys.Resume else ConstantsModule1.DontLeaveGameLocalizedKey
	})
	local ConfirmLeaveGame = UseLocalizationResult.ConfirmLeaveGame
	local LeaveGame = UseLocalizationResult.LeaveGame
	ReactModule.useEffect(function()
		-- upvalues: UseLastInputResult (copy), Input (upval), UseFocusGuiObjectResult (copy), UseRefResult (copy)
		if UseLastInputResult == Input.Touch then
			UseFocusGuiObjectResult(nil)
			
			return
		else
			UseFocusGuiObjectResult(UseRefResult.current)
		end
	end, { UseLastInputResult, UseFocusGuiObjectResult })
	
	if FFlagLeaveGameButtonKeepsFocusWhileLeavingModule then
		local SetShowLeavingFunction = p1.setShowLeaving
		ReactModule.useEffect(function()
			-- upvalues: SetShowLeavingFunction (copy), UseRefResult1 (copy), Callback (ref), UseFocusGuiObjectResult (copy), UseRefResult (copy)
			if SetShowLeavingFunction then
				SetShowLeavingFunction(function(Current): boolean
					-- upvalues: UseRefResult1 (upval), Callback (upval), UseFocusGuiObjectResult (upval), UseRefResult (upval)
					if Current and UseRefResult1.current then
						return false
					end
					UseRefResult1.current = Current
					Callback(Current)
					
					if Current then
						UseFocusGuiObjectResult(UseRefResult.current)
					end
					return true
				end)
				
				return function()
					-- upvalues: SetShowLeavingFunction (upval)
					SetShowLeavingFunction(nil)
				end
			else
				return nil
			end
		end, { SetShowLeavingFunction, UseFocusGuiObjectResult })
	end
	return ReactModule.createElement(View, {
		tag = "size-full-0 auto-y col",
		Position = UDim2.new(0, 0, 0, if NoFFlagResponsiveUnitsDeprecateTenFoot then 100 else 0)
	}, {
		LeaveGameText = ReactModule.createElement(Text, {
			LayoutOrder = 1,
			Text = ConfirmLeaveGame,
			Size = UDim2.new(1, 0, 0, if UtilityModule:IsSmallTouchScreen() then 100 else 200),
			tag = {
				["text-wrap"] = true,
				["text-heading-medium"] = not UtilityModule:IsSmallTouchScreen() and not NoFFlagResponsiveUnitsDeprecateTenFoot,
				["text-heading-small"] = UtilityModule:IsSmallTouchScreen(),
				["text-heading-large"] = NoFFlagResponsiveUnitsDeprecateTenFoot
			}
		}),
		LeaveButtonsContainer = ReactModule.createElement(View, {
			LayoutOrder = 2,
			tag = "size-full-0 auto-y row align-x-center gap-xlarge wrap"
		}, {
			LeaveGameButton = ReactModule.createElement(Button, {
				LayoutOrder = 1,
				text = LeaveGame,
				size = InputSize.Large,
				variant = if FFlagConfirmationButtonsUseGreyButtonsModule then ButtonVariant.Standard else ButtonVariant.SoftEmphasis,
				width = UDim.new(0, if NoFFlagResponsiveUnitsDeprecateTenFoot then 300 else 200),
				ref = UseRefResult,
				onActivated = ReactModule.useCallback(function()
					-- upvalues: FFlagLeaveGameButtonKeepsFocusWhileLeavingModule (upval), UseRefResult1 (copy), Callback (ref), FFlagPioneerLeaveLogsOut (upval), IsPioneerLaunchFunction (upval), LeaveGameModule (upval), PioneerLeaveReason (upval)
					if FFlagLeaveGameButtonKeepsFocusWhileLeavingModule then
						if UseRefResult1.current then return end
						UseRefResult1.current = true
						Callback(true)
					end
					if FFlagPioneerLeaveLogsOut and IsPioneerLaunchFunction() then
						LeaveGameModule(false, {
							inhibitAppRating = true,
							leaveReason = PioneerLeaveReason.Logout,
							keepSelection = if FFlagLeaveGameButtonKeepsFocusWhileLeavingModule then true else nil
						})
					elseif IsPioneerLaunchFunction() then
						LeaveGameModule(false, {
							shouldNativeExit = true,
							keepSelection = if FFlagLeaveGameButtonKeepsFocusWhileLeavingModule then true else nil
						})
					else
						LeaveGameModule(true, if FFlagLeaveGameButtonKeepsFocusWhileLeavingModule then { keepSelection = true } else nil)
					end
					if FFlagLeaveGameButtonKeepsFocusWhileLeavingModule and IsPioneerLaunchFunction() then
						UseRefResult1.current = false
						Callback(false)
					end
				end, { LeaveGameModule }),
				isLoading = if FFlagLeaveGameButtonKeepsFocusWhileLeavingModule then v2 else nil,
				testId = if FFlagPioneerLogoutButtonLabel then "--leave-game-page-button-leave" else nil
			}),
			DontLeaveGameButton = ReactModule.createElement(Button, {
				LayoutOrder = 2,
				text = UseLocalizationResult.DontLeaveGame,
				size = InputSize.Large,
				variant = ButtonVariant.Subtle,
				width = UDim.new(0, if NoFFlagResponsiveUnitsDeprecateTenFoot then 300 else 200),
				onActivated = ReactModule.useCallback(function()
					-- upvalues: p1 (copy), UtilityModule (upval)
					p1.dontLeaveFromButton(UtilityModule:IsUsingGamepad())
				end, { UtilityModule, p1.dontLeaveFromButton }),
				testId = if FFlagPioneerLogoutButtonLabel then "--leave-game-page-button-dont-leave" else nil
			})
		})
	})
end

local function LeaveGameContainer(p1)
	-- upvalues: Localization (copy), LocalizationService (copy), ReactModule (copy), LocalizationProvider (copy), FoundationProvider (copy), FoundationModule (copy), ReactFocusNavigationModule (copy), NewResult (copy), LeaveButtonsContainer (copy)
	return ReactModule.createElement(LocalizationProvider, {
		localization = Localization.new(LocalizationService.RobloxLocaleId)
	}, {
		FoundationProvider = ReactModule.createElement(FoundationProvider, { colorMode = FoundationModule.Enums.ColorMode.Dark }, {
			FocusNavigationProvider = ReactModule.createElement(ReactFocusNavigationModule.FocusNavigationContext.Provider, { value = NewResult }, {
				LeaveButtonsContainer = ReactModule.createElement(LeaveButtonsContainer, p1)
			})
		})
	})
end

v1 = (function()
	-- upvalues: RobloxGui (copy), RbxAnalyticsServiceExposePlaySessionIdEngineFeature (copy), RbxAnalyticsService (copy), ConstantsModule1 (copy), ReactRobloxModule (copy), ReactModule (copy), LeaveGameContainer (copy), FFlagLeaveGameButtonKeepsFocusWhileLeavingModule (copy)
	local NewPage = require(RobloxGui.Modules.Settings.SettingsPageFactory):CreateNewPage()
	NewPage.playsessionid = ""
	
	if RbxAnalyticsServiceExposePlaySessionIdEngineFeature then
		NewPage.playsessionid = RbxAnalyticsService:GetPlaySessionId()
	end
	function NewPage.DontLeaveFunc(IsUserInputTypeMatch)
		-- upvalues: NewPage (copy), RbxAnalyticsService (upval), ConstantsModule1 (upval)
		if NewPage.HubRef then
			NewPage.HubRef:PopMenu(IsUserInputTypeMatch, true)
		end
		RbxAnalyticsService:SetRBXEventStream(ConstantsModule1.AnalyticsTargetName, ConstantsModule1.AnalyticsInGameMenuName, ConstantsModule1.AnalyticsLeaveGameName, {
			confirmed = ConstantsModule1.AnalyticsCancelledName,
			universeid = tostring(game.GameId),
			source = ConstantsModule1.AnalyticsLeaveGameSource,
			playsessionid = NewPage.playsessionid
		})
	end
	
	function NewPage:DontLeaveFromHotkey(UserInputState, Input)
		-- upvalues: NewPage (copy)
		if UserInputState == Enum.UserInputState.Begin then
			NewPage.DontLeaveFunc(Input.UserInputType == Enum.UserInputType.Gamepad1 or (Input.UserInputType == Enum.UserInputType.Gamepad2 or (Input.UserInputType == Enum.UserInputType.Gamepad3 or Input.UserInputType == Enum.UserInputType.Gamepad4)))
		end
	end
	
	function NewPage.DontLeaveFromButton(p1)
		-- upvalues: NewPage (copy)
		NewPage.DontLeaveFunc(p1)
	end
	
	NewPage.ShowLeaving = nil
	
	function NewPage.SetShowLeaving(ShowLeaving)
		-- upvalues: NewPage (copy)
		NewPage.ShowLeaving = ShowLeaving
	end
	
	NewPage.TabHeader = nil
	NewPage.Page.Name = "LeaveGamePage"
	NewPage.ShouldShowBottomBar = false
	NewPage.ShouldShowHubBar = false
	
	function NewPage.RenderPage()
		-- upvalues: NewPage (copy), ReactRobloxModule (upval), ReactModule (upval), LeaveGameContainer (upval), FFlagLeaveGameButtonKeepsFocusWhileLeavingModule (upval)
		NewPage.PageRoot = ReactRobloxModule.createRoot(NewPage.Page)
		NewPage.PageRoot:render(ReactModule.createElement(LeaveGameContainer, {
			dontLeaveFromButton = NewPage.DontLeaveFromButton,
			setShowLeaving = if FFlagLeaveGameButtonKeepsFocusWhileLeavingModule then NewPage.SetShowLeaving else nil
		}))
	end
	
	function NewPage.UnmountPage()
		-- upvalues: NewPage (copy)
		if NewPage.PageRoot then
			NewPage.PageRoot:unmount()
		end
	end
	
	NewPage.Page.Size = UDim2.new(1, 0, 0, 0)
	
	return NewPage
end)()
v1.Displayed.Event:connect(function()
	-- upvalues: v1 (ref), FFlagEnableConsoleExpControls (copy), EnabledResult (copy), FFlagChromeShortcutRemoveRespawnOnLeavePage (copy), ServiceModule (copy), ConstantsModule (copy), ContextActionService (copy)
	v1.RenderPage()
	
	if not FFlagEnableConsoleExpControls then
		ContextActionService:BindCoreAction("LeaveGameCancelAction", v1.DontLeaveFromHotkey, false, Enum.KeyCode.ButtonB)
	elseif EnabledResult then
		if FFlagChromeShortcutRemoveRespawnOnLeavePage then
			ServiceModule:setShortcutBar(ConstantsModule.TILTMENU_LEAVE_DIALOG_SHORTCUTBAR_ID)
			
			return
		else
			ServiceModule:setShortcutBar(ConstantsModule.TILTMENU_DIALOG_SHORTCUTBAR_ID)
			
			return
		end
	end
end)
v1.Hidden.Event:connect(function()
	-- upvalues: v1 (ref), ContextActionService (copy)
	v1.UnmountPage()
	ContextActionService:UnbindCoreAction("LeaveGameCancelAction")
end)

return v1