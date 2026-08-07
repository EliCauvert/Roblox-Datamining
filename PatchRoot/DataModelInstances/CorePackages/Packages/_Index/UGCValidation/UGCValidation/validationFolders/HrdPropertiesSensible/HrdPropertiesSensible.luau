-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:32:47 2026 Pacific Standard Time.

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
local var9 = game:DefineFastInt("UGCValidationHrdJointSizeHundredthsLimit", 150) / 100
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
local var22 = game:DefineFastInt("UGCValidationDrdJointSizeHundredthsLimit", 150) / 100
local vector3_4 = Vector3.new(game:DefineFastInt("UGCValidationDrdJointRangeMinXHundredths", 0) / 100, game:DefineFastInt("UGCValidationDrdJointRangeMinYHundredths", 0) / 100, game:DefineFastInt("UGCValidationDrdJointRangeMinZHundredths", 0) / 100)
local vector3_5 = Vector3.new(game:DefineFastInt("UGCValidationDrdJointRangeMaxXHundredths", 0) / 100, game:DefineFastInt("UGCValidationDrdJointRangeMaxYHundredths", 0) / 100, game:DefineFastInt("UGCValidationDrdJointRangeMaxZHundredths", 0) / 100)

local function checkVectorRange(p0, p1, p2, p3, p4, p5) --[[ line: 45 ]]
	-- upvalues: vector3UtilsModule (ref), errorSourceStringsModule (ref), valueToStringModule (ref)
	if not vector3UtilsModule.isInRange(p3, p4, p5) then
		p0:fail(errorSourceStringsModule.Keys.HrdProperties_PropertyOutOfRange, {
			jointName = p1,
			propertyName = p2,
			currentValue = valueToStringModule(p3),
			valueMin = valueToStringModule(p4),
			valueMax = valueToStringModule(p5)
		})
	end
end

local function checkSize(p6, p7, p8, p9, p10) --[[ line: 64 ]]
	-- upvalues: errorSourceStringsModule (ref), valueToStringModule (ref)
	if p9 < 0 or p10 < p9 then
		p6:fail(errorSourceStringsModule.Keys.HrdProperties_PropertyOutOfRange, {
			valueMin = "0",
			jointName = p7,
			propertyName = p8,
			currentValue = valueToStringModule(p9),
			valueMax = valueToStringModule(p10)
		})
	end
end

