return function(p1, p2)
	local var1 = game:SetFastFlagForTesting(p1, true)
	local ok, status = pcall(p2)
	game:SetFastFlagForTesting(p1, var1)
	assert(ok, tostring(status))
end