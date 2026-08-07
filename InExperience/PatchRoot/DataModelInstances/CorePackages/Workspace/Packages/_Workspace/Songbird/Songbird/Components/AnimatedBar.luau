local songbird = script:FindFirstAncestor("Songbird")
local cryoModule = require(songbird.Parent.Cryo)
local reactModule = require(songbird.Parent.React)
local reactOtterModule = require(songbird.Parent.ReactOtter)
local foundationModule = require(songbird.Parent.Foundation)
local useCallback = reactModule.useCallback
local useEffect = reactModule.useEffect
local useTokens = foundationModule.Hooks.useTokens
local t = {
	isMoving = true,
	staticHeight = 0.5,
	heightRange = NumberRange.new(0.3, 1),
	width = UDim.new(1, 0)
}
local random = Random.new()

return function(p0) --[[ line: 34 | named "AnimatedBar" ]]
	-- upvalues: cryoModule (ref), t (ref), useTokens (ref), useCallback (ref), random (ref), reactOtterModule (ref), useEffect (ref), reactModule (ref)
	local var7 = cryoModule.Dictionary.join(t, p0)
	local var8 = useTokens()
	local var9 = useCallback(function() --[[ line: 38 ]]
		-- upvalues: random (copy), var7 (ref)
		return random:NextNumber(var7.heightRange.Min, var7.heightRange.Max)
	end, { var7.heightRange })
	local var10, var11 = reactOtterModule.useAnimatedBinding(var9())
	useEffect(function() --[[ line: 44 ]]
		-- upvalues: var7 (ref), var9 (ref), var11 (ref), reactOtterModule (copy)
		local var12 = true
		task.spawn(function() --[[ line: 47 ]]
			-- upvalues: var12 (write), var7 (copy), var9 (copy), var11 (copy), reactOtterModule (copy)
			while var12 do
				var11(reactOtterModule.ease(if var7.isMoving then var9() else var7.staticHeight, { duration = 0.25, easingStyle = Enum.EasingStyle.Linear }))
				task.wait(0.25)
			end
		end)
		
		return function() --[[ line: 60 ]]
			-- upvalues: var12 (write)
			var12 = false
		end
	end, { var11, var7.isMoving, var7.staticHeight })
	
	return reactModule.createElement("Frame", {
		BorderSizePixel = 0,
		LayoutOrder = var7.layoutOrder,
		Size = var10:map(function(p1) --[[ line: 67 ]]
			-- upvalues: var7 (ref)
			return UDim2.new(var7.width, UDim.new(p1, 0))
		end),
		BackgroundColor3 = var8.Color.ActionSubEmphasis.Background.Color3
	}, {
		Corner = reactModule.createElement("UICorner", { CornerRadius = UDim.new(0.5, 0) })
	})
end