local itemKeyRegistryModule = require(script.Parent.ItemKeyRegistry)

local function validateUnique(p0, p1)
	local t = {}
	local var3 = `{p1}: keys must be strings`
	
	for i, v in p0 do
		assert(type(v) == "string", var3)
		
		if t[v] ~= nil then
			assert(false, `{p1}: duplicate key "{v}"`)
		end
		t[v] = true
	end
	return t
end

return {
	validateUnique = validateUnique,
	keysFor = function(p2, p3)
		-- upvalues: itemKeyRegistryModule (ref), validateUnique (ref)
		local list = table.create(#p2)
		
		for i, v in p2 do
			list[i] = if p3 ~= nil then itemKeyRegistryModule.generatedKey() else p3(v, i)
		end
		return list, validateUnique(list, "DataSource")
	end
}