local Parent = script:FindFirstAncestor("Moments").Parent
local BuilderIconsModule = require(Parent.BuilderIcons)
local FoundationModule = require(Parent.Foundation)
local ReactModule = require(Parent.React)
local ReactOtterModule = require(Parent.ReactOtter)
local Icon = FoundationModule.Icon
local Text = FoundationModule.Text
local View = FoundationModule.View
local IconSize = FoundationModule.Enums.IconSize
local StateLayerAffordance = FoundationModule.Enums.StateLayerAffordance
local UseLocalizationFunction = require(Parent.Localization).Hooks.useLocalization
local UseTokensFunction = FoundationModule.Hooks.useTokens
local config = {
	title = "Feature.Moments.Label.MomentRemovedTitle",
	body = "Feature.Moments.Label.MomentRemovedBody"
}
local config1 = {
	title = "Feature.Moments.Label.MomentUnavailable",
	body = "Feature.Moments.Label.MomentUnavailableDefault"
}
local config2 = { duration = 0.75, easingStyle = { 0.37, 0, 0.63, 1 } }

return function(Frame)
	-- upvalues: UseTokensFunction (copy), UseLocalizationFunction (copy), config (copy), config1 (copy), ReactModule (copy), ReactOtterModule (copy), config2 (copy), View (copy), Text (copy), StateLayerAffordance (copy), Icon (copy), BuilderIconsModule (copy), IconSize (copy)
	local UseTokensResult = UseTokensFunction()
	local UseLocalizationResult = UseLocalizationFunction(if Frame.isModerated then config else config1)
	local Animate = Frame.animate
	local UseRefResult = ReactModule.useRef(Animate)
	local UseRefResult1 = ReactModule.useRef(nil)
	local UseAnimatedBindingResult, UseAnimatedBindingResult2 = ReactOtterModule.useAnimatedBinding(0, (ReactModule.useCallback(function(p1: number)
		-- upvalues: UseRefResult1 (copy), UseRefResult (copy), ReactOtterModule (upval), config2 (upval)
		local CurrentFunction: (any) -> () = UseRefResult1.current
		
		if UseRefResult.current and CurrentFunction ~= nil then
			CurrentFunction(ReactOtterModule.ease(if p1 >= 0.5 then 0 else 1, config2))
		end
	end, {})))
	ReactModule.useEffect(function()
		-- upvalues: UseRefResult (copy), Animate (copy), UseRefResult1 (copy), UseAnimatedBindingResult2 (copy), ReactOtterModule (upval), config2 (upval)
		UseRefResult.current = Animate
		UseRefResult1.current = UseAnimatedBindingResult2
		
		if Animate then
			UseAnimatedBindingResult2(ReactOtterModule.ease(1, config2))
			
			return
		else
			UseAnimatedBindingResult2(ReactOtterModule.instant(0))
		end
	end, { Animate, UseAnimatedBindingResult2 })
	local v1 = 8 / UseTokensResult.Size.Size_1200
	
	return ReactModule.createElement(View, {
		tag = "size-full bg-surface-0",
		testId = "moments-unavailable-moment",
		LayoutOrder = Frame.LayoutOrder
	}, {
		Content = ReactModule.createElement(View, {
			tag = "col align-x-center align-y-center size-full padding-x-xlarge",
			ZIndex = 1
		}, {
			TextBlock = ReactModule.createElement(View, {
				tag = "col align-x-center gap-small size-full-0 auto-y",
				sizeConstraint = { MaxSize = Vector2.new(420, 1e999) }
			}, {
				Title = ReactModule.createElement(Text, {
					LayoutOrder = 1,
					tag = "size-full-0 auto-y text-heading-small text-wrap text-align-x-center content-emphasis",
					Text = UseLocalizationResult.title
				}),
				Body = ReactModule.createElement(Text, {
					LayoutOrder = 2,
					tag = "size-full-0 auto-y text-body-medium text-wrap text-align-x-center content-default",
					Text = UseLocalizationResult.body
				})
			})
		}),
		NextAffordance = ReactModule.createElement(View, {
			tag = "position-bottom-center anchor-bottom-center auto-xy",
			ZIndex = 2,
			padding = {
				bottom = UDim.new(0, (Frame.bottomInset or 0) + UseTokensResult.Padding.Small)
			}
		}, {
			NextButton = ReactModule.createElement(View, {
				tag = "size-1200 radius-circle",
				testId = "moments-unavailable-next",
				onActivated = Frame.onNext,
				stateLayer = { affordance = StateLayerAffordance.None }
			}, {
				Arrow = ReactModule.createElement(Icon, {
					testId = "moments-unavailable-next-arrow",
					AnchorPoint = Vector2.new(0.5, 0.5),
					Position = UseAnimatedBindingResult:map(function(p1): UDim2
						-- upvalues: v1 (copy)
						return UDim2.fromScale(0.5, 0.5 + p1 * v1)
					end),
					name = BuilderIconsModule.Icon.DoubleChevronLargeDown,
					size = IconSize.Large,
					style = UseTokensResult.Color.Content.Emphasis
				})
			})
		})
	})
end