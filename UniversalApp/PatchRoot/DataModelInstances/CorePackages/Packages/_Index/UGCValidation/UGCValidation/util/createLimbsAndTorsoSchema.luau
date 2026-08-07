local parent = script.Parent.Parent
local constantsModule = require(parent.Constants)
local _ = require(parent.util.Types)
local createIndividualBodyPartSchemaModule = require(parent.util.createIndividualBodyPartSchema)

return function(p0, p1, p2) --[[ line: 8 | named "createLimbsAndTorsoSchema" ]]
	-- upvalues: constantsModule (ref), createIndividualBodyPartSchemaModule (ref)
	local t = { ClassName = "Folder", Name = { p1 }, _children = {} }
	
	for i in pairs(constantsModule.ASSET_TYPE_INFO[p0].subParts) do
		table.insert(t._children, createIndividualBodyPartSchemaModule(p0, i, p2))
	end
	return t
end