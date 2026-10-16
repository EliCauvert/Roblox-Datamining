return function(List) --[[ Line: 3 | Named "getCommonItemStatus" ]]
	local v1 = nil
	
	for _, value in List do
		if v1 ~= nil and value ~= v1 then
			return nil
		elseif v1 == nil then
			v1 = value
		end
	end
	return v1
end