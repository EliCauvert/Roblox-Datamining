local Parent = script.Parent.Parent.Parent
local _ = require(Parent.util.Types)
local ValidationEnumsModule = require(Parent.validationSystem.ValidationEnums)
local ErrorSourceStringsModule = require(Parent.validationSystem.ErrorSourceStrings)
local ValidationRulesUtilModule = require(Parent.util.ValidationRulesUtil)
local GetAllInstancesIsAModule = require(Parent.util.getAllInstancesIsA)
local R15plusUtilsModule = require(Parent.util.R15plusUtils)
local Vector3UtilsModule = require(Parent.util.Vector3Utils)
local ValueToStringModule = require(Parent.util.valueToString)
local CFrameUtilsModule = require(Parent.util.CFrameUtils)
local UGCValidationHrdJointSizeHundredthsLimitRatio = game:DefineFastInt("UGCValidationHrdJointSizeHundredthsLimit", 150) / 100
local _Vector3 = Vector3.new(game:DefineFastInt("UGCValidationHrdJointRangeMinXHundredths", 0) / 100, game:DefineFastInt("UGCValidationHrdJointRangeMinYHundredths", 0) / 100, game:DefineFastInt("UGCValidationHrdJointRangeMinZHundredths", 0) / 100)
local _Vector3_1 = Vector3.new(game:DefineFastInt("UGCValidationHrdJointRangeMaxXHundredths", 0) / 100, game:DefineFastInt("UGCValidationHrdJointRangeMaxYHundredths", 0) / 100, game:DefineFastInt("UGCValidationHrdJointRangeMaxZHundredths", 0) / 100)
local _Vector3_2 = Vector3.new(0, game:DefineFastInt("UGCValidationHrdOriginOffsetMinYHundredths", -500) / 100, 0)
local _Vector3_3 = Vector3.new(0, game:DefineFastInt("UGCValidationHrdOriginOffsetMaxYHundredths", 500) / 100, 0)
local UGCValidationDrdJointSizeHundredthsLimitRatio = game:DefineFastInt("UGCValidationDrdJointSizeHundredthsLimit", 150) / 100
local _Vector3_4 = Vector3.new(game:DefineFastInt("UGCValidationDrdJointRangeMinXHundredths", 0) / 100, game:DefineFastInt("UGCValidationDrdJointRangeMinYHundredths", 0) / 100, game:DefineFastInt("UGCValidationDrdJointRangeMinZHundredths", 0) / 100)
local _Vector3_5 = Vector3.new(game:DefineFastInt("UGCValidationDrdJointRangeMaxXHundredths", 0) / 100, game:DefineFastInt("UGCValidationDrdJointRangeMaxYHundredths", 0) / 100, game:DefineFastInt("UGCValidationDrdJointRangeMaxZHundredths", 0) / 100)

local function checkVectorRange(p1, Name, PropertyName, IndexRange, p2, p3) --[[ Line: 45 ]]
	-- upvalues: Vector3UtilsModule (copy), ErrorSourceStringsModule (copy), ValueToStringModule (copy)
	if not Vector3UtilsModule.isInRange(IndexRange, p2, p3) then
		p1:fail(ErrorSourceStringsModule.Keys.HrdProperties_PropertyOutOfRange, {
			jointName = Name,
			propertyName = PropertyName,
			currentValue = ValueToStringModule(IndexRange),
			valueMin = ValueToStringModule(p2),
			valueMax = ValueToStringModule(p3)
		})
	end
end

local function checkSize(p1, JointName, PropertyName, IndexSize: number, UGCValidationDrdJointSizeHundredthsLimitRatio) --[[ Line: 64 ]]
	-- upvalues: ErrorSourceStringsModule (copy), ValueToStringModule (copy)
	if IndexSize < 0 or UGCValidationDrdJointSizeHundredthsLimitRatio < IndexSize then
		p1:fail(ErrorSourceStringsModule.Keys.HrdProperties_PropertyOutOfRange, {
			valueMin = "0",
			jointName = JointName,
			propertyName = PropertyName,
			currentValue = ValueToStringModule(IndexSize),
			valueMax = ValueToStringModule(UGCValidationDrdJointSizeHundredthsLimitRatio)
		})
	end
end

