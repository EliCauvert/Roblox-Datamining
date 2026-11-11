local Parent = script.Parent.Parent
local _ = require(Parent.util.Types)
local CreateIndividualBodyPartSchemaModule = require(Parent.util.createIndividualBodyPartSchema)

return function(p1)
	-- upvalues: CreateIndividualBodyPartSchemaModule (copy)
	local Head = CreateIndividualBodyPartSchemaModule(Enum.AssetType.DynamicHead, "Head", p1)
	table.insert(Head._children, { ClassName = "FaceControls", Name = { "FaceControls" } })
	
	return Head
end