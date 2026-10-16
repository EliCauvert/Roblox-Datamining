return function(Callback: () -> ()) --[[ Line: 16 | Named "exitCreationFlow" ]]
	if Callback then
		Callback()
	end
end