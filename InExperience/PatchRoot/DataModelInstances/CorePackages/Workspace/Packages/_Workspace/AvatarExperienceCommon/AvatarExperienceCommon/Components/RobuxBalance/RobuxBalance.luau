local parent = script:FindFirstAncestor("AvatarExperienceCommon").Parent
local reactModule = require(parent.React)
local foundationModule = require(parent.Foundation)
local avatarExperienceFlagsModule = require(parent.AvatarExperienceFlags)
local cursorType = foundationModule.Enums.CursorType
local useCursor = foundationModule.Hooks.useCursor
local fFlagAXResetAvatarButton = avatarExperienceFlagsModule.FFlagAXResetAvatarButton

return reactModule.forwardRef(function(p1, p2)
	-- upvalues: foundationModule (ref), useCursor (ref), cursorType (ref), reactModule (ref), fFlagAXResetAvatarButton (ref)
	local var1 = foundationModule.Hooks.useTokens()
	local var2 = useCursor(cursorType.SmallPill)
	local var3, var4 = reactModule.useBinding(false)
	
	return reactModule.createElement(foundationModule.View, {
		testId = "RobuxBalance",
		tag = if fFlagAXResetAvatarButton then "row auto-xy align-y-center radius-circle padding-x-large gap-xsmall size-0-1000" else "row auto-xy align-y-center radius-circle padding-x-large gap-xsmall size-0-1100",
		ref = p2,
		onActivated = p1.onActivated,
		onStateChanged = reactModule.useCallback(function(p3)
			-- upvalues: foundationModule (copy), var4 (ref)
			if p3 == foundationModule.Enums.ControlState.Default then
				var4(false)
				
				return
			elseif p3 == foundationModule.Enums.ControlState.Hover then
				var4(true)
			end
		end, {}),
		backgroundStyle = var3:map(function(p3)
			-- upvalues: var1 (ref)
			return if p3 then var1.Color.Shift.Shift_200 else var1.Color.Surface.Surface_0
		end),
		stateLayer = {
			affordance = foundationModule.Enums.StateLayerAffordance.None
		},
		selection = {
			Selectable = true,
			SelectionImageObject = var2,
			NextSelectionLeft = p1.NextSelectionLeft
		}
	}, {
		RobuxBalanceIcon = reactModule.createElement(foundationModule.Icon, {
			name = "robux",
			LayoutOrder = 1,
			testId = "RobuxBalanceIcon",
			style = var1.Color.ActionStandard.Foreground,
			size = foundationModule.Enums.IconSize.Small
		}),
		RobuxBalanceText = reactModule.createElement(foundationModule.Text, {
			tag = "auto-xy",
			testId = "RobuxBalanceText",
			LayoutOrder = 2,
			Text = p1.text,
			textStyle = var1.Color.Content.Emphasis,
			fontStyle = var1.Typography.LabelMedium,
			selection = { Selectable = false }
		})
	})
end)