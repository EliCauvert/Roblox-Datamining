local parent = script:FindFirstAncestor("AvatarExperienceControlBar").Parent
local reactModule = require(parent.React)
local foundationModule = require(parent.Foundation)
local focusNavigationUtilsModule = require(parent.FocusNavigationUtils)
local inputHandlersModule = require(parent.InputHandlers)
local reactFocusNavigationModule = require(parent.ReactFocusNavigation)
local focusNavigationEventNameEnum = focusNavigationUtilsModule.FocusNavigationEventNameEnum
local t = { Selectable = false }
local t_1 = {
	[Enum.KeyCode.ButtonB] = focusNavigationEventNameEnum.NavigateBack,
	[Enum.KeyCode.Escape] = focusNavigationEventNameEnum.NavigateBack
}

return function(p1)
	-- upvalues: foundationModule (ref), reactModule (ref), focusNavigationEventNameEnum (ref), inputHandlersModule (ref), reactFocusNavigationModule (ref), t_1 (ref), t (ref)
	local var1 = foundationModule.Hooks.useTokens()
	local var2 = foundationModule.Hooks.useScaledValue(296)
	local var3 = p1.onDismiss ~= nil
	local var4 = if var3 then var1.Size.Size_800 else 0
	local var5 = var2 - var1.Padding.Medium * 2 - var4 - (if var3 then var1.Gap.XSmall else 0)
	
	return reactModule.createElement(foundationModule.View, {
		selectionGroup = false,
		tag = "row align-y-center gap-xsmall auto-xy padding-medium",
		testId = "--control-bar-compact-tooltip",
		ref = reactFocusNavigationModule.useEventHandlerMap(reactModule.useMemo(function()
			-- upvalues: focusNavigationEventNameEnum (copy), inputHandlersModule (copy), p1 (ref)
			return {
				[focusNavigationEventNameEnum.NavigateBack] = {
					handler = inputHandlersModule.onRelease(function(p2)
						-- upvalues: p1 (copy)
						if p1.onDismiss then
							p1.onDismiss()
							p2:cancel()
						end
					end)
				}
			}
		end, { p1.onDismiss }), reactFocusNavigationModule.useEventMap(t_1)),
		selection = t
	}, {
		Body = reactModule.createElement(foundationModule.Text, {
			LayoutOrder = 1,
			tag = "auto-xy text-body-medium text-wrap text-align-x-left content-inverse-default",
			Text = p1.bodyText,
			sizeConstraint = reactModule.useMemo(function()
				-- upvalues: var5 (ref)
				return { MaxSize = Vector2.new(var5, 1e999) }
			end, { var5 })
		}),
		CloseSlot = if var3 then reactModule.createElement(foundationModule.View, {
			LayoutOrder = 2,
			Size = UDim2.fromOffset(var4, var1.Size.Size_500 + var1.Size.Size_50)
		}, {
			Close = reactModule.createElement(foundationModule.View, {
				tag = "position-center-center anchor-center-center size-800-800 radius-medium",
				testId = "--control-bar-tooltip-close",
				onActivated = p1.onDismiss,
				stateLayer = { mode = foundationModule.Enums.StateLayerMode.Inverse },
				selection = { Selectable = true }
			}, {
				Icon = reactModule.createElement(foundationModule.Icon, {
					name = foundationModule.Enums.IconName.X,
					size = foundationModule.Enums.IconSize.Medium,
					style = var1.Inverse.Content.Emphasis,
					Position = UDim2.fromScale(0.5, 0.5),
					AnchorPoint = Vector2.new(0.5, 0.5)
				})
			})
		}) else nil
	})
end