local UGCValidationService = game:GetService("UGCValidationService")
local parent = script.Parent.Parent
local getFIntMaxCoplanarIntersectionsPercentageModule = require(parent.flags.getFIntMaxCoplanarIntersectionsPercentage)
local _ = require(parent.util.Types)
local pcallDeferredModule = require(parent.util.pcallDeferred)
local analyticsModule = require(parent.Analytics)

local function getTriangleCount(vectorA, vectorB, p1)
	-- upvalues: pcallDeferredModule (ref), UGCValidationService (ref), analyticsModule (ref)
	local var1, var2 = pcallDeferredModule(function()
		-- upvalues: UGCValidationService (copy), vectorA (ref)
		return UGCValidationService:GetEditableMeshTriCount(vectorA.editableMesh)
	end, vectorB)
	
	if var1 then
		return true, nil, var2
	end
	local formattedText = string.format("Failed to load model mesh %s. Make sure the mesh exists and try again.", vectorA.fullName)
	analyticsModule.reportFailure(analyticsModule.ErrorType.validateCoplanarIntersection_FailedToExecute, nil, vectorB)
	
	if p1 ~= nil and p1 then
		error(formattedText)
	end
	return false, { formattedText }
end

return function(p1, p2, p3)
	-- upvalues: getTriangleCount (ref), getFIntMaxCoplanarIntersectionsPercentageModule (ref), pcallDeferredModule (ref), UGCValidationService (ref), analyticsModule (ref)
	local currentTime = tick()
	local isServer = p3.isServer
	local var1, var2, var3 = getTriangleCount(p1, p3, isServer)
	
	if not var1 then
		return false, var2
	end
	local floored = math.floor(getFIntMaxCoplanarIntersectionsPercentageModule() / 100 * var3)
	local var4, var5 = pcallDeferredModule(function()
		-- upvalues: UGCValidationService (copy), p1 (ref), floored (ref), p2 (ref)
		return UGCValidationService:IsEditableMeshNumCoplanarIntersectionsOverLimit(p1.editableMesh, floored, p2, true)
	end, p3)
	
	if var4 then
		if var5 then
			analyticsModule.reportFailure(analyticsModule.ErrorType.validateCoplanarIntersection_CoplanarIntersection, nil, p3)
			
			return false, {
				string.format("Detected too many coplanar triangles intersecting in model mesh '%s'. The maximum is %d intersections in a %d triangle mesh. Edit your mesh to reduce the number of coplanar triangle intersections.", p1.fullName, floored, var3)
			}
		end
		analyticsModule.recordScriptTime(script.Name, currentTime, p3)
		
		return true
	else
		local formattedText = string.format("Failed to execute coplanar triangle intersection check for '%s'. Make sure mesh exists and try again.", p1.fullName)
		
		if isServer ~= nil and isServer then
			error(formattedText)
		end
		analyticsModule.reportFailure(analyticsModule.ErrorType.validateCoplanarIntersection_FailedToExecute, nil, p3)
		
		return false, { formattedText }
	end
end