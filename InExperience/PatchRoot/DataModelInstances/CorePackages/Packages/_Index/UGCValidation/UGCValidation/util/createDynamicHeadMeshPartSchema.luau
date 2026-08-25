local parent = script.Parent.Parent
local _ = require(parent.util.Types)
local createIndividualBodyPartSchemaModule = require(parent.util.createIndividualBodyPartSchema)

return function(p0)
	-- upvalues: createIndividualBodyPartSchemaModule (ref)
	local var1 = createIndividualBodyPartSchemaModule(Enum.AssetType.DynamicHead, "Head", p0)
	table.insert(var1._children, { ClassName = "FaceControls", Name = { "FaceControls" } })
	
	return var1
end