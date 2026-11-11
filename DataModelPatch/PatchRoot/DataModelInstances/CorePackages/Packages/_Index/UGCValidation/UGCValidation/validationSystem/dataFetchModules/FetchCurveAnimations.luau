local Parent = script.Parent.Parent.Parent
local _ = require(Parent.util.Types)
local GetAllInstancesIsAModule = require(Parent.util.getAllInstancesIsA)

return {
	getData = function(p1)
		-- upvalues: GetAllInstancesIsAModule (copy)
		local CurveAnimations = {}
		
		for _, Animation in GetAllInstancesIsAModule(p1, "Animation") do
			local AnimationId = Animation.AnimationId
			
			if AnimationId ~= "" then
				local Success, Result = pcall(function()
					-- upvalues: AnimationId (copy)
					return game:GetObjectsAllOrNone(AnimationId)
				end)
				
				if not Success or Result == nil then
					return nil
				end
				for _, CurveAnimation in Result do
					if CurveAnimation:IsA("CurveAnimation") then
						table.insert(CurveAnimations, CurveAnimation)
					end
				end
			end
		end
		return CurveAnimations
	end
}