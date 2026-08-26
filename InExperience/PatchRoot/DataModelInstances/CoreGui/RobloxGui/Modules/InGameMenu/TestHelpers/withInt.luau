return function(p1, p2, p3)
	local var1 = game:SetFastIntForTesting(p1, p2)
	local ok, status = pcall(p3)
	game:SetFastIntForTesting(p1, var1)
	
	if not ok then
		error(status)
	end
end