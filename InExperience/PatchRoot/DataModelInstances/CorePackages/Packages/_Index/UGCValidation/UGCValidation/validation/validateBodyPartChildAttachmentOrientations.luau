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
local var1 = CFrame.new(Vector3.new(0, 0, 0), Vector3.new(0, 0, -1)) * CFrame.fromEulerAnglesXYZ(-1.570796326795, 0, 0)

function t.expectedGripAttCFrameRotation(p1, p2)
	-- upvalues: r15plusUtilsModule (ref), getAttachmentCFrameInPartSpaceModule (ref), var1 (ref)
	assert(if p2 ~= Enum.AssetType.RightArm then p2 == Enum.AssetType.LeftArm else true)
	local var2 = if p2 == Enum.AssetType.RightArm then "Right" else "Left"
	local var3 = p1:FindFirstChild(var2 .. "LowerArm")
	local var4 = p1:FindFirstChild(var2 .. "Hand")
	assert(var3)
	assert(var4)
	local var5 = var3:FindFirstChild(var2 .. "ElbowRigAttachment", r15plusUtilsModule.checkFlagEnabledForAllowHrd())
	local var6 = var3:FindFirstChild(var2 .. "WristRigAttachment", r15plusUtilsModule.checkFlagEnabledForAllowHrd())
	local var7 = var4:FindFirstChild(var2 .. "WristRigAttachment", r15plusUtilsModule.checkFlagEnabledForAllowHrd())
	local var8 = var4:FindFirstChild(var2 .. "GripAttachment", r15plusUtilsModule.checkFlagEnabledForAllowHrd())
	assert(var5)
	assert(var6)
	assert(var7)
	assert(var8)
	local var9 = getAttachmentCFrameInPartSpaceModule(var7)
	local var10 = var9.Position - (var9 * getAttachmentCFrameInPartSpaceModule(var6):Inverse() * getAttachmentCFrameInPartSpaceModule(var5)).Position
	
	return CFrame.fromEulerAnglesXYZ(0, 0, 1.570796326795 - math.acos(Vector3.new(var10.X, math.max(0, -var10.Y), 0).Unit.X)) * var1.Rotation
end

function t.runValidation(p1, p2)
	-- upvalues: failureReasonsAccumulatorModule (ref), UGCValidateRigAttachmentRotationUsesDiff (ref), getDiffBetweenOrientationsModule (ref), getAttachmentCFrameInPartSpaceModule (ref), thresholdGetters (ref), floatEqualsModule (ref), analyticsModule (ref), t (ref), valueToStringModule (ref)
	local var2 = failureReasonsAccumulatorModule.new()
	
	for i, v in p1:GetDescendants() do
		if v.ClassName == "Attachment" then
			local isGripAttachment = string.sub(v.Name, -14) == "GripAttachment"
			
			if string.sub(v.Name, -13) == "RigAttachment" then
				local var3
				local _ = nil
				
				if UGCValidateRigAttachmentRotationUsesDiff then
					local _ = thresholdGetters.RigAttachment() < getDiffBetweenOrientationsModule(CFrame.identity, getAttachmentCFrameInPartSpaceModule(v))
				else
					local var4, var5, var6 = getAttachmentCFrameInPartSpaceModule(v):ToOrientation()
					var3 = if floatEqualsModule(var4, 0) then if floatEqualsModule(var5, 0) then not floatEqualsModule(var6, 0) else not floatEqualsModule(var5, 0) else not floatEqualsModule(var4, 0)
				end
				if var3 then
					analyticsModule.reportFailure(analyticsModule.ErrorType.validateBodyPartChildAttachmentOrientations_RotatedRig, nil, p2)
					var2:updateReasons(false, {
						string.format("Rig attachments cannot be rotated, please set %s's orientation to (0,0,0)", v:GetFullName())
					})
				end
			elseif thresholdGetters[v.Name] ~= nil then
				local cFrame = CFrame.new()
				
				if isGripAttachment then
					assert(p2.assetTypeEnum)
					cFrame = t.expectedGripAttCFrameRotation(p1, p2.assetTypeEnum)
				end
				if thresholdGetters[v.Name]() < getDiffBetweenOrientationsModule(cFrame, getAttachmentCFrameInPartSpaceModule(v)) then
					analyticsModule.reportFailure(if isGripAttachment then analyticsModule.ErrorType.validateBodyPartChildAttachmentOrientations_RotatedGrip else analyticsModule.ErrorType.validateBodyPartChildAttachmentOrientations_RotatedBasic, nil, p2)
					local vector3 = Vector3.new(cFrame:ToOrientation())
					var2:updateReasons(false, {
						string.format("Attachment %s's orientation deviates too far from expectation, which will make attached accessories look unaligned. Recommended orientation is %s, and you can deviate up to %d degrees", v:GetFullName(), valueToStringModule(Vector3.new(math.deg(vector3.X), math.deg(vector3.Y), math.deg(vector3.Z))), thresholdGetters[v.Name]())
					})
				end
			end
		end
	end
	return var2:getFinalResults()
end

return t