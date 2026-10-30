local Parent = script:FindFirstAncestor("Moments").Parent
local FoundationModule = require(Parent.Foundation)
local ReactModule = require(Parent.React)
local ReactOtterModule = require(Parent.ReactOtter)
local UseTokensFunction = FoundationModule.Hooks.useTokens
local config = { duration = 0.2, easingStyle = Enum.EasingStyle.Sine }

local function FadeCover(p1)
	-- upvalues: UseTokensFunction (copy), ReactOtterModule (copy), ReactModule (copy), config (copy), FoundationModule (copy)
	local UseTokensResult = UseTokensFunction()
	local OnFadedFunction = p1.onFaded
	local UseAnimatedBindingResult, UseAnimatedBindingResult2 = ReactOtterModule.useAnimatedBinding(0, function(p2: number)
		-- upvalues: OnFadedFunction (copy)
		if p2 >= 1 then
			OnFadedFunction()
		end
	end)
	ReactModule.useEffect(function()
		-- upvalues: UseAnimatedBindingResult2 (copy), ReactOtterModule (upval), config (upval)
		UseAnimatedBindingResult2((ReactOtterModule.ease(1, config)))
	end, {})
	local Surface0 = UseTokensResult.Color.Surface.Surface_0
	
	return ReactModule.createElement(FoundationModule.View, {
		tag = "size-full",
		testId = "--moments-feed-switch-fade",
		backgroundStyle = UseAnimatedBindingResult:map(function(Alpha: number)
			-- upvalues: Surface0 (copy)
			return {
				Color3 = Surface0.Color3,
				Transparency = math.lerp(Surface0.Transparency, 1, Alpha)
			}
		end)
	})
end

return function(p1)
	-- upvalues: ReactModule (copy), FadeCover (copy), FoundationModule (copy)
	local UseStateResult, UseStateResult2 = ReactModule.useState(0)
	local UseStateResult1, UseStateResult2_1 = ReactModule.useState(0)
	local UseStateResult3, UseStateResult2_2 = ReactModule.useState(p1.feedKey)
	
	if UseStateResult3 ~= p1.feedKey then
		UseStateResult2_2(p1.feedKey)
		UseStateResult2(UseStateResult + 1)
	end
	local UseResult = ReactModule.useCallback(function()
		-- upvalues: UseStateResult2_1 (copy), UseStateResult (copy)
		UseStateResult2_1(UseStateResult)
	end, { UseStateResult })
	
	return if UseStateResult1 == UseStateResult then nil else ReactModule.createElement(FoundationModule.View, {
		tag = "size-full",
		backgroundStyle = { Transparency = 1 },
		ZIndex = p1.ZIndex
	}, {
		[`Cover{UseStateResult}`] = ReactModule.createElement(FadeCover, { onFaded = UseResult })
	})
end