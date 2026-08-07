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

local function validateMeshIds(p0, p1) --[[ line: 34 ]]
	-- upvalues: parseContentIdsModule (ref), t_1 (ref), t_2 (ref)
	if parseContentIdsModule.parseWithErrorCheck({}, {}, p0, t_1, t_2, p1) then
		return true
	end
	return false, { p0.Name .. " does not have a MeshId" }
end

local function validateAllMeshParts(p2, p3) --[[ line: 52 ]]
	-- upvalues: constantsModule (ref), validateMeshIds (ref)
	local t, var20
	for i, v in constantsModule.ASSET_TYPE_INFO do
		if v.isBodyPart then
			for i_1, v_1 in pairs(v.subParts) do
				local var15 = p2[i_1]
				
				if var15 and var15.ClassName == "MeshPart" then
					if var15.Name == i_1 then
						local var16, var17 = validateMeshIds(var15, p3)
						
						if var16 then
							t = { [v_1.rigAttachmentToParent.name] = 0 }
							local var19 = 1
							
							for i_2 in v_1.otherAttachments do
								if string.find(i_2, "RigAttachment$") ~= nil then
									t[i_2] = 0
									var19 += 1
								end
							end
							var20 = 0
							
							for i_3, v_2 in var15:GetChildren() do
								if v_2.ClassName == "Attachment" and t[v_2.Name] then
									if t[v_2.Name] ~= 1 then
										t[v_2.Name] += 1
										var20 += 1
										continue
									end
									return false, { i_1 .. " has duplicate rig attachments: " .. v_2.Name }
								end
							end
							if var20 ~= var19 then
								return false, { "Missing rig attachments" }
							end
						end
						return false, var17
					end
					return false, { i_1 .. " input data is incorrectly set-up" }
				end
				return false, { i_1 .. " missing" }
			end
		end
	end
	return true
end

local function _(p4, p5) --[[ line: 107 | named "isWindowValid" ]]
	return p4 <= p5
end

local list = { "X", "Y", "Z" }

local function calculateScalingWindow(p6, p7) --[[ line: 116 ]]
	-- upvalues: boundsDataUtilsModule (ref), list (ref)
	local t = {}
	local var22, _, var23 = boundsDataUtilsModule.calculateBoundsDimensions(p6)
	t.meshSize = var22
	t.overallSize = var23
	t.scaleTypes = {}
	
	for i, v in p7 do
		local t_1 = { max = 1e999, min = -1e999 }
		
		for i_1, v_1 in list do
			t_1[v_1] = {
				min = 0.00005 + v.minSize[v_1] / var22[v_1],
				max = v.maxSize[v_1] / var23[v_1] - 0.00005
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

local function combineScalingWindows(p8) --[[ line: 144 ]]
	local t = {}
	
	for i, v in p8 do
		for i_1, v_1 in v.scaleTypes do
			t[i_1] = t[i_1] or { max = 1e999, min = -1e999 }
			t[i_1].max = math.min(t[i_1].max, v_1.max)
			t[i_1].min = math.max(t[i_1].min, v_1.min)
		end
	end
	return t
end

local function createFinalResults(p9) --[[ line: 160 ]]
	-- upvalues: list (ref)
	local t = { meshSize = p9.meshSize, overallSize = p9.overallSize }
	
	for i, v in p9.scaleTypes do
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

function t.preprocessDataAsync(p10, p11) --[[ line: 180 ]]
	-- upvalues: validateAllMeshParts (ref), constantsModule (ref), getMeshInfoModule (ref), getMeshVertsModule (ref)
	local var28, var29 = validateAllMeshParts(p10, p11)
	
	if not var28 then
		return { ok = false, errors = var29 }
	end
	local t = {}
	
	for i, v in constantsModule.ASSET_TYPE_INFO do
		if v.isBodyPart then
			for i_1 in v.subParts do
				assert(p10[i_1].ClassName == "MeshPart")
				local var31 = p10[i_1]
				local var32 = nil
				local _ = nil
				local _ = nil
				local var33, var34, var35 = getMeshInfoModule(var31, constantsModule.MESH_CONTENT_TYPE.RENDER_MESH, p11)
				local var36 = var35
				
				if var33 then
					var33 = var36
					t[var31.MeshId] = {}
					local meshId = t[var31.MeshId]
					local _ = nil
					local var37, var38, var39 = getMeshVertsModule(var33, p11)
					var32 = var37
					local var40 = var38
					local var41 = var39
					
					if var32 then
						meshId.verts = var41
						continue
					end
					return { ok = false, errors = var40 }
				end
				return { ok = false, errors = var34 }
			end
		end
	end
	return { ok = true, cache = { meshData = t } }
end

function t.isPreprocessDataCached(p12, p13) --[[ line: 232 ]]
	-- upvalues: constantsModule (ref)
	local meshData = p13.meshData
	
	for i, v in constantsModule.ASSET_TYPE_INFO do
		if v.isBodyPart then
			for i_1 in pairs(v.subParts) do
				local var42 = p12[i_1]
				
				if var42 and var42.ClassName == "MeshPart" and var42.MeshId ~= "" then
					if meshData then
						local meshId = meshData[var42.MeshId]
						
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

function t.calculateScaleToValidateBoundsAsync(p14, p15, p16) --[[ line: 268 ]]
	-- upvalues: validateAllMeshParts (ref), boundsCalculatorModule (ref), boundsDataUtilsModule (ref), calculateScalingWindow (ref), constantsModule (ref), combineScalingWindows (ref), createFinalResults (ref)
	local var43, var44 = validateAllMeshParts(p14, p15)
	
	if not var43 then
		return { ok = false, errors = var44 }
	end
	local var45, var46, var47 = boundsCalculatorModule.calculateIndividualFullBodyPartsData(p14, p15, p16, true)
	
	if not var45 then
		return {
			ok = false,
			errors = var46 or { "Errors calculating parts metrics" }
		}
	end
	local t = {}
	
	for i, v in var47 do
		t = boundsDataUtilsModule.combineBounds(t, v.boundsData)
	end
	local t_1 = {
		FullBody = calculateScalingWindow(t, constantsModule.FULL_BODY_BOUNDS)
	}
	
	for i_1, v_1 in constantsModule.ASSET_TYPE_INFO do
		if v_1.isBodyPart then
			local t_2 = {}
			
			for i_2 in v_1.subParts do
				t_2 = boundsDataUtilsModule.combineBounds(t_2, var47[i_2].boundsData)
			end
			t_1[i_1.Name] = calculateScalingWindow(t_2, constantsModule.ASSET_TYPE_INFO[i_1].bounds)
		end
	end
	local var50 = nil
	local var51 = nil
	
	for i_2, v_2 in combineScalingWindows(t_1) do
		if v_2.min <= v_2.max then
			if v_2.min <= 1 and v_2.max >= 1 then
				var50 = 1
				var51 = i_2
				break
			end
			local var53 = if math.abs(1 - v_2.min) < math.abs(1 - v_2.max) then v_2.min else v_2.max
			
			if not var50 or math.abs(1 - var53) < math.abs(1 - var50) then
				var50 = var53
				var51 = i_2
			end
		end
	end
	local t_2 = {
		ok = true,
		Overall = { ok = var50 ~= nil, scale = var50, scaleType = var51 }
	}
	
	for v_2, v_3 in t_1 do
		t_2[v_2] = createFinalResults(v_3)
	end
	return t_2
end

return t