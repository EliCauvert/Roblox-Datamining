local CorePackages = game:GetService("CorePackages")
local UserInputService = game:GetService("UserInputService")
local RobloxGui = game:GetService("CoreGui"):WaitForChild("RobloxGui")
local UtilityModule = require(RobloxGui.Modules.Settings.Utility)
local ReactModule = require(CorePackages.Packages.React)
local FoundationModule = require(CorePackages.Packages.Foundation)
local ResponsiveModule = require(CorePackages.Workspace.Packages.Responsive)
local UseTokensFunction = FoundationModule.Hooks.useTokens
local View = FoundationModule.View
local Text = FoundationModule.Text
local Image = FoundationModule.Image
local PopoverSide = FoundationModule.Enums.PopoverSide
local TraversalHistoryMenuModule = require(RobloxGui.Modules.Settings.Components.Traversal.TraversalHistoryMenu)
local FFlagAddTraversalHistoryReactMenuButtonsModule = require(RobloxGui.Modules.Settings.Flags.FFlagAddTraversalHistoryReactMenuButtons)
local FIntRelocateMobileMenuButtonsVariantModule = require(RobloxGui.Modules.Settings.Flags.FIntRelocateMobileMenuButtonsVariant)
local MenuButtonsIncreaseIconSize = game:DefineFastFlag("MenuButtonsIncreaseIconSize", false)
local FFlagIEMFocusNavSupportNewButtonsModule = require(RobloxGui.Modules.Settings.Flags.FFlagIEMFocusNavSupportNewButtons)
local FFlagGamepadIconSupportCheck = require(CorePackages.Workspace.Packages.SharedFlags).FFlagGamepadIconSupportCheck

local function _(p1: number): number
	return p1 + (1 - p1) * 0.5
end

local function KeyLabelIcon(KeyboardHint, IsDisabled)
	-- upvalues: UseTokensFunction (copy), ReactModule (copy), View (copy), Text (copy)
	local UseTokensResult = UseTokensFunction()
	local CreateElementFunction = ReactModule.createElement
	local config = {
		LayoutOrder = 1,
		tag = "size-1000-700 row align-x-center align-y-center radius-medium"
	}
	local BackgroundStyle = {
		Color3 = UseTokensResult.Color.ActionStandard.Background.Color3
	}
	local NewTransparency = nil
	
	if IsDisabled then
		local Transparency: number = UseTokensResult.Color.ActionStandard.Background.Transparency
		NewTransparency = Transparency + (1 - Transparency) * 0.5
	else
		NewTransparency = UseTokensResult.Color.ActionStandard.Background.Transparency
	end
	BackgroundStyle.Transparency = NewTransparency
	config.backgroundStyle = BackgroundStyle
	local t = {}
	local CreateElementFunction1 = ReactModule.createElement
	local config1 = { tag = "text-title-small", Text = KeyboardHint }
	local TextStyle = {
		Color3 = UseTokensResult.Color.ActionStandard.Foreground.Color3
	}
	local NewTransparency1 = nil
	
	if IsDisabled then
		local Transparency: number = UseTokensResult.Color.ActionStandard.Foreground.Transparency
		NewTransparency1 = Transparency + (1 - Transparency) * 0.5
	else
		NewTransparency1 = UseTokensResult.Color.ActionStandard.Foreground.Transparency
	end
	TextStyle.Transparency = NewTransparency1
	config1.textStyle = TextStyle
	t.HotkeyText = CreateElementFunction1(Text, config1)
	
	return CreateElementFunction(View, config, t)
end

local function Hint(p1)
	-- upvalues: FIntRelocateMobileMenuButtonsVariantModule (copy), UtilityModule (copy), ResponsiveModule (copy), MenuButtonsIncreaseIconSize (copy), ReactModule (copy), Image (copy), KeyLabelIcon (copy)
	if FIntRelocateMobileMenuButtonsVariantModule == 2 and UtilityModule:IsSmallTouchScreen() then
		return nil
	elseif p1.lastInput == ResponsiveModule.Input.Pointer or p1.lastInput == ResponsiveModule.Input.Directional then
		local IsNotLastInputMatch: boolean = MenuButtonsIncreaseIconSize and p1.lastInput ~= ResponsiveModule.Input.Directional
		
		return ReactModule.createElement(Image, {
			Image = if p1.lastInput == ResponsiveModule.Input.Directional then p1.gamepadButtonImageHint else p1.keyboardButtonImageHint,
			imageStyle = {
				Color3 = p1.foregroundStyle.Color3,
				Transparency = if p1.isDisabled then 0.5 else p1.foregroundStyle.Transparency
			},
			tag = {
				["size-700"] = not IsNotLastInputMatch and p1.isSmall,
				["size-800"] = not IsNotLastInputMatch and not p1.isSmall,
				["size-900"] = IsNotLastInputMatch and p1.isSmall,
				["size-1000"] = IsNotLastInputMatch and not p1.isSmall
			}
		})
	else
		return if p1.lastInput == ResponsiveModule.Input.Pointer then KeyLabelIcon(p1.keyboardHint, p1.isDisabled) elseif p1.lastInput == ResponsiveModule.Input.Directional then ReactModule.createElement(Image, {
			Image = p1.gamepadButtonImageHint,
			imageStyle = {
				Color3 = p1.foregroundStyle.Color3,
				Transparency = if p1.isDisabled then 0.5 else p1.foregroundStyle.Transparency
			},
			tag = { ["size-600"] = not p1.isSmall, ["size-500"] = p1.isSmall }
		}) else nil
	end
