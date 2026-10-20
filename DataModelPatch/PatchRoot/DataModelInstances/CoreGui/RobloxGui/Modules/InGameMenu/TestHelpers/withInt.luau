return function(Name, NewValue, p1)
	local SetFastIntForTestingResult = game:SetFastIntForTesting(Name, NewValue)
	local Success, Result = pcall(p1)
	game:SetFastIntForTesting(Name, SetFastIntForTestingResult)
	assert(Success, Result)
end