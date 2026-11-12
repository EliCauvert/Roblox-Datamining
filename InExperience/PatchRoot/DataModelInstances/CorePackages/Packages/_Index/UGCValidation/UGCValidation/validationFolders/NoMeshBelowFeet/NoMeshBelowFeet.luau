local Parent = script.Parent.Parent.Parent
local ConstantsModule = require(Parent.Constants)
local _ = require(Parent.util.Types)
local ValidationEnumsModule = require(Parent.validationSystem.ValidationEnums)
local ErrorSourceStringsModule = require(Parent.validationSystem.ErrorSourceStrings)
local BoundsCalculatorModule = require(Parent.util.BoundsCalculator)
local GetFFlagUGCValidateNoMeshBelowFeetModule = require(Parent.flags.getFFlagUGCValidateNoMeshBelowFeet)
game:DefineFastString("UGCValidateMaxMeshBelowFeet", "0.1")
local list = {
	ConstantsModule.NAMED_R15_BODY_PARTS.LeftUpperLeg,
	ConstantsModule.NAMED_R15_BODY_PARTS.LeftLowerLeg,
	ConstantsModule.NAMED_R15_BODY_PARTS.LeftFoot,
	ConstantsModule.NAMED_R15_BODY_PARTS.RightUpperLeg,
	ConstantsModule.NAMED_R15_BODY_PARTS.RightLowerLeg,
	ConstantsModule.NAMED_R15_BODY_PARTS.RightFoot
}
local PartNames = {
	ConstantsModule.NAMED_R15_BODY_PARTS.Head,
	ConstantsModule.NAMED_R15_BODY_PARTS.UpperTorso,
	ConstantsModule.NAMED_R15_BODY_PARTS.LowerTorso,
	ConstantsModule.NAMED_R15_BODY_PARTS.LeftUpperArm,
	ConstantsModule.NAMED_R15_BODY_PARTS.LeftLowerArm,
	ConstantsModule.NAMED_R15_BODY_PARTS.LeftHand,
	ConstantsModule.NAMED_R15_BODY_PARTS.RightUpperArm,
	ConstantsModule.NAMED_R15_BODY_PARTS.RightLowerArm,
	ConstantsModule.NAMED_R15_BODY_PARTS.RightHand
}

local function _(p1, p2)
	local v1 = p1[p2]
	local MinMeshCorner = v1 and v1.boundsData.minMeshCorner
	
	return if MinMeshCorner then MinMeshCorner.Y else nil
end

return {
	categories = { ValidationEnumsModule.UploadCategory.FULL_BODY },
	requiredData = {
		ValidationEnumsModule.SharedDataMember.rootInstance,
		ValidationEnumsModule.SharedDataMember.renderMeshesData
	},
	fflag = GetFFlagUGCValidateNoMeshBelowFeetModule,
	expectedFailures = {},
	run = function(p1, p2)
		-- upvalues: BoundsCalculatorModule (copy), list (copy), PartNames (copy), ErrorSourceStringsModule (copy)
		local Parts = {}
		
		for _, Part in p2.rootInstance:GetChildren() do
			if Part:IsA("MeshPart") then
				Parts[Part.Name] = Part
			end
		end
		local IndividualFullBodyPartsDataFromData, _, IndividualFullBodyPartsDataFromData3 = BoundsCalculatorModule.calculateIndividualFullBodyPartsDataFromData(Parts, p2.renderMeshesData)
		
		if not IndividualFullBodyPartsDataFromData then
			p1:fetchError("Failed to calculate full body part bounds")
			
			return
		end
		local v1 = nil
		
		for _, value in list do
			local IndividualFullBodyPartsDataFrom = IndividualFullBodyPartsDataFromData3[value]
			local MinMeshCorner = IndividualFullBodyPartsDataFrom and IndividualFullBodyPartsDataFrom.boundsData.minMeshCorner
			local Y = if MinMeshCorner then MinMeshCorner.Y else nil
			
			if Y and (v1 == nil or Y < v1) then
				v1 = Y
			end
		end
		if v1 == nil then return end
		local Number: number? = tonumber(game:GetFastString("UGCValidateMaxMeshBelowFeet"))
		
		for _, partName in PartNames do
			local IndividualFullBodyPartsDataFrom = IndividualFullBodyPartsDataFromData3[partName]
			local MinMeshCorner = IndividualFullBodyPartsDataFrom and IndividualFullBodyPartsDataFrom.boundsData.minMeshCorner
			local Y = if MinMeshCorner then MinMeshCorner.Y else nil
			
			if Y ~= nil then
				local v2 = v1 - Y
				
				if Number < v2 then
					p1:fail(ErrorSourceStringsModule.Keys.NoMeshBelowFeet_PartBelowFeet, {
						partName = partName,
						distance = string.format("%.2f", v2),
						maxDistance = string.format("%.2f", Number)
					}, Parts[partName])
				end
			end
		end
	end
}