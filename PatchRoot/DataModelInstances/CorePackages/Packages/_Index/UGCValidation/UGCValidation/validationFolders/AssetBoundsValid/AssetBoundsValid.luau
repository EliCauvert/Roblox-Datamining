-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:32:45 2026 Pacific Standard Time.

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

local function _(a) --[[ line: 28 | named "getScaleTypeFromInstance" ]]
	-- upvalues: constantsModule (ref)
	local avatarPartScaleType = a:FindFirstChild("AvatarPartScaleType")
	
	return if avatarPartScaleType and constantsModule.AvatarPartScaleTypes[avatarPartScaleType.Value] then avatarPartScaleType.Value else nil
end

local function getConsistentScaleType(p0, p1, p2) --[[ line: 36 ]]
	-- upvalues: constantsModule (ref), errorSourceStringsModule (ref)
	local var11 = constantsModule.ASSET_TYPE_INFO[p1]
	local var12 = nil
	
	if Enum.AssetType.DynamicHead == p1 then
		local avatarPartScaleType = p0:FindFirstChild("AvatarPartScaleType")
		
		return if avatarPartScaleType and constantsModule.AvatarPartScaleTypes[avatarPartScaleType.Value] then avatarPartScaleType.Value else nil
	end
	for i in pairs(var11.subParts) do
		local var14 = p0:FindFirstChild(i)
		
		if var14 then
			local avatarPartScaleType = var14:FindFirstChild("AvatarPartScaleType")
			local var16 = if avatarPartScaleType and constantsModule.AvatarPartScaleTypes[avatarPartScaleType.Value] then avatarPartScaleType.Value else nil
			
			if var16 then
				if var12 == nil then
					var12 = var16
				elseif var12 ~= var16 then
					p2:fail(errorSourceStringsModule.Keys.AssetBounds_InconsistentScaleType, nil, p0)
					
					return nil
				end
			end
		end
	end
	return var12
end

local function validateMinBounds(a, b, p3, p4, p5) --[[ line: 67 ]]
	-- upvalues: errorSourceStringsModule (ref)
	local var17 = p3.maxMeshCorner - p3.minMeshCorner
	
	for i, v in { "X", "Y", "Z" } do
		local var18 = var17[v]
		local var19 = a[v]
		
		if var18 < var19 then
			p4:fail(errorSourceStringsModule.Keys.AssetBounds_TooSmall, {
				assetName = b,
				axis = v,
				currentSize = string.format("%.2f", var18),
				minSize = string.format("%.2f", var19)
			}, p5)
		end
	end
end

local function validateMaxBounds(a, b, p6, p7, p8) --[[ line: 89 ]]
	-- upvalues: errorSourceStringsModule (ref)
	local var20 = p6.maxOverall - p6.minOverall
	
	for i, v in { "X", "Y", "Z" } do
		local var21 = var20[v]
		local var22 = a[v]
		
		if var22 < var21 then
			p7:fail(errorSourceStringsModule.Keys.AssetBounds_TooLarge, {
				assetName = b,
				axis = v,
				currentSize = string.format("%.2f", var21),
				maxSize = string.format("%.2f", var22)
			}, p8)
		end
	end
end

local function createAllBodyPartsFromRootInstance(p9) --[[ line: 111 ]]
	local t = {}
	
	for i, v in p9:GetChildren() do
		if v:IsA("MeshPart") then
			t[v.Name] = v
		end
	end
	return t
end

local function getFullBodyConsistentScaleType(p10, p11, p12) --[[ line: 121 ]]
	-- upvalues: constantsModule (ref), errorSourceStringsModule (ref)
	local var24 = nil
	
	for i, v in p10 do
		local avatarPartScaleType = v:FindFirstChild("AvatarPartScaleType")
		
		if avatarPartScaleType then
			if constantsModule.AvatarPartScaleTypes[avatarPartScaleType.Value] then
				local value = avatarPartScaleType.Value
				
				if var24 == nil then
					var24 = value
				elseif var24 ~= value then
					p11:fail(errorSourceStringsModule.Keys.AssetBounds_InconsistentScaleType, nil, p12)
					
					return nil
				end
			end
			p11:fail(errorSourceStringsModule.Keys.ScaleTypeInvalid, { ParentName = v.Name }, v)
			
			return nil
		end
	end
	return var24
end

function t.run(p13, p14) --[[ line: 149 ]]
	-- upvalues: validationEnumsModule (ref), createAllBodyPartsFromRootInstance (ref), getFullBodyConsistentScaleType (ref), constantsModule (ref), boundsCalculatorModule (ref), validateMinBounds (ref), validateMaxBounds (ref), getConsistentScaleType (ref)
	local var30
	local rootInstance = p14.rootInstance
	local renderMeshesData = p14.renderMeshesData
	
	if p14.uploadCategory == validationEnumsModule.UploadCategory.FULL_BODY then
		if not renderMeshesData then return end
		local var26 = createAllBodyPartsFromRootInstance(rootInstance)
		
		if not next(var26) then return end
		local var27 = getFullBodyConsistentScaleType(var26, p13, rootInstance)
		
		if not var27 then return end
		local var28 = constantsModule.FULL_BODY_BOUNDS[var27]
		
		if not var28 then return end
		var29, var30, var31 = boundsCalculatorModule.calculateFullBodyBoundsFromData(var26, renderMeshesData)
		
		if var29 then
			validateMinBounds(var28.minSize, "Full body", var31, p13, rootInstance)
			validateMaxBounds(var28.maxSize, "Full body", var31, p13, rootInstance)
			
			return
		end
		p13:fetchError("Failed to calculate full body bounds")
		
		return
	else
		local assetType = p14.uploadEnum.assetType
		local var32 = getConsistentScaleType(rootInstance, assetType, p13)
		
		if not var32 then return end
		local var33 = constantsModule.ASSET_TYPE_INFO[assetType]
		
		if not var33 or not var33.bounds or not var33.bounds[var32] then return end
		if not renderMeshesData then return end
		var34, var30, var35 = boundsCalculatorModule.calculateAssetBoundsFromData(rootInstance, assetType, renderMeshesData)
		
		if var34 then
			local name = assetType.Name
			validateMinBounds(var33.bounds[var32].minSize, name, var35, p13, rootInstance)
			validateMaxBounds(var33.bounds[var32].maxSize, name, var35, p13, rootInstance)
			
			return
		end
		p13:fetchError("Failed to calculate asset bounds for " .. assetType.Name)
	end
end

return t