return function(List, Callback: (any) -> ())
	for i, _ in List do
		Callback(i)
	end
end