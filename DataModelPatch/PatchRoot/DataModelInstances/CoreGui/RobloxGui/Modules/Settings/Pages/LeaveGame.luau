local CorePackages = game:GetService("CorePackages")
local ContextActionService = game:GetService("ContextActionService")
local RobloxGui = game:GetService("CoreGui"):WaitForChild("RobloxGui")
local GuiService = game:GetService("GuiService")
local RbxAnalyticsService = game:GetService("RbxAnalyticsService")
local LocalizationService = game:GetService("LocalizationService")
local UtilityModule = require(RobloxGui.Modules.Settings.Utility)
local LeaveGameModule = require(RobloxGui.Modules.Settings.leaveGame)
local CreateFunction = require(CorePackages.Workspace.Packages.AppCommonLib).Create
local ReactModule = require(CorePackages.Packages.React)
local ReactRobloxModule = require(CorePackages.Packages.ReactRoblox)
local ReactFocusNavigationModule = require(CorePackages.Packages.ReactFocusNavigation)
local UseFocusGuiObjectFunction = ReactFocusNavigationModule.useFocusGuiObject
local ResponsiveModule = require(CorePackages.Workspace.Packages.Responsive)
local Input = ResponsiveModule.Input
local UseLastInputFunction = ResponsiveModule.useLastInput
local Localization = require(CorePackages.Workspace.Packages.InExperienceLocales).Localization
local LocalizationProvider = require(CorePackages.Workspace.Packages.Localization).LocalizationProvider
local UseLocalizationFunction = require(CorePackages.Workspace.Packages.Localization).Hooks.useLocalization
local FoundationModule = require(CorePackages.Packages.Foundation)
local EnabledResult = require(CorePackages.Workspace.Packages.Chrome).Enabled()
local ServiceModule = if EnabledResult then require(RobloxGui.Modules.Chrome.Service) else nil
local ConstantsModule = if EnabledResult then require(RobloxGui.Modules.Chrome.ChromeShared.Unibar.Constants) else nil
local v1 = nil
RobloxGui:WaitForChild("Modules"):WaitForChild("TenFootInterface")
local IsEnabled = require(RobloxGui.Modules.TenFootInterface):IsEnabled()
local RbxAnalyticsServiceExposePlaySessionIdEngineFeature = game:GetEngineFeature("RbxAnalyticsServiceExposePlaySessionId")
local SharedFlagsModule = require(CorePackages.Workspace.Packages.SharedFlags)
local FFlagEnableConsoleExpControls = SharedFlagsModule.FFlagEnableConsoleExpControls
local FFlagChromeShortcutRemoveRespawnOnLeavePage = SharedFlagsModule.FFlagChromeShortcutRemoveRespawnOnLeavePage
local FFlagRefactorMenuConfirmationButtonsModule = require(RobloxGui.Modules.Settings.Flags.FFlagRefactorMenuConfirmationButtons)
local FFlagConfirmationButtonsUseGreyButtonsModule = require(RobloxGui.Modules.Settings.Flags.FFlagConfirmationButtonsUseGreyButtons)
local ConstantsModule1 = require(RobloxGui.Modules:WaitForChild("InGameMenu"):WaitForChild("Resources"):WaitForChild("Constants"))
local NewResult = ReactFocusNavigationModule.FocusNavigationService.new(ReactFocusNavigationModule.EngineInterface.CoreGui)
local ThemeModule = require(RobloxGui.Modules.Settings.Theme)
local FoundationProvider = FoundationModule.FoundationProvider
local Button = FoundationModule.Button
local ButtonVariant = FoundationModule.Enums.ButtonVariant
local InputSize = FoundationModule.Enums.InputSize
local Text = FoundationModule.Text
local View = FoundationModule.View
local RobloxTranslatorModule = require(CorePackages.Workspace.Packages.RobloxTranslator)

