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

return function(p1)
	-- upvalues: cryoModule (ref), t (ref), useTokens (ref), useCallback (ref), random (ref), reactOtterModule (ref), useEffect (ref), reactModule (ref)
	local var1 = cryoModule.Dictionary.join(t, p1)
	local var2 = useTokens()
	local var3 = useCallback(function()
		-- upvalues: random (copy), var1 (ref)
		return random:NextNumber(var1.heightRange.Min, var1.heightRange.Max)
	end, { var1.heightRange })
	local var4, var5 = reactOtterModule.useAnimatedBinding(var3())
	useEffect(function()
		-- upvalues: var1 (ref), var3 (ref), var5 (ref), reactOtterModule (copy)
		local var6 = true
		task.spawn(function()
			-- upvalues: var6 (write), var1 (copy), var3 (copy), var5 (copy), reactOtterModule (copy)
			while var6 do
				var5(reactOtterModule.ease(if var1.isMoving then var3() else var1.staticHeight, { duration = 0.25, easingStyle = Enum.EasingStyle.Linear }))
				task.wait(0.25)
			end
		end)
		
		return function()
			-- upvalues: var6 (write)
			var6 = false
		end
	end, { var5, var1.isMoving, var1.staticHeight })
	
	return reactModule.createElement("Frame", {
		BorderSizePixel = 0,
		LayoutOrder = var1.layoutOrder,
		Size = var4:map(function(p2)
			-- upvalues: var1 (ref)
			return UDim2.new(var1.width, UDim.new(p2, 0))
		end),
		BackgroundColor3 = var2.Color.ActionSubEmphasis.Background.Color3
	}, {
		Corner = reactModule.createElement("UICorner", { CornerRadius = UDim.new(0.5, 0) })
	})
end