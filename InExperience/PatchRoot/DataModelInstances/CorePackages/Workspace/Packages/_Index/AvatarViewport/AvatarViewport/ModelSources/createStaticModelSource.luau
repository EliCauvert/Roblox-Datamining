local _ = require(script.Parent.Parent.Types)

return function(p1)
	return function(_)
		-- upvalues: p1 (ref)
		local var1 = p1:Clone()
		local humanoid = var1:FindFirstChildOfClass("Humanoid")
		
		return {
			model = var1,
			humanoid = humanoid,
			animator = if humanoid then humanoid:FindFirstChildOfClass("Animator") else nil
		}
	end
end