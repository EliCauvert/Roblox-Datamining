local parent = script.Parent.Parent.Parent
local _ = require(parent.util.Types)
local validationEnumsModule = require(parent.validationSystem.ValidationEnums)
local errorSourceStringsModule = require(parent.validationSystem.ErrorSourceStrings)
local validationRulesUtilModule = require(parent.util.ValidationRulesUtil)
local getAllInstancesIsAModule = require(parent.util.getAllInstancesIsA)
local r15plusUtilsModule = require(parent.util.R15plusUtils)
local vector3UtilsModule = require(parent.util.Vector3Utils)
local valueToStringModule = require(parent.util.valueToString)
local cFrameUtilsModule = require(parent.util.CFrameUtils)
local t = {
	categories = {
		validationEnumsModule.UploadCategory.TORSO_AND_LIMBS,
		validationEnumsModule.UploadCategory.DYNAMIC_HEAD
	},
	requiredData = { validationEnumsModule.SharedDataMember.rootInstance },
	fflag = r15plusUtilsModule.checkFlagEnabledForAllowHrd
}
local var1 = game:DefineFastInt("UGCValidationHrdJointSizeHundredthsLimit", 150) / 100
local UGCValidationHrdJointRangeMinXHundredths = game:DefineFastInt("UGCValidationHrdJointRangeMinXHundredths", 0)
local UGCValidationHrdJointRangeMaxXHundredths = game:DefineFastInt("UGCValidationHrdJointRangeMaxXHundredths", 0)
local UGCValidationHrdJointRangeMinYHundredths = game:DefineFastInt("UGCValidationHrdJointRangeMinYHundredths", 0)
local UGCValidationHrdJointRangeMaxYHundredths = game:DefineFastInt("UGCValidationHrdJointRangeMaxYHundredths", 0)
local UGCValidationHrdJointRangeMinZHundredths = game:DefineFastInt("UGCValidationHrdJointRangeMinZHundredths", 0)
local UGCValidationHrdJointRangeMaxZHundredths = game:DefineFastInt("UGCValidationHrdJointRangeMaxZHundredths", 0)
local UGCValidationHrdOriginOffsetMinYHundredths = game:DefineFastInt("UGCValidationHrdOriginOffsetMinYHundredths", -500)
local UGCValidationHrdOriginOffsetMaxYHundredths = game:DefineFastInt("UGCValidationHrdOriginOffsetMaxYHundredths", 500)
local vector3 = Vector3.new(UGCValidationHrdJointRangeMinXHundredths / 100, UGCValidationHrdJointRangeMinYHundredths / 100, UGCValidationHrdJointRangeMinZHundredths / 100)
local vector3_1 = Vector3.new(UGCValidationHrdJointRangeMaxXHundredths / 100, UGCValidationHrdJointRangeMaxYHundredths / 100, UGCValidationHrdJointRangeMaxZHundredths / 100)
local vector3_2 = Vector3.new(0, UGCValidationHrdOriginOffsetMinYHundredths / 100, 0)
local vector3_3 = Vector3.new(0, UGCValidationHrdOriginOffsetMaxYHundredths / 100, 0)
local var2 = game:DefineFastInt("UGCValidationDrdJointSizeHundredthsLimit", 150) / 100
local vector3_4 = Vector3.new(game:DefineFastInt("UGCValidationDrdJointRangeMinXHundredths", 0) / 100, game:DefineFastInt("UGCValidationDrdJointRangeMinYHundredths", 0) / 100, game:DefineFastInt("UGCValidationDrdJointRangeMinZHundredths", 0) / 100)
local vector3_5 = Vector3.new(game:DefineFastInt("UGCValidationDrdJointRangeMaxXHundredths", 0) / 100, game:DefineFastInt("UGCValidationDrdJointRangeMaxYHundredths", 0) / 100, game:DefineFastInt("UGCValidationDrdJointRangeMaxZHundredths", 0) / 100)

local function checkVectorRange(p1, p2, p3, p4, p5, p6)
	-- upvalues: vector3UtilsModule (ref), errorSourceStringsModule (ref), valueToStringModule (ref)
	if not vector3UtilsModule.isInRange(p4, p5, p6) then
		p1:fail(errorSourceStringsModule.Keys.HrdProperties_PropertyOutOfRange, {
			jointName = p2,
			propertyName = p3,
			currentValue = valueToStringModule(p4),
			valueMin = valueToStringModule(p5),
			valueMax = valueToStringModule(p6)
		})
	end
end

local function checkSize(p1, p2, p3, p4, p5)
	-- upvalues: errorSourceStringsModule (ref), valueToStringModule (ref)
	if p4 < 0 or p5 < p4 then
		p1:fail(errorSourceStringsModule.Keys.HrdProperties_PropertyOutOfRange, {
			valueMin = "0",
			jointName = p2,
			propertyName = p3,
			currentValue = valueToStringModule(p4),
			valueMax = valueToStringModule(p5)
		})
	end
end

