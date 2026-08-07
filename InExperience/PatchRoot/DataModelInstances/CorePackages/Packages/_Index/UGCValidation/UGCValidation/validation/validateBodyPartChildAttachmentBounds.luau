local parent = script.Parent.Parent
local _ = require(parent.util.Types)
local analyticsModule = require(parent.Analytics)
local constantsModule = require(parent.Constants)
local failureReasonsAccumulatorModule = require(parent.util.FailureReasonsAccumulator)
local prettyPrintVector3Module = require(parent.util.prettyPrintVector3)
local boundsCalculatorModule = require(parent.util.BoundsCalculator)
local boundsDataUtilsModule = require(parent.util.BoundsDataUtils)
local meshSpaceUtilsModule = require(parent.util.MeshSpaceUtils)
local getFStringUGCValidationAttachmentErrorLinkModule = require(parent.flags.getFStringUGCValidationAttachmentErrorLink)
local r15plusUtilsModule = require(parent.util.R15plusUtils)
local getAttachmentCFrameInPartSpaceModule = require(parent.util.getAttachmentCFrameInPartSpace)

local function validateInMeshSpace(p0, p1, p2, p3, p4) --[[ line: 21 ]]
	-- upvalues: getAttachmentCFrameInPartSpaceModule (ref), boundsDataUtilsModule (ref), analyticsModule (ref), meshSpaceUtilsModule (ref), prettyPrintVector3Module (ref), getFStringUGCValidationAttachmentErrorLinkModule (ref)
	local var12 = p4.cframe * getAttachmentCFrameInPartSpaceModule(p0)
	local var13 = boundsDataUtilsModule.calculateBoundsCenters(p4.boundsData)
	local var14 = boundsDataUtilsModule.calculateBoundsDimensions(p4.boundsData)
	
	if not var13 or not var14 then
		return false, { "Missing mesh data for " .. p1.Name }
	end
	local var15 = (var12.Position - var13) / (var14 / 2)
	local min = p2.min
	local max = p2.max
	
	for i, v in { "X", "Y", "Z" } do
		if var15[v] < min[v] or max[v] < var15[v] then
			analyticsModule.reportFailure(analyticsModule.ErrorType.validateBodyPartChildAttachmentBounds_InvalidAttachmentPosition, nil, p3)
			local var16 = meshSpaceUtilsModule.clampAttachmentToBounds(p0, p4, p2, 0.001)
			assert(var13 and var14, "meshCenterOpt and meshDimensionsOpt must be defined")
			local var17, var18 = meshSpaceUtilsModule.calculateAcceptableBoundsLocalSpace(p2, p4, var14, var13)
			local position = var17.Position
			local var19, var20, var21 = var17.Rotation:ToOrientation()
			
			return false, {
				string.format("Attachment (%s) in %s is placed at position [%s] that is outside the valid range. The closest valid position is [%s]. (the attachment must be within the oriented bounding box - Position: [%s], Orientation: [%s], Size: [%s]%s)", p0.Name, p1.Name, prettyPrintVector3Module(p0.CFrame.Position, 3), prettyPrintVector3Module(var16.Position, 3), prettyPrintVector3Module(position, 3), prettyPrintVector3Module(Vector3.new(math.deg(var19), math.deg(var20), math.deg(var21)), 3), prettyPrintVector3Module(var18, 3), if getFStringUGCValidationAttachmentErrorLinkModule() ~= "" then "" else ". See " .. getFStringUGCValidationAttachmentErrorLinkModule() .. " for further explanation")
			}
		end
	end
	return true
end

local function checkAll(p5, _, p6, p7, p8) --[[ line: 88 ]]
	-- upvalues: failureReasonsAccumulatorModule (ref), r15plusUtilsModule (ref), validateInMeshSpace (ref)
	local var22 = failureReasonsAccumulatorModule.new()
	local name = p5:FindFirstChild(p6.rigAttachmentToParent.name, r15plusUtilsModule.checkFlagEnabledForAllowHrd())
	assert(name)
	var22:updateReasons(validateInMeshSpace(name, p5, p6.rigAttachmentToParent.bounds, p7, p8))
	
	for i, v in pairs(p6.otherAttachments) do
		local var24 = p5:FindFirstChild(i, r15plusUtilsModule.checkFlagEnabledForAllowHrd())
		assert(var24)
		var22:updateReasons(validateInMeshSpace(var24, p5, v.bounds, p7, p8))
	end
	return var22:getFinalResults()
end

return function(p9, p10) --[[ line: 131 | named "validateBodyPartChildAttachmentBounds" ]]
	-- upvalues: constantsModule (ref), failureReasonsAccumulatorModule (ref), boundsCalculatorModule (ref), checkAll (ref), analyticsModule (ref)
	local currentTime = tick()
	local assetTypeEnum = p10.assetTypeEnum
	local isServer = p10.isServer
	assert(assetTypeEnum)
	local var26 = constantsModule.ASSET_TYPE_INFO[assetTypeEnum]
	assert(var26)
	local var27 = failureReasonsAccumulatorModule.new()
	local var28, var29, var30 = boundsCalculatorModule.calculateIndividualAssetPartsData(p9, p10)
	
	if not var28 then
		return var28, var29
	elseif Enum.AssetType.DynamicHead == assetTypeEnum then
		var27:updateReasons(checkAll(p9, isServer, var26.subParts.Head, p10, var30[p9.Name]))
	else
		for i, v in pairs(var26.subParts) do
			local var31 = p9:FindFirstChild(i)
			assert(var31)
			var27:updateReasons(checkAll(var31, isServer, v, p10, var30[i]))
		end
	end
	analyticsModule.recordScriptTime(script.Name, currentTime, p10)
	
	return var27:getFinalResults()
end