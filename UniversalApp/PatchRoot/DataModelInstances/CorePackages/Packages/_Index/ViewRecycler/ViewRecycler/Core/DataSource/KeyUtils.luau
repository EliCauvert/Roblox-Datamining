local itemKeyRegistryModule = require(script.Parent.ItemKeyRegistry)

local function validateUnique(p1, p2)
	local t = {}
	local var1 = `{p2}: keys must be strings`
	
	for i, v in p1 do
		assert(type(v) == "string", var1)
		
		if t[v] ~= nil then
			assert(false, `{p2}: duplicate key "{v}"`)
		end
		t[v] = true
	end
	return t
end

return {
	validateUnique = validateUnique,
	keysFor = function(p3, p4)
		-- upvalues: itemKeyRegistryModule (ref), validateUnique (ref)
		local list = table.create(#p3)
		
		for i, v in p3 do
			list[i] = if p4 ~= nil then itemKeyRegistryModule.generatedKey() else p4(v, i)
		end
		return list, validateUnique(list, "DataSource")
	end
}