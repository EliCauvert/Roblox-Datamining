return function(p1, Callback, Prefix, SearchQuery, p2)
	if p1 == nil or p1.prefix ~= Prefix then
		return nil
	end
	local CallbackResult = Callback(p1)
	
	if CallbackResult == nil then
		return nil
	else
		local Entry = CallbackResult.entries[p2]
		
		return if Entry == nil or Entry.searchQuery ~= SearchQuery then nil else { entries = CallbackResult.entries, entry = Entry }
	end
end