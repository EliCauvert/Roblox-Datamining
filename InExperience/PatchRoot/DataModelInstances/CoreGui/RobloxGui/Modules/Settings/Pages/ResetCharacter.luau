local avatarEditorService = game:GetService("AvatarEditorService")
local contextActionService = game:GetService("ContextActionService")
local robloxGui = game:GetService("CoreGui"):WaitForChild("RobloxGui")
local guiService = game:GetService("GuiService")
local playersService = game:GetService("Players")
local rbxAnalyticsService = game:GetService("RbxAnalyticsService")
local corePackagesService = game:GetService("CorePackages")
local localizationService = game:GetService("LocalizationService")
local utilityModule = require(robloxGui.Modules.Settings.Utility)
local themeModule = require(robloxGui.Modules.Settings.Theme)
local create = require(corePackagesService.Workspace.Packages.AppCommonLib).Create
local cryoModule = require(corePackagesService.Packages.Cryo)
local reactModule = require(corePackagesService.Packages.React)
local reactRobloxModule = require(corePackagesService.Packages.ReactRoblox)
local reactFocusNavigationModule = require(corePackagesService.Packages.ReactFocusNavigation)
local useFocusGuiObject = reactFocusNavigationModule.useFocusGuiObject
local responsiveModule = require(corePackagesService.Workspace.Packages.Responsive)
local input = responsiveModule.Input
local useLastInput = responsiveModule.useLastInput
local localization = require(corePackagesService.Workspace.Packages.InExperienceLocales).Localization
local localizationProvider = require(corePackagesService.Workspace.Packages.Localization).LocalizationProvider
local useLocalization = require(corePackagesService.Workspace.Packages.Localization).Hooks.useLocalization
local foundationModule = require(corePackagesService.Packages.Foundation)
local var1 = require(corePackagesService.Workspace.Packages.Chrome).Enabled()
local var2 = if var1 then require(robloxGui.Modules.Chrome.Service) else nil
local var3 = if var1 then require(robloxGui.Modules.Chrome.ChromeShared.Unibar.Constants) else nil
local _ = nil
robloxGui:WaitForChild("Modules"):WaitForChild("TenFootInterface")
local var4 = require(robloxGui.Modules.TenFootInterface):IsEnabled()
local sharedFlagsModule = require(corePackagesService.Workspace.Packages.SharedFlags)
local fFlagEnableConsoleExpControls = sharedFlagsModule.FFlagEnableConsoleExpControls
local fFlagChromeShortcutRemoveLeaveOnRespawnPage = sharedFlagsModule.FFlagChromeShortcutRemoveLeaveOnRespawnPage
local fFlagRespawnActionChromeShortcutTelemetryModule = require(robloxGui.Modules.Chrome.Flags.FFlagRespawnActionChromeShortcutTelemetry)
local fFlagRefactorMenuConfirmationButtonsModule = require(robloxGui.Modules.Settings.Flags.FFlagRefactorMenuConfirmationButtons)
local fFlagConfirmationButtonsUseGreyButtonsModule = require(robloxGui.Modules.Settings.Flags.FFlagConfirmationButtonsUseGreyButtons)
local fFlagRenameRespawnConfirmationPage = sharedFlagsModule.FFlagRenameRespawnConfirmationPage
local constantsModule = require(robloxGui.Modules:WaitForChild("InGameMenu"):WaitForChild("Resources"):WaitForChild("Constants"))
local var5 = reactFocusNavigationModule.FocusNavigationService.new(reactFocusNavigationModule.EngineInterface.CoreGui)
local foundationProvider = foundationModule.FoundationProvider
local button = foundationModule.Button
local buttonVariant = foundationModule.Enums.ButtonVariant
local inputSize = foundationModule.Enums.InputSize
local text = foundationModule.Text
local view = foundationModule.View

