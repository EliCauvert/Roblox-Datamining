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

local function validateBasedOnBBoxes(p1, p2, p3, p4, p5)
	-- upvalues: errorSourceStringsModule (ref)
	local boundsData = p3[p1.Name].boundsData
	local boundsData_1 = p3[p2.Name].boundsData
	local var1 = true
	
	if boundsData_1.maxOverall and boundsData.maxOverall and boundsData.maxOverall.Y < boundsData_1.maxOverall.Y then
		p5:fail(errorSourceStringsModule.Keys.Extents_PartAboveParent, {
			lowerPart = p2.Name,
			upperPart = p1.Name,
			attachmentName = p4
		}, p2)
		var1 = false
	end
	if boundsData.minOverall and boundsData_1.minOverall and boundsData.minOverall.Y < boundsData_1.minOverall.Y then
		p5:fail(errorSourceStringsModule.Keys.Extents_ParentBelowPart, {
			upperPart = p1.Name,
			lowerPart = p2.Name,
			attachmentName = p4
		}, p1)
		var1 = false
	end
	return var1
end

local function validateBasedOnAttachmentYPos(p1, p2, p3, p4)
	-- upvalues: r15plusUtilsModule (ref), getAttachmentCFrameInPartSpaceModule (ref), errorSourceStringsModule (ref)
	local var1 = p2:FindFirstChild(p3, r15plusUtilsModule.checkFlagEnabledForAllowHrd())
	local var2 = p1:FindFirstChild(p3, r15plusUtilsModule.checkFlagEnabledForAllowHrd())
	
	if not var1 or not var2 then return end
	local size = p2.Size
	local size_1 = p1.Size
	local position = getAttachmentCFrameInPartSpaceModule(var1).Position
	local position_1 = getAttachmentCFrameInPartSpaceModule(var2).Position
	local y = (size / 2 - position).Y
	local y_1 = (size / 2 + position).Y
	local y_2 = (size_1 / 2 + position_1).Y
	
	if (size_1 / 2 - position_1).Y < y then
		p4:fail(errorSourceStringsModule.Keys.Extents_PartAboveParent, {
			lowerPart = p2.Name,
			upperPart = p1.Name,
			attachmentName = p3
		}, p2)
	end
	if y_1 < y_2 then
		p4:fail(errorSourceStringsModule.Keys.Extents_ParentBelowPart, {
			upperPart = p1.Name,
			lowerPart = p2.Name,
			attachmentName = p3
		}, p1)
	end
end

function t.run(p1, p2)
	-- upvalues: t_1 (ref), constantsModule (ref), boundsCalculatorModule (ref), t_2 (ref), validateBasedOnBBoxes (ref), t_3 (ref), validateBasedOnAttachmentYPos (ref)
	local rootInstance = p2.rootInstance
	local assetType = p2.uploadEnum.assetType
	
	if not t_1[assetType] then return end
	local var1 = constantsModule.ASSET_TYPE_INFO[assetType]
	
	if not var1 then return end
	local renderMeshesData = p2.renderMeshesData
	
	if not renderMeshesData then return end
	local var2, _, var3 = boundsCalculatorModule.calculateIndividualAssetPartsDataFromData(rootInstance, assetType, renderMeshesData)
	
	if not var2 then
		p1:fetchError("Failed to calculate asset bounds data for extents check on " .. assetType.Name)
		
		return
	end
	for i, v in pairs(var1.subParts) do
		local var4 = constantsModule.BODYPART_TO_PARENT[i]
		
		if var4 ~= nil then
			local var5 = rootInstance:FindFirstChild(i)
			local var6 = rootInstance:FindFirstChild(var4)
			
			if var5 and var6 then
				local var7 = var6
				local var8 = var5
				
				if t_2[i] then
					var7 = var5
					var8 = var6
				end
				local name = v.rigAttachmentToParent.name
				
				if (if var3[var7.Name] and var3[var8.Name] then validateBasedOnBBoxes(var7, var8, var3, name, p1) else true) and t_3[assetType] then
					validateBasedOnAttachmentYPos(var7, var8, name, p1)
				end
			end
		end
	end
end

return t