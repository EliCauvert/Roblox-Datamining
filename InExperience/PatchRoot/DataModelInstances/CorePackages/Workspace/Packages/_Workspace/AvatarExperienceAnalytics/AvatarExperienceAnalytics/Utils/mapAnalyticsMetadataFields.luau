local list = {
	{ protoKey = "sort", aliases = { "sortEnumValue" } },
	{
		protoKey = "filterSalesType",
		aliases = { "filterSalesTypeEnumValue" }
	},
	{
		protoKey = "filterCreators",
		aliases = { "filterCreatorsType", "filterCreatorsTypeEnumValue" }
	},
	{
		protoKey = "filterPrice",
		aliases = { "filterPriceEnumValue" }
	},
	{
		protoKey = "filterUnavailableItems",
		aliases = { "filterUnavailableItemsEnumValue" }
	}
}
local t = {}

for i, v in list do
	for i_1, v_1 in v.aliases do
		t[v_1] = true
	end
end
return function(p1)
	-- upvalues: t (ref), list (ref)
	local t_1 = {}
	
	if p1 == nil then
		return t_1
	end
	for i, v in p1 do
		if not t[i] then
			t_1[i] = v
		end
	end
	for i_1, v_1 in list do
		if t_1[v_1.protoKey] == nil then
			for i_2, v_2 in v_1.aliases do
				if p1[v_2] ~= nil then
					t_1[v_1.protoKey] = p1[v_2]
					continue
				end
			end
		end
	end
	return t_1
end