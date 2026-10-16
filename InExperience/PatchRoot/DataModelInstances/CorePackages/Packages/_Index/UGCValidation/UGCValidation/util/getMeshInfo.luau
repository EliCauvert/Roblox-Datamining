local Parent = script.Parent.Parent
local ConstantsModule = require(Parent.Constants)
local _ = require(Parent.util.Types)
local GetEditableMeshFromContextModule = require(Parent.util.getEditableMeshFromContext)

local function getContent(Object, INNERCAGE) --[[ Line: 12 ]]
	-- upvalues: ConstantsModule (copy)
	if INNERCAGE == ConstantsModule.MESH_CONTENT_TYPE.RENDER_MESH then
		assert(Object:IsA("MeshPart"), "Only MESH_TYPE.RENDER_MESH is only supported for MeshPart")
		
		return Object.MeshId
	elseif INNERCAGE == ConstantsModule.MESH_CONTENT_TYPE.OUTER_CAGE then
		assert(Object:IsA("BaseWrap"), "Only MESH_TYPE.OUTER_CAGE is only supported for BaseWrap")
		
		return Object.CageMeshId
	elseif INNERCAGE ~= ConstantsModule.MESH_CONTENT_TYPE.INNER_CAGE then
		error("No valid mesh content type was provided")
		
		return
	else
		assert(Object:IsA("WrapLayer"), "Only MESH_TYPE.INNER_CAGE is only supported for WrapLayer")
		
		return Object.ReferenceMeshId
	end
end

return function(Object, p1, p2) --[[ Line: 27 | Named "getMeshInfo" ]]
	-- upvalues: getContent (copy), ConstantsModule (copy), GetEditableMeshFromContextModule (copy)
	local Content = getContent(Object, p1)
	local FullName = Object:GetFullName()
	local MESHCONTENTTYPETOFIELDNAMEEntry = ConstantsModule.MESH_CONTENT_TYPE_TO_FIELD_NAME[p1]
	local EditableMeshFromContextModule, EditableMeshFromContextModule2 = GetEditableMeshFromContextModule(Object, MESHCONTENTTYPETOFIELDNAMEEntry, p2)
	
	if EditableMeshFromContextModule then
		return true, nil, {
			fullName = FullName,
			fieldName = MESHCONTENTTYPETOFIELDNAMEEntry,
			contentId = Content,
			context = Object.ClassName,
			editableMesh = EditableMeshFromContextModule2
		}
	else
		return false, {
			string.format("Mesh for '%s' failed to load. Make sure the mesh exists and try again.", FullName)
		}
	end
end