local UGCValidationService = game:GetService("UGCValidationService")
local parent = script.Parent.Parent
local _ = require(parent.util.Types)
local analyticsModule = require(parent.Analytics)
local getFIntUGCValidationPartMaxMassModule = require(parent.flags.getFIntUGCValidationPartMaxMass)

return function(value, p0) --[[ line: 14 | named "resetPhysicsData" ]]
	-- upvalues: UGCValidationService (ref), analyticsModule (ref), getFIntUGCValidationPartMaxMassModule (ref)
	local currentTime = tick()
	
	if not game:GetEngineFeature("EngineResetCollisionFidelity") then
		return false, "EngineResetCollisionFidelity is not enabled"
	end
	local var4 = if p0.bypassFlags then p0.bypassFlags.skipPhysicsDataReset else false
	
	for i, v in value do
		local descendants = v:GetDescendants()
		table.insert(descendants, 1, v)
		
		for i_1, v_1 in descendants do
			if v_1:IsA("MeshPart") and not var4 then
				if pcall(function() --[[ line: 31 ]]
					-- upvalues: UGCValidationService (copy), v_1 (ref)
					UGCValidationService:ResetCollisionFidelity(v_1, v_1.CollisionFidelity)
				end) then
					if getFIntUGCValidationPartMaxMassModule() < v_1:GetMass() then
						analyticsModule.reportFailure(analyticsModule.ErrorType.resetPhysicsData_LargeMass, nil, p0)
						
						return false, string.format("%s has a mass of %d while the limit is %d.", v_1.Name, v_1:GetMass(), getFIntUGCValidationPartMaxMassModule())
					end
				end
				if p0.isServer then
					error("Failed to load mesh data")
				end
				analyticsModule.reportFailure(analyticsModule.ErrorType.resetPhysicsData_FailedToLoadMesh, nil, p0)
				
				return false, "Failed to load mesh data"
			end
		end
	end
	analyticsModule.recordScriptTime(script.Name, currentTime, p0)
	
	return true
end