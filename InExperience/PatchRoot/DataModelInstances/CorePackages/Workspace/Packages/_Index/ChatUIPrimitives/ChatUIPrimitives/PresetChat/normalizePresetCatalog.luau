local tModule = require(script:FindFirstAncestor("ChatUIPrimitives").Parent.t)
local _ = require(script.Parent.Types)
local var1 = tModule.union(tModule.literal("Enabled"), tModule.literal("ReadOnly"), tModule.literal("Disabled"))
local var2 = tModule.interface({
	categories = tModule.array(tModule.interface({
		messages = tModule.array(tModule.interface({ value = tModule.string, presetId = tModule.string }))
	}))
})

return function(value)
	-- upvalues: var1 (ref), var2 (ref)
	if type(value) ~= "table" or not var1(value.accessLevel) then
		return nil
	end
	local accessLevel = value.accessLevel
	local version = value.version
	
	if accessLevel ~= "Disabled" and (type(version) ~= "string" or version == "") then
		return nil
	end
	local t = {}
	
	if type(value.categoryGroups) == "table" then
		for i, v in value.categoryGroups do
			if var2(v) then
				table.insert(t, v)
			end
		end
	end
	return {
		accessLevel = accessLevel,
		categoryGroups = t,
		version = if type(version) == "string" then version else ""
	}
end