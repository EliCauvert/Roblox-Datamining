local parent = script.Parent.Parent
local constantsModule = require(parent.Constants)
local _ = require(parent.util.Types)
local boundsCalculatorModule = require(parent.util.BoundsCalculator)
local boundsDataUtilsModule = require(parent.util.BoundsDataUtils)
local parseContentIdsModule = require(parent.util.ParseContentIds)
local getMeshInfoModule = require(parent.util.getMeshInfo)
local getMeshVertsModule = require(parent.util.getMeshVerts)
local t = {}
local t_1 = { MeshPart = { "MeshId" } }
local t_2 = { MeshPart = { MeshId = true } }

local function validateMeshIds(p1, p2)
	-- upvalues: parseContentIdsModule (ref), t_1 (ref), t_2 (ref)
	if parseContentIdsModule.parseWithErrorCheck({}, {}, p1, t_1, t_2, p2) then
		return true
	end
	return false, { p1.Name .. " does not have a MeshId" }
end

local function validateAllMeshParts(p1, p2)
	-- upvalues: constantsModule (ref), validateMeshIds (ref)
	local t, var1
	for i, v in constantsModule.ASSET_TYPE_INFO do
		if v.isBodyPart then
			for i_1, v_1 in pairs(v.subParts) do
				local var2 = p1[i_1]
				
				if var2 and var2.ClassName == "MeshPart" then
					if var2.Name == i_1 then
						local var3, var4 = validateMeshIds(var2, p2)
						
						if var3 then
							t = { [v_1.rigAttachmentToParent.name] = 0 }
							local var5 = 1
							
							for i_2 in v_1.otherAttachments do
								if string.find(i_2, "RigAttachment$") ~= nil then
									t[i_2] = 0
									var5 += 1
								end
							end
							var1 = 0
							
							for i_3, v_2 in var2:GetChildren() do
								if v_2.ClassName == "Attachment" and t[v_2.Name] then
									if t[v_2.Name] ~= 1 then
										t[v_2.Name] += 1
										var1 += 1
										continue
									end
									return false, { i_1 .. " has duplicate rig attachments: " .. v_2.Name }
								end
							end
							if var1 ~= var5 then
								return false, { "Missing rig attachments" }
							end
						end
						return false, var4
					end
					return false, { i_1 .. " input data is incorrectly set-up" }
				end
				return false, { i_1 .. " missing" }
			end
		end
	end
	return true
end

local function _(p3, p4)
	return p3 <= p4
end

local list = { "X", "Y", "Z" }

local function calculateScalingWindow(p3, p4)
	-- upvalues: boundsDataUtilsModule (ref), list (ref)
	local t = {}
	local var6, _, var7 = boundsDataUtilsModule.calculateBoundsDimensions(p3)
	t.meshSize = var6
	t.overallSize = var7
	t.scaleTypes = {}
	
	for i, v in p4 do
		local t_1 = { max = 1e999, min = -1e999 }
		
		for i_1, v_1 in list do
			t_1[v_1] = {
				min = 0.00005 + v.minSize[v_1] / var6[v_1],
				max = v.maxSize[v_1] / var7[v_1] - 0.00005
			}
			t_1[v_1].ok = t_1[v_1].min <= t_1[v_1].max
			t_1.max = math.min(t_1.max, t_1[v_1].max)
			t_1.min = math.max(t_1.min, t_1[v_1].min)
		end
		t_1.ok = t_1.min <= t_1.max
		t.scaleTypes[i] = t_1
	end
	return t
end

local function combineScalingWindows(p5)
	local t = {}
	
	for i, v in p5 do
		for i_1, v_1 in v.scaleTypes do
			t[i_1] = t[i_1] or { max = 1e999, min = -1e999 }
			t[i_1].max = math.min(t[i_1].max, v_1.max)
			t[i_1].min = math.max(t[i_1].min, v_1.min)
		end
	end
	return t
end

local function createFinalResults(p6)
	-- upvalues: list (ref)
	local t = { meshSize = p6.meshSize, overallSize = p6.overallSize }
	
	for i, v in p6.scaleTypes do
		local t_1 = {}
		
		for i_1, v_1 in list do
			t_1[v_1] = v[v_1]
		end
		t_1.ok = v.ok
		t_1.min = v.min
		t_1.max = v.max
		t[i] = t_1
	end
	return t
