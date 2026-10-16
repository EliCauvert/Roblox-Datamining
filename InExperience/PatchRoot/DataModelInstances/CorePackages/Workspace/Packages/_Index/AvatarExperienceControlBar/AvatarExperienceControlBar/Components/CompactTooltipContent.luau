local Parent = script:FindFirstAncestor("AvatarExperienceControlBar").Parent
local ReactModule = require(Parent.React)
local FoundationModule = require(Parent.Foundation)
local InputHandlersModule = require(Parent.InputHandlers)
local ReactFocusNavigationModule = require(Parent.ReactFocusNavigation)
local FocusNavigationEventNameEnum = require(Parent.FocusNavigationUtils).FocusNavigationEventNameEnum
local Selection = { Selectable = false }
local config = {
	[Enum.KeyCode.ButtonB] = FocusNavigationEventNameEnum.NavigateBack,
	[Enum.KeyCode.Escape] = FocusNavigationEventNameEnum.NavigateBack
}

return function(p1) --[[ Line: 23 | Named "CompactTooltipContent" ]]
	-- upvalues: FoundationModule (copy), ReactModule (copy), FocusNavigationEventNameEnum (copy), InputHandlersModule (copy), ReactFocusNavigationModule (copy), config (copy), Selection (copy)
	local UseTokensResult = FoundationModule.Hooks.useTokens()
	local HasOnDismiss = p1.onDismiss ~= nil
	local Size800 = if HasOnDismiss then UseTokensResult.Size.Size_800 else 0
	local UseScaledValueResultDelta = FoundationModule.Hooks.useScaledValue(296) - UseTokensResult.Padding.Medium * 2 - Size800 - (if HasOnDismiss then UseTokensResult.Gap.XSmall else 0)
	
	return ReactModule.createElement(FoundationModule.View, {
		selectionGroup = false,
		tag = "row align-y-center gap-xsmall auto-xy padding-medium",
		testId = "--control-bar-compact-tooltip",
		ref = ReactFocusNavigationModule.useEventHandlerMap(ReactModule.useMemo(function() --[[ Line: 36 ]]
			-- upvalues: FocusNavigationEventNameEnum (upval), InputHandlersModule (upval), p1 (copy)
			return {
				[FocusNavigationEventNameEnum.NavigateBack] = {
					handler = InputHandlersModule.onRelease(function(p2) --[[ Line: 39 ]]
						-- upvalues: p1 (upval)
						if p1.onDismiss then
							p1.onDismiss()
							p2:cancel()
						end
					end)
				}
			}
		end, { p1.onDismiss }), (ReactFocusNavigationModule.useEventMap(config))),
		selection = Selection
	}, {
		Body = ReactModule.createElement(FoundationModule.Text, {
			LayoutOrder = 1,
			tag = "auto-xy text-body-medium text-wrap text-align-x-left content-inverse-default",
			Text = p1.bodyText,
			sizeConstraint = ReactModule.useMemo(function() --[[ Line: 30 ]]
				-- upvalues: UseScaledValueResultDelta (copy)
				return { MaxSize = Vector2.new(UseScaledValueResultDelta, 1e999) }
			end, { UseScaledValueResultDelta })
		}),
		CloseSlot = if HasOnDismiss then ReactModule.createElement(FoundationModule.View, {
			LayoutOrder = 2,
			Size = UDim2.fromOffset(Size800, UseTokensResult.Size.Size_500 + UseTokensResult.Size.Size_50)
		}, {
			Close = ReactModule.createElement(FoundationModule.View, {
				tag = "position-center-center anchor-center-center size-800-800 radius-medium",
				testId = "--control-bar-tooltip-close",
				onActivated = p1.onDismiss,
				stateLayer = { mode = FoundationModule.Enums.StateLayerMode.Inverse },
				selection = { Selectable = true }
			}, {
				Icon = ReactModule.createElement(FoundationModule.Icon, {
					name = FoundationModule.Enums.IconName.X,
					size = FoundationModule.Enums.IconSize.Medium,
					style = UseTokensResult.Inverse.Content.Emphasis,
					Position = UDim2.fromScale(0.5, 0.5),
					AnchorPoint = Vector2.new(0.5, 0.5)
				})
			})
		}) else nil
	})
end