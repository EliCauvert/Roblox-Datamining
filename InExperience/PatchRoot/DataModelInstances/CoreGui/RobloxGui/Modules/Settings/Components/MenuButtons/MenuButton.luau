local corePackagesService = game:GetService("CorePackages")
local userInputService = game:GetService("UserInputService")
local robloxGui = game:GetService("CoreGui"):WaitForChild("RobloxGui")
local utilityModule = require(robloxGui.Modules.Settings.Utility)
local reactModule = require(corePackagesService.Packages.React)
local foundationModule = require(corePackagesService.Packages.Foundation)
local responsiveModule = require(corePackagesService.Workspace.Packages.Responsive)
local useTokens = foundationModule.Hooks.useTokens
local view = foundationModule.View
local text = foundationModule.Text
local image = foundationModule.Image
local popoverSide = foundationModule.Enums.PopoverSide
local traversalHistoryMenuModule = require(robloxGui.Modules.Settings.Components.Traversal.TraversalHistoryMenu)
local sharedFlagsModule = require(corePackagesService.Workspace.Packages.SharedFlags)
local fFlagAddTraversalHistoryReactMenuButtonsModule = require(robloxGui.Modules.Settings.Flags.FFlagAddTraversalHistoryReactMenuButtons)
local fIntRelocateMobileMenuButtonsVariantModule = require(robloxGui.Modules.Settings.Flags.FIntRelocateMobileMenuButtonsVariant)
local menuButtonsIncreaseIconSize = game:DefineFastFlag("MenuButtonsIncreaseIconSize", false)
local fFlagIEMFocusNavSupportNewButtonsModule = require(robloxGui.Modules.Settings.Flags.FFlagIEMFocusNavSupportNewButtons)
local fFlagGamepadIconSupportCheck = sharedFlagsModule.FFlagGamepadIconSupportCheck

local _ = function(p1)
	return p1 + (1 - p1) * 0.5
end

local function KeyLabelIcon(p1, p2)
	-- upvalues: useTokens (ref), reactModule (ref), view (ref), text (ref)
	local var1
	local var2 = useTokens()
	local createElement = reactModule.createElement
	local t = {
		LayoutOrder = 1,
		tag = "size-1000-700 row align-x-center align-y-center radius-medium"
	}
	local t_1 = { Color3 = var2.Color.ActionStandard.Background.Color3 }
	
	if p2 then
		local transparency = var2.Color.ActionStandard.Background.Transparency
		var1 = transparency + (1 - transparency) * 0.5
	else
		var1 = var2.Color.ActionStandard.Background.Transparency
	end
	local var3
	t_1.Transparency = var1
	t.backgroundStyle = t_1
	local t_2 = {}
	local createElement_1 = reactModule.createElement
	local t_3 = { tag = "text-title-small", Text = p1 }
	local t_4 = { Color3 = var2.Color.ActionStandard.Foreground.Color3 }
	
	if p2 then
		local transparency = var2.Color.ActionStandard.Foreground.Transparency
		var3 = transparency + (1 - transparency) * 0.5
	else
		var3 = var2.Color.ActionStandard.Foreground.Transparency
	end
	t_4.Transparency = var3
	t_3.textStyle = t_4
	t_2.HotkeyText = createElement_1(text, t_3)
	
	return createElement(view, t, t_2)
end

