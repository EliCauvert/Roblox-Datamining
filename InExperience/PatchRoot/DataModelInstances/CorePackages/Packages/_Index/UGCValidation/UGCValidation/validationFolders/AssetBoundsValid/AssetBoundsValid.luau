local parent = script.Parent.Parent.Parent
local constantsModule = require(parent.Constants)
local _ = require(parent.util.Types)
local validationEnumsModule = require(parent.validationSystem.ValidationEnums)
local errorSourceStringsModule = require(parent.validationSystem.ErrorSourceStrings)
local boundsCalculatorModule = require(parent.util.BoundsCalculator)
local t = {
	categories = {
		validationEnumsModule.UploadCategory.TORSO_AND_LIMBS,
		validationEnumsModule.UploadCategory.DYNAMIC_HEAD,
		validationEnumsModule.UploadCategory.FULL_BODY
	},
	requiredData = {
		validationEnumsModule.SharedDataMember.rootInstance,
		validationEnumsModule.SharedDataMember.uploadEnum
	},
	conditionalData = { validationEnumsModule.SharedDataMember.renderMeshesData },
	fflag = require(parent.flags.getFFlagUGCValidateMigrateBodyPartBounds),
	expectedFailures = {}
}

local function _(a)
	-- upvalues: constantsModule (ref)
	local avatarPartScaleType = a:FindFirstChild("AvatarPartScaleType")
	
	return if avatarPartScaleType and constantsModule.AvatarPartScaleTypes[avatarPartScaleType.Value] then avatarPartScaleType.Value else nil
end

local function getConsistentScaleType(p1, p2, p3)
	-- upvalues: constantsModule (ref), errorSourceStringsModule (ref)
	local var1 = constantsModule.ASSET_TYPE_INFO[p2]
	local var2 = nil
	
	if Enum.AssetType.DynamicHead == p2 then
		local avatarPartScaleType = p1:FindFirstChild("AvatarPartScaleType")
		
		return if avatarPartScaleType and constantsModule.AvatarPartScaleTypes[avatarPartScaleType.Value] then avatarPartScaleType.Value else nil
	end
	for i in pairs(var1.subParts) do
		local var3 = p1:FindFirstChild(i)
		
		if var3 then
			local avatarPartScaleType = var3:FindFirstChild("AvatarPartScaleType")
			local var4 = if avatarPartScaleType and constantsModule.AvatarPartScaleTypes[avatarPartScaleType.Value] then avatarPartScaleType.Value else nil
			
			if var4 then
				if var2 == nil then
					var2 = var4
				elseif var2 ~= var4 then
					p3:fail(errorSourceStringsModule.Keys.AssetBounds_InconsistentScaleType, nil, p1)
					
					return nil
				end
			end
		end
	end
	return var2
end

local function validateMinBounds(a, b, p4, p5, p6)
	-- upvalues: errorSourceStringsModule (ref)
	local var5 = p4.maxMeshCorner - p4.minMeshCorner
	
	for i, v in { "X", "Y", "Z" } do
		local var6 = var5[v]
		local var7 = a[v]
		
		if var6 < var7 then
			p5:fail(errorSourceStringsModule.Keys.AssetBounds_TooSmall, {
				assetName = b,
				axis = v,
				currentSize = string.format("%.2f", var6),
				minSize = string.format("%.2f", var7)
			}, p6)
		end
	end
end

local function validateMaxBounds(a, b, p7, p8, p9)
	-- upvalues: errorSourceStringsModule (ref)
	local var8 = p7.maxOverall - p7.minOverall
	
	for i, v in { "X", "Y", "Z" } do
		local var9 = var8[v]
		local var10 = a[v]
		
		if var10 < var9 then
			p8:fail(errorSourceStringsModule.Keys.AssetBounds_TooLarge, {
				assetName = b,
				axis = v,
				currentSize = string.format("%.2f", var9),
				maxSize = string.format("%.2f", var10)
			}, p9)
		end
	end
end

local function createAllBodyPartsFromRootInstance(p10)
	local t = {}
	
	for i, v in p10:GetChildren() do
		if v:IsA("MeshPart") then
			t[v.Name] = v
		end
	end
	return t
end

local function getFullBodyConsistentScaleType(p11, p12, p13)
	-- upvalues: constantsModule (ref), errorSourceStringsModule (ref)
	local var11 = nil
	
	for i, v in p11 do
		local avatarPartScaleType = v:FindFirstChild("AvatarPartScaleType")
		
		if avatarPartScaleType then
			if constantsModule.AvatarPartScaleTypes[avatarPartScaleType.Value] then
				local value = avatarPartScaleType.Value
				
				if var11 == nil then
					var11 = value
				elseif var11 ~= value then
					p12:fail(errorSourceStringsModule.Keys.AssetBounds_InconsistentScaleType, nil, p13)
					
					return nil
				end
			end
			p12:fail(errorSourceStringsModule.Keys.ScaleTypeInvalid, { ParentName = v.Name }, v)
			
			return nil
		end
	end
	return var11
end

function t.run(p14, p15)
	-- upvalues: validationEnumsModule (ref), createAllBodyPartsFromRootInstance (ref), getFullBodyConsistentScaleType (ref), constantsModule (ref), boundsCalculatorModule (ref), validateMinBounds (ref), validateMaxBounds (ref), getConsistentScaleType (ref)
	local var12
	local rootInstance = p15.rootInstance
	local renderMeshesData = p15.renderMeshesData
	
	if p15.uploadCategory == validationEnumsModule.UploadCategory.FULL_BODY then
		if not renderMeshesData then return end
		local var13 = createAllBodyPartsFromRootInstance(rootInstance)
		
		if not next(var13) then return end
		local var14 = getFullBodyConsistentScaleType(var13, p14, rootInstance)
		
		if not var14 then return end
		local var15 = constantsModule.FULL_BODY_BOUNDS[var14]
		
		if not var15 then return end
		var29, var12, var31 = boundsCalculatorModule.calculateFullBodyBoundsFromData(var13, renderMeshesData)
		
		if var29 then
			validateMinBounds(var15.minSize, "Full body", var31, p14, rootInstance)
			validateMaxBounds(var15.maxSize, "Full body", var31, p14, rootInstance)
			
			return
		end
		p14:fetchError("Failed to calculate full body bounds")
		
		return
	else
		local assetType = p15.uploadEnum.assetType
		local var16 = getConsistentScaleType(rootInstance, assetType, p14)
		
		if not var16 then return end
		local var17 = constantsModule.ASSET_TYPE_INFO[assetType]
		
		if not var17 or not var17.bounds or not var17.bounds[var16] then return end
		if not renderMeshesData then return end
		var34, var12, var35 = boundsCalculatorModule.calculateAssetBoundsFromData(rootInstance, assetType, renderMeshesData)
		
		if var34 then
			local name = assetType.Name
			validateMinBounds(var17.bounds[var16].minSize, name, var35, p14, rootInstance)
			validateMaxBounds(var17.bounds[var16].maxSize, name, var35, p14, rootInstance)
			
			return
		end
		p14:fetchError("Failed to calculate asset bounds for " .. assetType.Name)
	end
end

return t