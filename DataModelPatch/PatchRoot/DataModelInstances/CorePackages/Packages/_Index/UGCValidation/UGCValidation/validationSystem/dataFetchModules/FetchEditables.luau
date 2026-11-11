local Parent = script.Parent.Parent.Parent
local CreateEditableInstancesForContextModule = require(Parent.util.createEditableInstancesForContext)
local GetMeshSizeModule = require(Parent.util.getMeshSize)
local SharedDataMember = require(Parent.validationSystem.ValidationEnums).SharedDataMember
local _ = require(Parent.util.Types)
local GetFFlagUGCValidationAddPBRToSharedDataModule = require(Parent.flags.getFFlagUGCValidationAddPBRToSharedData)
local GetFFlagUGCValidateAllowEmissivesModule = require(Parent.flags.getFFlagUGCValidateAllowEmissives)
local FetchEditablesModule = {
	cleanup = function(List)
		-- upvalues: GetFFlagUGCValidationAddPBRToSharedDataModule (copy)
		for i, value in List do
			if value.createdInValidation then
				value.editable:Destroy()
			end
			if GetFFlagUGCValidationAddPBRToSharedDataModule() and value.isPBR ~= nil then
				for _, value1 in value do
					if typeof(value1) == "table" and value1.createdInValidation then
						value1.editable:Destroy()
					end
				end
			end
			List[i] = nil
		end
	end
}

local function getMeshData(Object, p1, p2)
	-- upvalues: CreateEditableInstancesForContextModule (copy), GetMeshSizeModule (copy)
	local EditableMeshEditableInstanceInfo, EditableMeshEditableInstanceInfo2 = CreateEditableInstancesForContextModule.getEditableInstanceInfo(Object:IsA("MeshPart") and Object.MeshContent or Content.fromUri(Object.MeshId), p2, "EditableMesh", p1)
	
	if not EditableMeshEditableInstanceInfo then
		return false
	end
	local MeshSize = nil
	local Scale = nil
	
	if Object:IsA("MeshPart") then
		if Object.MeshContent.SourceType == Enum.ContentSourceType.Object then
			MeshSize = GetMeshSizeModule({
				editableMesh = EditableMeshEditableInstanceInfo2.instance
			})
			Scale = vector.create(1, 1, 1)
		else
			MeshSize = Object.MeshSize
			Scale = Object.Size / Object.MeshSize
		end
	elseif Object:IsA("SpecialMesh") then
		MeshSize = GetMeshSizeModule({
			editableMesh = EditableMeshEditableInstanceInfo2.instance
		})
		Scale = Object.Scale
	end
	return true, {
		editable = EditableMeshEditableInstanceInfo2.instance,
		createdInValidation = EditableMeshEditableInstanceInfo2.created,
		originalSize = MeshSize,
		scale = Scale
	}
end

local function getTextureData_deprecated(Part: Part, p1, p2)
	-- upvalues: CreateEditableInstancesForContextModule (copy)
	local EditableImageEditableInstanceInfo, EditableImageEditableInstanceInfo2 = CreateEditableInstancesForContextModule.getEditableInstanceInfo(if Part:IsA("MeshPart") then Part.TextureContent else Content.fromUri(Part.TextureId), p2, "EditableImage", p1)
	
	if EditableImageEditableInstanceInfo then
		return true, {
			editable = EditableImageEditableInstanceInfo2.instance,
			createdInValidation = EditableImageEditableInstanceInfo2.created
		}
	else
		return false
	end
end

local function getTextureData(Part: Part, p1, p2)
	-- upvalues: GetFFlagUGCValidateAllowEmissivesModule (copy), CreateEditableInstancesForContextModule (copy), FetchEditablesModule (copy)
	local SurfaceAppearance = Part:FindFirstChildWhichIsA("SurfaceAppearance")
	local config = nil
	
	if SurfaceAppearance == nil then
		config = {
			isPBR = false,
			Texture = if Part:IsA("MeshPart") then Part.TextureContent else Content.fromUri(Part.TextureId)
		}
	else
		config = {
			isPBR = true,
			ColorMap = SurfaceAppearance.ColorMapContent,
			MetalnessMap = SurfaceAppearance.MetalnessMapContent,
			NormalMap = SurfaceAppearance.NormalMapContent,
			RoughnessMap = SurfaceAppearance.RoughnessMapContent
		}
		
		if GetFFlagUGCValidateAllowEmissivesModule() then
			config.EmissiveMask = SurfaceAppearance.EmissiveMaskContent
		end
	end
	local config1 = { isPBR = config.isPBR }
	
	for i, value in config do
		if i ~= "isPBR" and value.SourceType ~= Enum.ContentSourceType.None then
			local EditableImageEditableInstanceInfo, EditableImageEditableInstanceInfo2 = CreateEditableInstancesForContextModule.getEditableInstanceInfo(value, p2, "EditableImage", p1)
			
			if not EditableImageEditableInstanceInfo then
				FetchEditablesModule.cleanup(config1)
				
				return false
			end
			config1[i] = {
				editable = EditableImageEditableInstanceInfo2.instance,
				createdInValidation = EditableImageEditableInstanceInfo2.created
			}
		end
	end
	return true, config1
end

