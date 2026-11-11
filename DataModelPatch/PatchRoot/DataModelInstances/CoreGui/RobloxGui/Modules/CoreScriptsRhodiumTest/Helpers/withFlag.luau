return function(Name, p1)
	local SetFastFlagForTestingResult = game:SetFastFlagForTesting(Name, true)
	local Success, Result = pcall(p1)
	game:SetFastFlagForTesting(Name, SetFastFlagForTestingResult)
	assert(Success, (tostring(Result)))
end