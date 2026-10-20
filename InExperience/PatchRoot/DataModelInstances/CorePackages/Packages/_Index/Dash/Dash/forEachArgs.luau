return function(Callback: (any, any) -> (), ...)
	for i = 1, select("#", ...) do
		Callback(select(i, ...), i)
	end
end