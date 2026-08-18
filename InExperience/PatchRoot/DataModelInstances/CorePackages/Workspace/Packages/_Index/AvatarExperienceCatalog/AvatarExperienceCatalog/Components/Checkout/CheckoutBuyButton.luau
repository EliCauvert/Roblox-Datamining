local parent = script:FindFirstAncestor("AvatarExperienceCatalog").Parent
local reactModule = require(parent.React)
local tutilsModule = require(parent.tutils)
local foundationModule = require(parent.Foundation)
local reactOtterModule = require(parent.ReactOtter)
local fFlagAXMISWithBlackbird = require(parent.SharedFlags).FFlagAXMISWithBlackbird
local var4 = game:DefineFastInt("AXBuyDelayMilliseconds", 1000) / 1000

return reactModule.memo(function(p0) --[[ line: 22 | named "CheckoutBuyButton" ]]
	-- upvalues: foundationModule (ref), reactModule (ref), reactOtterModule (ref), var4 (ref), fFlagAXMISWithBlackbird (ref)
	local var5 = foundationModule.Hooks.useTokens()
	local var6, var7 = reactModule.useState(false)
	local var8, var9 = reactOtterModule.useAnimatedBinding(1, reactModule.useCallback(function() --[[ line: 26 ]]
		-- upvalues: var7 (ref)
		var7(true)
	end, { var6 }))
	reactModule.useEffect(function() --[[ line: 31 ]]
		-- upvalues: var6 (ref), var9 (ref), reactOtterModule (copy), var4 (copy)
		if not var6 then
			var9(reactOtterModule.ease(0, { duration = var4, easingStyle = Enum.EasingStyle.Linear }))
		end
	end, { var6 })
	
	return reactModule.createElement(foundationModule.View, {
		tag = "size-full-0 auto-y fill",
		LayoutOrder = if fFlagAXMISWithBlackbird then p0.LayoutOrder else nil
	}, {
		BuyButton = reactModule.createElement(foundationModule.Button, {
			testId = "CheckoutBuyButton_BuyButton",
			text = p0.label,
			onActivated = p0.onCheckoutButtonActivated,
			variant = foundationModule.Enums.ButtonVariant.Emphasis,
			size = foundationModule.Enums.ButtonSize.Medium,
			fillBehavior = foundationModule.Enums.FillBehavior.Fill,
			isDisabled = not var6 or p0.isPurchasing,
			isLoading = p0.isPurchasing
		}),
		CooldownBar = reactModule.createElement(foundationModule.View, {
			isDisabled = true,
			backgroundStyle = {
				Transparency = 0.5,
				Color3 = var5.Color.Surface.Surface_0.Color3
			},
			Position = UDim2.fromScale(1, 0),
			Size = var8:map(function(p1) --[[ line: 61 ]]
				return UDim2.fromScale(-p1, 1)
			end)
		})
	})
end, tutilsModule.deepEqual)