local _ = require(script.Parent.Parent.Types)

return function(p0) --[[ line: 7 | named "createStaticModelSource" ]]
	return function(_) --[[ line: 8 ]]
		-- upvalues: p0 (ref)
		local var0 = p0:Clone()
		local humanoid = var0:FindFirstChildOfClass("Humanoid")
		
		return {
			model = var0,
			humanoid = humanoid,
			animator = if humanoid then humanoid:FindFirstChildOfClass("Animator") else nil
		}
	end
end