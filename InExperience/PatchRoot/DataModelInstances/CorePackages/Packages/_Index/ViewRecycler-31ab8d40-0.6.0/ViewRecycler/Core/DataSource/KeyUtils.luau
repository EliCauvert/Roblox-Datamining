local ItemKeyRegistryModule = require(script.Parent.ItemKeyRegistry)

local function validateUnique(DKeys, p1) --[[ Line: 5 ]]
	local t = {}
	local Message: string = `{p1}: keys must be strings`
	
	for _, dKey in DKeys do
		assert(type(dKey) == "string", Message)
		
		if t[dKey] ~= nil then
			assert(false, `{p1}: duplicate key "{dKey}"`)
		end
		t[dKey] = true
	end
	return t
end

return {
	validateUnique = validateUnique,
	keysFor = function(List, Callback) --[[ Line: 18 ]]
		-- upvalues: ItemKeyRegistryModule (copy), validateUnique (copy)
		local Buffer = table.create(#List)
		
		for i, value in List do
			Buffer[i] = if Callback == nil then ItemKeyRegistryModule.generatedKey() else Callback(value, i)
		end
		return Buffer, (validateUnique(Buffer, "DataSource"))
	end
}