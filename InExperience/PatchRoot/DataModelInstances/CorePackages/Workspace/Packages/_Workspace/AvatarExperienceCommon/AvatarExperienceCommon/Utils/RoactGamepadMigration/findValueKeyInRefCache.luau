return function(Current, List) --[[ Line: 1 | Named "findValueKeyInRefCache" ]]
	for i, value in List do
		if value.current == Current then
			return i
		end
	end
	return nil
end