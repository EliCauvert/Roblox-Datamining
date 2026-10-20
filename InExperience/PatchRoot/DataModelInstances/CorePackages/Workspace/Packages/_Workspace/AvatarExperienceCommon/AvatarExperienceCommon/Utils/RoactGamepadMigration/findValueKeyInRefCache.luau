return function(Current, List)
	for i, value in List do
		if value.current == Current then
			return i
		end
	end
	return nil
end