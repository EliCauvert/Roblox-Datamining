return function(p0, p1)
	local var0 = game:SetFastFlagForTesting(p0, true)
	local ok, status = pcall(p1)
	game:SetFastFlagForTesting(p0, var0)
	assert(ok, tostring(status))
end