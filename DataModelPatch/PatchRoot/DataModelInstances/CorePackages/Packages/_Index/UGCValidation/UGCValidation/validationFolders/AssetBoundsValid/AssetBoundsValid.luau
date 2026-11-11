local Parent = script.Parent.Parent.Parent
local ConstantsModule = require(Parent.Constants)
local _ = require(Parent.util.Types)
local ValidationEnumsModule = require(Parent.validationSystem.ValidationEnums)
local ErrorSourceStringsModule = require(Parent.validationSystem.ErrorSourceStrings)
local BoundsCalculatorModule = require(Parent.util.BoundsCalculator)

local function _(Object)
	-- upvalues: ConstantsModule (copy)
	local AvatarPartScaleType = Object:FindFirstChild("AvatarPartScaleType")
	
	return if AvatarPartScaleType and ConstantsModule.AvatarPartScaleTypes[AvatarPartScaleType.Value] then AvatarPartScaleType.Value else nil
end

local function getConsistentScaleType(Object, AssetType, p1)
	-- upvalues: ConstantsModule (copy), ErrorSourceStringsModule (copy)
	local ASSETTYPE = ConstantsModule.ASSET_TYPE_INFO[AssetType]
	local v1 = nil
	
	if Enum.AssetType.DynamicHead == AssetType then
		local AvatarPartScaleType = Object:FindFirstChild("AvatarPartScaleType")
		
		return if AvatarPartScaleType and ConstantsModule.AvatarPartScaleTypes[AvatarPartScaleType.Value] then AvatarPartScaleType.Value else nil
	end
	for subPart in pairs(ASSETTYPE.subParts) do
		local Child = Object:FindFirstChild(subPart)
		
		if Child then
			local AvatarPartScaleType = Child:FindFirstChild("AvatarPartScaleType")
			local Value = if AvatarPartScaleType and ConstantsModule.AvatarPartScaleTypes[AvatarPartScaleType.Value] then AvatarPartScaleType.Value else nil
			
			if Value then
				if v1 == nil then
					v1 = Value
				elseif v1 ~= Value then
					p1:fail(ErrorSourceStringsModule.Keys.AssetBounds_InconsistentScaleType, nil, Object)
					
					return nil
				end
			end
		end
	end
	return v1
end

local function validateMinBounds(MinSize, AssetName, p2, p3, RootInstance)
	-- upvalues: ErrorSourceStringsModule (copy)
	local MaxMeshCornerDelta = p2.maxMeshCorner - p2.minMeshCorner
	
	for _, Axis in { "X", "Y", "Z" } do
		local MaxMeshCornerDeltaEntry = MaxMeshCornerDelta[Axis]
		local MinSizeEntry = MinSize[Axis]
		
		if MaxMeshCornerDeltaEntry < MinSizeEntry then
			p3:fail(ErrorSourceStringsModule.Keys.AssetBounds_TooSmall, {
				assetName = AssetName,
				axis = Axis,
				currentSize = string.format("%.2f", MaxMeshCornerDeltaEntry),
				minSize = string.format("%.2f", MinSizeEntry)
			}, RootInstance)
		end
	end
end

local function validateMaxBounds(MaxSize, AssetName, p4, p5, RootInstance)
	-- upvalues: ErrorSourceStringsModule (copy)
	local MaxOverallDelta = p4.maxOverall - p4.minOverall
	
	for _, Axis in { "X", "Y", "Z" } do
		local MaxOverallDeltaEntry = MaxOverallDelta[Axis]
		local MaxSizeEntry = MaxSize[Axis]
		
		if MaxSizeEntry < MaxOverallDeltaEntry then
			p5:fail(ErrorSourceStringsModule.Keys.AssetBounds_TooLarge, {
				assetName = AssetName,
				axis = Axis,
				currentSize = string.format("%.2f", MaxOverallDeltaEntry),
				maxSize = string.format("%.2f", MaxSizeEntry)
			}, RootInstance)
		end
	end
end

local function createAllBodyPartsFromRootInstance(RootInstance)
	local Parts = {}
	
	for _, Part in RootInstance:GetChildren() do
		if Part:IsA("MeshPart") then
			Parts[Part.Name] = Part
		end
	end
	return Parts
end

