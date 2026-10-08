local parent = script:FindFirstAncestor("Moments").Parent
local builderIconsModule = require(parent.BuilderIcons)
local foundationModule = require(parent.Foundation)
local localizationModule = require(parent.Localization)
local reactModule = require(parent.React)
local reactOtterModule = require(parent.ReactOtter)
local icon = foundationModule.Icon
local text = foundationModule.Text
local view = foundationModule.View
local iconSize = foundationModule.Enums.IconSize
local stateLayerAffordance = foundationModule.Enums.StateLayerAffordance
local useLocalization = localizationModule.Hooks.useLocalization
local useTokens = foundationModule.Hooks.useTokens
local t = {
	title = "Feature.Moments.Label.MomentRemovedTitle",
	body = "Feature.Moments.Label.MomentRemovedBody"
}
local t_1 = {
	title = "Feature.Moments.Label.MomentUnavailable",
	body = "Feature.Moments.Label.MomentUnavailableDefault"
}
local t_2 = { duration = 0.75, easingStyle = { 0.37, 0, 0.63, 1 } }

return function(p1)
	-- upvalues: useTokens (ref), useLocalization (ref), t (ref), t_1 (ref), reactModule (ref), reactOtterModule (ref), t_2 (ref), view (ref), text (ref), stateLayerAffordance (ref), icon (ref), builderIconsModule (ref), iconSize (ref)
	local var1 = useTokens()
	local var2 = useLocalization(if p1.isModerated then t else t_1)
	local animate = p1.animate
	local var3 = reactModule.useRef(animate)
	local var4 = reactModule.useRef(nil)
	local var5, var6 = reactOtterModule.useAnimatedBinding(0, reactModule.useCallback(function(p2)
		-- upvalues: var4 (ref), var3 (ref), reactOtterModule (copy), t_2 (copy)
		local current = var4.current
		
		if var3.current and current ~= nil then
			current(reactOtterModule.ease(if p2 >= 0.5 then 0 else 1, t_2))
		end
	end, {}))
	reactModule.useEffect(function()
		-- upvalues: var3 (ref), animate (ref), var4 (ref), var6 (ref), reactOtterModule (copy), t_2 (copy)
		var3.current = animate
		var4.current = var6
		
		if animate then
			var6(reactOtterModule.ease(1, t_2))
			
			return
		end
		var6(reactOtterModule.instant(0))
	end, { animate, var6 })
	local var7 = 8 / var1.Size.Size_1200
	
	return reactModule.createElement(view, {
		tag = "size-full bg-surface-0",
		testId = "moments-unavailable-moment",
		LayoutOrder = p1.LayoutOrder
	}, {
		Content = reactModule.createElement(view, {
			tag = "col align-x-center align-y-center size-full padding-x-xlarge",
			ZIndex = 1
		}, {
			TextBlock = reactModule.createElement(view, {
				tag = "col align-x-center gap-small size-full-0 auto-y",
				sizeConstraint = { MaxSize = Vector2.new(420, 1e999) }
			}, {
				Title = reactModule.createElement(text, {
					LayoutOrder = 1,
					tag = "size-full-0 auto-y text-heading-small text-wrap text-align-x-center content-emphasis",
					Text = var2.title
				}),
				Body = reactModule.createElement(text, {
					LayoutOrder = 2,
					tag = "size-full-0 auto-y text-body-medium text-wrap text-align-x-center content-default",
					Text = var2.body
				})
			})
		}),
		NextAffordance = reactModule.createElement(view, {
			tag = "position-bottom-center anchor-bottom-center auto-xy",
			ZIndex = 2,
			padding = {
				bottom = UDim.new(0, (p1.bottomInset or 0) + var1.Padding.Small)
			}
		}, {
			NextButton = reactModule.createElement(view, {
				tag = "size-1200 radius-circle",
				testId = "moments-unavailable-next",
				onActivated = p1.onNext,
				stateLayer = { affordance = stateLayerAffordance.None }
			}, {
				Arrow = reactModule.createElement(icon, {
					testId = "moments-unavailable-next-arrow",
					AnchorPoint = Vector2.new(0.5, 0.5),
					Position = var5:map(function(p2)
						-- upvalues: var7 (ref)
						return UDim2.fromScale(0.5, 0.5 + p2 * var7)
					end),
					name = builderIconsModule.Icon.DoubleChevronLargeDown,
					size = iconSize.Large,
					style = var1.Color.Content.Emphasis
				})
			})
		})
	})
end