local parent = script.Parent.Parent.Parent
local _ = require(parent.util.Types)
local getAllInstancesIsAModule = require(parent.util.getAllInstancesIsA)
local getFFlagUGCValidateCurveAnimSingleRootModule = require(parent.flags.getFFlagUGCValidateCurveAnimSingleRoot)

return {
	getData = function(p1, p2)
		-- upvalues: getAllInstancesIsAModule (ref), getFFlagUGCValidateCurveAnimSingleRootModule (ref)
		local var1, status
		local t = {}
		
		for i, v in getAllInstancesIsAModule(p1, "Animation") do
			local animationId = v.AnimationId
			
			if animationId ~= "" then
				var1 = p2 and p2.preloadedCurveAnimations[animationId]
				
				if var1 then
					table.insert(t, var1)
					continue
				end
				ok, status = pcall(function()
					-- upvalues: animationId (ref)
					return game:GetObjectsAllOrNone(animationId)
				end)
				
				if ok and status ~= nil then
					if getFFlagUGCValidateCurveAnimSingleRootModule() then
						if #status == 1 and status[1]:IsA("CurveAnimation") then
							table.insert(t, status[1])
							continue
						end
						return nil
					else
						for i_1, v_1 in status do
							if v_1:IsA("CurveAnimation") then
								table.insert(t, v_1)
							end
						end
					end
				end
				return nil
			end
		end
		return t
	end
}