local function ResetCharacterButtonsContainer(value)
	-- upvalues: reactModule (ref), useLastInput (ref), useFocusGuiObject (ref), useLocalization (ref), constantsModule (ref), fFlagRenameRespawnConfirmationPage (ref), input (ref), utilityModule (ref), view (ref), var4 (ref), text (ref), button (ref), inputSize (ref), fFlagConfirmationButtonsUseGreyButtonsModule (ref), buttonVariant (ref)
	local var6 = reactModule.useRef(nil)
	local var7 = useLastInput()
	local var8 = useFocusGuiObject()
	local var9 = useLocalization({
		ConfirmResetCharacter = constantsModule.ConfirmResetCharacterLocalizedKey,
		ResetCharacter = if fFlagRenameRespawnConfirmationPage then constantsModule.RespawnLocalizedKey else constantsModule.ResetCharacterLocalizedKey,
		DontResetCharacter = constantsModule.DontResetCharacterLocalizedKey
	})
	reactModule.useEffect(function()
		-- upvalues: var7 (ref), input (copy), var8 (ref), var6 (ref)
		if var7 == input.Touch then
			var8(nil)
			
			return
		end
		var8(var6.current)
	end, { var7, var8 })
	
	return reactModule.createElement(view, {
		tag = "size-full-0 auto-y col",
		Position = UDim2.new(0, 0, 0, if var4 then 100 else 0)
	}, {
		ResetCharacterText = reactModule.createElement(text, {
			LayoutOrder = 1,
			Text = var9.ConfirmResetCharacter,
			Size = UDim2.new(1, 0, 0, if utilityModule:IsSmallTouchScreen() then 100 else 200),
			tag = {
				["text-wrap"] = true,
				["text-heading-medium"] = not utilityModule:IsSmallTouchScreen() and not var4,
				["text-heading-small"] = utilityModule:IsSmallTouchScreen(),
				["text-heading-large"] = var4
			}
		}),
		ButtonsContainer = reactModule.createElement(view, {
			LayoutOrder = 2,
			tag = "size-full-0 auto-y row align-x-center gap-xlarge wrap"
		}, {
			ResetCharacterButton = reactModule.createElement(button, {
				LayoutOrder = 1,
				text = var9.ResetCharacter,
				size = inputSize.Large,
				variant = if fFlagConfirmationButtonsUseGreyButtonsModule then buttonVariant.Standard else buttonVariant.SoftEmphasis,
				width = UDim.new(0, if var4 then 300 else 200),
				ref = var6,
				onActivated = value.onResetFunction
			}),
			DontResetCharacterButton = reactModule.createElement(button, {
				LayoutOrder = 2,
				text = var9.DontResetCharacter,
				size = inputSize.Large,
				variant = buttonVariant.Subtle,
				width = UDim.new(0, if var4 then 300 else 200),
				onActivated = reactModule.useCallback(function()
					-- upvalues: value (ref), utilityModule (copy)
					value.dontResetCharFromButton(utilityModule:IsUsingGamepad())
				end, { utilityModule, value.dontResetCharFromButton })
			})
		})
	})
end

local function ResetCharacterContainer(value)
	-- upvalues: localization (ref), localizationService (ref), reactModule (ref), localizationProvider (ref), foundationProvider (ref), foundationModule (ref), reactFocusNavigationModule (ref), var5 (ref), ResetCharacterButtonsContainer (ref)
	return reactModule.createElement(localizationProvider, {
		localization = localization.new(localizationService.RobloxLocaleId)
	}, {
		FoundationProvider = reactModule.createElement(foundationProvider, { colorMode = foundationModule.Enums.ColorMode.Dark }, {
			FocusNavigationProvider = reactModule.createElement(reactFocusNavigationModule.FocusNavigationContext.Provider, { value = var5 }, {
				ResetCharacterButtonsContainer = reactModule.createElement(ResetCharacterButtonsContainer, value)
			})
		})
	})
end

