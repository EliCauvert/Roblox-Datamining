-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:32:49 2026 Pacific Standard Time.

local parent = script.Parent.Parent.Parent
local createEditableInstancesForContextModule = require(parent.util.createEditableInstancesForContext)
local getMeshSizeModule = require(parent.util.getMeshSize)
local sharedDataMember = require(parent.validationSystem.ValidationEnums).SharedDataMember
local _ = require(parent.util.Types)
local getFFlagUGCValidationAddPBRToSharedDataModule = require(parent.flags.getFFlagUGCValidationAddPBRToSharedData)
local getFFlagUGCValidateAllowEmissivesModule = require(parent.flags.getFFlagUGCValidateAllowEmissives)
local t = {
	cleanup = function(p0) --[[ line: 20 ]]
		-- upvalues: getFFlagUGCValidationAddPBRToSharedDataModule (ref)
		for i, v in p0 do
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
			p0[i] = nil
		end
	end
}

local function getMeshData(p1, p2, p3) --[[ line: 45 ]]
	-- upvalues: createEditableInstancesForContextModule (ref), getMeshSizeModule (ref)
	local editableMesh, editableMesh_1 = createEditableInstancesForContextModule.getEditableInstanceInfo(if p1:IsA("MeshPart") then p1.MeshContent else Content.fromUri(p1.MeshId), p3, "EditableMesh", p2)
	
	if not editableMesh then
		return false
	end
	local var13 = nil
	local scale = nil
	
	if p1:IsA("MeshPart") then
		if p1.MeshContent.SourceType == Enum.ContentSourceType.Object then
			var13 = getMeshSizeModule({ editableMesh = editableMesh_1.instance })
			scale = Vector3.new(1, 1, 1)
		else
			var13 = p1.MeshSize
			scale = p1.Size / p1.MeshSize
		end
	elseif p1:IsA("SpecialMesh") then
		var13 = getMeshSizeModule({ editableMesh = editableMesh_1.instance })
		scale = p1.Scale
	end
	return true, {
		editable = editableMesh_1.instance,
		createdInValidation = editableMesh_1.created,
		originalSize = var13,
		scale = scale
	}
end

local function getTextureData_deprecated(p4, p5, p6) --[[ line: 85 ]]
	-- upvalues: createEditableInstancesForContextModule (ref)
	local editableImage, editableImage_1 = createEditableInstancesForContextModule.getEditableInstanceInfo(if p4:IsA("MeshPart") then p4.TextureContent else Content.fromUri(p4.TextureId), p6, "EditableImage", p5)
	
	if editableImage then
		return true, {
			editable = editableImage_1.instance,
			createdInValidation = editableImage_1.created
		}
	end
	return false
end

