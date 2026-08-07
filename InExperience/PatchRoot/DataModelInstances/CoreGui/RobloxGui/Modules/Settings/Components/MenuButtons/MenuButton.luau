local corePackagesService = game:GetService("CorePackages")
local userInputService = game:GetService("UserInputService")
local robloxGui = game:GetService("CoreGui"):WaitForChild("RobloxGui")
local utilityModule = require(robloxGui.Modules.Settings.Utility)
local reactModule = require(corePackagesService.Packages.React)
local foundationModule = require(corePackagesService.Packages.Foundation)
local responsiveModule = require(corePackagesService.Workspace.Packages.Responsive)
local coreScriptsRoactCommonModule = require(corePackagesService.Workspace.Packages.CoreScriptsRoactCommon)
local useTokens = foundationModule.Hooks.useTokens
local view = foundationModule.View
local text = foundationModule.Text
local image = foundationModule.Image
local popoverSide = foundationModule.Enums.PopoverSide
local traversal = coreScriptsRoactCommonModule.Traversal
local traversalHistoryMenuModule = require(robloxGui.Modules.Settings.Components.Traversal.TraversalHistoryMenu)
local sharedFlagsModule = require(corePackagesService.Workspace.Packages.SharedFlags)
local fFlagAddTraversalHistoryReactMenuButtonsModule = require(robloxGui.Modules.Settings.Flags.FFlagAddTraversalHistoryReactMenuButtons)
local fIntRelocateMobileMenuButtonsVariantModule = require(robloxGui.Modules.Settings.Flags.FIntRelocateMobileMenuButtonsVariant)
local menuButtonsIncreaseIconSize = game:DefineFastFlag("MenuButtonsIncreaseIconSize", false)
local fFlagFixTraversalHistoryMenuFixesV3 = traversal.Flags.FFlagFixTraversalHistoryMenuFixesV3
local fFlagIEMFocusNavSupportNewButtonsModule = require(robloxGui.Modules.Settings.Flags.FFlagIEMFocusNavSupportNewButtons)
local fFlagGamepadIconSupportCheck = sharedFlagsModule.FFlagGamepadIconSupportCheck

local _ = function(p0) --[[ line: 51 ]]
	return p0 + (1 - p0) * 0.5
end

local function KeyLabelIcon(p1, p2) --[[ line: 55 ]]
	-- upvalues: useTokens (ref), reactModule (ref), view (ref), text (ref)
	local var21
	local var18 = useTokens()
	local createElement = reactModule.createElement
	local t = {
		LayoutOrder = 1,
		tag = "size-1000-700 row align-x-center align-y-center radius-medium"
	}
	local t_1 = { Color3 = var18.Color.ActionStandard.Background.Color3 }
	
	if p2 then
		local transparency = var18.Color.ActionStandard.Background.Transparency
		var21 = transparency + (1 - transparency) * 0.5
	else
		var21 = var18.Color.ActionStandard.Background.Transparency
	end
	local var25
	t_1.Transparency = var21
	t.backgroundStyle = t_1
	local t_2 = {}
	local createElement_1 = reactModule.createElement
	local t_3 = { tag = "text-title-small", Text = p1 }
	local t_4 = { Color3 = var18.Color.ActionStandard.Foreground.Color3 }
	
	if p2 then
		local transparency = var18.Color.ActionStandard.Foreground.Transparency
		var25 = transparency + (1 - transparency) * 0.5
	else
		var25 = var18.Color.ActionStandard.Foreground.Transparency
	end
	t_4.Transparency = var25
	t_3.textStyle = t_4
	t_2.HotkeyText = createElement_1(text, t_3)
	
	return createElement(view, t, t_2)
end

