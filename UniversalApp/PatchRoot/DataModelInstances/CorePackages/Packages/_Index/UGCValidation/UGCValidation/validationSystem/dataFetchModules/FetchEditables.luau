local parent = script.Parent.Parent.Parent
local createEditableInstancesForContextModule = require(parent.util.createEditableInstancesForContext)
local getMeshSizeModule = require(parent.util.getMeshSize)
local sharedDataMember = require(parent.validationSystem.ValidationEnums).SharedDataMember
local _ = require(parent.util.Types)
local getFFlagUGCValidationAddPBRToSharedDataModule = require(parent.flags.getFFlagUGCValidationAddPBRToSharedData)
local getFFlagUGCValidateAllowEmissivesModule = require(parent.flags.getFFlagUGCValidateAllowEmissives)
local t = {
	cleanup = function(p1)
		-- upvalues: getFFlagUGCValidationAddPBRToSharedDataModule (ref)
		for i, v in p1 do
			if v.createdInValidation then
				v.editable:Destroy()
			end
			if getFFlagUGCValidationAddPBRToSharedDataModule() and v.isPBR ~= nil then
				for i_1, v_1 in v do
					if typeof(v_1) == "table" and v_1.createdInValidation then
						v_1.editable:Destroy()
					end
				end
			end
			p1[i] = nil
		end
	end
}

local function getMeshData(p2, p3, p4)
	-- upvalues: createEditableInstancesForContextModule (ref), getMeshSizeModule (ref)
	local editableMesh, editableMesh_1 = createEditableInstancesForContextModule.getEditableInstanceInfo(if p2:IsA("MeshPart") then p2.MeshContent else Content.fromUri(p2.MeshId), p4, "EditableMesh", p3)
	
	if not editableMesh then
		return false
	end
	local var1 = nil
	local scale = nil
	
	if p2:IsA("MeshPart") then
		if p2.MeshContent.SourceType == Enum.ContentSourceType.Object then
			var1 = getMeshSizeModule({ editableMesh = editableMesh_1.instance })
			scale = Vector3.new(1, 1, 1)
		else
			var1 = p2.MeshSize
			scale = p2.Size / p2.MeshSize
		end
	elseif p2:IsA("SpecialMesh") then
		var1 = getMeshSizeModule({ editableMesh = editableMesh_1.instance })
		scale = p2.Scale
	end
	return true, {
		editable = editableMesh_1.instance,
		createdInValidation = editableMesh_1.created,
		originalSize = var1,
		scale = scale
	}
end

local function getTextureData_deprecated(p2, p3, p4)
	-- upvalues: createEditableInstancesForContextModule (ref)
	local editableImage, editableImage_1 = createEditableInstancesForContextModule.getEditableInstanceInfo(if p2:IsA("MeshPart") then p2.TextureContent else Content.fromUri(p2.TextureId), p4, "EditableImage", p3)
	
	if editableImage then
		return true, {
			editable = editableImage_1.instance,
			createdInValidation = editableImage_1.created
		}
	end
	return false
end

local function getTextureData(p2, p3, p4)
	-- upvalues: getFFlagUGCValidateAllowEmissivesModule (ref), createEditableInstancesForContextModule (ref), t (ref)
	local t_1
	local surfaceAppearance = p2:FindFirstChildWhichIsA("SurfaceAppearance")
	local _ = {}
	
	if surfaceAppearance == nil then
		t_1 = {
			isPBR = false,
			Texture = if p2:IsA("MeshPart") then p2.TextureContent else Content.fromUri(p2.TextureId)
		}
	else
		t_1 = {
			isPBR = true,
			ColorMap = surfaceAppearance.ColorMapContent,
			MetalnessMap = surfaceAppearance.MetalnessMapContent,
			NormalMap = surfaceAppearance.NormalMapContent,
			RoughnessMap = surfaceAppearance.RoughnessMapContent
		}
		
		if getFFlagUGCValidateAllowEmissivesModule() then
			t_1.EmissiveMask = surfaceAppearance.EmissiveMaskContent
		end
	end
	local t_2 = { isPBR = t_1.isPBR }
	
	for i, v in t_1 do
		if i ~= "isPBR" and v.SourceType ~= Enum.ContentSourceType.None then
			local editableImage, editableImage_1 = createEditableInstancesForContextModule.getEditableInstanceInfo(v, p4, "EditableImage", p3)
			
			if editableImage then
				t_2[i] = {
					editable = editableImage_1.instance,
					createdInValidation = editableImage_1.created
				}
				continue
			end
			t.cleanup(t_2)
			
			return false
		end
	end
	return true, t_2
end