return {
	categories = {
		ValidationEnumsModule.UploadCategory.TORSO_AND_LIMBS,
		ValidationEnumsModule.UploadCategory.DYNAMIC_HEAD
	},
	requiredData = { ValidationEnumsModule.SharedDataMember.rootInstance },
	fflag = R15plusUtilsModule.checkFlagEnabledForAllowHrd,
	run = function(p1, p2) --[[ Line: 82 ]]
		-- upvalues: GetAllInstancesIsAModule (copy), ValidationRulesUtilModule (copy), CFrameUtilsModule (copy), Vector3UtilsModule (copy), _Vector3_2 (copy), _Vector3_3 (copy), ErrorSourceStringsModule (copy), ValueToStringModule (copy), R15plusUtilsModule (copy), checkSize (copy), UGCValidationHrdJointSizeHundredthsLimitRatio (copy), checkVectorRange (copy), _Vector3 (copy), _Vector3_1 (copy), UGCValidationDrdJointSizeHundredthsLimitRatio (copy), _Vector3_4 (copy), _Vector3_5 (copy)
		for _, Object in GetAllInstancesIsAModule(p2.rootInstance, "MeshPart") do
			local HumanoidRigDescription = Object:FindFirstChildWhichIsA("HumanoidRigDescription")
			local RigAttachmentToParent = ValidationRulesUtilModule.rigAttachmentToParentMap[Object.Name]
			
			if HumanoidRigDescription ~= nil then
				p1:setReportingInstance(HumanoidRigDescription)
				local OriginOffset = HumanoidRigDescription.OriginOffset
				
				if Object.Name == "LowerTorso" then
					if not CFrameUtilsModule.fuzzyEq(OriginOffset.Rotation, CFrame.identity) or not Vector3UtilsModule.isInRange(OriginOffset.Position, _Vector3_2, _Vector3_3) then
						p1:fail(ErrorSourceStringsModule.Keys.HrdProperties_OriginOutsideBounds, {
							valueMin = ValueToStringModule(_Vector3_2),
							valueMax = ValueToStringModule(_Vector3_3)
						})
					end
				elseif not CFrameUtilsModule.fuzzyEq(OriginOffset, CFrame.identity) then
					p1:fail(ErrorSourceStringsModule.Keys.HrdProperties_UncontainedJoint, { jointName = "originOffset", foundMeshName = Object.Name })
				end
				local ContainedJointLabels = HumanoidRigDescription:GetContainedJointLabels(Object.Name)
				
				for _, value in R15plusUtilsModule.getHrdJointLabels() do
					local IsRigAttachmentNameMatch = `{value.Name}RigAttachment` == RigAttachmentToParent
					local Joint = HumanoidRigDescription:GetJoint(value)
					
					if IsRigAttachmentNameMatch and (not Joint or Joint.Name ~= RigAttachmentToParent or Joint.ClassName ~= "Attachment") then
						p1:fail(ErrorSourceStringsModule.Keys.HrdMissingStandardJoint, { jointName = value.Name })
					end
					if Joint then
						if table.find(ContainedJointLabels, value) then
							if not IsRigAttachmentNameMatch and (Joint.Name ~= value.Name or Joint.ClassName ~= "Bone") then
								p1:fail(ErrorSourceStringsModule.Keys.HrdImproperJointMapping, { jointName = value.Name, boneName = value.Name })
							end
							local JointRangeMin = HumanoidRigDescription:GetJointRangeMin(value)
							local JointRangeMax = HumanoidRigDescription:GetJointRangeMax(value)
							checkSize(p1, value.Name, "size", HumanoidRigDescription:GetJointSize(value), UGCValidationHrdJointSizeHundredthsLimitRatio)
							checkVectorRange(p1, value.Name, "rangeMin", JointRangeMin, _Vector3, _Vector3_1)
							checkVectorRange(p1, value.Name, "rangeMax", JointRangeMax, _Vector3, _Vector3_1)
							
							if not Vector3UtilsModule.isFirstLessOrEqual(JointRangeMin, JointRangeMax) then
								p1:fail(ErrorSourceStringsModule.Keys.HrdProperties_MinAboveMax, { jointName = value.Name })
							end
						else
							p1:fail(ErrorSourceStringsModule.Keys.HrdProperties_UncontainedJoint, { jointName = value.Name, foundMeshName = Object.Name })
						end
					end
				end
				local DigitsRigDescription = Object:FindFirstChildWhichIsA("DigitsRigDescription")
				
				if DigitsRigDescription ~= nil then
					p1:setReportingInstance(DigitsRigDescription)
					
					if (Object.Name ~= "LeftHand" or DigitsRigDescription.Side ~= Enum.DigitsRigDescriptionSide.Left) and (Object.Name ~= "RightHand" or DigitsRigDescription.Side ~= Enum.DigitsRigDescriptionSide.Right) then
						p1:fail(ErrorSourceStringsModule.Keys.HrdCheck_DrdInvalidSide, {
							partName = Object.Name,
							expectedSide = if Object.Name == "LeftHand" then "Left" elseif Object.Name == "RightHand" then "Right" else "None",
							foundSide = DigitsRigDescription.Side.Name
						})
					end
					checkSize(p1, "Index", "size", DigitsRigDescription.IndexSize, UGCValidationDrdJointSizeHundredthsLimitRatio)
					checkSize(p1, "Thumb", "size", DigitsRigDescription.ThumbSize, UGCValidationDrdJointSizeHundredthsLimitRatio)
					checkSize(p1, "Middle", "size", DigitsRigDescription.MiddleSize, UGCValidationDrdJointSizeHundredthsLimitRatio)
					checkSize(p1, "Pinky", "size", DigitsRigDescription.PinkySize, UGCValidationDrdJointSizeHundredthsLimitRatio)
					checkSize(p1, "Ring", "size", DigitsRigDescription.RingSize, UGCValidationDrdJointSizeHundredthsLimitRatio)
					checkVectorRange(p1, "Index", "range", DigitsRigDescription.IndexRange, _Vector3_4, _Vector3_5)
					checkVectorRange(p1, "Thumb", "range", DigitsRigDescription.ThumbRange, _Vector3_4, _Vector3_5)
					checkVectorRange(p1, "Pinky", "range", DigitsRigDescription.PinkyRange, _Vector3_4, _Vector3_5)
					checkVectorRange(p1, "Ring", "range", DigitsRigDescription.RingRange, _Vector3_4, _Vector3_5)
					checkVectorRange(p1, "Middle", "range", DigitsRigDescription.MiddleRange, _Vector3_4, _Vector3_5)
				end
			end
		end
	end
}