function t.run(p11, p12) --[[ line: 82 ]]
	-- upvalues: getAllInstancesIsAModule (ref), validationRulesUtilModule (ref), cFrameUtilsModule (ref), vector3UtilsModule (ref), vector3_2 (ref), vector3_3 (ref), errorSourceStringsModule (ref), valueToStringModule (ref), r15plusUtilsModule (ref), checkSize (ref), var9 (ref), checkVectorRange (ref), vector3 (ref), vector3_1 (ref), var22 (ref), vector3_4 (ref), vector3_5 (ref)
	for i, v in getAllInstancesIsAModule(p12.rootInstance, "MeshPart") do
		local humanoidRigDescription = v:FindFirstChildWhichIsA("HumanoidRigDescription")
		local name = validationRulesUtilModule.rigAttachmentToParentMap[v.Name]
		
		if humanoidRigDescription ~= nil then
			p11:setReportingInstance(humanoidRigDescription)
			local originOffset = humanoidRigDescription.OriginOffset
			
			if v.Name == "LowerTorso" then
				if not cFrameUtilsModule.fuzzyEq(originOffset.Rotation, CFrame.identity) or not vector3UtilsModule.isInRange(originOffset.Position, vector3_2, vector3_3) then
					p11:fail(errorSourceStringsModule.Keys.HrdProperties_OriginOutsideBounds, {
						valueMin = valueToStringModule(vector3_2),
						valueMax = valueToStringModule(vector3_3)
					})
				end
			elseif not cFrameUtilsModule.fuzzyEq(originOffset, CFrame.identity) then
				p11:fail(errorSourceStringsModule.Keys.HrdProperties_UncontainedJoint, { jointName = "originOffset", foundMeshName = v.Name })
			end
			local nameContainedJointLabels = humanoidRigDescription:GetContainedJointLabels(v.Name)
			
			for i_1, v_1 in r15plusUtilsModule.getHrdJointLabels() do
				local var31 = `{v_1.Name}RigAttachment` == name
				local var32 = humanoidRigDescription:GetJoint(v_1)
				
				if var31 and (not var32 or var32.Name ~= name or var32.ClassName ~= "Attachment") then
					p11:fail(errorSourceStringsModule.Keys.HrdMissingStandardJoint, { jointName = v_1.Name })
				end
				if var32 then
					if table.find(nameContainedJointLabels, v_1) then
						if not var31 and (var32.Name ~= v_1.Name or var32.ClassName ~= "Bone") then
							p11:fail(errorSourceStringsModule.Keys.HrdImproperJointMapping, { jointName = v_1.Name, boneName = v_1.Name })
						end
						local var33 = humanoidRigDescription:GetJointSize(v_1)
						local var34 = humanoidRigDescription:GetJointRangeMin(v_1)
						local var35 = humanoidRigDescription:GetJointRangeMax(v_1)
						checkSize(p11, v_1.Name, "size", var33, var9)
						checkVectorRange(p11, v_1.Name, "rangeMin", var34, vector3, vector3_1)
						checkVectorRange(p11, v_1.Name, "rangeMax", var35, vector3, vector3_1)
						
						if not vector3UtilsModule.isFirstLessOrEqual(var34, var35) then
							p11:fail(errorSourceStringsModule.Keys.HrdProperties_MinAboveMax, { jointName = v_1.Name })
						end
					else
						p11:fail(errorSourceStringsModule.Keys.HrdProperties_UncontainedJoint, { jointName = v_1.Name, foundMeshName = v.Name })
					end
				end
			end
			local digitsRigDescription = v:FindFirstChildWhichIsA("DigitsRigDescription")
			
			if digitsRigDescription ~= nil then
				p11:setReportingInstance(digitsRigDescription)
				
				if (v.Name ~= "LeftHand" or digitsRigDescription.Side ~= Enum.DigitsRigDescriptionSide.Left) and (v.Name ~= "RightHand" or digitsRigDescription.Side ~= Enum.DigitsRigDescriptionSide.Right) then
					local var30 = "None"
					
					if v.Name == "LeftHand" then
						var30 = "Left"
					elseif v.Name == "RightHand" then
						var30 = "Right"
					end
					p11:fail(errorSourceStringsModule.Keys.HrdCheck_DrdInvalidSide, {
						partName = v.Name,
						expectedSide = var30,
						foundSide = digitsRigDescription.Side.Name
					})
				end
				checkSize(p11, "Index", "size", digitsRigDescription.IndexSize, var22)
				checkSize(p11, "Thumb", "size", digitsRigDescription.ThumbSize, var22)
				checkSize(p11, "Middle", "size", digitsRigDescription.MiddleSize, var22)
				checkSize(p11, "Pinky", "size", digitsRigDescription.PinkySize, var22)
				checkSize(p11, "Ring", "size", digitsRigDescription.RingSize, var22)
				checkVectorRange(p11, "Index", "range", digitsRigDescription.IndexRange, vector3_4, vector3_5)
				checkVectorRange(p11, "Thumb", "range", digitsRigDescription.ThumbRange, vector3_4, vector3_5)
				checkVectorRange(p11, "Pinky", "range", digitsRigDescription.PinkyRange, vector3_4, vector3_5)
				checkVectorRange(p11, "Ring", "range", digitsRigDescription.RingRange, vector3_4, vector3_5)
				checkVectorRange(p11, "Middle", "range", digitsRigDescription.MiddleRange, vector3_4, vector3_5)
			end
		end
	end
end

return t