local function getCageData(WrapLayer, IsOuterCagesDataMatch, p3, p4)
	-- upvalues: CreateEditableInstancesForContextModule (copy), GetMeshSizeModule (copy)
	local CageMeshContent = nil
	local CageOrigin = nil
	if IsOuterCagesDataMatch or WrapLayer.ClassName ~= "WrapLayer" then
		CageMeshContent = WrapLayer.CageMeshContent
		CageOrigin = WrapLayer.CageOrigin
	else
		CageMeshContent = WrapLayer.ReferenceMeshContent
		CageOrigin = WrapLayer.ReferenceOrigin
	end
	local EditableMeshEditableInstanceInfo, EditableMeshEditableInstanceInfo2 = CreateEditableInstancesForContextModule.getEditableInstanceInfo(CageMeshContent, p4, "EditableMesh", p3)
	
	if EditableMeshEditableInstanceInfo then
		return true, {
			editable = EditableMeshEditableInstanceInfo2.instance,
			createdInValidation = EditableMeshEditableInstanceInfo2.created,
			originalSize = GetMeshSizeModule({
				editableMesh = EditableMeshEditableInstanceInfo2.instance
			}),
			origin = CageOrigin
		}
	else
		return false
	end
end

local function getDataInstance_deprecated(Object, MeshTextures)
	-- upvalues: SharedDataMember (copy)
	if Object:IsA("MeshPart") or Object:IsA("Part") and Object:FindFirstChildOfClass("SpecialMesh") then
		local Object1 = Object:IsA("MeshPart") and Object or Object:FindFirstChildOfClass("SpecialMesh")
		
		if MeshTextures == SharedDataMember.meshTextures and (Object1.ClassName == "MeshPart" and Object1.TextureContent.SourceType == Enum.ContentSourceType.None or Object1.ClassName == "SpecialMesh" and Object1.TextureId == "") then
			return false
		end
		if MeshTextures == SharedDataMember.renderMeshesData or MeshTextures == SharedDataMember.meshTextures then
			return true, Object1
		end
		local BaseWrap = Object:FindFirstChildWhichIsA("BaseWrap")
		
		if MeshTextures == SharedDataMember.outerCagesData then
			return true, BaseWrap
		elseif MeshTextures == SharedDataMember.innerCagesData and BaseWrap and BaseWrap.ClassName == "WrapLayer" then
			return true, BaseWrap
		end
	end
	return false
end

local function getDataInstance(Object, OuterCagesData)
	-- upvalues: SharedDataMember (copy)
	local Object1 = Object:IsA("MeshPart") and Object or Object:FindFirstChildOfClass("SpecialMesh")
	
	if Object1 then
		local BaseWrap = Object:FindFirstChildWhichIsA("BaseWrap")
		
		if OuterCagesData == SharedDataMember.renderMeshesData then
			return true, Object1
		elseif OuterCagesData == SharedDataMember.meshTextures then
			local HasSurfaceAppearance = Object1:FindFirstChildWhichIsA("SurfaceAppearance") ~= nil
			local IsNotTextureIdMatch: boolean = Object1.ClassName == "SpecialMesh" and Object1.TextureId ~= ""
			
			return Object1.ClassName == "MeshPart" and Object1.TextureContent.SourceType ~= Enum.ContentSourceType.None or (HasSurfaceAppearance or IsNotTextureIdMatch), Object1
		elseif OuterCagesData == SharedDataMember.outerCagesData and BaseWrap then
			return BaseWrap.CageMeshContent.SourceType ~= Enum.ContentSourceType.None, BaseWrap
		elseif OuterCagesData == SharedDataMember.innerCagesData and BaseWrap and BaseWrap.ClassName == "WrapLayer" then
			return BaseWrap.ReferenceMeshContent.SourceType ~= Enum.ContentSourceType.None, BaseWrap
		end
	end
	return false
end

function FetchEditablesModule.getDatas(Object, MeshTextures, p3, p4, p5)
	-- upvalues: GetFFlagUGCValidationAddPBRToSharedDataModule (copy), getDataInstance (copy), getDataInstance_deprecated (copy), SharedDataMember (copy), getMeshData (copy), getCageData (copy), getTextureData (copy), getTextureData_deprecated (copy), FetchEditablesModule (copy)
	local t = {}
	local Descendants = Object:GetDescendants()
	table.insert(Descendants, Object)
	
	for _, descendant in Descendants do
		local DataInstance = nil
		local DataInstance2 = nil
		if GetFFlagUGCValidationAddPBRToSharedDataModule() then
			DataInstance, DataInstance2 = getDataInstance(descendant, MeshTextures)
		else
			DataInstance, DataInstance2 = getDataInstance_deprecated(descendant, MeshTextures)
		end
		if DataInstance then
			local v1 = nil
			local v2 = nil
			
			if MeshTextures == SharedDataMember.renderMeshesData then
				v1, v39 = getMeshData(DataInstance2, p3, p4)
			elseif MeshTextures == SharedDataMember.innerCagesData or MeshTextures == SharedDataMember.outerCagesData then
				v1, v39 = getCageData(DataInstance2, MeshTextures == SharedDataMember.outerCagesData, p3, p4)
			elseif MeshTextures == SharedDataMember.meshTextures then
				if GetFFlagUGCValidationAddPBRToSharedDataModule() then
					v1, v39 = getTextureData(DataInstance2, p3, p5)
				else
					v1, v39 = getTextureData_deprecated(DataInstance2, p3, p5)
				end
			end
			if not v1 or v2 == nil then
				FetchEditablesModule.cleanup(t)
				
				return
			end
			t[descendant.Name] = v2
		end
	end
	return t
end

return FetchEditablesModule