local UGCValidationService = game:GetService("UGCValidationService")
local parent = script.Parent.Parent
local analyticsModule = require(parent.Analytics)
local failureReasonsAccumulatorModule = require(parent.util.FailureReasonsAccumulator)
local var1 = game:DefineFastInt("UGCValidateFacialBoundsScale", 120) / 100
local getExpectedPartSizeModule = require(parent.util.getExpectedPartSize)
local _ = require(parent.util.Types)
local pcallDeferredModule = require(parent.util.pcallDeferred)
local getEditableMeshFromContextModule = require(parent.util.getEditableMeshFromContext)
local getEngineFeatureEngineUGCValidateMinMaxMeshSizeAcrossAllFacsModule = require(parent.flags.getEngineFeatureEngineUGCValidateMinMaxMeshSizeAcrossAllFacs)

local function validateFacialBounds(p1, p2)
	-- upvalues: pcallDeferredModule (ref), getExpectedPartSizeModule (ref), getEditableMeshFromContextModule (ref), UGCValidationService (ref), var1 (ref)
	local isServer = p2.isServer
	local var2, var3 = pcallDeferredModule(function()
		-- upvalues: getExpectedPartSizeModule (copy), p1 (ref), p2 (ref), getEditableMeshFromContextModule (copy), UGCValidationService (copy), var1 (copy)
		local var4 = getExpectedPartSizeModule(p1, p2)
		local var5, var6 = getEditableMeshFromContextModule(p1, "MeshId", p2)
		
		if not var5 then
			error("Failed to retrieve MeshContent")
		end
		return UGCValidationService:ValidateEditableMeshFacialBounds(var6, var1, var4)
	end, p2)
	
	if var2 then
		if var3 then
			return true
		end
		return false, {
			string.format("DynamicHead (%s) when emoting surpasses the expected bounding box", p1:GetFullName())
		}
	else
		local formattedText = string.format("Failed to load mesh data for '%s'. Make sure the mesh exists and try again.", p1:GetFullName())
		
		if isServer ~= nil and isServer then
			error(formattedText)
		end
		return false, { formattedText }
	end
end

return function(p1, p2)
	-- upvalues: failureReasonsAccumulatorModule (ref), getEngineFeatureEngineUGCValidateMinMaxMeshSizeAcrossAllFacsModule (ref), validateFacialBounds (ref), analyticsModule (ref)
	local currentTime = tick()
	local var2 = failureReasonsAccumulatorModule.new()
	
	if not getEngineFeatureEngineUGCValidateMinMaxMeshSizeAcrossAllFacsModule() then
		var2:updateReasons(validateFacialBounds(p1, p2))
	end
	analyticsModule.recordScriptTime(script.Name, currentTime, p2)
	
	return var2:getFinalResults()
end