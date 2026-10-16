local Parent = script.Parent.Parent
local ConstantsModule = require(Parent.Constants)
local _ = require(Parent.util.Types)
local GetMeshInfoModule = require(Parent.util.getMeshInfo)
local GetMeshMinMaxModule = require(Parent.util.getMeshMinMax)
local GetExpectedPartSizeModule = require(Parent.util.getExpectedPartSize)

return function(p1, p2) --[[ Line: 12 | Named "getRenderMeshScale" ]]
	-- upvalues: GetMeshInfoModule (copy), ConstantsModule (copy), GetMeshMinMaxModule (copy), GetExpectedPartSizeModule (copy)
	local MeshInfoModule, MeshInfoModule2, MeshInfoModule3 = GetMeshInfoModule(p1, ConstantsModule.MESH_CONTENT_TYPE.RENDER_MESH, p2)
	
	if not MeshInfoModule then
		return MeshInfoModule, MeshInfoModule2
	end
	local MeshMinMaxModule, MeshMinMaxModule2, MeshMinMaxModule3, MeshMinMaxModule4 = GetMeshMinMaxModule(MeshInfoModule3, p2)
	
	if MeshMinMaxModule then
		return true, nil, GetExpectedPartSizeModule(p1, p2) / (MeshMinMaxModule4 - MeshMinMaxModule3)
	else
		return MeshMinMaxModule, MeshMinMaxModule2
	end
end