end

function t.preprocessDataAsync(p7, p8)
	-- upvalues: validateAllMeshParts (ref), constantsModule (ref), getMeshInfoModule (ref), getMeshVertsModule (ref)
	local var8, var9 = validateAllMeshParts(p7, p8)
	
	if not var8 then
		return { ok = false, errors = var9 }
	end
	local t = {}
	
	for i, v in constantsModule.ASSET_TYPE_INFO do
		if v.isBodyPart then
			for i_1 in v.subParts do
				assert(p7[i_1].ClassName == "MeshPart")
				local var10 = p7[i_1]
				local var11 = nil
				local _ = nil
				local _ = nil
				local var12, var13, var14 = getMeshInfoModule(var10, constantsModule.MESH_CONTENT_TYPE.RENDER_MESH, p8)
				local var15 = var14
				
				if var12 then
					var12 = var15
					t[var10.MeshId] = {}
					local meshId = t[var10.MeshId]
					local _ = nil
					local var16, var17, var18 = getMeshVertsModule(var12, p8)
					var11 = var16
					local var19 = var17
					local var20 = var18
					
					if var11 then
						meshId.verts = var20
						continue
					end
					return { ok = false, errors = var19 }
				end
				return { ok = false, errors = var13 }
			end
		end
	end
	return { ok = true, cache = { meshData = t } }
end

function t.isPreprocessDataCached(p9, p10)
	-- upvalues: constantsModule (ref)
	local meshData = p10.meshData
	
	for i, v in constantsModule.ASSET_TYPE_INFO do
		if v.isBodyPart then
			for i_1 in pairs(v.subParts) do
				local var21 = p9[i_1]
				
				if var21 and var21.ClassName == "MeshPart" and var21.MeshId ~= "" then
					if meshData then
						local meshId = meshData[var21.MeshId]
						
						if meshId then
							if not meshId.verts then
								return false
							end
						end
						return false
					end
					return false
				end
			end
		end
	end
	return true
end

function t.calculateScaleToValidateBoundsAsync(p11, p12, p13)
	-- upvalues: validateAllMeshParts (ref), boundsCalculatorModule (ref), boundsDataUtilsModule (ref), calculateScalingWindow (ref), constantsModule (ref), combineScalingWindows (ref), createFinalResults (ref)
	local var22, var23 = validateAllMeshParts(p11, p12)
	
	if not var22 then
		return { ok = false, errors = var23 }
	end
	local var24, var25, var26 = boundsCalculatorModule.calculateIndividualFullBodyPartsData(p11, p12, p13, true)
	
	if not var24 then
		return {
			ok = false,
			errors = var25 or { "Errors calculating parts metrics" }
		}
	end
	local t = {}
	
	for i, v in var26 do
		t = boundsDataUtilsModule.combineBounds(t, v.boundsData)
	end
	local t_1 = {
		FullBody = calculateScalingWindow(t, constantsModule.FULL_BODY_BOUNDS)
	}
	
	for i_1, v_1 in constantsModule.ASSET_TYPE_INFO do
		if v_1.isBodyPart then
			local t_2 = {}
			
			for i_2 in v_1.subParts do
				t_2 = boundsDataUtilsModule.combineBounds(t_2, var26[i_2].boundsData)
			end
			t_1[i_1.Name] = calculateScalingWindow(t_2, constantsModule.ASSET_TYPE_INFO[i_1].bounds)
		end
	end
	local var27 = nil
	local var28 = nil
	
	for i_2, v_2 in combineScalingWindows(t_1) do
		if v_2.min <= v_2.max then
			if v_2.min <= 1 and v_2.max >= 1 then
				var27 = 1
				var28 = i_2
				break
			end
			local var29 = if math.abs(1 - v_2.min) < math.abs(1 - v_2.max) then v_2.min else v_2.max
			
			if not var27 or math.abs(1 - var29) < math.abs(1 - var27) then
				var27 = var29
				var28 = i_2
			end
		end
	end
	local t_2 = {
		ok = true,
		Overall = { ok = var27 ~= nil, scale = var27, scaleType = var28 }
	}
	
	for v_2, v_3 in t_1 do
		t_2[v_2] = createFinalResults(v_3)
	end
	return t_2
end

return t