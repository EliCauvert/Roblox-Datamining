-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:32:44 2026 Pacific Standard Time.

local UGCValidationService = game:GetService("UGCValidationService")
local parent = script.Parent.Parent
local analyticsModule = require(parent.Analytics)
local getFIntUGCValidateRenderMeshInsideOuterCageMeshThresholdModule = require(parent.flags.getFIntUGCValidateRenderMeshInsideOuterCageMeshThreshold)
local _ = require(parent.util.Types)
local pcallDeferredModule = require(parent.util.pcallDeferred)

return function(p0, p1, p2, p3) --[[ line: 17 | named "validateRenderMeshInsideOuterCageMesh" ]]
	-- upvalues: pcallDeferredModule (ref), UGCValidationService (ref), analyticsModule (ref), getFIntUGCValidateRenderMeshInsideOuterCageMeshThresholdModule (ref)
	local currentTime = tick()
	local var5, var6 = pcallDeferredModule(function() --[[ line: 28 ]]
		-- upvalues: UGCValidationService (copy), p1 (ref), p2 (ref), p0 (ref)
		return UGCValidationService:CalculateEditableMeshInsideMeshPercentage(p1.editableMesh, p2.editableMesh, p0.CageOrigin:Inverse(), Vector3.new(1, 1, 1))
	end, p3)
	
	if var5 then
		var6 *= 100
		
		if var6 < getFIntUGCValidateRenderMeshInsideOuterCageMeshThresholdModule() then
			analyticsModule.reportFailure(analyticsModule.ErrorType.validateRenderMeshInsideOuterCageMesh_MaxOutsideCageMeshExceeded, nil, p3)
			
			return false, {
				string.format("Validation detected %d%% of the accessory is outside its outer cage. Make adjustments to have more of the accessory placed between the cages", 100 - math.floor(var6)) .. "[Read more](https://create.roblox.com/docs/art/validation-errors#cageInsideMesh)"
			}
		end
		analyticsModule.recordScriptTime(script.Name, currentTime, p3)
		
		return true
	else
		local formattedText = string.format("Failed to execute render mesh inside outer mesh check for '%s' and '%s'. Make sure the meshes exists and try again.", p1.fullName, p2.fullName)
		
		if p3.isServer then
			error(formattedText)
		end
		analyticsModule.reportFailure(analyticsModule.ErrorType.validateRenderMeshInsideOuterCageMesh_FailedToExecute, nil, p3)
		
		return false, { formattedText }
	end
end