return function(Name, NewValue, p1)
	local SetFastIntForTestingResult = game:SetFastIntForTesting(Name, NewValue)
	local Success, Result = pcall(p1)
	game:SetFastIntForTesting(Name, SetFastIntForTestingResult)
	
	if not Success then
		error(Result)
	end
end