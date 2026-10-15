local parent = script.Parent.Parent.Parent
local createEditableInstancesForContextModule = require(parent.util.createEditableInstancesForContext)
local getMeshSizeModule = require(parent.util.getMeshSize)
local sharedDataMember = require(parent.validationSystem.ValidationEnums).SharedDataMember
local _ = require(parent.util.Types)
local getFFlagUGCValidateEmissiveAreaChecksFixedAlgoModule = require(parent.flags.getFFlagUGCValidateEmissiveAreaChecksFixedAlgo)
local t = {
	cleanup = function(p1)
		for i, v in p1 do
			if v.createdInValidation then
				v.editable:Destroy()
			end
			if v.isPBR ~= nil then
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

local function getTextureData(p2, p3, p4)
	-- upvalues: getFFlagUGCValidateEmissiveAreaChecksFixedAlgoModule (ref), createEditableInstancesForContextModule (ref), t (ref)
	local surfaceAppearance = p2:FindFirstChildWhichIsA("SurfaceAppearance")
	local var1 = if surfaceAppearance ~= nil then {
		isPBR = false,
		Texture = if p2:IsA("MeshPart") then p2.TextureContent else Content.fromUri(p2.TextureId)
	} else {
		isPBR = true,
		ColorMap = surfaceAppearance.ColorMapContent,
		MetalnessMap = surfaceAppearance.MetalnessMapContent,
		NormalMap = surfaceAppearance.NormalMapContent,
		RoughnessMap = surfaceAppearance.RoughnessMapContent,
		EmissiveMask = surfaceAppearance.EmissiveMaskContent
	}
	local t_1 = { isPBR = var1.isPBR }
	
	if getFFlagUGCValidateEmissiveAreaChecksFixedAlgoModule() and surfaceAppearance ~= nil then
		t_1.EmissiveTint = surfaceAppearance.EmissiveTint
		t_1.EmissiveStrength = surfaceAppearance.EmissiveStrength
	end
	for i, v in var1 do
		if getFFlagUGCValidateEmissiveAreaChecksFixedAlgoModule() then
			if i ~= "isPBR" and i ~= "EmissiveTint" and (i ~= "EmissiveStrength" and v.SourceType ~= Enum.ContentSourceType.None) then
				local editableImage, editableImage_1 = createEditableInstancesForContextModule.getEditableInstanceInfo(v, p4, "EditableImage", p3)
				
				if editableImage then
					t_1[i] = {
						editable = editableImage_1.instance,
						createdInValidation = editableImage_1.created
					}
					continue
				end
				t.cleanup(t_1)
				
				return false
			end
		elseif i ~= "isPBR" and v.SourceType ~= Enum.ContentSourceType.None then
		end
	end
	return true, t_1
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

local function getDataInstance(p5, p6)
	-- upvalues: sharedDataMember (ref)
	local var2 = if p5:IsA("MeshPart") then p5 else p5:FindFirstChildOfClass("SpecialMesh")
	
	if var2 then
		local baseWrap = p5:FindFirstChildWhichIsA("BaseWrap")
		
		if p6 == sharedDataMember.renderMeshesData then
			return true, var2
		elseif p6 == sharedDataMember.meshTextures then
			return (var2.ClassName == "MeshPart" and var2.TextureContent.SourceType ~= Enum.ContentSourceType.None) or (var2:FindFirstChildWhichIsA("SurfaceAppearance") ~= nil or (var2.ClassName == "SpecialMesh" and var2.TextureId ~= "")), var2
		elseif p6 == sharedDataMember.outerCagesData and baseWrap then
			return baseWrap.CageMeshContent.SourceType ~= Enum.ContentSourceType.None, baseWrap
		elseif p6 == sharedDataMember.innerCagesData and baseWrap and baseWrap.ClassName == "WrapLayer" then
			return baseWrap.ReferenceMeshContent.SourceType ~= Enum.ContentSourceType.None, baseWrap
		end
	end
	return false
end

function t.getDatas(p5, p6, p7, p8, p9)
	-- upvalues: getDataInstance (ref), sharedDataMember (ref), getMeshData (ref), getCageData (ref), getTextureData (ref), t (ref)
	local var2
	local t_1 = {}
	local descendants = p5:GetDescendants()
	table.insert(descendants, p5)
	
	for i, v in descendants do
		var22, var23 = getDataInstance(v, p6)
		
		if var22 then
			local var3 = nil
			local var4 = nil
			
			if p6 == sharedDataMember.renderMeshesData then
				local var5, var6 = getMeshData(var2, p7, p8)
				var3 = var5
				var4 = var6
			elseif p6 == sharedDataMember.innerCagesData or p6 == sharedDataMember.outerCagesData then
				local var7, var8 = getCageData(var2, p6 == sharedDataMember.outerCagesData, p7, p8)
				var3 = var7
				var4 = var8
			elseif p6 == sharedDataMember.meshTextures then
				local var9, var10 = getTextureData(var2, p7, p9)
				var3 = var9
				var4 = var10
			end
			if var3 and var4 ~= nil then
				t_1[v.Name] = var4
				continue
			end
			t.cleanup(t_1)
			
			return
		end
	end
	return t_1
end

return t