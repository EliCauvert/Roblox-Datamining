local config = {
	sort = "sortEnumValue",
	filterSalesType = "filterSalesTypeEnumValue",
	filterCreators = "filterCreatorsTypeEnumValue",
	filterPrice = "filterPriceEnumValue",
	filterUnavailableItems = "filterUnavailableItemsEnumValue"
}

return function(Tbl)
	-- upvalues: config (copy)
	if type(Tbl) ~= "table" then
		return Tbl
	end
	local Copy = table.clone(Tbl)
	
	for i, value in config do
		local Entry = Tbl[i]
		
		if Entry ~= nil then
			Copy[value] = Entry
		end
	end
	return Copy
end