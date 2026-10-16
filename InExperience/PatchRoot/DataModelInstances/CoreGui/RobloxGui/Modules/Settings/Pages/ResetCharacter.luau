local AvatarEditorService = game:GetService("AvatarEditorService")
local ContextActionService = game:GetService("ContextActionService")
local RobloxGui = game:GetService("CoreGui"):WaitForChild("RobloxGui")
local GuiService = game:GetService("GuiService")
local Players = game:GetService("Players")
local RbxAnalyticsService = game:GetService("RbxAnalyticsService")
local CorePackages = game:GetService("CorePackages")
local LocalizationService = game:GetService("LocalizationService")
local UtilityModule = require(RobloxGui.Modules.Settings.Utility)
local ThemeModule = require(RobloxGui.Modules.Settings.Theme)
local CreateFunction = require(CorePackages.Workspace.Packages.AppCommonLib).Create
local CryoModule = require(CorePackages.Packages.Cryo)
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
local SharedFlagsModule = require(CorePackages.Workspace.Packages.SharedFlags)
local FFlagEnableConsoleExpControls = SharedFlagsModule.FFlagEnableConsoleExpControls
local FFlagChromeShortcutRemoveLeaveOnRespawnPage = SharedFlagsModule.FFlagChromeShortcutRemoveLeaveOnRespawnPage
local FFlagRespawnActionChromeShortcutTelemetryModule = require(RobloxGui.Modules.Chrome.Flags.FFlagRespawnActionChromeShortcutTelemetry)
local FFlagRefactorMenuConfirmationButtonsModule = require(RobloxGui.Modules.Settings.Flags.FFlagRefactorMenuConfirmationButtons)
local FFlagConfirmationButtonsUseGreyButtonsModule = require(RobloxGui.Modules.Settings.Flags.FFlagConfirmationButtonsUseGreyButtons)
local FFlagRenameRespawnConfirmationPage = SharedFlagsModule.FFlagRenameRespawnConfirmationPage
local ConstantsModule1 = require(RobloxGui.Modules:WaitForChild("InGameMenu"):WaitForChild("Resources"):WaitForChild("Constants"))
local NewResult = ReactFocusNavigationModule.FocusNavigationService.new(ReactFocusNavigationModule.EngineInterface.CoreGui)
local FoundationProvider = FoundationModule.FoundationProvider
local Button = FoundationModule.Button
local ButtonVariant = FoundationModule.Enums.ButtonVariant
local InputSize = FoundationModule.Enums.InputSize
local Text = FoundationModule.Text
local View = FoundationModule.View

local function ResetCharacterButtonsContainer(p1) --[[ Line: 83 ]]
	-- upvalues: ReactModule (copy), UseLastInputFunction (copy), UseFocusGuiObjectFunction (copy), UseLocalizationFunction (copy), ConstantsModule1 (copy), FFlagRenameRespawnConfirmationPage (copy), Input (copy), UtilityModule (copy), View (copy), IsEnabled (copy), Text (copy), Button (copy), InputSize (copy), FFlagConfirmationButtonsUseGreyButtonsModule (copy), ButtonVariant (copy)
	local UseRefResult = ReactModule.useRef(nil)
	local UseLastInputResult = UseLastInputFunction()
	local UseFocusGuiObjectResult = UseFocusGuiObjectFunction()
	local UseLocalizationResult = UseLocalizationFunction({
		ConfirmResetCharacter = ConstantsModule1.ConfirmResetCharacterLocalizedKey,
		ResetCharacter = if FFlagRenameRespawnConfirmationPage then ConstantsModule1.RespawnLocalizedKey else ConstantsModule1.ResetCharacterLocalizedKey,
		DontResetCharacter = ConstantsModule1.DontResetCharacterLocalizedKey
	})
	ReactModule.useEffect(function() --[[ Line: 95 ]]
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
		ResetCharacterText = ReactModule.createElement(Text, {
			LayoutOrder = 1,
			Text = UseLocalizationResult.ConfirmResetCharacter,
			Size = UDim2.new(1, 0, 0, if UtilityModule:IsSmallTouchScreen() then 100 else 200),
			tag = {
				["text-wrap"] = true,
				["text-heading-medium"] = not UtilityModule:IsSmallTouchScreen() and not IsEnabled,
				["text-heading-small"] = UtilityModule:IsSmallTouchScreen(),
				["text-heading-large"] = IsEnabled
			}
		}),
		ButtonsContainer = ReactModule.createElement(View, {
			LayoutOrder = 2,
			tag = "size-full-0 auto-y row align-x-center gap-xlarge wrap"
		}, {
			ResetCharacterButton = ReactModule.createElement(Button, {
				LayoutOrder = 1,
				text = UseLocalizationResult.ResetCharacter,
				size = InputSize.Large,
				variant = if FFlagConfirmationButtonsUseGreyButtonsModule then ButtonVariant.Standard else ButtonVariant.SoftEmphasis,
				width = UDim.new(0, if IsEnabled then 300 else 200),
				ref = UseRefResult,
				onActivated = p1.onResetFunction
			}),
			DontResetCharacterButton = ReactModule.createElement(Button, {
				LayoutOrder = 2,
				text = UseLocalizationResult.DontResetCharacter,
				size = InputSize.Large,
				variant = ButtonVariant.Subtle,
				width = UDim.new(0, if IsEnabled then 300 else 200),
				onActivated = ReactModule.useCallback(function() --[[ Line: 103 ]]
					-- upvalues: p1 (copy), UtilityModule (upval)
					p1.dontResetCharFromButton(UtilityModule:IsUsingGamepad())
				end, { UtilityModule, p1.dontResetCharFromButton })
			})
		})
	})
