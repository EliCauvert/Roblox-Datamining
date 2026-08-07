-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:32:41 2026 Pacific Standard Time.

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

local function validateInternal(p0, p1) --[[ line: 26 ]]
	-- upvalues: getMeshInfoModule (ref), constantsModule (ref), getExpectedPartSizeModule (ref), pcallDeferredModule (ref), UGCValidationService (ref), analyticsModule (ref), getFStringUGCValidationMaxCageDistanceModule (ref)
	local _ = nil
	local _ = nil
	local _ = nil
	local var11, var12, var13 = getMeshInfoModule(p0, constantsModule.MESH_CONTENT_TYPE.RENDER_MESH, p1)
	local var14 = var13
	
	if not var11 then
		return false, var12
	end
	local wrapTarget = p0:FindFirstChildWhichIsA("WrapTarget")
	assert(wrapTarget, "Missing WrapTarget child for " .. p0.Name)
	local _ = nil
	local _ = nil
	local _ = nil
	local var16, var17, var18 = getMeshInfoModule(wrapTarget, constantsModule.MESH_CONTENT_TYPE.OUTER_CAGE, p1)
	local var19 = var18
	
	if not var16 then
		return false, var17
	end
	local var20 = getExpectedPartSizeModule(p0, p1) / getExpectedPartSizeModule(p0, p1, true)
	local var21, var22 = pcallDeferredModule(function() --[[ line: 50 ]]
		-- upvalues: UGCValidationService (copy), var19 (write), var14 (write), wrapTarget (ref), var20 (ref)
		return UGCValidationService:CalculateBodyPartMaxCageDistance(var19.editableMesh, var14.editableMesh, wrapTarget.CageOrigin, var20)
	end, p1)
	
	if var21 then
		if getFStringUGCValidationMaxCageDistanceModule.asNumber() < var22 then
			analyticsModule.reportFailure(analyticsModule.ErrorType.validateBodyPartCage_VertsAreTooFarInFrontOfRenderMesh, nil, p1)
			
			return false, {
				string.format("Cage mesh verts referenced in %s.%s.CageMeshId were found that are %.2f studs outside the %s render mesh. %s studs is the maximum. Reduce the size of your cage mesh.", p0.Name, wrapTarget.Name, var22, p0.Name, getFStringUGCValidationMaxCageDistanceModule.asString())
			}
		end
		return true
	else
		local name = `Failed to execute body part max cage distance check. Make sure {p0.Name}'s render mesh and its WrapTarget's cage mesh exist, and try again.`
		
		if p1.isServer ~= nil and p1.isServer then
			error(name)
		end
		analyticsModule.reportFailure(analyticsModule.ErrorType.validateBodyPartCage_FailedToExecute, nil, p1)
		
		return false, { name }
	end
end

function t.validateSingleBodyPart(p2, p3) --[[ line: 93 ]]
	-- upvalues: constantsModule (ref), failureReasonsAccumulatorModule (ref), validateInternal (ref), analyticsModule (ref)
	local currentTime = tick()
	local assetTypeEnum = constantsModule.ASSET_TYPE_INFO[p3.assetTypeEnum]
	local var25 = failureReasonsAccumulatorModule.new()
	
	if Enum.AssetType.DynamicHead == p3.assetTypeEnum then
		return validateInternal(p2, p3)
	end
	for i in pairs(assetTypeEnum.subParts) do
		local var26 = p2:FindFirstChild(i)
		assert(var26, "expected parts have been checked for existance before calling this function")
		var25:updateReasons(validateInternal(var26, p3))
	end
	analyticsModule.recordScriptTime(script.Name, currentTime, p3)
	
	return var25:getFinalResults()
end

function t.validateFullBody(p4, p5) --[[ line: 116 ]]
	-- upvalues: assetCalculatorModule (ref), getMeshInfoModule (ref), constantsModule (ref), getExpectedPartSizeModule (ref), pcallDeferredModule (ref), UGCValidationService (ref), analyticsModule (ref), getFStringUGCValidationMaxCageDistanceModule (ref)
	local currentTime = tick()
	local var28 = assetCalculatorModule.calculateAllTransformsForFullBody(p4)
	local t = {}
	
	for i, v in p4 do
		local var33 = nil
		local _ = nil
		local _ = nil
		local var34, var35, var36 = getMeshInfoModule(v, constantsModule.MESH_CONTENT_TYPE.RENDER_MESH, p5)
		var33 = var34
		local var37 = var35
		local var38 = var36
		
		if var33 then
			local wrapTarget = v:FindFirstChildWhichIsA("WrapTarget")
			assert(wrapTarget, "Missing WrapTarget child for " .. v.Name)
			var35 = nil
			local _ = nil
			local _ = nil
			local var40, var41, var42 = getMeshInfoModule(wrapTarget, constantsModule.MESH_CONTENT_TYPE.OUTER_CAGE, p5)
			var35 = var40
			local var43 = var41
			local var44 = var42
			
			if var35 then
				table.insert(t, {
					renderMesh = var38.editableMesh,
					outerCage = var44.editableMesh,
					renderMeshTransform = var28[v.Name],
					outerCageLocalTransform = wrapTarget.CageOrigin,
					scale = getExpectedPartSizeModule(v, p5) / getExpectedPartSizeModule(v, p5, true),
					name = v.Name
				})
				continue
			end
			return false, var43
		end
		return false, var37
	end
	local var30, var31, var32 = pcallDeferredModule(function() --[[ line: 158 ]]
		-- upvalues: UGCValidationService (copy), t (ref)
		return UGCValidationService:CalculateBodyMaxCageDistance(t)
	end, p5)
	analyticsModule.recordScriptTime(script.Name, currentTime, p5)
	
	if var30 then
		if getFStringUGCValidationMaxCageDistanceModule.asNumber() < var31 then
			analyticsModule.reportFailure(analyticsModule.ErrorType.validateBodyPartCage_VertsAreTooFarInFrontOfRenderMesh, nil, p5)
			
			return false, {
				string.format("A vertex was found on the %s's cage mesh that is %.2f studs away from the closest render mesh. %s studs is the maximum. Make the cage mesh more closely match the shape and size of the render mesh.", var32, var31, getFStringUGCValidationMaxCageDistanceModule.asString()) .. "[Read more](https://create.roblox.com/docs/art/validation-errors#bodyCageMaxSize)"
			}
		end
		return true
	elseif p5.isServer ~= nil and p5.isServer then
		error("Failed to execute body max cage distance check. Make sure all render meshes and their WrapTarget cage meshes exist, and try again.")
	end
	analyticsModule.reportFailure(analyticsModule.ErrorType.validateBodyPartCage_FailedToExecute, nil, p5)
	
	return false, {
		"Failed to execute body max cage distance check. Make sure all render meshes and their WrapTarget cage meshes exist, and try again."
	}
end

return t