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
local var16 = require(corePackagesService.Workspace.Packages.Chrome).Enabled()
local var17 = if var16 then require(robloxGui.Modules.Chrome.Service) else nil
local var18 = if var16 then require(robloxGui.Modules.Chrome.ChromeShared.Unibar.Constants) else nil
local _ = nil
robloxGui:WaitForChild("Modules"):WaitForChild("TenFootInterface")
local var19 = require(robloxGui.Modules.TenFootInterface):IsEnabled()
local sharedFlagsModule = require(corePackagesService.Workspace.Packages.SharedFlags)
local fFlagEnableConsoleExpControls = sharedFlagsModule.FFlagEnableConsoleExpControls
local fFlagChromeShortcutRemoveLeaveOnRespawnPage = sharedFlagsModule.FFlagChromeShortcutRemoveLeaveOnRespawnPage
local fFlagRespawnActionChromeShortcutTelemetryModule = require(robloxGui.Modules.Chrome.Flags.FFlagRespawnActionChromeShortcutTelemetry)
local fFlagRefactorMenuConfirmationButtonsModule = require(robloxGui.Modules.Settings.Flags.FFlagRefactorMenuConfirmationButtons)
local fFlagConfirmationButtonsUseGreyButtonsModule = require(robloxGui.Modules.Settings.Flags.FFlagConfirmationButtonsUseGreyButtons)
local fFlagRenameRespawnConfirmationPage = sharedFlagsModule.FFlagRenameRespawnConfirmationPage
local constantsModule = require(robloxGui.Modules:WaitForChild("InGameMenu"):WaitForChild("Resources"):WaitForChild("Constants"))
local var25 = reactFocusNavigationModule.FocusNavigationService.new(reactFocusNavigationModule.EngineInterface.CoreGui)
local foundationProvider = foundationModule.FoundationProvider
local button = foundationModule.Button
local buttonVariant = foundationModule.Enums.ButtonVariant
local inputSize = foundationModule.Enums.InputSize
local text = foundationModule.Text
local view = foundationModule.View

local function ResetCharacterButtonsContainer(value) --[[ line: 83 ]]
	-- upvalues: reactModule (ref), useLastInput (ref), useFocusGuiObject (ref), useLocalization (ref), constantsModule (ref), fFlagRenameRespawnConfirmationPage (ref), input (ref), utilityModule (ref), view (ref), var19 (ref), text (ref), button (ref), inputSize (ref), fFlagConfirmationButtonsUseGreyButtonsModule (ref), buttonVariant (ref)
	local var30 = reactModule.useRef(nil)
	local var31 = useLastInput()
	local var32 = useFocusGuiObject()
	local var33 = useLocalization({
		ConfirmResetCharacter = constantsModule.ConfirmResetCharacterLocalizedKey,
		ResetCharacter = if fFlagRenameRespawnConfirmationPage then constantsModule.RespawnLocalizedKey else constantsModule.ResetCharacterLocalizedKey,
		DontResetCharacter = constantsModule.DontResetCharacterLocalizedKey
	})
	reactModule.useEffect(function() --[[ line: 95 ]]
		-- upvalues: var31 (ref), input (copy), var32 (ref), var30 (ref)
		if var31 == input.Touch then
			var32(nil)
			
			return
		end
		var32(var30.current)
	end, { var31, var32 })
	
	return reactModule.createElement(view, {
		tag = "size-full-0 auto-y col",
		Position = UDim2.new(0, 0, 0, if var19 then 100 else 0)
	}, {
		ResetCharacterText = reactModule.createElement(text, {
			LayoutOrder = 1,
			Text = var33.ConfirmResetCharacter,
			Size = UDim2.new(1, 0, 0, if utilityModule:IsSmallTouchScreen() then 100 else 200),
			tag = {
				["text-wrap"] = true,
				["text-heading-medium"] = not utilityModule:IsSmallTouchScreen() and not var19,
				["text-heading-small"] = utilityModule:IsSmallTouchScreen(),
				["text-heading-large"] = var19
			}
		}),
		ButtonsContainer = reactModule.createElement(view, {
			LayoutOrder = 2,
			tag = "size-full-0 auto-y row align-x-center gap-xlarge wrap"
		}, {
			ResetCharacterButton = reactModule.createElement(button, {
				LayoutOrder = 1,
				text = var33.ResetCharacter,
				size = inputSize.Large,
				variant = if fFlagConfirmationButtonsUseGreyButtonsModule then buttonVariant.Standard else buttonVariant.SoftEmphasis,
				width = UDim.new(0, if var19 then 300 else 200),
				ref = var30,
				onActivated = value.onResetFunction
			}),
			DontResetCharacterButton = reactModule.createElement(button, {
				LayoutOrder = 2,
				text = var33.DontResetCharacter,
				size = inputSize.Large,
				variant = buttonVariant.Subtle,
				width = UDim.new(0, if var19 then 300 else 200),
				onActivated = reactModule.useCallback(function() --[[ line: 103 ]]
					-- upvalues: value (ref), utilityModule (copy)
					value.dontResetCharFromButton(utilityModule:IsUsingGamepad())
				end, { utilityModule, value.dontResetCharFromButton })
			})
		})
	})
