-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:32:41 2026 Pacific Standard Time.

local UGCValidationService = game:GetService("UGCValidationService")
local parent = script.Parent.Parent
local getFIntMaxCoplanarIntersectionsPercentageModule = require(parent.flags.getFIntMaxCoplanarIntersectionsPercentage)
local _ = require(parent.util.Types)
local pcallDeferredModule = require(parent.util.pcallDeferred)
local analyticsModule = require(parent.Analytics)

local function getTriangleCount(vectorA, vectorB, p0) --[[ line: 16 ]]
	-- upvalues: pcallDeferredModule (ref), UGCValidationService (ref), analyticsModule (ref)
	local var5, var6 = pcallDeferredModule(function() --[[ line: 21 ]]
		-- upvalues: UGCValidationService (copy), vectorA (ref)
		return UGCValidationService:GetEditableMeshTriCount(vectorA.editableMesh)
	end, vectorB)
	
	if var5 then
		return true, nil, var6
	end
	local formattedText = string.format("Failed to load model mesh %s. Make sure the mesh exists and try again.", vectorA.fullName)
	analyticsModule.reportFailure(analyticsModule.ErrorType.validateCoplanarIntersection_FailedToExecute, nil, vectorB)
	
	if p0 ~= nil and p0 then
		error(formattedText)
	end
	return false, { formattedText }
end

return function(p1, p2, p3) --[[ line: 44 | named "validateCoplanarIntersection" ]]
	-- upvalues: getTriangleCount (ref), getFIntMaxCoplanarIntersectionsPercentageModule (ref), pcallDeferredModule (ref), UGCValidationService (ref), analyticsModule (ref)
	local currentTime = tick()
	local isServer = p3.isServer
	local var9, var10, var11 = getTriangleCount(p1, p3, isServer)
	
	if not var9 then
		return false, var10
	end
	local floored = math.floor(getFIntMaxCoplanarIntersectionsPercentageModule() / 100 * var11)
	local var13, var14 = pcallDeferredModule(function() --[[ line: 62 ]]
		-- upvalues: UGCValidationService (copy), p1 (ref), floored (ref), p2 (ref)
		return UGCValidationService:IsEditableMeshNumCoplanarIntersectionsOverLimit(p1.editableMesh, floored, p2, true)
	end, p3)
	
	if var13 then
		if var14 then
			analyticsModule.reportFailure(analyticsModule.ErrorType.validateCoplanarIntersection_CoplanarIntersection, nil, p3)
			
			return false, {
				string.format("Detected too many coplanar triangles intersecting in model mesh '%s'. The maximum is %d intersections in a %d triangle mesh. Edit your mesh to reduce the number of coplanar triangle intersections.", p1.fullName, floored, var11)
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