local function getTextureData(p7, p8, p9) --[[ line: 113 ]]
	-- upvalues: getFFlagUGCValidateAllowEmissivesModule (ref), createEditableInstancesForContextModule (ref), t (ref)
	local t_1
	local surfaceAppearance = p7:FindFirstChildWhichIsA("SurfaceAppearance")
	local _ = {}
	
	if surfaceAppearance == nil then
		t_1 = {
			isPBR = false,
			Texture = if p7:IsA("MeshPart") then p7.TextureContent else Content.fromUri(p7.TextureId)
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
			local editableImage, editableImage_1 = createEditableInstancesForContextModule.getEditableInstanceInfo(v, p9, "EditableImage", p8)
			
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

local function getCageData(p10, p11, p12, p13) --[[ line: 172 ]]
	-- upvalues: createEditableInstancesForContextModule (ref), getMeshSizeModule (ref)
	local referenceMeshContent, referenceOrigin
	local _ = nil
	local _ = nil
	
	if p11 or p10.ClassName ~= "WrapLayer" then
		referenceMeshContent = p10.CageMeshContent
		referenceOrigin = p10.CageOrigin
	else
		referenceMeshContent = p10.ReferenceMeshContent
		referenceOrigin = p10.ReferenceOrigin
	end
	local editableMesh, editableMesh_1 = createEditableInstancesForContextModule.getEditableInstanceInfo(referenceMeshContent, p13, "EditableMesh", p12)
	
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

local function getDataInstance_deprecated(p14, p15) --[[ line: 206 ]]
	-- upvalues: sharedDataMember (ref)
	if p14:IsA("MeshPart") or p14:IsA("Part") and p14:FindFirstChildOfClass("SpecialMesh") then
		local var23 = if p14:IsA("MeshPart") then p14 else p14:FindFirstChildOfClass("SpecialMesh")
		
		if p15 == sharedDataMember.meshTextures and (var23.ClassName == "MeshPart" and var23.TextureContent.SourceType == Enum.ContentSourceType.None or var23.ClassName == "SpecialMesh" and var23.TextureId == "") then
			return false
		elseif p15 == sharedDataMember.renderMeshesData or p15 == sharedDataMember.meshTextures then
			return true, var23
		end
		local baseWrap = p14:FindFirstChildWhichIsA("BaseWrap")
		
		if p15 == sharedDataMember.outerCagesData then
			return true, baseWrap
		elseif p15 == sharedDataMember.innerCagesData and baseWrap and baseWrap.ClassName == "WrapLayer" then
			return true, baseWrap
		end
	end
	return false
end

local function getDataInstance(p16, p17) --[[ line: 241 ]]
	-- upvalues: sharedDataMember (ref)
	local var25 = if p16:IsA("MeshPart") then p16 else p16:FindFirstChildOfClass("SpecialMesh")
	
	if var25 then
		local baseWrap = p16:FindFirstChildWhichIsA("BaseWrap")
		
		if p17 == sharedDataMember.renderMeshesData then
			return true, var25
		elseif p17 == sharedDataMember.meshTextures then
			return (var25.ClassName == "MeshPart" and var25.TextureContent.SourceType ~= Enum.ContentSourceType.None) or (var25:FindFirstChildWhichIsA("SurfaceAppearance") ~= nil or (var25.ClassName == "SpecialMesh" and var25.TextureId ~= "")), var25
		elseif p17 == sharedDataMember.outerCagesData and baseWrap then
			return baseWrap.CageMeshContent.SourceType ~= Enum.ContentSourceType.None, baseWrap
		elseif p17 == sharedDataMember.innerCagesData and baseWrap and baseWrap.ClassName == "WrapLayer" then
			return baseWrap.ReferenceMeshContent.SourceType ~= Enum.ContentSourceType.None, baseWrap
		end
	end
	return false
end

function t.getDatas(p18, p19, p20, p21, p22) --[[ line: 271 ]]
	-- upvalues: getFFlagUGCValidationAddPBRToSharedDataModule (ref), getDataInstance (ref), getDataInstance_deprecated (ref), sharedDataMember (ref), getMeshData (ref), getCageData (ref), getTextureData (ref), getTextureData_deprecated (ref), t (ref)
	local var30, var31, var32
	local t_1 = {}
	local descendants = p18:GetDescendants()
	table.insert(descendants, p18)
	
	for i, v in descendants do
		local var29 = nil
		local _ = nil
		
		if getFFlagUGCValidationAddPBRToSharedDataModule() then
			var30, var31 = getDataInstance(v, p19)
			var29 = var30
			var32 = var31
		else
			var30, var31 = getDataInstance_deprecated(v, p19)
			var29 = var30
			var32 = var31
		end
		if var29 then
			var30 = nil
			var31 = nil
			
			if p19 == sharedDataMember.renderMeshesData then
				local var33, var34 = getMeshData(var32, p20, p21)
				var30 = var33
				var31 = var34
			elseif p19 == sharedDataMember.innerCagesData or p19 == sharedDataMember.outerCagesData then
				local var39, var40 = getCageData(var32, p19 == sharedDataMember.outerCagesData, p20, p21)
				var30 = var39
				var31 = var40
			elseif p19 == sharedDataMember.meshTextures then
				if getFFlagUGCValidationAddPBRToSharedDataModule() then
					local var35, var36 = getTextureData(var32, p20, p22)
					var30 = var35
					var31 = var36
				else
					local var37, var38 = getTextureData_deprecated(var32, p20, p22)
					var30 = var37
					var31 = var38
				end
			end
			if var30 and var31 ~= nil then
				t_1[v.Name] = var31
				continue
			end
			t.cleanup(t_1)
			
			return
		end
	end
	return t_1
end

return t