local function Hint(p1)
	-- upvalues: fIntRelocateMobileMenuButtonsVariantModule (ref), utilityModule (ref), responsiveModule (ref), menuButtonsIncreaseIconSize (ref), reactModule (ref), image (ref), KeyLabelIcon (ref)
	if fIntRelocateMobileMenuButtonsVariantModule == 2 and utilityModule:IsSmallTouchScreen() then
		return nil
	elseif p1.lastInput == responsiveModule.Input.Pointer or p1.lastInput == responsiveModule.Input.Directional then
		local var1 = menuButtonsIncreaseIconSize and p1.lastInput ~= responsiveModule.Input.Directional
		
		return reactModule.createElement(image, {
			Image = if p1.lastInput == responsiveModule.Input.Directional then p1.gamepadButtonImageHint else p1.keyboardButtonImageHint,
			imageStyle = {
				Color3 = p1.foregroundStyle.Color3,
				Transparency = if p1.isDisabled then 0.5 else p1.foregroundStyle.Transparency
			},
			tag = {
				["size-700"] = not var1 and p1.isSmall,
				["size-800"] = not var1 and not p1.isSmall,
				["size-900"] = var1 and p1.isSmall,
				["size-1000"] = var1 and not p1.isSmall
			}
		})
	end
	return if p1.lastInput == responsiveModule.Input.Pointer then KeyLabelIcon(p1.keyboardHint, p1.isDisabled) elseif p1.lastInput == responsiveModule.Input.Directional then reactModule.createElement(image, {
		Image = p1.gamepadButtonImageHint,
		imageStyle = {
			Color3 = p1.foregroundStyle.Color3,
			Transparency = if p1.isDisabled then 0.5 else p1.foregroundStyle.Transparency
		},
		tag = { ["size-600"] = not p1.isSmall, ["size-500"] = p1.isSmall }
	}) else nil
end

