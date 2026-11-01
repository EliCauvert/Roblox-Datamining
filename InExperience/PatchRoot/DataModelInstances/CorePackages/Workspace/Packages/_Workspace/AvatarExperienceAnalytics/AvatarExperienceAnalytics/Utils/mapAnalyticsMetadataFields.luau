local FFlagAXUnifiedEventStrictPayloads = require(script:FindFirstAncestor("AvatarExperienceAnalytics").Parent.AvatarExperienceFlags).FFlagAXUnifiedEventStrictPayloads
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

for _, value in list do
	for _, alias in value.aliases do
		t[alias] = true
	end
end
return function(List, p1)
	-- upvalues: FFlagAXUnifiedEventStrictPayloads (copy), t (copy), list (copy)
	local t1 = {}
	
	if List == nil then
		return t1
	end
	for i, value in List do
		if FFlagAXUnifiedEventStrictPayloads and p1 and t[i] then
			t1[i] = value
		end
		if not t[i] then
			t1[i] = value
		end
	end
	for _, value1 in list do
		if t1[value1.protoKey] == nil then
			for _, alias in value1.aliases do
				if List[alias] ~= nil then
					t1[value1.protoKey] = List[alias]
					break
				end
			end
		end
	end
	return t1
end