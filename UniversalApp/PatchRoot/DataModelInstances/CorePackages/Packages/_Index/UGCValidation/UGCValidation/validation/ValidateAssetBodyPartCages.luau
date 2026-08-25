local parent = script.Parent.Parent
local UGCValidationService = game:GetService("UGCValidationService")
local analyticsModule = require(parent.Analytics)
local constantsModule = require(parent.Constants)
local util = parent.util
local _ = require(util.Types)
local pcallDeferredModule = require(util.pcallDeferred)
local failureReasonsAccumulatorModule = require(util.FailureReasonsAccumulator)
local getExpectedPartSizeModule = require(util.getExpectedPartSize)
local getMeshInfoModule = require(util.getMeshInfo)
local assetCalculatorModule = require(util.AssetCalculator)
local getFStringUGCValidationMaxCageDistanceModule = require(parent.flags.GetFStringUGCValidationMaxCageDistance)
local t = {}

local function validateInternal(p1, p2)
	-- upvalues: getMeshInfoModule (ref), constantsModule (ref), getExpectedPartSizeModule (ref), pcallDeferredModule (ref), UGCValidationService (ref), analyticsModule (ref), getFStringUGCValidationMaxCageDistanceModule (ref)
	local _ = nil
	local _ = nil
	local _ = nil
	local var1, var2, var3 = getMeshInfoModule(p1, constantsModule.MESH_CONTENT_TYPE.RENDER_MESH, p2)
	local var4 = var3
	
	if not var1 then
		return false, var2
	end
	local wrapTarget = p1:FindFirstChildWhichIsA("WrapTarget")
	assert(wrapTarget, "Missing WrapTarget child for " .. p0.Name)
	local _ = nil
	local _ = nil
	local _ = nil
	local var5, var6, var7 = getMeshInfoModule(wrapTarget, constantsModule.MESH_CONTENT_TYPE.OUTER_CAGE, p2)
	local var8 = var7
	
	if not var5 then
		return false, var6
	end
	local var9 = getExpectedPartSizeModule(p1, p2) / getExpectedPartSizeModule(p1, p2, true)
	local var10, var11 = pcallDeferredModule(function()
		-- upvalues: UGCValidationService (copy), var8 (write), var4 (write), wrapTarget (ref), var9 (ref)
		return UGCValidationService:CalculateBodyPartMaxCageDistance(var8.editableMesh, var4.editableMesh, wrapTarget.CageOrigin, var9)
	end, p2)
	
	if var10 then
		if getFStringUGCValidationMaxCageDistanceModule.asNumber() < var11 then
			analyticsModule.reportFailure(analyticsModule.ErrorType.validateBodyPartCage_VertsAreTooFarInFrontOfRenderMesh, nil, p2)
			
			return false, {
				string.format("Cage mesh verts referenced in %s.%s.CageMeshId were found that are %.2f studs outside the %s render mesh. %s studs is the maximum. Reduce the size of your cage mesh.", p1.Name, wrapTarget.Name, var11, p1.Name, getFStringUGCValidationMaxCageDistanceModule.asString())
			}
		end
		return true
	else
		local name = `Failed to execute body part max cage distance check. Make sure {p1.Name}'s render mesh and its WrapTarget's cage mesh exist, and try again.`
		
		if p2.isServer ~= nil and p2.isServer then
			error(name)
		end
		analyticsModule.reportFailure(analyticsModule.ErrorType.validateBodyPartCage_FailedToExecute, nil, p2)
		
		return false, { name }
	end
end

function t.validateSingleBodyPart(p1, p2)
	-- upvalues: constantsModule (ref), failureReasonsAccumulatorModule (ref), validateInternal (ref), analyticsModule (ref)
	local currentTime = tick()
	local assetTypeEnum = constantsModule.ASSET_TYPE_INFO[p2.assetTypeEnum]
	local var1 = failureReasonsAccumulatorModule.new()
	
	if Enum.AssetType.DynamicHead == p2.assetTypeEnum then
		return validateInternal(p1, p2)
	end
	for i in pairs(assetTypeEnum.subParts) do
		local var2 = p1:FindFirstChild(i)
		assert(var2, "expected parts have been checked for existance before calling this function")
		var1:updateReasons(validateInternal(var2, p2))
	end
	analyticsModule.recordScriptTime(script.Name, currentTime, p2)
	
	return var1:getFinalResults()
end

function t.validateFullBody(p1, p2)
	-- upvalues: assetCalculatorModule (ref), getMeshInfoModule (ref), constantsModule (ref), getExpectedPartSizeModule (ref), pcallDeferredModule (ref), UGCValidationService (ref), analyticsModule (ref), getFStringUGCValidationMaxCageDistanceModule (ref)
	local currentTime = tick()
	local var1 = assetCalculatorModule.calculateAllTransformsForFullBody(p1)
	local t = {}
	
	for i, v in p1 do
		local var2 = nil
		local _ = nil
		local _ = nil
		local var3, var4, var5 = getMeshInfoModule(v, constantsModule.MESH_CONTENT_TYPE.RENDER_MESH, p2)
		var2 = var3
		local var6 = var4
		local var7 = var5
		
		if var2 then
			local wrapTarget = v:FindFirstChildWhichIsA("WrapTarget")
			assert(wrapTarget, "Missing WrapTarget child for " .. v.Name)
			var4 = nil
			local _ = nil
			local _ = nil
			local var8, var9, var10 = getMeshInfoModule(wrapTarget, constantsModule.MESH_CONTENT_TYPE.OUTER_CAGE, p2)
			var4 = var8
			local var11 = var9
			local var12 = var10
			
			if var4 then
				table.insert(t, {
					renderMesh = var7.editableMesh,
					outerCage = var12.editableMesh,
					renderMeshTransform = var1[v.Name],
					outerCageLocalTransform = wrapTarget.CageOrigin,
					scale = getExpectedPartSizeModule(v, p2) / getExpectedPartSizeModule(v, p2, true),
					name = v.Name
				})
				continue
			end
			return false, var11
		end
		return false, var6
	end
	local var13, var14, var15 = pcallDeferredModule(function()
		-- upvalues: UGCValidationService (copy), t (ref)
		return UGCValidationService:CalculateBodyMaxCageDistance(t)
	end, p2)
	analyticsModule.recordScriptTime(script.Name, currentTime, p2)
	
	if var13 then
		if getFStringUGCValidationMaxCageDistanceModule.asNumber() < var14 then
			analyticsModule.reportFailure(analyticsModule.ErrorType.validateBodyPartCage_VertsAreTooFarInFrontOfRenderMesh, nil, p2)
			
			return false, {
				string.format("A vertex was found on the %s's cage mesh that is %.2f studs away from the closest render mesh. %s studs is the maximum. Make the cage mesh more closely match the shape and size of the render mesh.", var15, var14, getFStringUGCValidationMaxCageDistanceModule.asString()) .. "[Read more](https://create.roblox.com/docs/art/validation-errors#bodyCageMaxSize)"
			}
		end
		return true
	elseif p2.isServer ~= nil and p2.isServer then
		error("Failed to execute body max cage distance check. Make sure all render meshes and their WrapTarget cage meshes exist, and try again.")
	end
	analyticsModule.reportFailure(analyticsModule.ErrorType.validateBodyPartCage_FailedToExecute, nil, p2)
	
	return false, {
		"Failed to execute body max cage distance check. Make sure all render meshes and their WrapTarget cage meshes exist, and try again."
	}
end

return t