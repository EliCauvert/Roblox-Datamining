local Parent = script.Parent.Parent
local AssetService = game:GetService("AssetService")
local UGCValidationService = game:GetService("UGCValidationService")
local _ = require(Parent.util.Types)
local DestroyEditableInstancesModule = require(Parent.util.destroyEditableInstances)

local function _(p1, Key, p2, p3, p4)
	local EditableImages = if p4 == "EditableImage" then p1.editableImages else p1.editableMeshes
	
	if not EditableImages[Key] then
		EditableImages[Key] = {}
	end
	EditableImages[Key][p2] = p3
end

local function createEditableInstanceFromId(Content1, p1, p2)
	-- upvalues: AssetService (copy), UGCValidationService (copy)
	local Success, Result = pcall(function()
		-- upvalues: p2 (copy), AssetService (upval), Content1 (copy), UGCValidationService (upval)
		return if p2 == "EditableMesh" then AssetService:CreateEditableMeshAsync(Content1) else UGCValidationService:CreateEditableImageOriginalSizeAsync(Content1.Uri)
	end)
	
	if Success then
		p1[Content1.Uri] = Result
		
		return true, { created = true, instance = Result }
	else
		return Success, Result
	end
end

local CreateEditableInstancesForContextModule = {
	getEditableInstanceInfo = function(Content1, p1, ContentType, p2)
		-- upvalues: createEditableInstanceFromId (copy)
		local Object = if p2 then Content1.Object else nil
		
		if not Object then
			local Uri = Content1.Uri
			
			if Uri and Uri ~= "" then
				Object = p1[Uri]
				
				if not Object then
					return createEditableInstanceFromId(Content1, p1, ContentType)
				end
			end
		end
		return true, { created = false, instance = Object }
	end
}

local _ = function(p1, Key, Content1, ContentType)
	p1[Key] = { content = Content1, contentType = ContentType }
end

local function getTextureContentMap(Object, p1)
	if Object:IsA("MeshPart") then
		p1.TextureID = {
			contentType = "EditableImage",
			content = Object.TextureContent
		}
		
		return
	end
	if Object:IsA("SpecialMesh") then
		p1.TextureId = {
			contentType = "EditableImage",
			content = Content.fromUri(Object.TextureId)
		}
		
		return
	end
	if Object:IsA("SurfaceAppearance") or Object:IsA("Decal") then
		p1.ColorMap = {
			contentType = "EditableImage",
			content = Object.ColorMapContent
		}
		p1.MetalnessMap = {
			contentType = "EditableImage",
			content = Object.MetalnessMapContent
		}
		p1.NormalMap = {
			contentType = "EditableImage",
			content = Object.NormalMapContent
		}
		p1.RoughnessMap = {
			contentType = "EditableImage",
			content = Object.RoughnessMapContent
		}
	end
end

local _ = function(p1)
	return p1.CageMeshContent
end

local function getMeshContentMap(Object, p1)
	if Object:IsA("MeshPart") then
		p1.MeshId = {
			contentType = "EditableMesh",
			content = Object.MeshContent
		}
		
		return
	end
	if Object:IsA("WrapTarget") then
		p1.CageMeshId = {
			contentType = "EditableMesh",
			content = Object.CageMeshContent
		}
		
		return
	end
	if Object:IsA("WrapLayer") then
		p1.CageMeshId = {
			contentType = "EditableMesh",
			content = Object.CageMeshContent
		}
		p1.ReferenceMeshId = {
			contentType = "EditableMesh",
			content = Object.ReferenceMeshContent
		}
		
		return
	end
	if Object:IsA("SpecialMesh") then
		p1.MeshId = {
			contentType = "EditableMesh",
			content = Content.fromUri(Object.MeshId)
		}
		
		return
	end
	if Object:IsA("WrapTextureTransfer") then
		p1.ReferenceCageMeshContent = {
			contentType = "EditableMesh",
			content = Object.ReferenceCageMeshContent
		}
	end
end

function CreateEditableInstancesForContextModule.getOrCreateEditableInstances(Key, p1, p2, p3)
	-- upvalues: getMeshContentMap (copy), getTextureContentMap (copy), CreateEditableInstancesForContextModule (copy)
	local t = {}
	getMeshContentMap(Key, t)
	getTextureContentMap(Key, t)
	local EditableInstanceInfo = nil
	local EditableInstanceInfo2 = nil
	
	for i, TextureID in t do
		local ContentType = TextureID.contentType
		EditableInstanceInfo, EditableInstanceInfo2 = CreateEditableInstancesForContextModule.getEditableInstanceInfo(TextureID.content, p1, ContentType, p3)
		
		if not EditableInstanceInfo then
			return EditableInstanceInfo, EditableInstanceInfo2
		end
		local EditableImages = if ContentType == "EditableImage" then p2.editableImages else p2.editableMeshes
		
		if not EditableImages[Key] then
			EditableImages[Key] = {}
		end
		EditableImages[Key][i] = EditableInstanceInfo2
	end
	return true
end

function CreateEditableInstancesForContextModule.processAll(List, p4)
	-- upvalues: CreateEditableInstancesForContextModule (copy), DestroyEditableInstancesModule (copy)
	local config = { editableMeshes = {}, editableImages = {} }
	local t = {}
	
	for _, value in List do
		local Descendants = value:GetDescendants()
		table.insert(Descendants, value)
		local OrCreateEditableInstances2 = nil
		
		for _, descendant in pairs(Descendants) do
			local OrCreateEditableInstances
			OrCreateEditableInstances, OrCreateEditableInstances2 = CreateEditableInstancesForContextModule.getOrCreateEditableInstances(descendant, t, config, p4)
			
			if not OrCreateEditableInstances then
				DestroyEditableInstancesModule(config.editableMeshes, config.editableImages)
				
				return false, { OrCreateEditableInstances2 }
			end
		end
	end
	return true, config
end

return CreateEditableInstancesForContextModule