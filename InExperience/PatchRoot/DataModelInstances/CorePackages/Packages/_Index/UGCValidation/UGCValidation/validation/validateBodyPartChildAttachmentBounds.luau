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

local function validateInMeshSpace(p1, p2, p3, p4, p5)
	-- upvalues: getAttachmentCFrameInPartSpaceModule (ref), boundsDataUtilsModule (ref), analyticsModule (ref), meshSpaceUtilsModule (ref), prettyPrintVector3Module (ref), getFStringUGCValidationAttachmentErrorLinkModule (ref)
	local var1 = p5.cframe * getAttachmentCFrameInPartSpaceModule(p1)
	local var2 = boundsDataUtilsModule.calculateBoundsCenters(p5.boundsData)
	local var3 = boundsDataUtilsModule.calculateBoundsDimensions(p5.boundsData)
	
	if not var2 or not var3 then
		return false, { "Missing mesh data for " .. p1.Name }
	end
	local var4 = (var1.Position - var2) / (var3 / 2)
	local min = p3.min
	local max = p3.max
	
	for i, v in { "X", "Y", "Z" } do
		if var4[v] < min[v] or max[v] < var4[v] then
			analyticsModule.reportFailure(analyticsModule.ErrorType.validateBodyPartChildAttachmentBounds_InvalidAttachmentPosition, nil, p4)
			local var5 = meshSpaceUtilsModule.clampAttachmentToBounds(p1, p5, p3, 0.001)
			assert(var2 and var3, "meshCenterOpt and meshDimensionsOpt must be defined")
			local var6, var7 = meshSpaceUtilsModule.calculateAcceptableBoundsLocalSpace(p3, p5, var3, var2)
			local position = var6.Position
			local var8, var9, var10 = var6.Rotation:ToOrientation()
			
			return false, {
				string.format("Attachment (%s) in %s is placed at position [%s] that is outside the valid range. The closest valid position is [%s]. (the attachment must be within the oriented bounding box - Position: [%s], Orientation: [%s], Size: [%s]%s)", p1.Name, p2.Name, prettyPrintVector3Module(p1.CFrame.Position, 3), prettyPrintVector3Module(var5.Position, 3), prettyPrintVector3Module(position, 3), prettyPrintVector3Module(Vector3.new(math.deg(var8), math.deg(var9), math.deg(var10)), 3), prettyPrintVector3Module(var7, 3), if getFStringUGCValidationAttachmentErrorLinkModule() ~= "" then "" else ". See " .. getFStringUGCValidationAttachmentErrorLinkModule() .. " for further explanation")
			}
		end
	end
	return true
end

local function checkAll(p6, _, p7, p8, p9)
	-- upvalues: failureReasonsAccumulatorModule (ref), r15plusUtilsModule (ref), validateInMeshSpace (ref)
	local var11 = failureReasonsAccumulatorModule.new()
	local name = p6:FindFirstChild(p7.rigAttachmentToParent.name, r15plusUtilsModule.checkFlagEnabledForAllowHrd())
	assert(name)
	var11:updateReasons(validateInMeshSpace(name, p6, p7.rigAttachmentToParent.bounds, p8, p9))
	
	for i, v in pairs(p7.otherAttachments) do
		local var12 = p6:FindFirstChild(i, r15plusUtilsModule.checkFlagEnabledForAllowHrd())
		assert(var12)
		var11:updateReasons(validateInMeshSpace(var12, p6, v.bounds, p8, p9))
	end
	return var11:getFinalResults()
end

return function(p10, p11)
	-- upvalues: constantsModule (ref), failureReasonsAccumulatorModule (ref), boundsCalculatorModule (ref), checkAll (ref), analyticsModule (ref)
	local currentTime = tick()
	local assetTypeEnum = p11.assetTypeEnum
	local isServer = p11.isServer
	assert(assetTypeEnum)
	local var13 = constantsModule.ASSET_TYPE_INFO[assetTypeEnum]
	assert(var13)
	local var14 = failureReasonsAccumulatorModule.new()
	local var15, var16, var17 = boundsCalculatorModule.calculateIndividualAssetPartsData(p10, p11)
	
	if not var15 then
		return var15, var16
	elseif Enum.AssetType.DynamicHead == assetTypeEnum then
		var14:updateReasons(checkAll(p10, isServer, var13.subParts.Head, p11, var17[p10.Name]))
	else
		for i, v in pairs(var13.subParts) do
			local var18 = p10:FindFirstChild(i)
			assert(var18)
			var14:updateReasons(checkAll(var18, isServer, v, p11, var17[i]))
		end
	end
	analyticsModule.recordScriptTime(script.Name, currentTime, p11)
	
	return var14:getFinalResults()
end