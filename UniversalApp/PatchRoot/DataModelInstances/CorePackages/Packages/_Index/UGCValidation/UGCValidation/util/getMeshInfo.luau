local parent = script.Parent.Parent
local constantsModule = require(parent.Constants)
local _ = require(parent.util.Types)
local getEditableMeshFromContextModule = require(parent.util.getEditableMeshFromContext)

local function getContent(p0, p1)
	-- upvalues: constantsModule (ref)
	if p1 == constantsModule.MESH_CONTENT_TYPE.RENDER_MESH then
		assert(p0:IsA("MeshPart"), "Only MESH_TYPE.RENDER_MESH is only supported for MeshPart")
		
		return p0.MeshId
	elseif p1 == constantsModule.MESH_CONTENT_TYPE.OUTER_CAGE then
		assert(p0:IsA("BaseWrap"), "Only MESH_TYPE.OUTER_CAGE is only supported for BaseWrap")
		
		return p0.CageMeshId
	elseif p1 == constantsModule.MESH_CONTENT_TYPE.INNER_CAGE then
		assert(p0:IsA("WrapLayer"), "Only MESH_TYPE.INNER_CAGE is only supported for WrapLayer")
		
		return p0.ReferenceMeshId
	end
	error("No valid mesh content type was provided")
end

return function(p2, p3, p4)
	-- upvalues: getContent (ref), constantsModule (ref), getEditableMeshFromContextModule (ref)
	local var3 = getContent(p2, p3)
	local fullName = p2:GetFullName()
	local var5 = constantsModule.MESH_CONTENT_TYPE_TO_FIELD_NAME[p3]
	local var6, var7 = getEditableMeshFromContextModule(p2, var5, p4)
	
	if var6 then
		return true, nil, {
			fullName = fullName,
			fieldName = var5,
			contentId = var3,
			context = p2.ClassName,
			editableMesh = var7
		}
	end
	return false, {
		string.format("Mesh for '%s' failed to load. Make sure the mesh exists and try again.", fullName)
	}
end