local function ButtonText(p1)
	-- upvalues: reactModule (ref), text (ref)
	return reactModule.createElement(text, {
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

local function supportsButton(p1, p2)
	-- upvalues: fFlagGamepadIconSupportCheck (ref), responsiveModule (ref), userInputService (ref)
	return if fFlagGamepadIconSupportCheck and p2 and p1 == responsiveModule.Input.Directional then userInputService:GamepadSupports(userInputService:GetLastInputType(), p2) else true
end

return reactModule.memo(function(p1)
	-- upvalues: useTokens (ref), fFlagIEMFocusNavSupportNewButtonsModule (ref), fFlagAddTraversalHistoryReactMenuButtonsModule (ref), reactModule (ref), supportsButton (ref), fFlagGamepadIconSupportCheck (ref), userInputService (ref), menuButtonsIncreaseIconSize (ref), responsiveModule (ref), view (ref), Hint (ref), ButtonText (ref), fIntRelocateMobileMenuButtonsVariantModule (ref), utilityModule (ref), image (ref), KeyLabelIcon (ref), text (ref), traversalHistoryMenuModule (ref), popoverSide (ref)
	local transparency
	local var1 = useTokens()
	local var2 = if fFlagIEMFocusNavSupportNewButtonsModule then p1.buttonRef elseif fFlagAddTraversalHistoryReactMenuButtonsModule then reactModule.useRef(nil) else nil
	local var3 = if p1.isEmphasized then var1.Color.ActionSoftEmphasis.Background else var1.Color.ActionStandard.Background
	local var4 = if p1.isEmphasized then var1.Color.ActionSoftEmphasis.Foreground else var1.Color.ActionStandard.Foreground
	local var5, var6 = reactModule.useState(supportsButton(p1.lastInput, p1.gamepadButton))
	reactModule.useEffect(function()
		-- upvalues: fFlagGamepadIconSupportCheck (copy), p1 (ref), userInputService (copy), var6 (ref), supportsButton (copy)
		local var7 = if fFlagGamepadIconSupportCheck and p1.gamepadButton then userInputService.LastInputTypeChanged:Connect(function()
			-- upvalues: var6 (copy), supportsButton (copy), p1 (copy)
			var6(supportsButton(p1.lastInput, p1.gamepadButton))
		end) else nil
		
		return function()
			-- upvalues: var7 (write)
			if var7 then
				var7:Disconnect()
			end
		end
	end, { p1.gamepadButton, p1.lastInput })
	local var7 = menuButtonsIncreaseIconSize and p1.lastInput ~= responsiveModule.Input.Directional
	local createElement = reactModule.createElement
	local t = {
		onActivated = p1.onActivated,
		isDisabled = p1.isDisabled,
		LayoutOrder = p1.layoutOrder
	}
	local t_1 = { Color3 = var3.Color3 }
	
	if p1.isDisabled then
		local transparency_1 = var3.Transparency
		transparency = transparency_1 + (1 - transparency_1) * 0.5
	else
		transparency = var3.Transparency
	end
	local var8
	t_1.Transparency = transparency
	t.backgroundStyle = t_1
	t.tag = {
		["fill auto-x row align-y-center align-x-center gap-small radius-medium"] = true,
		["size-0-1200"] = not p1.isSmall,
		["size-0-1000"] = p1.isSmall,
		["bg-action-standard"] = not p1.isEmphasized,
		["bg-action-soft-emphasis"] = p1.isEmphasized
	}
	t.ref = if fFlagAddTraversalHistoryReactMenuButtonsModule or fFlagIEMFocusNavSupportNewButtonsModule then var2 else nil
	t.Selectable = if fFlagIEMFocusNavSupportNewButtonsModule then true else nil
	local t_2 = {}
	
	if fFlagAddTraversalHistoryReactMenuButtonsModule then
		var8 = reactModule.createElement
		var8 = var8(view, {
			tag = "auto-xy row align-y-center align-x-center grow gap-small"
		}, {
			Hint = if fFlagGamepadIconSupportCheck and not var5 then nil else reactModule.createElement(Hint, {
				lastInput = p1.lastInput,
				gamepadButtonImageHint = p1.gamepadButtonImageHint,
				keyboardButtonImageHint = p1.keyboardButtonImageHint,
				isDisabled = p1.isDisabled,
				foregroundStyle = var4,
				isSmall = p1.isSmall
			}),
			ButtonText = reactModule.createElement(ButtonText, {
				text = p1.text,
				isDisabled = p1.isDisabled,
				foregroundStyle = var4,
				isEmphasized = p1.isEmphasized,
				isSmall = p1.isSmall
			})
		})
	else
		var8 = nil
	end
	t_2.Button = var8
	t_2.Hint = if fFlagGamepadIconSupportCheck and not var5 or fFlagAddTraversalHistoryReactMenuButtonsModule then nil elseif fIntRelocateMobileMenuButtonsVariantModule == 2 and utilityModule:IsSmallTouchScreen() then nil elseif p1.lastInput == responsiveModule.Input.Pointer or p1.lastInput == responsiveModule.Input.Directional then reactModule.createElement(image, {
		Image = if p1.lastInput == responsiveModule.Input.Directional then p1.gamepadButtonImageHint else p1.keyboardButtonImageHint,
		imageStyle = {
			Color3 = var4.Color3,
			Transparency = if p1.isDisabled then 0.5 else var4.Transparency
		},
		tag = {
			["size-700"] = not var7 and p1.isSmall,
			["size-800"] = not var7 and not p1.isSmall,
			["size-900"] = var7 and p1.isSmall,
			["size-1000"] = var7 and not p1.isSmall
		}
	}) elseif p1.lastInput == responsiveModule.Input.Pointer then KeyLabelIcon(p1.keyboardHint, p1.isDisabled) elseif p1.lastInput == responsiveModule.Input.Directional then reactModule.createElement(image, {
		Image = p1.gamepadButtonImageHint,
		imageStyle = {
			Color3 = var4.Color3,
			Transparency = if p1.isDisabled then 0.5 else var4.Transparency
		},
		tag = { ["size-600"] = not p1.isSmall, ["size-500"] = p1.isSmall }
	}) else nil
	t_2.ButtonText = if not fFlagAddTraversalHistoryReactMenuButtonsModule then reactModule.createElement(text, {
		LayoutOrder = 2,
		Text = p1.text,
		textStyle = {
			Color3 = var4.Color3,
			Transparency = if p1.isDisabled then 0.5 else var4.Transparency
		},
		tag = {
			["auto-x"] = true,
			["text-title-medium"] = not p1.isSmall,
			["text-title-small"] = p1.isSmall,
			["content-action-standard"] = not p1.isEmphasized,
			["content-action-soft-emphasis"] = p1.isEmphasized
		}
	}) else nil
	t_2.TraversalHistoryMenu = if fFlagAddTraversalHistoryReactMenuButtonsModule and p1.addTraversalHistoryMenu then reactModule.createElement(traversalHistoryMenuModule, {
		idleButtonStateIsDown = true,
		isDarkOnDarkMode = true,
		anchorRef = var2,
		currentPageChangeSignal = p1.currentPageChangeSignal,
		menuSide = if p1.isSmall then popoverSide.Bottom else popoverSide.Top
	}) else nil
	
	return createElement(view, t, t_2)
end)