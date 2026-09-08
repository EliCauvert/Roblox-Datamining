local parent = script:FindFirstAncestor("AvatarExperienceCatalog").Parent
local reactModule = require(parent.React)
local tutilsModule = require(parent.tutils)
local foundationModule = require(parent.Foundation)
local reactOtterModule = require(parent.ReactOtter)
local fFlagAXMISWithBlackbird = require(parent.SharedFlags).FFlagAXMISWithBlackbird
local var1 = game:DefineFastInt("AXBuyDelayMilliseconds", 1000) / 1000

return reactModule.memo(function(p1)
	-- upvalues: foundationModule (ref), reactModule (ref), reactOtterModule (ref), var1 (ref), fFlagAXMISWithBlackbird (ref)
	local var2 = foundationModule.Hooks.useTokens()
	local var3, var4 = reactModule.useState(false)
	local var5, var6 = reactOtterModule.useAnimatedBinding(1, reactModule.useCallback(function()
		-- upvalues: var4 (ref)
		var4(true)
	end, { var3 }))
	reactModule.useEffect(function()
		-- upvalues: var3 (ref), var6 (ref), reactOtterModule (copy), var1 (copy)
		if not var3 then
			var6(reactOtterModule.ease(0, { duration = var1, easingStyle = Enum.EasingStyle.Linear }))
		end
	end, { var3 })
	
	return reactModule.createElement(foundationModule.View, {
		tag = "size-full-0 auto-y fill",
		LayoutOrder = if fFlagAXMISWithBlackbird then p1.LayoutOrder else nil
	}, {
		BuyButton = reactModule.createElement(foundationModule.Button, {
			testId = "CheckoutBuyButton_BuyButton",
			text = p1.label,
			onActivated = p1.onCheckoutButtonActivated,
			variant = foundationModule.Enums.ButtonVariant.Emphasis,
			size = foundationModule.Enums.ButtonSize.Medium,
			fillBehavior = foundationModule.Enums.FillBehavior.Fill,
			isDisabled = not var3 or p1.isPurchasing,
			isLoading = p1.isPurchasing
		}),
		CooldownBar = reactModule.createElement(foundationModule.View, {
			isDisabled = true,
			backgroundStyle = {
				Transparency = 0.5,
				Color3 = var2.Color.Surface.Surface_0.Color3
			},
			Position = UDim2.fromScale(1, 0),
			Size = var5:map(function(p2)
				return UDim2.fromScale(-p2, 1)
			end)
		})
	})
end, tutilsModule.deepEqual)