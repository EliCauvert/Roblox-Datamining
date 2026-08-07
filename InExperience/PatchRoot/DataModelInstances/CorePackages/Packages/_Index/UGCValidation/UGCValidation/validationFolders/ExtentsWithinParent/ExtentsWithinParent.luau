local parent = script.Parent.Parent.Parent
local constantsModule = require(parent.Constants)
local _ = require(parent.util.Types)
local validationEnumsModule = require(parent.validationSystem.ValidationEnums)
local errorSourceStringsModule = require(parent.validationSystem.ErrorSourceStrings)
local boundsCalculatorModule = require(parent.util.BoundsCalculator)
local r15plusUtilsModule = require(parent.util.R15plusUtils)
local getAttachmentCFrameInPartSpaceModule = require(parent.util.getAttachmentCFrameInPartSpace)
local t = {
	categories = { validationEnumsModule.UploadCategory.TORSO_AND_LIMBS },
	requiredData = {
		validationEnumsModule.SharedDataMember.rootInstance,
		validationEnumsModule.SharedDataMember.uploadEnum
	},
	conditionalData = { validationEnumsModule.SharedDataMember.renderMeshesData },
	fflag = require(parent.flags.getFFlagUGCValidateMigrateBodyPartBounds),
	expectedFailures = {}
}
local t_1 = {
	[Enum.AssetType.Torso] = true,
	[Enum.AssetType.LeftArm] = true,
	[Enum.AssetType.RightArm] = true,
	[Enum.AssetType.RightLeg] = true,
	[Enum.AssetType.LeftLeg] = true
}
local t_2 = { UpperTorso = true }
local t_3 = {
	[Enum.AssetType.LeftLeg] = true,
	[Enum.AssetType.RightLeg] = true
}

local function validateBasedOnBBoxes(p0, p1, p2, p3, p4) --[[ line: 45 ]]
	-- upvalues: errorSourceStringsModule (ref)
	local boundsData = p2[p0.Name].boundsData
	local boundsData_1 = p2[p1.Name].boundsData
	local var12 = true
	
	if boundsData_1.maxOverall and boundsData.maxOverall and boundsData.maxOverall.Y < boundsData_1.maxOverall.Y then
		p4:fail(errorSourceStringsModule.Keys.Extents_PartAboveParent, {
			lowerPart = p1.Name,
			upperPart = p0.Name,
			attachmentName = p3
		}, p1)
		var12 = false
	end
	if boundsData.minOverall and boundsData_1.minOverall and boundsData.minOverall.Y < boundsData_1.minOverall.Y then
		p4:fail(errorSourceStringsModule.Keys.Extents_ParentBelowPart, {
			upperPart = p0.Name,
			lowerPart = p1.Name,
			attachmentName = p3
		}, p0)
		var12 = false
	end
	return var12
end

local function validateBasedOnAttachmentYPos(p5, p6, p7, p8) --[[ line: 77 ]]
	-- upvalues: r15plusUtilsModule (ref), getAttachmentCFrameInPartSpaceModule (ref), errorSourceStringsModule (ref)
	local var13 = p6:FindFirstChild(p7, r15plusUtilsModule.checkFlagEnabledForAllowHrd())
	local var14 = p5:FindFirstChild(p7, r15plusUtilsModule.checkFlagEnabledForAllowHrd())
	
	if not var13 or not var14 then return end
	local size = p6.Size
	local size_1 = p5.Size
	local position = getAttachmentCFrameInPartSpaceModule(var13).Position
	local position_1 = getAttachmentCFrameInPartSpaceModule(var14).Position
	local y = (size / 2 - position).Y
	local y_1 = (size / 2 + position).Y
	local y_2 = (size_1 / 2 + position_1).Y
	
	if (size_1 / 2 - position_1).Y < y then
		p8:fail(errorSourceStringsModule.Keys.Extents_PartAboveParent, {
			lowerPart = p6.Name,
			upperPart = p5.Name,
			attachmentName = p7
		}, p6)
	end
	if y_1 < y_2 then
		p8:fail(errorSourceStringsModule.Keys.Extents_ParentBelowPart, {
			upperPart = p5.Name,
			lowerPart = p6.Name,
			attachmentName = p7
		}, p5)
	end
end

function t.run(p9, p10) --[[ line: 117 ]]
	-- upvalues: t_1 (ref), constantsModule (ref), boundsCalculatorModule (ref), t_2 (ref), validateBasedOnBBoxes (ref), t_3 (ref), validateBasedOnAttachmentYPos (ref)
	local rootInstance = p10.rootInstance
	local assetType = p10.uploadEnum.assetType
	
	if not t_1[assetType] then return end
	local var15 = constantsModule.ASSET_TYPE_INFO[assetType]
	
	if not var15 then return end
	local renderMeshesData = p10.renderMeshesData
	
	if not renderMeshesData then return end
	local var16, _, var17 = boundsCalculatorModule.calculateIndividualAssetPartsDataFromData(rootInstance, assetType, renderMeshesData)
	
	if not var16 then
		p9:fetchError("Failed to calculate asset bounds data for extents check on " .. assetType.Name)
		
		return
	end
	for i, v in pairs(var15.subParts) do
		local var18 = constantsModule.BODYPART_TO_PARENT[i]
		
		if var18 ~= nil then
			local var19 = rootInstance:FindFirstChild(i)
			local var20 = rootInstance:FindFirstChild(var18)
			
			if var19 and var20 then
				local var21 = var20
				local var22 = var19
				
				if t_2[i] then
					var21 = var19
					var22 = var20
				end
				local name = v.rigAttachmentToParent.name
				
				if (if var17[var21.Name] and var17[var22.Name] then validateBasedOnBBoxes(var21, var22, var17, name, p9) else true) and t_3[assetType] then
					validateBasedOnAttachmentYPos(var21, var22, name, p9)
				end
			end
		end
	end
end

return t