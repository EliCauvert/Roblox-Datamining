local Parent = script:FindFirstAncestor("AvatarExperienceCatalog").Parent
local ReactModule = require(Parent.React)
local FoundationModule = require(Parent.Foundation)
local ReactOtterModule = require(Parent.ReactOtter)
local FFlagAXMISWithBlackbird = require(Parent.SharedFlags).FFlagAXMISWithBlackbird
local AXBuyDelayMillisecondsRatio = game:DefineFastInt("AXBuyDelayMilliseconds", 1000) / 1000

return ReactModule.memo(function(Frame) --[[ Line: 22 | Named "CheckoutBuyButton" ]]
	-- upvalues: FoundationModule (copy), ReactModule (copy), ReactOtterModule (copy), AXBuyDelayMillisecondsRatio (copy), FFlagAXMISWithBlackbird (copy)
	local UseTokensResult = FoundationModule.Hooks.useTokens()
	local UseStateResult, UseStateResult2 = ReactModule.useState(false)
	local UseAnimatedBindingResult, UseAnimatedBindingResult2 = ReactOtterModule.useAnimatedBinding(1, (ReactModule.useCallback(function() --[[ Line: 26 ]]
		-- upvalues: UseStateResult2 (copy)
		UseStateResult2(true)
	end, { UseStateResult })))
	ReactModule.useEffect(function() --[[ Line: 31 ]]
		-- upvalues: UseStateResult (copy), UseAnimatedBindingResult2 (copy), ReactOtterModule (upval), AXBuyDelayMillisecondsRatio (upval)
		if not UseStateResult then
			UseAnimatedBindingResult2(ReactOtterModule.ease(0, {
				duration = AXBuyDelayMillisecondsRatio,
				easingStyle = Enum.EasingStyle.Linear
			}))
		end
	end, { UseStateResult })
	
	return ReactModule.createElement(FoundationModule.View, {
		tag = "size-full-0 auto-y fill",
		LayoutOrder = if FFlagAXMISWithBlackbird then Frame.LayoutOrder else nil
	}, {
		BuyButton = ReactModule.createElement(FoundationModule.Button, {
			testId = "CheckoutBuyButton_BuyButton",
			text = Frame.label,
			onActivated = Frame.onCheckoutButtonActivated,
			variant = FoundationModule.Enums.ButtonVariant.Emphasis,
			size = FoundationModule.Enums.ButtonSize.Medium,
			fillBehavior = FoundationModule.Enums.FillBehavior.Fill,
			isDisabled = not UseStateResult or Frame.isPurchasing,
			isLoading = Frame.isPurchasing
		}),
		CooldownBar = ReactModule.createElement(FoundationModule.View, {
			isDisabled = true,
			backgroundStyle = {
				Transparency = 0.5,
				Color3 = UseTokensResult.Color.Surface.Surface_0.Color3
			},
			Position = UDim2.fromScale(1, 0),
			Size = UseAnimatedBindingResult:map(function(p1): UDim2 --[[ Line: 61 ]]
				return UDim2.fromScale(-p1, 1)
			end)
		})
	})
end, require(Parent.tutils).deepEqual)