end

local function ResetCharacterContainer(p1) --[[ Line: 147 ]]
	-- upvalues: Localization (copy), LocalizationService (copy), ReactModule (copy), LocalizationProvider (copy), FoundationProvider (copy), FoundationModule (copy), ReactFocusNavigationModule (copy), NewResult (copy), ResetCharacterButtonsContainer (copy)
	return ReactModule.createElement(LocalizationProvider, {
		localization = Localization.new(LocalizationService.RobloxLocaleId)
	}, {
		FoundationProvider = ReactModule.createElement(FoundationProvider, { colorMode = FoundationModule.Enums.ColorMode.Dark }, {
			FocusNavigationProvider = ReactModule.createElement(ReactFocusNavigationModule.FocusNavigationContext.Provider, { value = NewResult }, {
				ResetCharacterButtonsContainer = ReactModule.createElement(ResetCharacterButtonsContainer, p1)
			})
		})
	})
end

v1 = (function() --[[ Line: 165 | Named "Initialize" ]]
	-- upvalues: RobloxGui (copy), RbxAnalyticsService (copy), ConstantsModule1 (copy), FFlagRefactorMenuConfirmationButtonsModule (copy), CreateFunction (copy), FFlagRenameRespawnConfirmationPage (copy), ThemeModule (copy), IsEnabled (copy), UtilityModule (copy), Players (copy), FFlagRespawnActionChromeShortcutTelemetryModule (copy), CryoModule (copy), AvatarEditorService (copy), FFlagEnableConsoleExpControls (copy), ReactRobloxModule (copy), ReactModule (copy), ResetCharacterContainer (copy)
	local NewPage = require(RobloxGui.Modules.Settings.SettingsPageFactory):CreateNewPage()
	
	function NewPage.DontResetCharFunc(IsUserInputTypeMatch) --[[ Line: 169 ]]
		-- upvalues: RbxAnalyticsService (upval), ConstantsModule1 (upval), NewPage (copy)
		RbxAnalyticsService:SetRBXEventStream(ConstantsModule1.AnalyticsTargetName, ConstantsModule1.AnalyticsInGameMenuName, ConstantsModule1.AnalyticsRespawnCharacterName, {
			confirmed = ConstantsModule1.AnalyticsCancelledName,
			universeid = tostring(game.GameId)
		})
		
		if NewPage.HubRef then
			NewPage.HubRef:PopMenu(IsUserInputTypeMatch, true)
		end
	end
	
	function NewPage:DontResetCharFromHotkey(UserInputState, Input) --[[ Line: 177 ]]
		-- upvalues: NewPage (copy)
		if UserInputState == Enum.UserInputState.Begin then
			NewPage.DontResetCharFunc(Input.UserInputType == Enum.UserInputType.Gamepad1 or (Input.UserInputType == Enum.UserInputType.Gamepad2 or (Input.UserInputType == Enum.UserInputType.Gamepad3 or Input.UserInputType == Enum.UserInputType.Gamepad4)))
		end
	end
	
	function NewPage.DontResetCharFromButton(p1) --[[ Line: 185 ]]
		-- upvalues: NewPage (copy)
		NewPage.DontResetCharFunc(p1)
	end
	
	NewPage.TabHeader = nil
	NewPage.Page.Name = "ResetCharacter"
	NewPage.ShouldShowBottomBar = false
	NewPage.ShouldShowHubBar = false
	local Parent = nil
	
	if not FFlagRefactorMenuConfirmationButtonsModule then
		local Parent1 = CreateFunction("TextLabel")({
			Name = "ResetCharacterText",
			BackgroundTransparency = 1,
			TextWrapped = true,
			ZIndex = 2,
			Text = if FFlagRenameRespawnConfirmationPage then "Are you sure you want to respawn your character?" else "Are you sure you want to reset your character?",
			Font = ThemeModule.font(Enum.Font.SourceSansBold, "Confirmation"),
			FontSize = ThemeModule.fontSize(Enum.FontSize.Size36, "Confirmation"),
			TextColor3 = Color3.new(1, 1, 1),
			Size = UDim2.new(1, 0, 0, 200),
			Parent = NewPage.Page,
			Position = IsEnabled and UDim2.new(0, 0, 0, 100) or UDim2.new(0, 0, 0, 0)
		})
		Parent = CreateFunction("Frame")({
			Name = "ResetButtonContainer",
			BackgroundTransparency = 1,
			Parent = Parent1,
			Size = UDim2.new(1, 0, 0, 400),
			Position = UDim2.new(0, 0, 1, 0)
		})
		local _ = CreateFunction("UIGridLayout")({
			Name = "ResetButtonsLayout",
			CellSize = IsEnabled and UDim2.new(0, 300, 0, 80) or UDim2.new(0, 200, 0, 50),
			CellPadding = UDim2.new(0, 20, 0, 20),
			FillDirection = Enum.FillDirection.Horizontal,
			HorizontalAlignment = Enum.HorizontalAlignment.Center,
			SortOrder = Enum.SortOrder.LayoutOrder,
			VerticalAlignment = Enum.VerticalAlignment.Top,
			Parent = Parent
		})
		
		if UtilityModule:IsSmallTouchScreen() then
			Parent1.FontSize = Enum.FontSize.Size24
			Parent1.Size = UDim2.new(1, 0, 0, 100)
		elseif IsEnabled then
			Parent1.FontSize = Enum.FontSize.Size48
		end
	end
	local function v51(p1) --[[ Line: 244 ]]
		-- upvalues: Players (upval), ConstantsModule1 (upval), FFlagRespawnActionChromeShortcutTelemetryModule (upval), CryoModule (upval), RbxAnalyticsService (upval)
		local LocalPlayer = Players.LocalPlayer
		
		if LocalPlayer then
			local Character = LocalPlayer.Character
			
			if Character then
				local Humanoid = Character:FindFirstChild("Humanoid")
				
				if Humanoid then
					Humanoid.Health = 0
				end
			end
		end
		local JoinResult = {
			confirmed = ConstantsModule1.AnalyticsConfirmedName,
			universeid = tostring(game.GameId)
		}
		
		if FFlagRespawnActionChromeShortcutTelemetryModule and p1 and type(p1) == "table" and p1.resetTelemetryFields then
			JoinResult = CryoModule.Dictionary.join(JoinResult, p1.resetTelemetryFields)
		end
		RbxAnalyticsService:SetRBXEventStream(ConstantsModule1.AnalyticsTargetName, ConstantsModule1.AnalyticsInGameMenuName, ConstantsModule1.AnalyticsRespawnCharacterName, JoinResult)
		RbxAnalyticsService:ReportCounter("InGameMenu-ResetCharacter")
	end
	
	NewPage.ResetBindable = true
	
	local function OnResetFunction(p1) --[[ Line: 267 ]]
		-- upvalues: AvatarEditorService (upval), NewPage (copy), v51 (copy)
		AvatarEditorService:BustAvatarFetchCache()
		
		if NewPage.ResetBindable == true then
			v51(p1)
		elseif NewPage.ResetBindable then
			NewPage.ResetBindable:Fire()
		end
		if NewPage.HubRef then
			NewPage.HubRef:SetVisibility(false, true)
		end
	end
	
	if FFlagEnableConsoleExpControls then
		NewPage.ResetFunction = OnResetFunction
	end
	if not FFlagRefactorMenuConfirmationButtonsModule then
		NewPage.ResetCharacterButton = UtilityModule:MakeStyledButton("ResetCharacter", if FFlagRenameRespawnConfirmationPage then "Respawn" else "Reset", nil, OnResetFunction)
		NewPage.ResetCharacterButton.NextSelectionRight = nil
		NewPage.ResetCharacterButton.Parent = Parent
		local DontResetCharacter = UtilityModule:MakeStyledButton("DontResetCharacter", if FFlagRenameRespawnConfirmationPage then "Don't Respawn" else "Don't Reset", nil, NewPage.DontResetCharFromButton)
		DontResetCharacter.NextSelectionLeft = nil
		DontResetCharacter.Parent = Parent
		NewPage.Page.Size = UDim2.new(1, 0, 0, DontResetCharacter.AbsolutePosition.Y + DontResetCharacter.AbsoluteSize.Y)
	end
	if FFlagRefactorMenuConfirmationButtonsModule then
		function NewPage.RenderPage() --[[ Line: 297 ]]
			-- upvalues: NewPage (copy), ReactRobloxModule (upval), ReactModule (upval), ResetCharacterContainer (upval), OnResetFunction (copy)
			NewPage.PageRoot = ReactRobloxModule.createRoot(NewPage.Page)
			NewPage.PageRoot:render(ReactModule.createElement(ResetCharacterContainer, {
				onResetFunction = OnResetFunction,
				dontResetCharFromButton = NewPage.DontResetCharFromButton
			}))
		end
		
		function NewPage.UnmountPage() --[[ Line: 305 ]]
			-- upvalues: NewPage (copy)
			if NewPage.PageRoot then
				NewPage.PageRoot:unmount()
			end
		end
		
		NewPage.Page.Size = UDim2.new(1, 0, 0, 0)
	end
	return NewPage
end)()
local Flag = false
v1.Displayed.Event:connect(function() --[[ Line: 322 ]]
	-- upvalues: Flag (ref), FFlagRefactorMenuConfirmationButtonsModule (copy), v1 (ref), GuiService (copy), FFlagEnableConsoleExpControls (copy), EnabledResult (copy), FFlagChromeShortcutRemoveLeaveOnRespawnPage (copy), ServiceModule (copy), ConstantsModule (copy), ContextActionService (copy)
	Flag = true
	
	if FFlagRefactorMenuConfirmationButtonsModule then
		v1.RenderPage()
	end
	if not FFlagRefactorMenuConfirmationButtonsModule then
		GuiService.SelectedCoreObject = v1.ResetCharacterButton
	end
	if not FFlagEnableConsoleExpControls then
		ContextActionService:BindCoreAction("ResetCharacterAction", v1.DontResetCharFromHotkey, false, Enum.KeyCode.ButtonB)
	elseif EnabledResult then
		if FFlagChromeShortcutRemoveLeaveOnRespawnPage then
			ServiceModule:setShortcutBar(ConstantsModule.TILTMENU_RESPAWN_DIALOG_SHORTCUTBAR_ID)
			
			return
		else
			ServiceModule:setShortcutBar(ConstantsModule.TILTMENU_DIALOG_SHORTCUTBAR_ID)
			
			return
		end
	end
end)
v1.Hidden.Event:connect(function() --[[ Line: 343 ]]
	-- upvalues: Flag (ref), FFlagRefactorMenuConfirmationButtonsModule (copy), v1 (ref), ContextActionService (copy)
	Flag = false
	
	if FFlagRefactorMenuConfirmationButtonsModule then
		v1.UnmountPage()
	end
	ContextActionService:UnbindCoreAction("ResetCharacterAction")
end)

function v1:SetResetCallback(Enabled) --[[ Line: 351 ]]
	-- upvalues: Flag (ref), v1 (ref)
	if Enabled == false and Flag then
		v1.HubRef:PopMenu(nil, true)
	end
	v1.ResetBindable = Enabled
end

return v1