end

local function ButtonText(p1)
	-- upvalues: ReactModule (copy), Text (copy)
	return ReactModule.createElement(Text, {
		LayoutOrder = 2,
		Text = p1.text,
		textStyle = {
			Color3 = p1.foregroundStyle.Color3,
			Transparency = if p1.isDisabled then 0.5 else p1.foregroundStyle.Transparency
		},
		tag = {
			["auto-x"] = true,
			["text-title-medium"] = not p1.isSmall,
			["text-title-small"] = p1.isSmall,
			["content-action-standard"] = not p1.isEmphasized,
			["content-action-soft-emphasis"] = p1.isEmphasized
		}
	})
end

local function supportsButton(LastInput, GamepadButton)
	-- upvalues: FFlagGamepadIconSupportCheck (copy), ResponsiveModule (copy), UserInputService (copy)
	return not FFlagGamepadIconSupportCheck or not GamepadButton or LastInput ~= ResponsiveModule.Input.Directional or UserInputService:GamepadSupports(UserInputService:GetLastInputType(), GamepadButton)
end

return ReactModule.memo(function(p1)
	-- upvalues: UseTokensFunction (copy), FFlagIEMFocusNavSupportNewButtonsModule (copy), FFlagAddTraversalHistoryReactMenuButtonsModule (copy), ReactModule (copy), supportsButton (copy), FFlagGamepadIconSupportCheck (copy), UserInputService (copy), MenuButtonsIncreaseIconSize (copy), ResponsiveModule (copy), View (copy), Hint (copy), ButtonText (copy), FIntRelocateMobileMenuButtonsVariantModule (copy), UtilityModule (copy), Image (copy), KeyLabelIcon (copy), Text (copy), TraversalHistoryMenuModule (copy), PopoverSide (copy)
	local UseTokensResult = UseTokensFunction()
	local ButtonRef = if FFlagIEMFocusNavSupportNewButtonsModule then p1.buttonRef elseif FFlagAddTraversalHistoryReactMenuButtonsModule then ReactModule.useRef(nil) else nil
	local Background = if p1.isEmphasized then UseTokensResult.Color.ActionSoftEmphasis.Background else UseTokensResult.Color.ActionStandard.Background
	local Foreground = if p1.isEmphasized then UseTokensResult.Color.ActionSoftEmphasis.Foreground else UseTokensResult.Color.ActionStandard.Foreground
	local UseStateResult, UseStateResult2 = ReactModule.useState(supportsButton(p1.lastInput, p1.gamepadButton))
	ReactModule.useEffect(function()
		-- upvalues: FFlagGamepadIconSupportCheck (upval), p1 (copy), UserInputService (upval), UseStateResult2 (copy), supportsButton (upval)
		local LastInputTypeChangedConnection = if FFlagGamepadIconSupportCheck and p1.gamepadButton then UserInputService.LastInputTypeChanged:Connect(function()
			-- upvalues: UseStateResult2 (upval), supportsButton (upval), p1 (upval)
			UseStateResult2(supportsButton(p1.lastInput, p1.gamepadButton))
		end) else nil
		
		return function()
			-- upvalues: LastInputTypeChangedConnection (ref)
			if LastInputTypeChangedConnection then
				LastInputTypeChangedConnection:Disconnect()
			end
		end
	end, { p1.gamepadButton, p1.lastInput })
	local IsNotLastInputMatch: boolean = MenuButtonsIncreaseIconSize and p1.lastInput ~= ResponsiveModule.Input.Directional
	local CreateElementFunction = ReactModule.createElement
	local config = {
		onActivated = p1.onActivated,
		isDisabled = p1.isDisabled,
		LayoutOrder = p1.layoutOrder
	}
	local BackgroundStyle = { Color3 = Background.Color3 }
	local NewTransparency = nil
	
	if p1.isDisabled then
		local Transparency: number = Background.Transparency
		NewTransparency = Transparency + (1 - Transparency) * 0.5
	else
		NewTransparency = Background.Transparency
	end
	BackgroundStyle.Transparency = NewTransparency
	config.backgroundStyle = BackgroundStyle
	config.tag = {
		["fill auto-x row align-y-center align-x-center gap-small radius-medium"] = true,
		["size-0-1200"] = not p1.isSmall,
		["size-0-1000"] = p1.isSmall,
		["bg-action-standard"] = not p1.isEmphasized,
		["bg-action-soft-emphasis"] = p1.isEmphasized
	}
	config.ref = if FFlagAddTraversalHistoryReactMenuButtonsModule or FFlagIEMFocusNavSupportNewButtonsModule then ButtonRef else nil
	config.Selectable = if FFlagIEMFocusNavSupportNewButtonsModule then true else nil
	
	return CreateElementFunction(View, config, {
		Button = if FFlagAddTraversalHistoryReactMenuButtonsModule then ReactModule.createElement(View, {
			tag = "auto-xy row align-y-center align-x-center grow gap-small"
		}, {
			Hint = if FFlagGamepadIconSupportCheck and not UseStateResult then nil else ReactModule.createElement(Hint, {
				lastInput = p1.lastInput,
				gamepadButtonImageHint = p1.gamepadButtonImageHint,
				keyboardButtonImageHint = p1.keyboardButtonImageHint,
				isDisabled = p1.isDisabled,
				foregroundStyle = Foreground,
				isSmall = p1.isSmall
			}),
			ButtonText = ReactModule.createElement(ButtonText, {
				text = p1.text,
				isDisabled = p1.isDisabled,
				foregroundStyle = Foreground,
				isEmphasized = p1.isEmphasized,
				isSmall = p1.isSmall
			})
		}) else nil,
		Hint = if FFlagGamepadIconSupportCheck and not UseStateResult then nil elseif FFlagAddTraversalHistoryReactMenuButtonsModule then nil elseif FIntRelocateMobileMenuButtonsVariantModule == 2 and UtilityModule:IsSmallTouchScreen() then nil elseif p1.lastInput == ResponsiveModule.Input.Pointer or p1.lastInput == ResponsiveModule.Input.Directional then ReactModule.createElement(Image, {
			Image = if p1.lastInput == ResponsiveModule.Input.Directional then p1.gamepadButtonImageHint else p1.keyboardButtonImageHint,
			imageStyle = {
				Color3 = Foreground.Color3,
				Transparency = if p1.isDisabled then 0.5 else Foreground.Transparency
			},
			tag = {
				["size-700"] = not IsNotLastInputMatch and p1.isSmall,
				["size-800"] = not IsNotLastInputMatch and not p1.isSmall,
				["size-900"] = IsNotLastInputMatch and p1.isSmall,
				["size-1000"] = IsNotLastInputMatch and not p1.isSmall
			}
		}) elseif p1.lastInput == ResponsiveModule.Input.Pointer then KeyLabelIcon(p1.keyboardHint, p1.isDisabled) elseif p1.lastInput == ResponsiveModule.Input.Directional then ReactModule.createElement(Image, {
			Image = p1.gamepadButtonImageHint,
			imageStyle = {
				Color3 = Foreground.Color3,
				Transparency = if p1.isDisabled then 0.5 else Foreground.Transparency
			},
			tag = { ["size-600"] = not p1.isSmall, ["size-500"] = p1.isSmall }
		}) else nil,
		ButtonText = if FFlagAddTraversalHistoryReactMenuButtonsModule then nil else ReactModule.createElement(Text, {
			LayoutOrder = 2,
			Text = p1.text,
			textStyle = {
				Color3 = Foreground.Color3,
				Transparency = if p1.isDisabled then 0.5 else Foreground.Transparency
			},
			tag = {
				["auto-x"] = true,
				["text-title-medium"] = not p1.isSmall,
				["text-title-small"] = p1.isSmall,
				["content-action-standard"] = not p1.isEmphasized,
				["content-action-soft-emphasis"] = p1.isEmphasized
			}
		}),
		TraversalHistoryMenu = if FFlagAddTraversalHistoryReactMenuButtonsModule and p1.addTraversalHistoryMenu then ReactModule.createElement(TraversalHistoryMenuModule, {
			idleButtonStateIsDown = true,
			isDarkOnDarkMode = true,
			anchorRef = ButtonRef,
			currentPageChangeSignal = p1.currentPageChangeSignal,
			menuSide = if p1.isSmall then PopoverSide.Bottom else PopoverSide.Top
		}) else nil
	})
end)