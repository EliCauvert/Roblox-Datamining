local t = {
	sort = "sortEnumValue",
	filterSalesType = "filterSalesTypeEnumValue",
	filterCreators = "filterCreatorsTypeEnumValue",
	filterPrice = "filterPriceEnumValue",
	filterUnavailableItems = "filterUnavailableItemsEnumValue"
}

return function(p1)
	-- upvalues: t (ref)
	if type(p1) ~= "table" then
		return p1
	end
	local cloned = table.clone(p1)
	
	for i, v in t do
		local var1 = p1[i]
		
		if var1 ~= nil then
			cloned[v] = var1
		end
	end
	return cloned
end