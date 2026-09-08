local parent = script.Parent.Parent.Parent
local _ = require(parent.util.Types)
local getAllInstancesIsAModule = require(parent.util.getAllInstancesIsA)
local getFFlagUGCValidateCurveAnimSingleRootModule = require(parent.flags.getFFlagUGCValidateCurveAnimSingleRoot)

return {
	getData = function(p1)
		-- upvalues: getAllInstancesIsAModule (ref), getFFlagUGCValidateCurveAnimSingleRootModule (ref)
		local status
		local t = {}
		
		for i, v in getAllInstancesIsAModule(p1, "Animation") do
			local animationId = v.AnimationId
			
			if animationId ~= "" then
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