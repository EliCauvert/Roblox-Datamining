return function(List, Callback: (any, any) -> ())
	for i, value in List do
		Callback(value, i)
	end
end