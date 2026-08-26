local parent = script.Parent.Parent
local constantsModule = require(parent.Constants)
local _ = require(parent.util.Types)
local getEditableMeshFromContextModule = require(parent.util.getEditableMeshFromContext)

local function getContent(p1, p2)
	-- upvalues: constantsModule (ref)
	if p2 == constantsModule.MESH_CONTENT_TYPE.RENDER_MESH then
		assert(p1:IsA("MeshPart"), "Only MESH_TYPE.RENDER_MESH is only supported for MeshPart")
		
		return p1.MeshId
	elseif p2 == constantsModule.MESH_CONTENT_TYPE.OUTER_CAGE then
		assert(p1:IsA("BaseWrap"), "Only MESH_TYPE.OUTER_CAGE is only supported for BaseWrap")
		
		return p1.CageMeshId
	elseif p2 == constantsModule.MESH_CONTENT_TYPE.INNER_CAGE then
		assert(p1:IsA("WrapLayer"), "Only MESH_TYPE.INNER_CAGE is only supported for WrapLayer")
		
		return p1.ReferenceMeshId
	end
	error("No valid mesh content type was provided")
end

return function(p1, p2, p3)
	-- upvalues: getContent (ref), constantsModule (ref), getEditableMeshFromContextModule (ref)
	local var1 = getContent(p1, p2)
	local fullName = p1:GetFullName()
	local var2 = constantsModule.MESH_CONTENT_TYPE_TO_FIELD_NAME[p2]
	local var3, var4 = getEditableMeshFromContextModule(p1, var2, p3)
	
	if var3 then
		return true, nil, {
			fullName = fullName,
			fieldName = var2,
			contentId = var1,
			context = p1.ClassName,
			editableMesh = var4
		}
	end
	return false, {
		string.format("Mesh for '%s' failed to load. Make sure the mesh exists and try again.", fullName)
	}
end