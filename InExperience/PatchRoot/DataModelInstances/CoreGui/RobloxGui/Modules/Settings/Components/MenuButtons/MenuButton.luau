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

local _ = function(p0) --[[ line: 47 ]]
	return p0 + (1 - p0) * 0.5
end

local function KeyLabelIcon(p1, p2) --[[ line: 51 ]]
	-- upvalues: useTokens (ref), reactModule (ref), view (ref), text (ref)
	local var20
	local var17 = useTokens()
	local createElement = reactModule.createElement
	local t = {
		LayoutOrder = 1,
		tag = "size-1000-700 row align-x-center align-y-center radius-medium"
	}
	local t_1 = { Color3 = var17.Color.ActionStandard.Background.Color3 }
	
	if p2 then
		local transparency = var17.Color.ActionStandard.Background.Transparency
		var20 = transparency + (1 - transparency) * 0.5
	else
		var20 = var17.Color.ActionStandard.Background.Transparency
	end
	local var24
	t_1.Transparency = var20
	t.backgroundStyle = t_1
	local t_2 = {}
	local createElement_1 = reactModule.createElement
	local t_3 = { tag = "text-title-small", Text = p1 }
	local t_4 = { Color3 = var17.Color.ActionStandard.Foreground.Color3 }
	
	if p2 then
		local transparency = var17.Color.ActionStandard.Foreground.Transparency
		var24 = transparency + (1 - transparency) * 0.5
	else
		var24 = var17.Color.ActionStandard.Foreground.Transparency
	end
	t_4.Transparency = var24
	t_3.textStyle = t_4
	t_2.HotkeyText = createElement_1(text, t_3)
	
	return createElement(view, t, t_2)
end

local function Hint(p3) --[[ line: 73 ]]
	-- upvalues: fIntRelocateMobileMenuButtonsVariantModule (ref), utilityModule (ref), responsiveModule (ref), menuButtonsIncreaseIconSize (ref), reactModule (ref), image (ref), KeyLabelIcon (ref)
	if fIntRelocateMobileMenuButtonsVariantModule == 2 and utilityModule:IsSmallTouchScreen() then
		return nil
	elseif p3.lastInput == responsiveModule.Input.Pointer or p3.lastInput == responsiveModule.Input.Directional then
		local var25 = menuButtonsIncreaseIconSize and p3.lastInput ~= responsiveModule.Input.Directional
		
		return reactModule.createElement(image, {
			Image = if p3.lastInput == responsiveModule.Input.Directional then p3.gamepadButtonImageHint else p3.keyboardButtonImageHint,
			imageStyle = {
				Color3 = p3.foregroundStyle.Color3,
				Transparency = if p3.isDisabled then 0.5 else p3.foregroundStyle.Transparency
			},
			tag = {
				["size-700"] = not var25 and p3.isSmall,
				["size-800"] = not var25 and not p3.isSmall,
				["size-900"] = var25 and p3.isSmall,
				["size-1000"] = var25 and not p3.isSmall
			}
		})
	end
	return if p3.lastInput == responsiveModule.Input.Pointer then KeyLabelIcon(p3.keyboardHint, p3.isDisabled) elseif p3.lastInput == responsiveModule.Input.Directional then reactModule.createElement(image, {
		Image = p3.gamepadButtonImageHint,
		imageStyle = {
			Color3 = p3.foregroundStyle.Color3,
			Transparency = if p3.isDisabled then 0.5 else p3.foregroundStyle.Transparency
		},
		tag = { ["size-600"] = not p3.isSmall, ["size-500"] = p3.isSmall }
	}) else nil
end

