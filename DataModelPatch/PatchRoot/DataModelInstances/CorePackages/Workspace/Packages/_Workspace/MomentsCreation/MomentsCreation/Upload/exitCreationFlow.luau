return function(Callback: () -> ())
	if Callback then
		Callback()
	end
end