end

local function ResetCharacterContainer(value) --[[ line: 147 ]]
	-- upvalues: localization (ref), localizationService (ref), reactModule (ref), localizationProvider (ref), foundationProvider (ref), foundationModule (ref), reactFocusNavigationModule (ref), var25 (ref), ResetCharacterButtonsContainer (ref)
	return reactModule.createElement(localizationProvider, {
		localization = localization.new(localizationService.RobloxLocaleId)
	}, {
		FoundationProvider = reactModule.createElement(foundationProvider, { theme = foundationModule.Enums.Theme.Dark }, {
			FocusNavigationProvider = reactModule.createElement(reactFocusNavigationModule.FocusNavigationContext.Provider, { value = var25 }, {
				ResetCharacterButtonsContainer = reactModule.createElement(ResetCharacterButtonsContainer, value)
			})
		})
	})
end

local var28 = (function() --[[ line: 165 | named "Initialize" ]]
	-- upvalues: robloxGui (ref), rbxAnalyticsService (ref), constantsModule (ref), fFlagRefactorMenuConfirmationButtonsModule (ref), create (ref), fFlagRenameRespawnConfirmationPage (ref), themeModule (ref), var19 (ref), utilityModule (ref), playersService (ref), fFlagRespawnActionChromeShortcutTelemetryModule (ref), cryoModule (ref), avatarEditorService (ref), fFlagEnableConsoleExpControls (ref), reactRobloxModule (ref), reactModule (ref), ResetCharacterContainer (ref)
	local resetCharacter = require(robloxGui.Modules.Settings.SettingsPageFactory):CreateNewPage()
	
	function resetCharacter.DontResetCharFunc(p0) --[[ line: 169 ]]
		-- upvalues: rbxAnalyticsService (copy), constantsModule (copy), resetCharacter (ref)
		rbxAnalyticsService:SetRBXEventStream(constantsModule.AnalyticsTargetName, constantsModule.AnalyticsInGameMenuName, constantsModule.AnalyticsRespawnCharacterName, {
			confirmed = constantsModule.AnalyticsCancelledName,
			universeid = tostring(game.GameId)
		})
		
		if resetCharacter.HubRef then
			resetCharacter.HubRef:PopMenu(p0, true)
		end
	end
	
	function resetCharacter.DontResetCharFromHotkey(_, p1, p2) --[[ line: 177 ]]
		-- upvalues: resetCharacter (ref)
		if p1 == Enum.UserInputState.Begin then
			resetCharacter.DontResetCharFunc(if p2.UserInputType ~= Enum.UserInputType.Gamepad1 then if p2.UserInputType ~= Enum.UserInputType.Gamepad2 then if p2.UserInputType ~= Enum.UserInputType.Gamepad3 then p2.UserInputType == Enum.UserInputType.Gamepad4 else true else true else true)
		end
	end
	
	function resetCharacter.DontResetCharFromButton(p3) --[[ line: 185 ]]
		-- upvalues: resetCharacter (ref)
		resetCharacter.DontResetCharFunc(p3)
	end
	
	resetCharacter.TabHeader = nil
	resetCharacter.Page.Name = "ResetCharacter"
	resetCharacter.ShouldShowBottomBar = false
	resetCharacter.ShouldShowHubBar = false
	local var35 = nil
	
	if not fFlagRefactorMenuConfirmationButtonsModule then
		local var36 = create("TextLabel")({
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
			Position = var19 and UDim2.new(0, 0, 0, 100) or UDim2.new(0, 0, 0, 0)
		})
		var35 = create("Frame")({
			Name = "ResetButtonContainer",
			BackgroundTransparency = 1,
			Parent = var36,
			Size = UDim2.new(1, 0, 0, 400),
			Position = UDim2.new(0, 0, 1, 0)
		})
		local _ = create("UIGridLayout")({
			Name = "ResetButtonsLayout",
			CellSize = var19 and UDim2.new(0, 300, 0, 80) or UDim2.new(0, 200, 0, 50),
			CellPadding = UDim2.new(0, 20, 0, 20),
			FillDirection = Enum.FillDirection.Horizontal,
			HorizontalAlignment = Enum.HorizontalAlignment.Center,
			SortOrder = Enum.SortOrder.LayoutOrder,
			VerticalAlignment = Enum.VerticalAlignment.Top,
			Parent = var35
		})
		
		if utilityModule:IsSmallTouchScreen() then
			var36.FontSize = Enum.FontSize.Size24
			var36.Size = UDim2.new(1, 0, 0, 100)
		elseif var19 then
			var36.FontSize = Enum.FontSize.Size48
		end
	end
	local var37 = function(p4) --[[ line: 244 ]]
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
		
		if fFlagRespawnActionChromeShortcutTelemetryModule and p4 and (type(p4) == "table" and p4.resetTelemetryFields) then
			t = cryoModule.Dictionary.join(t, p4.resetTelemetryFields)
		end
		rbxAnalyticsService:SetRBXEventStream(constantsModule.AnalyticsTargetName, constantsModule.AnalyticsInGameMenuName, constantsModule.AnalyticsRespawnCharacterName, t)
		rbxAnalyticsService:ReportCounter("InGameMenu-ResetCharacter")
	end
	
	resetCharacter.ResetBindable = true
	
	local var38 = function(p5) --[[ line: 267 ]]
		-- upvalues: avatarEditorService (copy), resetCharacter (ref), var37 (ref)
		avatarEditorService:BustAvatarFetchCache()
		
		if resetCharacter.ResetBindable == true then
			var37(p5)
		elseif resetCharacter.ResetBindable then
			resetCharacter.ResetBindable:Fire()
		end
		if resetCharacter.HubRef then
			resetCharacter.HubRef:SetVisibility(false, true)
		end
	end
	
	if fFlagEnableConsoleExpControls then
		resetCharacter.ResetFunction = var38
	end
	if not fFlagRefactorMenuConfirmationButtonsModule then
		resetCharacter.ResetCharacterButton = utilityModule:MakeStyledButton("ResetCharacter", if fFlagRenameRespawnConfirmationPage then "Respawn" else "Reset", nil, var38)
		resetCharacter.ResetCharacterButton.NextSelectionRight = nil
		resetCharacter.ResetCharacterButton.Parent = var35
		local dontResetCharacter = utilityModule:MakeStyledButton("DontResetCharacter", if fFlagRenameRespawnConfirmationPage then "Don't Respawn" else "Don't Reset", nil, resetCharacter.DontResetCharFromButton)
		dontResetCharacter.NextSelectionLeft = nil
		dontResetCharacter.Parent = var35
		resetCharacter.Page.Size = UDim2.new(1, 0, 0, dontResetCharacter.AbsolutePosition.Y + dontResetCharacter.AbsoluteSize.Y)
	end
	if fFlagRefactorMenuConfirmationButtonsModule then
		function resetCharacter.RenderPage() --[[ line: 297 ]]
			-- upvalues: resetCharacter (ref), reactRobloxModule (copy), reactModule (copy), ResetCharacterContainer (copy), var38 (ref)
			resetCharacter.PageRoot = reactRobloxModule.createRoot(resetCharacter.Page)
			resetCharacter.PageRoot:render(reactModule.createElement(ResetCharacterContainer, {
				onResetFunction = var38,
				dontResetCharFromButton = resetCharacter.DontResetCharFromButton
			}))
		end
		
		function resetCharacter.UnmountPage() --[[ line: 305 ]]
			-- upvalues: resetCharacter (ref)
			if resetCharacter.PageRoot then
				resetCharacter.PageRoot:unmount()
			end
		end
		
		resetCharacter.Page.Size = UDim2.new(1, 0, 0, 0)
	end
	return resetCharacter
end)()
local var29 = false
var28.Displayed.Event:connect(function() --[[ line: 322 ]]
	-- upvalues: var29 (write), fFlagRefactorMenuConfirmationButtonsModule (ref), var28 (write), guiService (ref), fFlagEnableConsoleExpControls (ref), var16 (ref), fFlagChromeShortcutRemoveLeaveOnRespawnPage (ref), var17 (ref), var18 (ref), contextActionService (ref)
	var29 = true
	
	if fFlagRefactorMenuConfirmationButtonsModule then
		var28.RenderPage()
	end
	if not fFlagRefactorMenuConfirmationButtonsModule then
		guiService.SelectedCoreObject = var28.ResetCharacterButton
	end
	if fFlagEnableConsoleExpControls then
		if not var16 then return end
		if fFlagChromeShortcutRemoveLeaveOnRespawnPage then
			var17:setShortcutBar(var18.TILTMENU_RESPAWN_DIALOG_SHORTCUTBAR_ID)
			
			return
		end
		var17:setShortcutBar(var18.TILTMENU_DIALOG_SHORTCUTBAR_ID)
		
		return
	else
		contextActionService:BindCoreAction("ResetCharacterAction", var28.DontResetCharFromHotkey, false, Enum.KeyCode.ButtonB)
	end
end)
var28.Hidden.Event:connect(function() --[[ line: 343 ]]
	-- upvalues: var29 (write), fFlagRefactorMenuConfirmationButtonsModule (ref), var28 (write), contextActionService (ref)
	var29 = false
	
	if fFlagRefactorMenuConfirmationButtonsModule then
		var28.UnmountPage()
	end
	contextActionService:UnbindCoreAction("ResetCharacterAction")
end)

function var28.SetResetCallback(_, p6) --[[ line: 351 ]]
	-- upvalues: var29 (write), var28 (write)
	if p6 == false and var29 then
		var28.HubRef:PopMenu(nil, true)
	end
	var28.ResetBindable = p6
end

return var28