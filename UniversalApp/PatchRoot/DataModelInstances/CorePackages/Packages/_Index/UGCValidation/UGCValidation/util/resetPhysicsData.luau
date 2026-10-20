local UGCValidationService = game:GetService("UGCValidationService")
local Parent = script.Parent.Parent
local _ = require(Parent.util.Types)
local AnalyticsModule = require(Parent.Analytics)
local GetFIntUGCValidationPartMaxMassModule = require(Parent.flags.getFIntUGCValidationPartMaxMass)

return function(List, p1)
	-- upvalues: UGCValidationService (copy), AnalyticsModule (copy), GetFIntUGCValidationPartMaxMassModule (copy)
	local CurrentTime = tick()
	
	if not game:GetEngineFeature("EngineResetCollisionFidelity") then
		return false, "EngineResetCollisionFidelity is not enabled"
	end
	local SkipPhysicsDataReset = if p1.bypassFlags then p1.bypassFlags.skipPhysicsDataReset else false
	for _, value in List do
		local Descendants = value:GetDescendants()
		table.insert(Descendants, 1, value)
		
		for _, Part in Descendants do
			if Part:IsA("MeshPart") and not SkipPhysicsDataReset then
				if not pcall(function()
					-- upvalues: UGCValidationService (upval), Part (copy)
					UGCValidationService:ResetCollisionFidelity(Part, Part.CollisionFidelity)
				end) then
					if p1.isServer then
						error("Failed to load mesh data")
					end
					AnalyticsModule.reportFailure(AnalyticsModule.ErrorType.resetPhysicsData_FailedToLoadMesh, nil, p1)
					
					return false, "Failed to load mesh data"
				elseif GetFIntUGCValidationPartMaxMassModule() < Part:GetMass() then
					AnalyticsModule.reportFailure(AnalyticsModule.ErrorType.resetPhysicsData_LargeMass, nil, p1)
					
					return false, string.format("%s has a mass of %d while the limit is %d.", Part.Name, Part:GetMass(), GetFIntUGCValidationPartMaxMassModule())
				end
				continue
			end
		end
	end
	AnalyticsModule.recordScriptTime(script.Name, CurrentTime, p1)
	
	return true
end