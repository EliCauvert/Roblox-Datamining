local Parent = script.Parent.Parent
local ConstantsModule = require(Parent.Constants)
local _ = require(Parent.util.Types)
local CreateIndividualBodyPartSchemaModule = require(Parent.util.createIndividualBodyPartSchema)

return function(p1, p2, p3) --[[ Line: 8 | Named "createLimbsAndTorsoSchema" ]]
	-- upvalues: ConstantsModule (copy), CreateIndividualBodyPartSchemaModule (copy)
	local config = { ClassName = "Folder", Name = { p2 }, _children = {} }
	
	for subPart in pairs(ConstantsModule.ASSET_TYPE_INFO[p1].subParts) do
		table.insert(config._children, (CreateIndividualBodyPartSchemaModule(p1, subPart, p3)))
	end
	return config
end