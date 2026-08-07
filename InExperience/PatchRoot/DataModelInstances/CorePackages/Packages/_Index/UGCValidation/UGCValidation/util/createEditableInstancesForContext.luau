local parent = script.Parent.Parent
local t = {}
local assetService = game:GetService("AssetService")
local UGCValidationService = game:GetService("UGCValidationService")
local _ = require(parent.util.Types)
local destroyEditableInstancesModule = require(parent.util.destroyEditableInstances)

local function _(p0, p1, p2, p3, p4) --[[ line: 13 | named "addEditableInstance" ]]
	local var7 = if p4 == "EditableImage" then p0.editableImages else p0.editableMeshes
	
	if not var7[p1] then
		var7[p1] = {}
	end
	var7[p1][p2] = p3
end

local function createEditableInstanceFromId(p5, p6, p7) --[[ line: 26 ]]
	-- upvalues: assetService (ref), UGCValidationService (ref)
	local ok, status = pcall(function() --[[ line: 27 ]]
		-- upvalues: p7 (ref), assetService (copy), p5 (ref), UGCValidationService (copy)
		return if p7 == "EditableMesh" then assetService:CreateEditableMeshAsync(p5) else UGCValidationService:CreateEditableImageOriginalSizeAsync(p5.Uri)
	end)
	
	if ok then
		p6[p5.Uri] = status
		
		return true, { created = true, instance = status }
	end
	return ok, status
end

function t.getEditableInstanceInfo(p8, p9, p10, p11) --[[ line: 46 ]]
	-- upvalues: createEditableInstanceFromId (ref)
	local var8 = if p11 then p8.Object else nil
	
	if not var8 then
		local uri = p8.Uri
		
		if uri and uri ~= "" then
			var8 = p9[uri]
			
			if var8 then
				return true, { created = false, instance = var8 }
			else
				return createEditableInstanceFromId(p8, p9, p10)
			end
		end
	end
end

local _ = function(p12, p13, p14, p15) --[[ line: 72 | named "addContent" ]]
	p12[p13] = { content = p14, contentType = p15 }
end

local function getTextureContentMap(p16, p17) --[[ line: 79 ]]
	if p16:IsA("MeshPart") then
		p17.TextureID = {
			contentType = "EditableImage",
			content = p16.TextureContent
		}
		
		return
	elseif p16:IsA("SpecialMesh") then
		p17.TextureId = {
			contentType = "EditableImage",
			content = Content.fromUri(p16.TextureId)
		}
		
		return
	elseif p16:IsA("SurfaceAppearance") or p16:IsA("Decal") then
		p17.ColorMap = {
			contentType = "EditableImage",
			content = p16.ColorMapContent
		}
		p17.MetalnessMap = {
			contentType = "EditableImage",
			content = p16.MetalnessMapContent
		}
		p17.NormalMap = {
			contentType = "EditableImage",
			content = p16.NormalMapContent
		}
		p17.RoughnessMap = {
			contentType = "EditableImage",
			content = p16.RoughnessMapContent
		}
	end
end

local _ = function(p18) --[[ line: 118 | named "getCageMeshContent" ]]
	return p18.CageMeshContent
end

local function getMeshContentMap(p19, p20) --[[ line: 122 ]]
	if p19:IsA("MeshPart") then
		p20.MeshId = { contentType = "EditableMesh", content = p19.MeshContent }
		
		return
	elseif p19:IsA("WrapTarget") then
		p20.CageMeshId = {
			contentType = "EditableMesh",
			content = p19.CageMeshContent
		}
		
		return
	elseif p19:IsA("WrapLayer") then
		p20.CageMeshId = {
			contentType = "EditableMesh",
			content = p19.CageMeshContent
		}
		p20.ReferenceMeshId = {
			contentType = "EditableMesh",
			content = p19.ReferenceMeshContent
		}
		
		return
	elseif p19:IsA("SpecialMesh") then
		p20.MeshId = {
			contentType = "EditableMesh",
			content = Content.fromUri(p19.MeshId)
		}
		
		return
	elseif p19:IsA("WrapTextureTransfer") then
		p20.ReferenceCageMeshContent = {
			contentType = "EditableMesh",
			content = p19.ReferenceCageMeshContent
		}
	end
end

function t.getOrCreateEditableInstances(p21, p22, p23, p24) --[[ line: 143 ]]
	-- upvalues: getMeshContentMap (ref), getTextureContentMap (ref), t (ref)
	local t_1 = {}
	getMeshContentMap(p21, t_1)
	getTextureContentMap(p21, t_1)
	
	for i, v in t_1 do
		local contentType = v.contentType
		local editableInstanceInfo, editableInstanceInfo_1 = t.getEditableInstanceInfo(v.content, p22, contentType, p24)
		
		if editableInstanceInfo then
			local var12 = if contentType == "EditableImage" then p23.editableImages else p23.editableMeshes
			
			if not var12[p21] then
				var12[p21] = {}
			end
			var12[p21][i] = editableInstanceInfo_1
		end
		return editableInstanceInfo, editableInstanceInfo_1
	end
	return true
end

function t.processAll(p25, p26) --[[ line: 171 ]]
	-- upvalues: t (ref), destroyEditableInstancesModule (ref)
	local t_1 = { editableMeshes = {}, editableImages = {} }
	local t_2 = {}
	
	for i, v in p25 do
		local descendants = v:GetDescendants()
		table.insert(descendants, v)
		
		for i_1, v_1 in pairs(descendants) do
			local orCreateEditableInstances, orCreateEditableInstances_1 = t.getOrCreateEditableInstances(v_1, t_2, t_1, p26)
			
			if not orCreateEditableInstances then
				destroyEditableInstancesModule(t_1.editableMeshes, t_1.editableImages)
				
				return false, { orCreateEditableInstances_1 }
			end
		end
	end
	return true, t_1
end

return t