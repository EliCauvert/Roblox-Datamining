local UGCValidationService = game:GetService("UGCValidationService")
local parent = script.Parent.Parent
local _ = require(parent.util.Types)
local analyticsModule = require(parent.Analytics)
local getFIntUGCValidationPartMaxMassModule = require(parent.flags.getFIntUGCValidationPartMaxMass)

return function(value, p1)
	-- upvalues: UGCValidationService (ref), analyticsModule (ref), getFIntUGCValidationPartMaxMassModule (ref)
	local currentTime = tick()
	
	if not game:GetEngineFeature("EngineResetCollisionFidelity") then
		return false, "EngineResetCollisionFidelity is not enabled"
	end
	local var1 = if p1.bypassFlags then p1.bypassFlags.skipPhysicsDataReset else false
	
	for i, v in value do
		local descendants = v:GetDescendants()
		table.insert(descendants, 1, v)
		
		for i_1, v_1 in descendants do
			if v_1:IsA("MeshPart") and not var1 then
				if pcall(function()
					-- upvalues: UGCValidationService (copy), v_1 (ref)
					UGCValidationService:ResetCollisionFidelity(v_1, v_1.CollisionFidelity)
				end) then
					if getFIntUGCValidationPartMaxMassModule() < v_1:GetMass() then
						analyticsModule.reportFailure(analyticsModule.ErrorType.resetPhysicsData_LargeMass, nil, p1)
						
						return false, string.format("%s has a mass of %d while the limit is %d.", v_1.Name, v_1:GetMass(), getFIntUGCValidationPartMaxMassModule())
					end
				end
				if p1.isServer then
					error("Failed to load mesh data")
				end
				analyticsModule.reportFailure(analyticsModule.ErrorType.resetPhysicsData_FailedToLoadMesh, nil, p1)
				
				return false, "Failed to load mesh data"
			end
		end
	end
	analyticsModule.recordScriptTime(script.Name, currentTime, p1)
	
	return true
end