function t.run(p1, p2)
	-- upvalues: getAllInstancesIsAModule (ref), validationRulesUtilModule (ref), cFrameUtilsModule (ref), vector3UtilsModule (ref), vector3_2 (ref), vector3_3 (ref), errorSourceStringsModule (ref), valueToStringModule (ref), r15plusUtilsModule (ref), checkSize (ref), var1 (ref), checkVectorRange (ref), vector3 (ref), vector3_1 (ref), var2 (ref), vector3_4 (ref), vector3_5 (ref)
	for i, v in getAllInstancesIsAModule(p2.rootInstance, "MeshPart") do
		local humanoidRigDescription = v:FindFirstChildWhichIsA("HumanoidRigDescription")
		local name = validationRulesUtilModule.rigAttachmentToParentMap[v.Name]
		
		if humanoidRigDescription ~= nil then
			p1:setReportingInstance(humanoidRigDescription)
			local originOffset = humanoidRigDescription.OriginOffset
			
			if v.Name == "LowerTorso" then
				if not cFrameUtilsModule.fuzzyEq(originOffset.Rotation, CFrame.identity) or not vector3UtilsModule.isInRange(originOffset.Position, vector3_2, vector3_3) then
					p1:fail(errorSourceStringsModule.Keys.HrdProperties_OriginOutsideBounds, {
						valueMin = valueToStringModule(vector3_2),
						valueMax = valueToStringModule(vector3_3)
					})
				end
			elseif not cFrameUtilsModule.fuzzyEq(originOffset, CFrame.identity) then
				p1:fail(errorSourceStringsModule.Keys.HrdProperties_UncontainedJoint, { jointName = "originOffset", foundMeshName = v.Name })
			end
			local nameContainedJointLabels = humanoidRigDescription:GetContainedJointLabels(v.Name)
			
			for i_1, v_1 in r15plusUtilsModule.getHrdJointLabels() do
				local var3 = `{v_1.Name}RigAttachment` == name
				local var4 = humanoidRigDescription:GetJoint(v_1)
				
				if var3 and (not var4 or var4.Name ~= name or var4.ClassName ~= "Attachment") then
					p1:fail(errorSourceStringsModule.Keys.HrdMissingStandardJoint, { jointName = v_1.Name })
				end
				if var4 then
					if table.find(nameContainedJointLabels, v_1) then
						if not var3 and (var4.Name ~= v_1.Name or var4.ClassName ~= "Bone") then
							p1:fail(errorSourceStringsModule.Keys.HrdImproperJointMapping, { jointName = v_1.Name, boneName = v_1.Name })
						end
						local var5 = humanoidRigDescription:GetJointSize(v_1)
						local var6 = humanoidRigDescription:GetJointRangeMin(v_1)
						local var7 = humanoidRigDescription:GetJointRangeMax(v_1)
						checkSize(p1, v_1.Name, "size", var5, var3)
						checkVectorRange(p1, v_1.Name, "rangeMin", var6, vector3, vector3_1)
						checkVectorRange(p1, v_1.Name, "rangeMax", var7, vector3, vector3_1)
						
						if not vector3UtilsModule.isFirstLessOrEqual(var6, var7) then
							p1:fail(errorSourceStringsModule.Keys.HrdProperties_MinAboveMax, { jointName = v_1.Name })
						end
					else
						p1:fail(errorSourceStringsModule.Keys.HrdProperties_UncontainedJoint, { jointName = v_1.Name, foundMeshName = v.Name })
					end
				end
			end
			local digitsRigDescription = v:FindFirstChildWhichIsA("DigitsRigDescription")
			
			if digitsRigDescription ~= nil then
				p1:setReportingInstance(digitsRigDescription)
				
				if (v.Name ~= "LeftHand" or digitsRigDescription.Side ~= Enum.DigitsRigDescriptionSide.Left) and (v.Name ~= "RightHand" or digitsRigDescription.Side ~= Enum.DigitsRigDescriptionSide.Right) then
					local var8 = "None"
					
					if v.Name == "LeftHand" then
						var8 = "Left"
					elseif v.Name == "RightHand" then
						var8 = "Right"
					end
					p1:fail(errorSourceStringsModule.Keys.HrdCheck_DrdInvalidSide, {
						partName = v.Name,
						expectedSide = var8,
						foundSide = digitsRigDescription.Side.Name
					})
				end
				checkSize(p1, "Index", "size", digitsRigDescription.IndexSize, var4)
				checkSize(p1, "Thumb", "size", digitsRigDescription.ThumbSize, var4)
				checkSize(p1, "Middle", "size", digitsRigDescription.MiddleSize, var4)
				checkSize(p1, "Pinky", "size", digitsRigDescription.PinkySize, var4)
				checkSize(p1, "Ring", "size", digitsRigDescription.RingSize, var4)
				checkVectorRange(p1, "Index", "range", digitsRigDescription.IndexRange, vector3_4, vector3_5)
				checkVectorRange(p1, "Thumb", "range", digitsRigDescription.ThumbRange, vector3_4, vector3_5)
				checkVectorRange(p1, "Pinky", "range", digitsRigDescription.PinkyRange, vector3_4, vector3_5)
				checkVectorRange(p1, "Ring", "range", digitsRigDescription.RingRange, vector3_4, vector3_5)
				checkVectorRange(p1, "Middle", "range", digitsRigDescription.MiddleRange, vector3_4, vector3_5)
			end
		end
	end
end

return t