local function getCageData(p5, p6, p7, p8)
	-- upvalues: createEditableInstancesForContextModule (ref), getMeshSizeModule (ref)
	local referenceMeshContent, referenceOrigin
	local _ = nil
	local _ = nil
	
	if p6 or p5.ClassName ~= "WrapLayer" then
		referenceMeshContent = p5.CageMeshContent
		referenceOrigin = p5.CageOrigin
	else
		referenceMeshContent = p5.ReferenceMeshContent
		referenceOrigin = p5.ReferenceOrigin
	end
	local editableMesh, editableMesh_1 = createEditableInstancesForContextModule.getEditableInstanceInfo(referenceMeshContent, p8, "EditableMesh", p7)
	
	if editableMesh then
		return true, {
			editable = editableMesh_1.instance,
			createdInValidation = editableMesh_1.created,
			originalSize = getMeshSizeModule({ editableMesh = editableMesh_1.instance }),
			origin = referenceOrigin
		}
	end
	return false
end

local function getDataInstance_deprecated(p5, p6)
	-- upvalues: sharedDataMember (ref)
	if p5:IsA("MeshPart") or p5:IsA("Part") and p5:FindFirstChildOfClass("SpecialMesh") then
		local var1 = if p5:IsA("MeshPart") then p5 else p5:FindFirstChildOfClass("SpecialMesh")
		
		if p6 == sharedDataMember.meshTextures and (var1.ClassName == "MeshPart" and var1.TextureContent.SourceType == Enum.ContentSourceType.None or var1.ClassName == "SpecialMesh" and var1.TextureId == "") then
			return false
		elseif p6 == sharedDataMember.renderMeshesData or p6 == sharedDataMember.meshTextures then
			return true, var1
		end
		local baseWrap = p5:FindFirstChildWhichIsA("BaseWrap")
		
		if p6 == sharedDataMember.outerCagesData then
			return true, baseWrap
		elseif p6 == sharedDataMember.innerCagesData and baseWrap and baseWrap.ClassName == "WrapLayer" then
			return true, baseWrap
		end
	end
	return false
end

local function getDataInstance(p5, p6)
	-- upvalues: sharedDataMember (ref)
	local var1 = if p5:IsA("MeshPart") then p5 else p5:FindFirstChildOfClass("SpecialMesh")
	
	if var1 then
		local baseWrap = p5:FindFirstChildWhichIsA("BaseWrap")
		
		if p6 == sharedDataMember.renderMeshesData then
			return true, var1
		elseif p6 == sharedDataMember.meshTextures then
			return (var1.ClassName == "MeshPart" and var1.TextureContent.SourceType ~= Enum.ContentSourceType.None) or (var1:FindFirstChildWhichIsA("SurfaceAppearance") ~= nil or (var1.ClassName == "SpecialMesh" and var1.TextureId ~= "")), var1
		elseif p6 == sharedDataMember.outerCagesData and baseWrap then
			return baseWrap.CageMeshContent.SourceType ~= Enum.ContentSourceType.None, baseWrap
		elseif p6 == sharedDataMember.innerCagesData and baseWrap and baseWrap.ClassName == "WrapLayer" then
			return baseWrap.ReferenceMeshContent.SourceType ~= Enum.ContentSourceType.None, baseWrap
		end
	end
	return false
end

function t.getDatas(p5, p6, p7, p8, p9)
	-- upvalues: getFFlagUGCValidationAddPBRToSharedDataModule (ref), getDataInstance (ref), getDataInstance_deprecated (ref), sharedDataMember (ref), getMeshData (ref), getCageData (ref), getTextureData (ref), getTextureData_deprecated (ref), t (ref)
	local var1, var2, var3
	local t_1 = {}
	local descendants = p5:GetDescendants()
	table.insert(descendants, p5)
	
	for i, v in descendants do
		local var4 = nil
		local _ = nil
		
		if getFFlagUGCValidationAddPBRToSharedDataModule() then
			var1, var31 = getDataInstance(v, p6)
			var4 = var1
			var3 = var2
		else
			var1, var31 = getDataInstance_deprecated(v, p6)
			var4 = var1
			var3 = var2
		end
		if var4 then
			var1 = nil
			var2 = nil
			
			if p6 == sharedDataMember.renderMeshesData then
				local var5, var6 = getMeshData(var3, p7, p8)
				var1 = var5
				var2 = var6
			elseif p6 == sharedDataMember.innerCagesData or p6 == sharedDataMember.outerCagesData then
				local var7, var8 = getCageData(var3, p6 == sharedDataMember.outerCagesData, p7, p8)
				var1 = var7
				var2 = var8
			elseif p6 == sharedDataMember.meshTextures then
				if getFFlagUGCValidationAddPBRToSharedDataModule() then
					local var9, var10 = getTextureData(var3, p7, p9)
					var1 = var9
					var2 = var10
				else
					local var11, var12 = getTextureData_deprecated(var3, p7, p9)
					var1 = var11
					var2 = var12
				end
			end
			if var1 and var2 ~= nil then
				t_1[v.Name] = var2
				continue
			end
			t.cleanup(t_1)
			
			return
		end
	end
	return t_1
end

return t