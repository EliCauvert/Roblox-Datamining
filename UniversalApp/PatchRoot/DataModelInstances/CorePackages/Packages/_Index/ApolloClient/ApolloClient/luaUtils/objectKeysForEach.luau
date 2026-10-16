return function(List, Callback: (any) -> ()) --[[ Line: 7 ]]
	for i, _ in List do
		Callback(i)
	end
end