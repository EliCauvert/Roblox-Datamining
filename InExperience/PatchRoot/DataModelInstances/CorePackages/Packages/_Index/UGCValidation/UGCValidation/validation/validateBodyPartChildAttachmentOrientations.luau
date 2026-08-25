local parent = script.Parent.Parent
local analyticsModule = require(parent.Analytics)
local _ = require(parent.util.Types)
local failureReasonsAccumulatorModule = require(parent.util.FailureReasonsAccumulator)
local getDiffBetweenOrientationsModule = require(parent.util.getDiffBetweenOrientations)
local floatEqualsModule = require(parent.util.floatEquals)
local valueToStringModule = require(parent.util.valueToString)
local r15plusUtilsModule = require(parent.util.R15plusUtils)
local getAttachmentCFrameInPartSpaceModule = require(parent.util.getAttachmentCFrameInPartSpace)
local attachmentRotationFIntsModule = require(parent.util.AttachmentRotationFInts)
local t = {}
local UGCValidateRigAttachmentRotationUsesDiff = game:DefineFastFlag("UGCValidateRigAttachmentRotationUsesDiff", false)
local thresholdGetters = attachmentRotationFIntsModule.thresholdGetters
local var10 = CFrame.new(Vector3.new(0, 0, 0), Vector3.new(0, 0, -1)) * CFrame.fromEulerAnglesXYZ(-1.570796326795, 0, 0)

function t.expectedGripAttCFrameRotation(p0, p1)
	-- upvalues: r15plusUtilsModule (ref), getAttachmentCFrameInPartSpaceModule (ref), var10 (ref)
	assert(if p1 ~= Enum.AssetType.RightArm then p1 == Enum.AssetType.LeftArm else true)
	local var11 = if p1 == Enum.AssetType.RightArm then "Right" else "Left"
	local var12 = p0:FindFirstChild(var11 .. "LowerArm")
	local var13 = p0:FindFirstChild(var11 .. "Hand")
	assert(var12)
	assert(var13)
	local var14 = var12:FindFirstChild(var11 .. "ElbowRigAttachment", r15plusUtilsModule.checkFlagEnabledForAllowHrd())
	local var15 = var12:FindFirstChild(var11 .. "WristRigAttachment", r15plusUtilsModule.checkFlagEnabledForAllowHrd())
	local var16 = var13:FindFirstChild(var11 .. "WristRigAttachment", r15plusUtilsModule.checkFlagEnabledForAllowHrd())
	local var17 = var13:FindFirstChild(var11 .. "GripAttachment", r15plusUtilsModule.checkFlagEnabledForAllowHrd())
	assert(var14)
	assert(var15)
	assert(var16)
	assert(var17)
	local var18 = getAttachmentCFrameInPartSpaceModule(var16)
	local var19 = var18.Position - (var18 * getAttachmentCFrameInPartSpaceModule(var15):Inverse() * getAttachmentCFrameInPartSpaceModule(var14)).Position
	
	return CFrame.fromEulerAnglesXYZ(0, 0, 1.570796326795 - math.acos(Vector3.new(var19.X, math.max(0, -var19.Y), 0).Unit.X)) * var10.Rotation
end

function t.runValidation(p2, p3)
	-- upvalues: failureReasonsAccumulatorModule (ref), UGCValidateRigAttachmentRotationUsesDiff (ref), getDiffBetweenOrientationsModule (ref), getAttachmentCFrameInPartSpaceModule (ref), thresholdGetters (ref), floatEqualsModule (ref), analyticsModule (ref), t (ref), valueToStringModule (ref)
	local var20 = failureReasonsAccumulatorModule.new()
	
	for i, v in p2:GetDescendants() do
		if v.ClassName == "Attachment" then
			local isGripAttachment = string.sub(v.Name, -14) == "GripAttachment"
			
			if string.sub(v.Name, -13) == "RigAttachment" then
				local var27
				local _ = nil
				
				if UGCValidateRigAttachmentRotationUsesDiff then
					local _ = thresholdGetters.RigAttachment() < getDiffBetweenOrientationsModule(CFrame.identity, getAttachmentCFrameInPartSpaceModule(v))
				else
					local var24, var25, var26 = getAttachmentCFrameInPartSpaceModule(v):ToOrientation()
					var27 = if floatEqualsModule(var24, 0) then if floatEqualsModule(var25, 0) then not floatEqualsModule(var26, 0) else not floatEqualsModule(var25, 0) else not floatEqualsModule(var24, 0)
				end
				if var27 then
					analyticsModule.reportFailure(analyticsModule.ErrorType.validateBodyPartChildAttachmentOrientations_RotatedRig, nil, p3)
					var20:updateReasons(false, {
						string.format("Rig attachments cannot be rotated, please set %s's orientation to (0,0,0)", v:GetFullName())
					})
				end
			elseif thresholdGetters[v.Name] ~= nil then
				local cFrame = CFrame.new()
				
				if isGripAttachment then
					assert(p3.assetTypeEnum)
					cFrame = t.expectedGripAttCFrameRotation(p2, p3.assetTypeEnum)
				end
				if thresholdGetters[v.Name]() < getDiffBetweenOrientationsModule(cFrame, getAttachmentCFrameInPartSpaceModule(v)) then
					analyticsModule.reportFailure(if isGripAttachment then analyticsModule.ErrorType.validateBodyPartChildAttachmentOrientations_RotatedGrip else analyticsModule.ErrorType.validateBodyPartChildAttachmentOrientations_RotatedBasic, nil, p3)
					local vector3 = Vector3.new(cFrame:ToOrientation())
					var20:updateReasons(false, {
						string.format("Attachment %s's orientation deviates too far from expectation, which will make attached accessories look unaligned. Recommended orientation is %s, and you can deviate up to %d degrees", v:GetFullName(), valueToStringModule(Vector3.new(math.deg(vector3.X), math.deg(vector3.Y), math.deg(vector3.Z))), thresholdGetters[v.Name]())
					})
				end
			end
		end
	end
	return var20:getFinalResults()
end

return t