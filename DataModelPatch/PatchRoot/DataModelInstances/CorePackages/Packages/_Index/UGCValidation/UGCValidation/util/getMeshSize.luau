local UGCValidationService = game:GetService("UGCValidationService")
local _ = require(script.Parent.Parent.util.Types)

return function(p1): Vector3
	-- upvalues: UGCValidationService (copy)
	local EditableMeshVerts = UGCValidationService:GetEditableMeshVerts(p1.editableMesh)
	local Smallest = 1e999
	local Largest = -1e999
	local Smallest1 = 1e999
	local Largest1 = -1e999
	local Smallest2 = 1e999
	local Largest2 = -1e999
	
	for i = 1, #EditableMeshVerts do
		local EditableMeshVert = EditableMeshVerts[i]
		Smallest = math.min(Smallest, EditableMeshVert.X)
		Smallest1 = math.min(Smallest1, EditableMeshVert.Y)
		Smallest2 = math.min(Smallest2, EditableMeshVert.Z)
		Largest = math.max(Largest, EditableMeshVert.X)
		Largest1 = math.max(Largest1, EditableMeshVert.Y)
		Largest2 = math.max(Largest2, EditableMeshVert.Z)
	end
	return (Vector3.new(Largest - Smallest, Largest1 - Smallest1, Largest2 - Smallest2))
end