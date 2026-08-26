local parent = script.Parent.Parent
local t = {}
local assetService = game:GetService("AssetService")
local UGCValidationService = game:GetService("UGCValidationService")
local _ = require(parent.util.Types)
local destroyEditableInstancesModule = require(parent.util.destroyEditableInstances)

local function _(p1, p2, p3, p4, p5)
	local var1 = if p5 == "EditableImage" then p1.editableImages else p1.editableMeshes
	
	if not var1[p2] then
		var1[p2] = {}
	end
	var1[p2][p3] = p4
end

local function createEditableInstanceFromId(p1, p2, p3)
	-- upvalues: assetService (ref), UGCValidationService (ref)
	local ok, status = pcall(function()
		-- upvalues: p3 (ref), assetService (copy), p1 (ref), UGCValidationService (copy)
		return if p3 == "EditableMesh" then assetService:CreateEditableMeshAsync(p1) else UGCValidationService:CreateEditableImageOriginalSizeAsync(p1.Uri)
	end)
	
	if ok then
		p2[p1.Uri] = status
		
		return true, { created = true, instance = status }
	end
	return ok, status
end

function t.getEditableInstanceInfo(p1, p2, p3, p4)
	-- upvalues: createEditableInstanceFromId (ref)
	local var1 = if p4 then p1.Object else nil
	
	if not var1 then
		local uri = p1.Uri
		
		if uri and uri ~= "" then
			var1 = p2[uri]
			
			if var1 then
				return true, { created = false, instance = var1 }
			else
				return createEditableInstanceFromId(p1, p2, p3)
			end
		end
	end
end

local _ = function(p1, p2, p3, p4)
	p1[p2] = { content = p3, contentType = p4 }
end

local function getTextureContentMap(p1, p2)
	if p1:IsA("MeshPart") then
		p2.TextureID = {
			contentType = "EditableImage",
			content = p1.TextureContent
		}
		
		return
	elseif p1:IsA("SpecialMesh") then
		p2.TextureId = {
			contentType = "EditableImage",
			content = Content.fromUri(p1.TextureId)
		}
		
		return
	elseif p1:IsA("SurfaceAppearance") or p1:IsA("Decal") then
		p2.ColorMap = {
			contentType = "EditableImage",
			content = p1.ColorMapContent
		}
		p2.MetalnessMap = {
			contentType = "EditableImage",
			content = p1.MetalnessMapContent
		}
		p2.NormalMap = {
			contentType = "EditableImage",
			content = p1.NormalMapContent
		}
		p2.RoughnessMap = {
			contentType = "EditableImage",
			content = p1.RoughnessMapContent
		}
	end
end

local _ = function(p1)
	return p1.CageMeshContent
end

local function getMeshContentMap(p1, p2)
	if p1:IsA("MeshPart") then
		p2.MeshId = { contentType = "EditableMesh", content = p1.MeshContent }
		
		return
	elseif p1:IsA("WrapTarget") then
		p2.CageMeshId = {
			contentType = "EditableMesh",
			content = p1.CageMeshContent
		}
		
		return
	elseif p1:IsA("WrapLayer") then
		p2.CageMeshId = {
			contentType = "EditableMesh",
			content = p1.CageMeshContent
		}
		p2.ReferenceMeshId = {
			contentType = "EditableMesh",
			content = p1.ReferenceMeshContent
		}
		
		return
	elseif p1:IsA("SpecialMesh") then
		p2.MeshId = {
			contentType = "EditableMesh",
			content = Content.fromUri(p1.MeshId)
		}
		
		return
	elseif p1:IsA("WrapTextureTransfer") then
		p2.ReferenceCageMeshContent = {
			contentType = "EditableMesh",
			content = p1.ReferenceCageMeshContent
		}
	end
end

function t.getOrCreateEditableInstances(p1, p2, p3, p4)
	-- upvalues: getMeshContentMap (ref), getTextureContentMap (ref), t (ref)
	local t_1 = {}
	getMeshContentMap(p1, t_1)
	getTextureContentMap(p1, t_1)
	
	for i, v in t_1 do
		local contentType = v.contentType
		local editableInstanceInfo, editableInstanceInfo_1 = t.getEditableInstanceInfo(v.content, p2, contentType, p4)
		
		if editableInstanceInfo then
			local var1 = if contentType == "EditableImage" then p3.editableImages else p3.editableMeshes
			
			if not var1[p1] then
				var1[p1] = {}
			end
			var1[p1][i] = editableInstanceInfo_1
		end
		return editableInstanceInfo, editableInstanceInfo_1
	end
	return true
end

function t.processAll(p5, p6)
	-- upvalues: t (ref), destroyEditableInstancesModule (ref)
	local t_1 = { editableMeshes = {}, editableImages = {} }
	local t_2 = {}
	
	for i, v in p5 do
		local descendants = v:GetDescendants()
		table.insert(descendants, v)
		
		for i_1, v_1 in pairs(descendants) do
			local orCreateEditableInstances, orCreateEditableInstances_1 = t.getOrCreateEditableInstances(v_1, t_2, t_1, p6)
			
			if not orCreateEditableInstances then
				destroyEditableInstancesModule(t_1.editableMeshes, t_1.editableImages)
				
				return false, { orCreateEditableInstances_1 }
			end
		end
	end
	return true, t_1
end

return t