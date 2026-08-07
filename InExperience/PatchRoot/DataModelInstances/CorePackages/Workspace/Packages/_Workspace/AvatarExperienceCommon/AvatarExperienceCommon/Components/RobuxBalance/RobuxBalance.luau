local parent = script:FindFirstAncestor("AvatarExperienceCommon").Parent
local reactModule = require(parent.React)
local foundationModule = require(parent.Foundation)
local avatarExperienceFlagsModule = require(parent.AvatarExperienceFlags)
local cursorType = foundationModule.Enums.CursorType
local useCursor = foundationModule.Hooks.useCursor
local fFlagAXResetAvatarButton = avatarExperienceFlagsModule.FFlagAXResetAvatarButton

return reactModule.forwardRef(function(p0, p1) --[[ line: 21 ]]
	-- upvalues: foundationModule (ref), useCursor (ref), cursorType (ref), reactModule (ref), fFlagAXResetAvatarButton (ref)
	local var3 = foundationModule.Hooks.useTokens()
	local var4 = useCursor(cursorType.SmallPill)
	local var5, var6 = reactModule.useBinding(false)
	
	return reactModule.createElement(foundationModule.View, {
		testId = "RobuxBalance",
		tag = if fFlagAXResetAvatarButton then "row auto-xy align-y-center radius-circle padding-x-large gap-xsmall size-0-1000" else "row auto-xy align-y-center radius-circle padding-x-large gap-xsmall size-0-1100",
		ref = p1,
		onActivated = p0.onActivated,
		onStateChanged = reactModule.useCallback(function(p2) --[[ line: 28 ]]
			-- upvalues: foundationModule (copy), var6 (ref)
			if p2 == foundationModule.Enums.ControlState.Default then
				var6(false)
				
				return
			elseif p2 == foundationModule.Enums.ControlState.Hover then
				var6(true)
			end
		end, {}),
		backgroundStyle = var5:map(function(p3) --[[ line: 46 ]]
			-- upvalues: var3 (ref)
			return if p3 then var3.Color.Shift.Shift_200 else var3.Color.Surface.Surface_0
		end),
		stateLayer = {
			affordance = foundationModule.Enums.StateLayerAffordance.None
		},
		selection = {
			Selectable = true,
			SelectionImageObject = var4,
			NextSelectionLeft = p0.NextSelectionLeft
		}
	}, {
		RobuxBalanceIcon = reactModule.createElement(foundationModule.Icon, {
			name = "robux",
			LayoutOrder = 1,
			testId = "RobuxBalanceIcon",
			style = var3.Color.ActionStandard.Foreground,
			size = foundationModule.Enums.IconSize.Small
		}),
		RobuxBalanceText = reactModule.createElement(foundationModule.Text, {
			tag = "auto-xy",
			testId = "RobuxBalanceText",
			LayoutOrder = 2,
			Text = p0.text,
			textStyle = var3.Color.Content.Emphasis,
			fontStyle = var3.Typography.LabelMedium,
			selection = { Selectable = false }
		})
	})
end)