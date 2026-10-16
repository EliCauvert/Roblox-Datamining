local Parent = script.Parent.Parent
local _ = require(Parent.util.Types)
local GetEditableMeshFromContextModule = require(Parent.util.getEditableMeshFromContext)
local GetMeshSizeModule = require(Parent.util.getMeshSize)
local PcallDeferredModule = require(Parent.util.pcallDeferred)

return function(Object, p1, p2) --[[ Line: 8 ]]
	-- upvalues: GetEditableMeshFromContextModule (copy), PcallDeferredModule (copy), GetMeshSizeModule (copy)
	if not p1.bypassFlags or not p1.bypassFlags.skipPhysicsDataReset then
		return if p2 then Object.MeshSize else Object.Size
	end
	if not p1.partSizes then
		p1.partSizes = {}
	end
	if p1.partSizes[Object] then
		return p1.partSizes[Object]
	end
	local config = {
		fieldName = "MeshId",
		fullName = Object:GetFullName(),
		contentId = Object.MeshId,
		context = Object.Name
	}
	local MeshId, MeshId2 = GetEditableMeshFromContextModule(Object, "MeshId", p1)
	
	if not MeshId then
		return if p2 then Object.MeshSize else Object.Size
	end
	config.editableMesh = MeshId2
	
	if p1.editableMeshes[Object].MeshId.created then
		return if p2 then Object.MeshSize else Object.Size
	end
	local PcallDeferredModuleResult, PcallDeferredModuleResult2 = PcallDeferredModule(function() --[[ Line: 40 ]]
		-- upvalues: GetMeshSizeModule (upval), config (copy)
		return GetMeshSizeModule(config)
	end, p1)
	
	if PcallDeferredModuleResult then
		p1.partSizes[Object] = PcallDeferredModuleResult2
		
		return PcallDeferredModuleResult2
	else
		return if p2 then Object.MeshSize else Object.Size
	end
end