local Parent = script:FindFirstAncestor("AvatarExperienceCommon").Parent
local ReactModule = require(Parent.React)
local FoundationModule = require(Parent.Foundation)
local CursorType = FoundationModule.Enums.CursorType
local UseCursorFunction = FoundationModule.Hooks.useCursor
local FFlagAXResetAvatarButton = require(Parent.AvatarExperienceFlags).FFlagAXResetAvatarButton

return (ReactModule.forwardRef(function(p1, Ref) --[[ Line: 21 ]]
	-- upvalues: FoundationModule (copy), UseCursorFunction (copy), CursorType (copy), ReactModule (copy), FFlagAXResetAvatarButton (copy)
	local UseTokensResult = FoundationModule.Hooks.useTokens()
	local UseCursorResult = UseCursorFunction(CursorType.SmallPill)
	local UseBindingResult, UseBindingResult2 = ReactModule.useBinding(false)
	
	return ReactModule.createElement(FoundationModule.View, {
		testId = "RobuxBalance",
		tag = if FFlagAXResetAvatarButton then "row auto-xy align-y-center radius-circle padding-x-large gap-xsmall size-0-1000" else "row auto-xy align-y-center radius-circle padding-x-large gap-xsmall size-0-1100",
		ref = Ref,
		onActivated = p1.onActivated,
		onStateChanged = ReactModule.useCallback(function(Default) --[[ Line: 28 ]]
			-- upvalues: FoundationModule (upval), UseBindingResult2 (copy)
			if Default == FoundationModule.Enums.ControlState.Default then
				UseBindingResult2(false)
				
				return
			end
			if Default == FoundationModule.Enums.ControlState.Hover then
				UseBindingResult2(true)
			end
		end, {}),
		backgroundStyle = UseBindingResult:map(function(p2) --[[ Line: 46 ]]
			-- upvalues: UseTokensResult (copy)
			return if p2 then UseTokensResult.Color.Shift.Shift_200 else UseTokensResult.Color.Surface.Surface_0
		end),
		stateLayer = {
			affordance = FoundationModule.Enums.StateLayerAffordance.None
		},
		selection = {
			Selectable = true,
			SelectionImageObject = UseCursorResult,
			NextSelectionLeft = p1.NextSelectionLeft
		}
	}, {
		RobuxBalanceIcon = ReactModule.createElement(FoundationModule.Icon, {
			name = "robux",
			LayoutOrder = 1,
			testId = "RobuxBalanceIcon",
			style = UseTokensResult.Color.ActionStandard.Foreground,
			size = FoundationModule.Enums.IconSize.Small
		}),
		RobuxBalanceText = ReactModule.createElement(FoundationModule.Text, {
			tag = "auto-xy",
			testId = "RobuxBalanceText",
			LayoutOrder = 2,
			Text = p1.text,
			textStyle = UseTokensResult.Color.Content.Emphasis,
			fontStyle = UseTokensResult.Typography.LabelMedium,
			selection = { Selectable = false }
		})
	})
end))