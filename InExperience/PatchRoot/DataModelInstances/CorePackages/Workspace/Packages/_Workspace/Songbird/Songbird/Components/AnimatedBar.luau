local Songbird = script:FindFirstAncestor("Songbird")
local CryoModule = require(Songbird.Parent.Cryo)
local ReactModule = require(Songbird.Parent.React)
local ReactOtterModule = require(Songbird.Parent.ReactOtter)
local UseCallbackFunction = ReactModule.useCallback
local UseEffectFunction = ReactModule.useEffect
local UseTokensFunction = require(Songbird.Parent.Foundation).Hooks.useTokens
local config = {
	isMoving = true,
	staticHeight = 0.5,
	heightRange = NumberRange.new(0.3, 1),
	width = UDim.new(1, 0)
}
local _Random = Random.new()

return function(p1) --[[ Line: 34 | Named "AnimatedBar" ]]
	-- upvalues: CryoModule (copy), config (copy), UseTokensFunction (copy), UseCallbackFunction (copy), _Random (copy), ReactOtterModule (copy), UseEffectFunction (copy), ReactModule (copy)
	local JoinResult = CryoModule.Dictionary.join(config, p1)
	local UseTokensResult = UseTokensFunction()
	local UseCallbackResult = UseCallbackFunction(function() --[[ Line: 38 ]]
		-- upvalues: _Random (upval), JoinResult (copy)
		return _Random:NextNumber(JoinResult.heightRange.Min, JoinResult.heightRange.Max)
	end, { JoinResult.heightRange })
	local UseAnimatedBindingResult, UseAnimatedBindingResult2 = ReactOtterModule.useAnimatedBinding(UseCallbackResult())
	UseEffectFunction(function() --[[ Line: 44 ]]
		-- upvalues: JoinResult (copy), UseCallbackResult (copy), UseAnimatedBindingResult2 (copy), ReactOtterModule (upval)
		local Flag = true
		task.spawn(function() --[[ Line: 47 ]]
			-- upvalues: Flag (ref), JoinResult (upval), UseCallbackResult (upval), UseAnimatedBindingResult2 (upval), ReactOtterModule (upval)
			while Flag do
				UseAnimatedBindingResult2(ReactOtterModule.ease(if JoinResult.isMoving then UseCallbackResult() else JoinResult.staticHeight, { duration = 0.25, easingStyle = Enum.EasingStyle.Linear }))
				task.wait(0.25)
			end
		end)
		
		return function() --[[ Line: 60 ]]
			-- upvalues: Flag (ref)
			Flag = false
		end
	end, {
		UseAnimatedBindingResult2,
		JoinResult.isMoving,
		JoinResult.staticHeight
	})
	
	return ReactModule.createElement("Frame", {
		BorderSizePixel = 0,
		LayoutOrder = JoinResult.layoutOrder,
		Size = UseAnimatedBindingResult:map(function(Scale): UDim2 --[[ Line: 67 ]]
			-- upvalues: JoinResult (copy)
			return UDim2.new(JoinResult.width, UDim.new(Scale, 0))
		end),
		BackgroundColor3 = UseTokensResult.Color.ActionSubEmphasis.Background.Color3
	}, {
		Corner = ReactModule.createElement("UICorner", { CornerRadius = UDim.new(0.5, 0) })
	})
end