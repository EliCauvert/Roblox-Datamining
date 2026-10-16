return function(List, Callback: (any, any) -> ()) --[[ Line: 12 | Named "forEach" ]]
	for i, value in List do
		Callback(value, i)
	end
end