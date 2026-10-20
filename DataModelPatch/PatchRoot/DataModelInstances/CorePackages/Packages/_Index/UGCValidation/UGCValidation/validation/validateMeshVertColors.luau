local UGCValidationService = game:GetService("UGCValidationService")
local Parent = script.Parent.Parent
local _ = require(Parent.util.Types)
local PcallDeferredModule = require(Parent.util.pcallDeferred)
local AnalyticsModule = require(Parent.Analytics)

return function(p1, IncludeAlpha, p2)
	-- upvalues: PcallDeferredModule (copy), UGCValidationService (copy), AnalyticsModule (copy)
	local CurrentTime = tick()
	local IsServer = p2.isServer
	local PcallDeferredModuleResult, PcallDeferredModuleResult2 = PcallDeferredModule(function()
		-- upvalues: UGCValidationService (upval), p1 (copy), IncludeAlpha (copy)
		return UGCValidationService:ValidateEditableMeshVertColors(p1.editableMesh, IncludeAlpha)
	end, p2)
	
	if not PcallDeferredModuleResult then
		AnalyticsModule.reportFailure(AnalyticsModule.ErrorType.validateMeshVertexColors_FailedToLoadMesh, nil, p2)
		local Formatted = string.format("Failed to load vertex color map for model mesh %s. Make sure it exists and try again.", p1.fullName)
		
		if IsServer ~= nil and IsServer then
			error(Formatted)
		end
		return false, { Formatted }
	elseif PcallDeferredModuleResult2 then
		AnalyticsModule.recordScriptTime(script.Name, CurrentTime, p2)
		
		return true
	else
		AnalyticsModule.reportFailure(AnalyticsModule.ErrorType.validateMeshVertexColors_NonNeutralVertexColors, nil, p2)
		
		return false, {
			string.format("Invalid vertex color found in mesh model '%s'. You need to edit the color map to be all white %s and try again.", p1.fullName, if IncludeAlpha then "with no transarency" else "")
		}
	end
end