local function LeaveButtonsContainer(p1)
	-- upvalues: ReactModule (copy), UseLastInputFunction (copy), UseFocusGuiObjectFunction (copy), UseLocalizationFunction (copy), ConstantsModule1 (copy), Input (copy), LeaveGameModule (copy), UtilityModule (copy), View (copy), IsEnabled (copy), Text (copy), Button (copy), InputSize (copy), FFlagConfirmationButtonsUseGreyButtonsModule (copy), ButtonVariant (copy)
	local UseRefResult = ReactModule.useRef(nil)
	local UseLastInputResult = UseLastInputFunction()
	local UseFocusGuiObjectResult = UseFocusGuiObjectFunction()
	local UseLocalizationResult = UseLocalizationFunction({
		ConfirmLeaveGame = ConstantsModule1.ConfirmLeaveGameLocalizedKey,
		LeaveGame = ConstantsModule1.LeaveGameLocalizedKey,
		DontLeaveGame = ConstantsModule1.DontLeaveGameLocalizedKey
	})
	ReactModule.useEffect(function()
		-- upvalues: UseLastInputResult (copy), Input (upval), UseFocusGuiObjectResult (copy), UseRefResult (copy)
		if UseLastInputResult == Input.Touch then
			UseFocusGuiObjectResult(nil)
			
			return
		else
			UseFocusGuiObjectResult(UseRefResult.current)
		end
	end, { UseLastInputResult, UseFocusGuiObjectResult })
	
	return ReactModule.createElement(View, {
		tag = "size-full-0 auto-y col",
		Position = UDim2.new(0, 0, 0, if IsEnabled then 100 else 0)
	}, {
		LeaveGameText = ReactModule.createElement(Text, {
			LayoutOrder = 1,
			Text = UseLocalizationResult.ConfirmLeaveGame,
			Size = UDim2.new(1, 0, 0, if UtilityModule:IsSmallTouchScreen() then 100 else 200),
			tag = {
				["text-wrap"] = true,
				["text-heading-medium"] = not UtilityModule:IsSmallTouchScreen() and not IsEnabled,
				["text-heading-small"] = UtilityModule:IsSmallTouchScreen(),
				["text-heading-large"] = IsEnabled
			}
		}),
		LeaveButtonsContainer = ReactModule.createElement(View, {
			LayoutOrder = 2,
			tag = "size-full-0 auto-y row align-x-center gap-xlarge wrap"
		}, {
			LeaveGameButton = ReactModule.createElement(Button, {
				LayoutOrder = 1,
				text = UseLocalizationResult.LeaveGame,
				size = InputSize.Large,
				variant = if FFlagConfirmationButtonsUseGreyButtonsModule then ButtonVariant.Standard else ButtonVariant.SoftEmphasis,
				width = UDim.new(0, if IsEnabled then 300 else 200),
				ref = UseRefResult,
				onActivated = ReactModule.useCallback(function()
					-- upvalues: LeaveGameModule (upval)
					LeaveGameModule(true)
				end, { LeaveGameModule })
			}),
			DontLeaveGameButton = ReactModule.createElement(Button, {
				LayoutOrder = 2,
				text = UseLocalizationResult.DontLeaveGame,
				size = InputSize.Large,
				variant = ButtonVariant.Subtle,
				width = UDim.new(0, if IsEnabled then 300 else 200),
				onActivated = ReactModule.useCallback(function()
					-- upvalues: p1 (copy), UtilityModule (upval)
					p1.dontLeaveFromButton(UtilityModule:IsUsingGamepad())
				end, { UtilityModule, p1.dontLeaveFromButton })
			})
		})
	})
end

local function LeaveGameContainer(p1)
	-- upvalues: Localization (copy), LocalizationService (copy), ReactModule (copy), LocalizationProvider (copy), FoundationProvider (copy), FoundationModule (copy), ReactFocusNavigationModule (copy), NewResult (copy), LeaveButtonsContainer (copy)
	return ReactModule.createElement(LocalizationProvider, {
		localization = Localization.new(LocalizationService.RobloxLocaleId)
	}, {
		FoundationProvider = ReactModule.createElement(FoundationProvider, { theme = FoundationModule.Enums.Theme.Dark }, {
			FocusNavigationProvider = ReactModule.createElement(ReactFocusNavigationModule.FocusNavigationContext.Provider, { value = NewResult }, {
				LeaveButtonsContainer = ReactModule.createElement(LeaveButtonsContainer, p1)
			})
		})
	})
end

