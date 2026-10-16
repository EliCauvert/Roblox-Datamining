local _ = require(script.Parent.Parent.Types)

return function(Object) --[[ Line: 7 | Named "createStaticModelSource" ]]
	return function(_) --[[ Line: 8 ]]
		-- upvalues: Object (copy)
		local ObjectClone = Object:Clone()
		local Humanoid = ObjectClone:FindFirstChildOfClass("Humanoid")
		
		return {
			model = ObjectClone,
			humanoid = Humanoid,
			animator = if Humanoid then Humanoid:FindFirstChildOfClass("Animator") else nil
		}
	end
end