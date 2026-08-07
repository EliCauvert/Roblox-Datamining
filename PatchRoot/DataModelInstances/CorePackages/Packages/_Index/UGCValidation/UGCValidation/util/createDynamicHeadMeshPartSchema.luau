-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:32:38 2026 Pacific Standard Time.

local parent = script.Parent.Parent
local _ = require(parent.util.Types)
local createIndividualBodyPartSchemaModule = require(parent.util.createIndividualBodyPartSchema)

return function(p0) --[[ line: 7 | named "createDynamicHeadMeshPartSchema" ]]
	-- upvalues: createIndividualBodyPartSchemaModule (ref)
	local var1 = createIndividualBodyPartSchemaModule(Enum.AssetType.DynamicHead, "Head", p0)
	table.insert(var1._children, { ClassName = "FaceControls", Name = { "FaceControls" } })
	
	return var1
end