local function getFullBodyConsistentScaleType(List, p6, RootInstance)
	-- upvalues: ConstantsModule (copy), ErrorSourceStringsModule (copy)
	local v2 = nil
	
	for _, value in List do
		local AvatarPartScaleType = value:FindFirstChild("AvatarPartScaleType")
		
		if AvatarPartScaleType then
			if not ConstantsModule.AvatarPartScaleTypes[AvatarPartScaleType.Value] then
				p6:fail(ErrorSourceStringsModule.Keys.ScaleTypeInvalid, { ParentName = value.Name }, value)
				
				return nil
			end
			local Value = AvatarPartScaleType.Value
			
			if v2 == nil then
				v2 = Value
			elseif v2 ~= Value then
				p6:fail(ErrorSourceStringsModule.Keys.AssetBounds_InconsistentScaleType, nil, RootInstance)
				
				return nil
			end
		end
	end
	return v2
end

return {
	categories = {
		ValidationEnumsModule.UploadCategory.TORSO_AND_LIMBS,
		ValidationEnumsModule.UploadCategory.DYNAMIC_HEAD,
		ValidationEnumsModule.UploadCategory.FULL_BODY
	},
	requiredData = {
		ValidationEnumsModule.SharedDataMember.rootInstance,
		ValidationEnumsModule.SharedDataMember.uploadEnum
	},
	conditionalData = { ValidationEnumsModule.SharedDataMember.renderMeshesData },
	fflag = require(Parent.flags.getFFlagUGCValidateMigrateBodyPartBounds),
	expectedFailures = {},
	run = function(p7, p8)
		-- upvalues: ValidationEnumsModule (copy), createAllBodyPartsFromRootInstance (copy), getFullBodyConsistentScaleType (copy), ConstantsModule (copy), BoundsCalculatorModule (copy), validateMinBounds (copy), validateMaxBounds (copy), getConsistentScaleType (copy)
		local RootInstance = p8.rootInstance
		local RenderMeshesData = p8.renderMeshesData
		
		if p8.uploadCategory ~= ValidationEnumsModule.UploadCategory.FULL_BODY then
			local AssetType = p8.uploadEnum.assetType
			local ConsistentScaleType = getConsistentScaleType(RootInstance, AssetType, p7)
			
			if not ConsistentScaleType then return end
			local ASSETTYPE = ConstantsModule.ASSET_TYPE_INFO[AssetType]
			
			if not ASSETTYPE or not ASSETTYPE.bounds or not ASSETTYPE.bounds[ConsistentScaleType] then return end
			if not RenderMeshesData then return end
			local AssetBoundsFromData, _, AssetBoundsFromData3 = BoundsCalculatorModule.calculateAssetBoundsFromData(RootInstance, AssetType, RenderMeshesData)
			
			if AssetBoundsFromData then
				local Name = AssetType.Name
				validateMinBounds(ASSETTYPE.bounds[ConsistentScaleType].minSize, Name, AssetBoundsFromData3, p7, RootInstance)
				validateMaxBounds(ASSETTYPE.bounds[ConsistentScaleType].maxSize, Name, AssetBoundsFromData3, p7, RootInstance)
				
				return
			else
				p7:fetchError("Failed to calculate asset bounds for " .. AssetType.Name)
				
				return
			end
		elseif not RenderMeshesData then return end
		local AllBodyPartsFromRootInstance = createAllBodyPartsFromRootInstance(RootInstance)
		
		if not next(AllBodyPartsFromRootInstance) then return end
		local FullBodyConsistentScaleType = getFullBodyConsistentScaleType(AllBodyPartsFromRootInstance, p7, RootInstance)
		
		if not FullBodyConsistentScaleType then return end
		local FULLBODYBOUND = ConstantsModule.FULL_BODY_BOUNDS[FullBodyConsistentScaleType]
		
		if not FULLBODYBOUND then return end
		local FullBodyBoundsFromData, _, FullBodyBoundsFromData3 = BoundsCalculatorModule.calculateFullBodyBoundsFromData(AllBodyPartsFromRootInstance, RenderMeshesData)
		
		if FullBodyBoundsFromData then
			validateMinBounds(FULLBODYBOUND.minSize, "Full body", FullBodyBoundsFromData3, p7, RootInstance)
			validateMaxBounds(FULLBODYBOUND.maxSize, "Full body", FullBodyBoundsFromData3, p7, RootInstance)
			
			return
		else
			p7:fetchError("Failed to calculate full body bounds")
		end
	end
}