local function Hint(p3) --[[ line: 77 ]]
	-- upvalues: fIntRelocateMobileMenuButtonsVariantModule (ref), utilityModule (ref), responsiveModule (ref), menuButtonsIncreaseIconSize (ref), reactModule (ref), image (ref), KeyLabelIcon (ref)
	if fIntRelocateMobileMenuButtonsVariantModule == 2 and utilityModule:IsSmallTouchScreen() then
		return nil
	elseif p3.lastInput == responsiveModule.Input.Pointer or p3.lastInput == responsiveModule.Input.Directional then
		local var26 = menuButtonsIncreaseIconSize and p3.lastInput ~= responsiveModule.Input.Directional
		
		return reactModule.createElement(image, {
			Image = if p3.lastInput == responsiveModule.Input.Directional then p3.gamepadButtonImageHint else p3.keyboardButtonImageHint,
			imageStyle = {
				Color3 = p3.foregroundStyle.Color3,
				Transparency = if p3.isDisabled then 0.5 else p3.foregroundStyle.Transparency
			},
			tag = {
				["size-700"] = not var26 and p3.isSmall,
				["size-800"] = not var26 and not p3.isSmall,
				["size-900"] = var26 and p3.isSmall,
				["size-1000"] = var26 and not p3.isSmall
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

local function ButtonText(p4) --[[ line: 115 ]]
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

local function supportsButton(p5, p6) --[[ line: 150 ]]
	-- upvalues: fFlagGamepadIconSupportCheck (ref), responsiveModule (ref), userInputService (ref)
	return if fFlagGamepadIconSupportCheck and p6 and p5 == responsiveModule.Input.Directional then userInputService:GamepadSupports(userInputService:GetLastInputType(), p6) else true
end

return reactModule.memo(function(p7) --[[ line: 157 | named "MenuButton" ]]
	-- upvalues: useTokens (ref), fFlagIEMFocusNavSupportNewButtonsModule (ref), fFlagAddTraversalHistoryReactMenuButtonsModule (ref), reactModule (ref), supportsButton (ref), fFlagGamepadIconSupportCheck (ref), userInputService (ref), menuButtonsIncreaseIconSize (ref), responsiveModule (ref), view (ref), Hint (ref), ButtonText (ref), fIntRelocateMobileMenuButtonsVariantModule (ref), utilityModule (ref), image (ref), KeyLabelIcon (ref), text (ref), traversalHistoryMenuModule (ref), fFlagFixTraversalHistoryMenuFixesV3 (ref), popoverSide (ref)
	local transparency
	local var27 = useTokens()
	local var28 = if fFlagIEMFocusNavSupportNewButtonsModule then p7.buttonRef elseif fFlagAddTraversalHistoryReactMenuButtonsModule then reactModule.useRef(nil) else nil
	local var29 = if p7.isEmphasized then var27.Color.ActionSoftEmphasis.Background else var27.Color.ActionStandard.Background
	local var30 = if p7.isEmphasized then var27.Color.ActionSoftEmphasis.Foreground else var27.Color.ActionStandard.Foreground
	local var31, var32 = reactModule.useState(supportsButton(p7.lastInput, p7.gamepadButton))
	reactModule.useEffect(function() --[[ line: 167 ]]
		-- upvalues: fFlagGamepadIconSupportCheck (copy), p7 (ref), userInputService (copy), var32 (ref), supportsButton (copy)
		local var38 = if fFlagGamepadIconSupportCheck and p7.gamepadButton then userInputService.LastInputTypeChanged:Connect(function() --[[ line: 170 ]]
			-- upvalues: var32 (copy), supportsButton (copy), p7 (copy)
			var32(supportsButton(p7.lastInput, p7.gamepadButton))
		end) else nil
		
		return function() --[[ line: 175 ]]
			-- upvalues: var38 (write)
			if var38 then
				var38:Disconnect()
			end
		end
	end, { p7.gamepadButton, p7.lastInput })
	local var33 = menuButtonsIncreaseIconSize and p7.lastInput ~= responsiveModule.Input.Directional
	local createElement = reactModule.createElement
	local t = {
		onActivated = p7.onActivated,
		isDisabled = p7.isDisabled,
		LayoutOrder = p7.layoutOrder
	}
	local t_1 = { Color3 = var29.Color3 }
	
	if p7.isDisabled then
		local transparency_1 = var29.Transparency
		transparency = transparency_1 + (1 - transparency_1) * 0.5
	else
		transparency = var29.Transparency
	end
	local var37
	t_1.Transparency = transparency
	t.backgroundStyle = t_1
	t.tag = {
		["fill auto-x row align-y-center align-x-center gap-small radius-medium"] = true,
		["size-0-1200"] = not p7.isSmall,
		["size-0-1000"] = p7.isSmall,
		["bg-action-standard"] = not p7.isEmphasized,
		["bg-action-soft-emphasis"] = p7.isEmphasized
	}
	t.ref = if fFlagAddTraversalHistoryReactMenuButtonsModule or fFlagIEMFocusNavSupportNewButtonsModule then var28 else nil
	t.Selectable = if fFlagIEMFocusNavSupportNewButtonsModule then true else nil
	local t_2 = {}
	
	if fFlagAddTraversalHistoryReactMenuButtonsModule then
		var37 = reactModule.createElement
		var37 = var37(view, {
			tag = "auto-xy row align-y-center align-x-center grow gap-small"
		}, {
			Hint = if fFlagGamepadIconSupportCheck and not var31 then nil else reactModule.createElement(Hint, {
				lastInput = p7.lastInput,
				gamepadButtonImageHint = p7.gamepadButtonImageHint,
				keyboardButtonImageHint = p7.keyboardButtonImageHint,
				isDisabled = p7.isDisabled,
				foregroundStyle = var30,
				isSmall = p7.isSmall
			}),
			ButtonText = reactModule.createElement(ButtonText, {
				text = p7.text,
				isDisabled = p7.isDisabled,
				foregroundStyle = var30,
				isEmphasized = p7.isEmphasized,
				isSmall = p7.isSmall
			})
		})
	else
		var37 = nil
	end
	t_2.Button = var37
	t_2.Hint = if fFlagGamepadIconSupportCheck and not var31 or fFlagAddTraversalHistoryReactMenuButtonsModule then nil elseif fIntRelocateMobileMenuButtonsVariantModule == 2 and utilityModule:IsSmallTouchScreen() then nil elseif p7.lastInput == responsiveModule.Input.Pointer or p7.lastInput == responsiveModule.Input.Directional then reactModule.createElement(image, {
		Image = if p7.lastInput == responsiveModule.Input.Directional then p7.gamepadButtonImageHint else p7.keyboardButtonImageHint,
		imageStyle = {
			Color3 = var30.Color3,
			Transparency = if p7.isDisabled then 0.5 else var30.Transparency
		},
		tag = {
			["size-700"] = not var33 and p7.isSmall,
			["size-800"] = not var33 and not p7.isSmall,
			["size-900"] = var33 and p7.isSmall,
			["size-1000"] = var33 and not p7.isSmall
		}
	}) elseif p7.lastInput == responsiveModule.Input.Pointer then KeyLabelIcon(p7.keyboardHint, p7.isDisabled) elseif p7.lastInput == responsiveModule.Input.Directional then reactModule.createElement(image, {
		Image = p7.gamepadButtonImageHint,
		imageStyle = {
			Color3 = var30.Color3,
			Transparency = if p7.isDisabled then 0.5 else var30.Transparency
		},
		tag = { ["size-600"] = not p7.isSmall, ["size-500"] = p7.isSmall }
	}) else nil
	t_2.ButtonText = if not fFlagAddTraversalHistoryReactMenuButtonsModule then reactModule.createElement(text, {
		LayoutOrder = 2,
		Text = p7.text,
		textStyle = {
			Color3 = var30.Color3,
			Transparency = if p7.isDisabled then 0.5 else var30.Transparency
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
		anchorRef = var28,
		currentPageChangeSignal = p7.currentPageChangeSignal,
		menuSide = if fFlagFixTraversalHistoryMenuFixesV3 then if p7.isSmall then popoverSide.Bottom else popoverSide.Top else nil
	}) else nil
	
	return createElement(view, t, t_2)
end)