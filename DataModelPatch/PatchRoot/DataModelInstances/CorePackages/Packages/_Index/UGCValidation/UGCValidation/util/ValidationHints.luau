local Parent = script.Parent.Parent
local ConstantsModule = require(Parent.Constants)
local _ = require(Parent.util.Types)
local BoundsCalculatorModule = require(Parent.util.BoundsCalculator)
local BoundsDataUtilsModule = require(Parent.util.BoundsDataUtils)
local ParseContentIdsModule = require(Parent.util.ParseContentIds)
local GetMeshInfoModule = require(Parent.util.getMeshInfo)
local GetMeshVertsModule = require(Parent.util.getMeshVerts)
local config = { MeshPart = { "MeshId" } }
local config1 = { MeshPart = { MeshId = true } }

local function validateMeshIds(Part, p1)
	-- upvalues: ParseContentIdsModule (copy), config (copy), config1 (copy)
	if ParseContentIdsModule.parseWithErrorCheck({}, {}, Part, config, config1, p1) then
		return true
	else
		return false, { Part.Name .. " does not have a MeshId" }
	end
end

local function validateAllMeshParts(p1, p2)
	-- upvalues: ConstantsModule (copy), validateMeshIds (copy)
	local ValidateMeshIdsResult2 = nil
	for _, value in ConstantsModule.ASSET_TYPE_INFO do
		if value.isBodyPart then
			for i, subPart in pairs(value.subParts) do
				local Part = p1[i]
				
				if not Part or Part.ClassName ~= "MeshPart" then
					return false, { i .. " missing" }
				end
				if Part.Name ~= i then
					return false, { i .. " input data is incorrectly set-up" }
				end
				local ValidateMeshIdsResult
				ValidateMeshIdsResult, ValidateMeshIdsResult2 = validateMeshIds(Part, p2)
				
				if not ValidateMeshIdsResult then
					return false, ValidateMeshIdsResult2
				end
				local config = { [subPart.rigAttachmentToParent.name] = 0 }
				local Count = 1
				
				for otherAttachment in subPart.otherAttachments do
					if string.find(otherAttachment, "RigAttachment$") ~= nil then
						config[otherAttachment] = 0
						Count += 1
					end
				end
				local Count1 = 0
				
				for _, Attachment in Part:GetChildren() do
					if Attachment.ClassName == "Attachment" and config[Attachment.Name] then
						if config[Attachment.Name] == 1 then
							return false, {
								i .. " has duplicate rig attachments: " .. Attachment.Name
							}
						end
						config[Attachment.Name] += 1
						Count1 += 1
					end
				end
				if Count1 ~= Count then
					return false, { "Missing rig attachments" }
				end
			end
		end
	end
	return true
end

local function _(p3, p4): boolean
	return p3 <= p4
end

local list = { "X", "Y", "Z" }

local function calculateScalingWindow(CombineBoundsResult, Bounds)
	-- upvalues: BoundsDataUtilsModule (copy), list (copy)
	local BoundsDimensions, _, BoundsDimensions3 = BoundsDataUtilsModule.calculateBoundsDimensions(CombineBoundsResult)
	local config = {
		meshSize = BoundsDimensions,
		overallSize = BoundsDimensions3,
		scaleTypes = {}
	}
	
	for i, bound in Bounds do
		local config1 = { max = 1e999, min = -1e999 }
		
		for _, value in list do
			config1[value] = {
				min = 0.00005 + bound.minSize[value] / BoundsDimensions[value],
				max = bound.maxSize[value] / BoundsDimensions3[value] - 0.00005
			}
			config1[value].ok = config1[value].min <= config1[value].max
			config1.max = math.min(config1.max, config1[value].max)
			config1.min = math.max(config1.min, config1[value].min)
		end
		config1.ok = config1.min <= config1.max
		config.scaleTypes[i] = config1
	end
	return config
end

local function combineScalingWindows(List)
	local t = {}
	
	for _, value in List do
		for i, scaleType in value.scaleTypes do
			t[i] = t[i] or { max = 1e999, min = -1e999 }
			t[i].max = math.min(t[i].max, scaleType.max)
			t[i].min = math.max(t[i].min, scaleType.min)
		end
	end
	return t
end

local function createFinalResults(p3)
	-- upvalues: list (copy)
	local config = { meshSize = p3.meshSize, overallSize = p3.overallSize }
	
	for i, scaleType in p3.scaleTypes do
		local t = {}
		
		for _, value in list do
			t[value] = scaleType[value]
		end
		t.ok = scaleType.ok
		t.min = scaleType.min
		t.max = scaleType.max
		config[i] = t
	end
	return config
end

