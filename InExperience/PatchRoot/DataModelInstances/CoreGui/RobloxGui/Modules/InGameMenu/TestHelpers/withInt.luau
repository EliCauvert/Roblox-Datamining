return function(p0, p1, p2) --[[ line: 4 | named "withInt" ]]
	local var0 = game:SetFastIntForTesting(p0, p1)
	local ok, status = pcall(p2)
	game:SetFastIntForTesting(p0, var0)
	
	if not ok then
		error(status)
	end
end