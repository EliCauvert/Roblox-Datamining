local UGCValidationService = game:GetService("UGCValidationService")
local Parent = script.Parent.Parent
local GetFIntMaxCoplanarIntersectionsPercentageModule = require(Parent.flags.getFIntMaxCoplanarIntersectionsPercentage)
local _ = require(Parent.util.Types)
local PcallDeferredModule = require(Parent.util.pcallDeferred)
local AnalyticsModule = require(Parent.Analytics)

local function getTriangleCount(p1, p2, IsServer)
	-- upvalues: PcallDeferredModule (copy), UGCValidationService (copy), AnalyticsModule (copy)
	local PcallDeferredModuleResult, PcallDeferredModuleResult2 = PcallDeferredModule(function()
		-- upvalues: UGCValidationService (upval), p1 (copy)
		return UGCValidationService:GetEditableMeshTriCount(p1.editableMesh)
	end, p2)
	
	if PcallDeferredModuleResult then
		return true, nil, PcallDeferredModuleResult2
	end
	local Formatted = string.format("Failed to load model mesh %s. Make sure the mesh exists and try again.", p1.fullName)
	AnalyticsModule.reportFailure(AnalyticsModule.ErrorType.validateCoplanarIntersection_FailedToExecute, nil, p2)
	
	if IsServer ~= nil and IsServer then
		error(Formatted)
	end
	return false, { Formatted }
end

return function(p1, MeshScale, p2)
	-- upvalues: getTriangleCount (copy), GetFIntMaxCoplanarIntersectionsPercentageModule (copy), PcallDeferredModule (copy), UGCValidationService (copy), AnalyticsModule (copy)
	local CurrentTime = tick()
	local IsServer = p2.isServer
	local TriangleCount, TriangleCount2, TriangleCount3 = getTriangleCount(p1, p2, IsServer)
	
	if not TriangleCount then
		return false, TriangleCount2
	end
	local Floored = math.floor(GetFIntMaxCoplanarIntersectionsPercentageModule() / 100 * TriangleCount3)
	local PcallDeferredModuleResult, PcallDeferredModuleResult2 = PcallDeferredModule(function()
		-- upvalues: UGCValidationService (upval), p1 (copy), Floored (copy), MeshScale (copy)
		return UGCValidationService:IsEditableMeshNumCoplanarIntersectionsOverLimit(p1.editableMesh, Floored, MeshScale, true)
	end, p2)
	
	if not PcallDeferredModuleResult then
		local Formatted = string.format("Failed to execute coplanar triangle intersection check for '%s'. Make sure mesh exists and try again.", p1.fullName)
		
		if IsServer ~= nil and IsServer then
			error(Formatted)
		end
		AnalyticsModule.reportFailure(AnalyticsModule.ErrorType.validateCoplanarIntersection_FailedToExecute, nil, p2)
		
		return false, { Formatted }
	elseif PcallDeferredModuleResult2 then
		AnalyticsModule.reportFailure(AnalyticsModule.ErrorType.validateCoplanarIntersection_CoplanarIntersection, nil, p2)
		
		return false, {
			string.format("Detected too many coplanar triangles intersecting in model mesh '%s'. The maximum is %d intersections in a %d triangle mesh. Edit your mesh to reduce the number of coplanar triangle intersections.", p1.fullName, Floored, TriangleCount3)
		}
	else
		AnalyticsModule.recordScriptTime(script.Name, CurrentTime, p2)
		
		return true
	end
end