v1 = (function()
	-- upvalues: RobloxGui (copy), RbxAnalyticsServiceExposePlaySessionIdEngineFeature (copy), RbxAnalyticsService (copy), ConstantsModule1 (copy), FFlagRefactorMenuConfirmationButtonsModule (copy), ReactRobloxModule (copy), ReactModule (copy), LeaveGameContainer (copy), RobloxTranslatorModule (copy), CreateFunction (copy), ThemeModule (copy), IsEnabled (copy), UtilityModule (copy), LeaveGameModule (copy)
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
	
	NewPage.TabHeader = nil
	NewPage.Page.Name = "LeaveGamePage"
	NewPage.ShouldShowBottomBar = false
	NewPage.ShouldShowHubBar = false
	
	if FFlagRefactorMenuConfirmationButtonsModule then
		function NewPage.RenderPage()
			-- upvalues: NewPage (copy), ReactRobloxModule (upval), ReactModule (upval), LeaveGameContainer (upval)
			NewPage.PageRoot = ReactRobloxModule.createRoot(NewPage.Page)
			NewPage.PageRoot:render(ReactModule.createElement(LeaveGameContainer, { dontLeaveFromButton = NewPage.DontLeaveFromButton }))
		end
		
		function NewPage.UnmountPage()
			-- upvalues: NewPage (copy)
			if NewPage.PageRoot then
				NewPage.PageRoot:unmount()
			end
		end
		
		NewPage.Page.Size = UDim2.new(1, 0, 0, 0)
		
		return NewPage
	end
	local Parent = CreateFunction("TextLabel")({
		Name = "LeaveGameText",
		BackgroundTransparency = 1,
		TextWrapped = true,
		ZIndex = 2,
		Text = RobloxTranslatorModule:FormatByKey(ConstantsModule1.ConfirmLeaveGameLocalizedKey),
		Font = ThemeModule.font(Enum.Font.SourceSansBold, "Confirmation"),
		FontSize = ThemeModule.fontSize(Enum.FontSize.Size36, "Confirmation"),
		TextColor3 = Color3.new(1, 1, 1),
		Size = UDim2.new(1, 0, 0, 200),
		Parent = NewPage.Page,
		Position = IsEnabled and UDim2.new(0, 0, 0, 100) or UDim2.new(0, 0, 0, 0)
	})
	local Parent1 = CreateFunction("Frame")({
		Name = "LeaveButtonContainer",
		BackgroundTransparency = 1,
		Parent = Parent,
		Size = UDim2.new(1, 0, 0, 400),
		Position = UDim2.new(0, 0, 1, 0)
	})
	local _ = CreateFunction("UIGridLayout")({
		Name = "LeavetButtonsLayout",
		CellSize = IsEnabled and UDim2.new(0, 300, 0, 80) or UDim2.new(0, 200, 0, 50),
		CellPadding = UDim2.new(0, 20, 0, 20),
		FillDirection = Enum.FillDirection.Horizontal,
		HorizontalAlignment = Enum.HorizontalAlignment.Center,
		SortOrder = Enum.SortOrder.LayoutOrder,
		VerticalAlignment = Enum.VerticalAlignment.Top,
		Parent = Parent1
	})
	
	if UtilityModule:IsSmallTouchScreen() then
		Parent.FontSize = Enum.FontSize.Size24
		Parent.Size = UDim2.new(1, 0, 0, 100)
	elseif IsEnabled then
		Parent.FontSize = Enum.FontSize.Size48
	end
	NewPage.LeaveGameButton = UtilityModule:MakeStyledButton("LeaveGame", "Leave", nil, function()
		-- upvalues: LeaveGameModule (upval)
		LeaveGameModule(true)
	end)
	NewPage.LeaveGameButton.NextSelectionRight = nil
	NewPage.LeaveGameButton.Parent = Parent1
	local DontLeaveGame = UtilityModule:MakeStyledButton("DontLeaveGame", RobloxTranslatorModule:FormatByKey("Feature.SettingsHub.Label.DontLeaveButton"), nil, NewPage.DontLeaveFromButton)
	DontLeaveGame.NextSelectionLeft = nil
	DontLeaveGame.Parent = Parent1
	NewPage.Page.Size = UDim2.new(1, 0, 0, DontLeaveGame.AbsolutePosition.Y + DontLeaveGame.AbsoluteSize.Y)
	
	return NewPage
end)()
v1.Displayed.Event:connect(function()
	-- upvalues: FFlagRefactorMenuConfirmationButtonsModule (copy), v1 (ref), GuiService (copy), FFlagEnableConsoleExpControls (copy), EnabledResult (copy), FFlagChromeShortcutRemoveRespawnOnLeavePage (copy), ServiceModule (copy), ConstantsModule (copy), ContextActionService (copy)
	if FFlagRefactorMenuConfirmationButtonsModule then
		v1.RenderPage()
	end
	if not FFlagRefactorMenuConfirmationButtonsModule then
		GuiService.SelectedCoreObject = v1.LeaveGameButton
	end
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
	-- upvalues: FFlagRefactorMenuConfirmationButtonsModule (copy), v1 (ref), ContextActionService (copy)
	if FFlagRefactorMenuConfirmationButtonsModule then
		v1.UnmountPage()
	end
	ContextActionService:UnbindCoreAction("LeaveGameCancelAction")
end)

return v1