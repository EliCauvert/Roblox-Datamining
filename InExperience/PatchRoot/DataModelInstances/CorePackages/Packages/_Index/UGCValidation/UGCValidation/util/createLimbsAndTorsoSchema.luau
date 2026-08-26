local parent = script.Parent.Parent
local constantsModule = require(parent.Constants)
local _ = require(parent.util.Types)
local createIndividualBodyPartSchemaModule = require(parent.util.createIndividualBodyPartSchema)

return function(p1, p2, p3)
	-- upvalues: constantsModule (ref), createIndividualBodyPartSchemaModule (ref)
	local t = { ClassName = "Folder", Name = { p2 }, _children = {} }
	
	for i in pairs(constantsModule.ASSET_TYPE_INFO[p1].subParts) do
		table.insert(t._children, createIndividualBodyPartSchemaModule(p1, i, p3))
	end
	return t
end