local var6 = (function()
	-- upvalues: robloxGui (ref), rbxAnalyticsService (ref), constantsModule (ref), fFlagRefactorMenuConfirmationButtonsModule (ref), create (ref), fFlagRenameRespawnConfirmationPage (ref), themeModule (ref), var4 (ref), utilityModule (ref), playersService (ref), fFlagRespawnActionChromeShortcutTelemetryModule (ref), cryoModule (ref), avatarEditorService (ref), fFlagEnableConsoleExpControls (ref), reactRobloxModule (ref), reactModule (ref), ResetCharacterContainer (ref)
	local resetCharacter = require(robloxGui.Modules.Settings.SettingsPageFactory):CreateNewPage()
	
	function resetCharacter.DontResetCharFunc(p1)
		-- upvalues: rbxAnalyticsService (copy), constantsModule (copy), resetCharacter (ref)
		rbxAnalyticsService:SetRBXEventStream(constantsModule.AnalyticsTargetName, constantsModule.AnalyticsInGameMenuName, constantsModule.AnalyticsRespawnCharacterName, {
			confirmed = constantsModule.AnalyticsCancelledName,
			universeid = tostring(game.GameId)
		})
		
		if resetCharacter.HubRef then
			resetCharacter.HubRef:PopMenu(p1, true)
		end
	end
	
	function resetCharacter.DontResetCharFromHotkey(_, p1, p2)
		-- upvalues: resetCharacter (ref)
		if p1 == Enum.UserInputState.Begin then
			resetCharacter.DontResetCharFunc(if p2.UserInputType ~= Enum.UserInputType.Gamepad1 then if p2.UserInputType ~= Enum.UserInputType.Gamepad2 then if p2.UserInputType ~= Enum.UserInputType.Gamepad3 then p2.UserInputType == Enum.UserInputType.Gamepad4 else true else true else true)
		end
	end
	
	function resetCharacter.DontResetCharFromButton(p1)
		-- upvalues: resetCharacter (ref)
		resetCharacter.DontResetCharFunc(p1)
	end
	
	resetCharacter.TabHeader = nil
	resetCharacter.Page.Name = "ResetCharacter"
	resetCharacter.ShouldShowBottomBar = false
	resetCharacter.ShouldShowHubBar = false
	local var7 = nil
	
	if not fFlagRefactorMenuConfirmationButtonsModule then
		local var8 = create("TextLabel")({
			Name = "ResetCharacterText",
			BackgroundTransparency = 1,
			TextWrapped = true,
			ZIndex = 2,
			Text = if fFlagRenameRespawnConfirmationPage then "Are you sure you want to respawn your character?" else "Are you sure you want to reset your character?",
			Font = themeModule.font(Enum.Font.SourceSansBold, "Confirmation"),
			FontSize = themeModule.fontSize(Enum.FontSize.Size36, "Confirmation"),
			TextColor3 = Color3.new(1, 1, 1),
			Size = UDim2.new(1, 0, 0, 200),
			Parent = resetCharacter.Page,
			Position = var4 and UDim2.new(0, 0, 0, 100) or UDim2.new(0, 0, 0, 0)
		})
		var7 = create("Frame")({
			Name = "ResetButtonContainer",
			BackgroundTransparency = 1,
			Parent = var8,
			Size = UDim2.new(1, 0, 0, 400),
			Position = UDim2.new(0, 0, 1, 0)
		})
		local _ = create("UIGridLayout")({
			Name = "ResetButtonsLayout",
			CellSize = var4 and UDim2.new(0, 300, 0, 80) or UDim2.new(0, 200, 0, 50),
			CellPadding = UDim2.new(0, 20, 0, 20),
			FillDirection = Enum.FillDirection.Horizontal,
			HorizontalAlignment = Enum.HorizontalAlignment.Center,
			SortOrder = Enum.SortOrder.LayoutOrder,
			VerticalAlignment = Enum.VerticalAlignment.Top,
			Parent = var7
		})
		
		if utilityModule:IsSmallTouchScreen() then
			var8.FontSize = Enum.FontSize.Size24
			var8.Size = UDim2.new(1, 0, 0, 100)
		elseif var4 then
			var8.FontSize = Enum.FontSize.Size48
		end
	end
	local var9 = function(p1)
		-- upvalues: playersService (copy), constantsModule (copy), fFlagRespawnActionChromeShortcutTelemetryModule (copy), cryoModule (copy), rbxAnalyticsService (copy)
		local localPlayer = playersService.LocalPlayer
		
		if localPlayer then
			local character = localPlayer.Character
			
			if character then
				local humanoid = character:FindFirstChild("Humanoid")
				
				if humanoid then
					humanoid.Health = 0
				end
			end
		end
		local t = {
			confirmed = constantsModule.AnalyticsConfirmedName,
			universeid = tostring(game.GameId)
		}
		
		if fFlagRespawnActionChromeShortcutTelemetryModule and p1 and (type(p1) == "table" and p1.resetTelemetryFields) then
			t = cryoModule.Dictionary.join(t, p1.resetTelemetryFields)
		end
		rbxAnalyticsService:SetRBXEventStream(constantsModule.AnalyticsTargetName, constantsModule.AnalyticsInGameMenuName, constantsModule.AnalyticsRespawnCharacterName, t)
		rbxAnalyticsService:ReportCounter("InGameMenu-ResetCharacter")
	end
	
	resetCharacter.ResetBindable = true
	
	local var10 = function(p1)
		-- upvalues: avatarEditorService (copy), resetCharacter (ref), var9 (ref)
		avatarEditorService:BustAvatarFetchCache()
		
		if resetCharacter.ResetBindable == true then
			var9(p1)
		elseif resetCharacter.ResetBindable then
			resetCharacter.ResetBindable:Fire()
		end
		if resetCharacter.HubRef then
			resetCharacter.HubRef:SetVisibility(false, true)
		end
	end
	
	if fFlagEnableConsoleExpControls then
		resetCharacter.ResetFunction = var10
	end
	if not fFlagRefactorMenuConfirmationButtonsModule then
		resetCharacter.ResetCharacterButton = utilityModule:MakeStyledButton("ResetCharacter", if fFlagRenameRespawnConfirmationPage then "Respawn" else "Reset", nil, var10)
		resetCharacter.ResetCharacterButton.NextSelectionRight = nil
		resetCharacter.ResetCharacterButton.Parent = var7
		local dontResetCharacter = utilityModule:MakeStyledButton("DontResetCharacter", if fFlagRenameRespawnConfirmationPage then "Don't Respawn" else "Don't Reset", nil, resetCharacter.DontResetCharFromButton)
		dontResetCharacter.NextSelectionLeft = nil
		dontResetCharacter.Parent = var7
		resetCharacter.Page.Size = UDim2.new(1, 0, 0, dontResetCharacter.AbsolutePosition.Y + dontResetCharacter.AbsoluteSize.Y)
	end
	if fFlagRefactorMenuConfirmationButtonsModule then
		function resetCharacter.RenderPage()
			-- upvalues: resetCharacter (ref), reactRobloxModule (copy), reactModule (copy), ResetCharacterContainer (copy), var10 (ref)
			resetCharacter.PageRoot = reactRobloxModule.createRoot(resetCharacter.Page)
			resetCharacter.PageRoot:render(reactModule.createElement(ResetCharacterContainer, {
				onResetFunction = var10,
				dontResetCharFromButton = resetCharacter.DontResetCharFromButton
			}))
		end
		
		function resetCharacter.UnmountPage()
			-- upvalues: resetCharacter (ref)
			if resetCharacter.PageRoot then
				resetCharacter.PageRoot:unmount()
			end
		end
		
		resetCharacter.Page.Size = UDim2.new(1, 0, 0, 0)
	end
	return resetCharacter
end)()
local var7 = false
var6.Displayed.Event:connect(function()
	-- upvalues: var7 (write), fFlagRefactorMenuConfirmationButtonsModule (ref), var6 (write), guiService (ref), fFlagEnableConsoleExpControls (ref), var1 (ref), fFlagChromeShortcutRemoveLeaveOnRespawnPage (ref), var2 (ref), var3 (ref), contextActionService (ref)
	var7 = true
	
	if fFlagRefactorMenuConfirmationButtonsModule then
		var6.RenderPage()
	end
	if not fFlagRefactorMenuConfirmationButtonsModule then
		guiService.SelectedCoreObject = var6.ResetCharacterButton
	end
	if fFlagEnableConsoleExpControls then
		if not var1 then return end
		if fFlagChromeShortcutRemoveLeaveOnRespawnPage then
			var2:setShortcutBar(var3.TILTMENU_RESPAWN_DIALOG_SHORTCUTBAR_ID)
			
			return
		end
		var2:setShortcutBar(var3.TILTMENU_DIALOG_SHORTCUTBAR_ID)
		
		return
	else
		contextActionService:BindCoreAction("ResetCharacterAction", var6.DontResetCharFromHotkey, false, Enum.KeyCode.ButtonB)
	end
end)
var6.Hidden.Event:connect(function()
	-- upvalues: var7 (write), fFlagRefactorMenuConfirmationButtonsModule (ref), var6 (write), contextActionService (ref)
	var7 = false
	
	if fFlagRefactorMenuConfirmationButtonsModule then
		var6.UnmountPage()
	end
	contextActionService:UnbindCoreAction("ResetCharacterAction")
end)

function var28.SetResetCallback(_, p1)
	-- upvalues: var7 (write), var6 (write)
	if p1 == false and var7 then
		var6.HubRef:PopMenu(nil, true)
	end
	var6.ResetBindable = p1
end

return var6