return {
	preprocessDataAsync = function(p4, p5)
		-- upvalues: validateAllMeshParts (copy), ConstantsModule (copy), GetMeshInfoModule (copy), GetMeshVertsModule (copy)
		local ValidateAllMeshPartsResult, ValidateAllMeshPartsResult2 = validateAllMeshParts(p4, p5)
		
		if not ValidateAllMeshPartsResult then
			return { ok = false, errors = ValidateAllMeshPartsResult2 }
		end
		local MeshData = {}
		local MeshVertsModule2 = nil
		local MeshInfoModule2 = nil
		
		for _, value in ConstantsModule.ASSET_TYPE_INFO do
			if value.isBodyPart then
				for subPart in value.subParts do
					assert(p4[subPart].ClassName == "MeshPart")
					local v1 = p4[subPart]
					local MeshInfoModule, MeshInfoModule3
					MeshInfoModule, MeshInfoModule2, MeshInfoModule3 = GetMeshInfoModule(v1, ConstantsModule.MESH_CONTENT_TYPE.RENDER_MESH, p5)
					
					if not MeshInfoModule then
						return { ok = false, errors = MeshInfoModule2 }
					end
					MeshData[v1.MeshId] = {}
					local Mesh = MeshData[v1.MeshId]
					local MeshVertsModule, MeshVertsModule3
					MeshVertsModule, MeshVertsModule2, MeshVertsModule3 = GetMeshVertsModule(MeshInfoModule3, p5)
					
					if not MeshVertsModule then
						return { ok = false, errors = MeshVertsModule2 }
					end
					Mesh.verts = MeshVertsModule3
				end
			end
		end
		return { ok = true, cache = { meshData = MeshData } }
	end,
	isPreprocessDataCached = function(p6, p7): boolean
		-- upvalues: ConstantsModule (copy)
		local MeshData = p7.meshData
		
		for _, value in ConstantsModule.ASSET_TYPE_INFO do
			if value.isBodyPart then
				for subPart in pairs(value.subParts) do
					local Part = p6[subPart]
					
					if Part and Part.ClassName == "MeshPart" and Part.MeshId ~= "" then
						if not MeshData then
							return false
						end
						local Mesh = MeshData[Part.MeshId]
						
						if not Mesh then
							return false
						elseif not Mesh.verts then
							return false
						end
						continue
					end
				end
			end
		end
		return true
	end,
	calculateScaleToValidateBoundsAsync = function(p8, p9, p10)
		-- upvalues: validateAllMeshParts (copy), BoundsCalculatorModule (copy), BoundsDataUtilsModule (copy), calculateScalingWindow (copy), ConstantsModule (copy), combineScalingWindows (copy), createFinalResults (copy)
		local ValidateAllMeshPartsResult, ValidateAllMeshPartsResult2 = validateAllMeshParts(p8, p9)
		
		if not ValidateAllMeshPartsResult then
			return { ok = false, errors = ValidateAllMeshPartsResult2 }
		end
		local IndividualFullBodyPartsData, IndividualFullBodyPartsData2, IndividualFullBodyPartsData3 = BoundsCalculatorModule.calculateIndividualFullBodyPartsData(p8, p9, p10, true)
		
		if not IndividualFullBodyPartsData then
			return {
				ok = false,
				errors = IndividualFullBodyPartsData2 or { "Errors calculating parts metrics" }
			}
		end
		local CombineBoundsResult = {}
		
		for _, value in IndividualFullBodyPartsData3 do
			CombineBoundsResult = BoundsDataUtilsModule.combineBounds(CombineBoundsResult, value.boundsData)
		end
		local config = {
			FullBody = calculateScalingWindow(CombineBoundsResult, ConstantsModule.FULL_BODY_BOUNDS)
		}
		
		for i, value1 in ConstantsModule.ASSET_TYPE_INFO do
			if value1.isBodyPart then
				local CombineBoundsResult1 = {}
				
				for subPart in value1.subParts do
					CombineBoundsResult1 = BoundsDataUtilsModule.combineBounds(CombineBoundsResult1, IndividualFullBodyPartsData3[subPart].boundsData)
				end
				config[i.Name] = calculateScalingWindow(CombineBoundsResult1, ConstantsModule.ASSET_TYPE_INFO[i].bounds)
			end
		end
		local Scale: number? = nil
		local ScaleType = nil
		
		for i1, value2 in combineScalingWindows(config) do
			if value2.min <= value2.max then
				if value2.min <= 1 and value2.max >= 1 then
					Scale = 1
					ScaleType = i1
					break
				else
					local Min = if math.abs(1 - value2.min) < math.abs(1 - value2.max) then value2.min else value2.max
					
					if not Scale or math.abs(1 - Min) < math.abs(1 - Scale) then
						Scale = Min
						ScaleType = i1
						continue
					end
				end
			end
		end
		local config1 = {
			ok = true,
			Overall = { ok = Scale ~= nil, scale = Scale, scaleType = ScaleType }
		}
		
		for i2, value3 in config do
			config1[i2] = createFinalResults(value3)
		end
		return config1
	end
}