local function ButtonText(p4) --[[ line: 111 ]]
	-- upvalues: reactModule (ref), text (ref)
	return reactModule.createElement(text, {
		LayoutOrder = 2,
		Text = p4.text,
		textStyle = {
			Color3 = p4.foregroundStyle.Color3,
			Transparency = if p4.isDisabled then 0.5 else p4.foregroundStyle.Transparency
		},
		tag = {
			["auto-x"] = true,
			["text-title-medium"] = not p4.isSmall,
			["text-title-small"] = p4.isSmall,
			["content-action-standard"] = not p4.isEmphasized,
			["content-action-soft-emphasis"] = p4.isEmphasized
		}
	})
end

local function supportsButton(p5, p6) --[[ line: 146 ]]
	-- upvalues: fFlagGamepadIconSupportCheck (ref), responsiveModule (ref), userInputService (ref)
	return if fFlagGamepadIconSupportCheck and p6 and p5 == responsiveModule.Input.Directional then userInputService:GamepadSupports(userInputService:GetLastInputType(), p6) else true
end

return reactModule.memo(function(p7) --[[ line: 153 | named "MenuButton" ]]
	-- upvalues: useTokens (ref), fFlagIEMFocusNavSupportNewButtonsModule (ref), fFlagAddTraversalHistoryReactMenuButtonsModule (ref), reactModule (ref), supportsButton (ref), fFlagGamepadIconSupportCheck (ref), userInputService (ref), menuButtonsIncreaseIconSize (ref), responsiveModule (ref), view (ref), Hint (ref), ButtonText (ref), fIntRelocateMobileMenuButtonsVariantModule (ref), utilityModule (ref), image (ref), KeyLabelIcon (ref), text (ref), traversalHistoryMenuModule (ref), popoverSide (ref)
	local transparency
	local var26 = useTokens()
	local var27 = if fFlagIEMFocusNavSupportNewButtonsModule then p7.buttonRef elseif fFlagAddTraversalHistoryReactMenuButtonsModule then reactModule.useRef(nil) else nil
	local var28 = if p7.isEmphasized then var26.Color.ActionSoftEmphasis.Background else var26.Color.ActionStandard.Background
	local var29 = if p7.isEmphasized then var26.Color.ActionSoftEmphasis.Foreground else var26.Color.ActionStandard.Foreground
	local var30, var31 = reactModule.useState(supportsButton(p7.lastInput, p7.gamepadButton))
	reactModule.useEffect(function() --[[ line: 163 ]]
		-- upvalues: fFlagGamepadIconSupportCheck (copy), p7 (ref), userInputService (copy), var31 (ref), supportsButton (copy)
		local var37 = if fFlagGamepadIconSupportCheck and p7.gamepadButton then userInputService.LastInputTypeChanged:Connect(function() --[[ line: 166 ]]
			-- upvalues: var31 (copy), supportsButton (copy), p7 (copy)
			var31(supportsButton(p7.lastInput, p7.gamepadButton))
		end) else nil
		
		return function() --[[ line: 171 ]]
			-- upvalues: var37 (write)
			if var37 then
				var37:Disconnect()
			end
		end
	end, { p7.gamepadButton, p7.lastInput })
	local var32 = menuButtonsIncreaseIconSize and p7.lastInput ~= responsiveModule.Input.Directional
	local createElement = reactModule.createElement
	local t = {
		onActivated = p7.onActivated,
		isDisabled = p7.isDisabled,
		LayoutOrder = p7.layoutOrder
	}
	local t_1 = { Color3 = var28.Color3 }
	
	if p7.isDisabled then
		local transparency_1 = var28.Transparency
		transparency = transparency_1 + (1 - transparency_1) * 0.5
	else
		transparency = var28.Transparency
	end
	local var36
	t_1.Transparency = transparency
	t.backgroundStyle = t_1
	t.tag = {
		["fill auto-x row align-y-center align-x-center gap-small radius-medium"] = true,
		["size-0-1200"] = not p7.isSmall,
		["size-0-1000"] = p7.isSmall,
		["bg-action-standard"] = not p7.isEmphasized,
		["bg-action-soft-emphasis"] = p7.isEmphasized
	}
	t.ref = if fFlagAddTraversalHistoryReactMenuButtonsModule or fFlagIEMFocusNavSupportNewButtonsModule then var27 else nil
	t.Selectable = if fFlagIEMFocusNavSupportNewButtonsModule then true else nil
	local t_2 = {}
	
	if fFlagAddTraversalHistoryReactMenuButtonsModule then
		var36 = reactModule.createElement
		var36 = var36(view, {
			tag = "auto-xy row align-y-center align-x-center grow gap-small"
		}, {
			Hint = if fFlagGamepadIconSupportCheck and not var30 then nil else reactModule.createElement(Hint, {
				lastInput = p7.lastInput,
				gamepadButtonImageHint = p7.gamepadButtonImageHint,
				keyboardButtonImageHint = p7.keyboardButtonImageHint,
				isDisabled = p7.isDisabled,
				foregroundStyle = var29,
				isSmall = p7.isSmall
			}),
			ButtonText = reactModule.createElement(ButtonText, {
				text = p7.text,
				isDisabled = p7.isDisabled,
				foregroundStyle = var29,
				isEmphasized = p7.isEmphasized,
				isSmall = p7.isSmall
			})
		})
	else
		var36 = nil
	end
	t_2.Button = var36
	t_2.Hint = if fFlagGamepadIconSupportCheck and not var30 or fFlagAddTraversalHistoryReactMenuButtonsModule then nil elseif fIntRelocateMobileMenuButtonsVariantModule == 2 and utilityModule:IsSmallTouchScreen() then nil elseif p7.lastInput == responsiveModule.Input.Pointer or p7.lastInput == responsiveModule.Input.Directional then reactModule.createElement(image, {
		Image = if p7.lastInput == responsiveModule.Input.Directional then p7.gamepadButtonImageHint else p7.keyboardButtonImageHint,
		imageStyle = {
			Color3 = var29.Color3,
			Transparency = if p7.isDisabled then 0.5 else var29.Transparency
		},
		tag = {
			["size-700"] = not var32 and p7.isSmall,
			["size-800"] = not var32 and not p7.isSmall,
			["size-900"] = var32 and p7.isSmall,
			["size-1000"] = var32 and not p7.isSmall
		}
	}) elseif p7.lastInput == responsiveModule.Input.Pointer then KeyLabelIcon(p7.keyboardHint, p7.isDisabled) elseif p7.lastInput == responsiveModule.Input.Directional then reactModule.createElement(image, {
		Image = p7.gamepadButtonImageHint,
		imageStyle = {
			Color3 = var29.Color3,
			Transparency = if p7.isDisabled then 0.5 else var29.Transparency
		},
		tag = { ["size-600"] = not p7.isSmall, ["size-500"] = p7.isSmall }
	}) else nil
	t_2.ButtonText = if not fFlagAddTraversalHistoryReactMenuButtonsModule then reactModule.createElement(text, {
		LayoutOrder = 2,
		Text = p7.text,
		textStyle = {
			Color3 = var29.Color3,
			Transparency = if p7.isDisabled then 0.5 else var29.Transparency
		},
		tag = {
			["auto-x"] = true,
			["text-title-medium"] = not p7.isSmall,
			["text-title-small"] = p7.isSmall,
			["content-action-standard"] = not p7.isEmphasized,
			["content-action-soft-emphasis"] = p7.isEmphasized
		}
	}) else nil
	t_2.TraversalHistoryMenu = if fFlagAddTraversalHistoryReactMenuButtonsModule and p7.addTraversalHistoryMenu then reactModule.createElement(traversalHistoryMenuModule, {
		idleButtonStateIsDown = true,
		isDarkOnDarkMode = true,
		anchorRef = var27,
		currentPageChangeSignal = p7.currentPageChangeSignal,
		menuSide = if p7.isSmall then popoverSide.Bottom else popoverSide.Top
	}) else nil
	
	return createElement(view, t, t_2)
end)