return function(p1, p2)
	if _G.__DEV__ or _G.__DISABLE_ALL_WARNINGS_EXCEPT_PROP_VALIDATION__ then
		local var1, var2 = p1(p2)
		
		if not var1 then
			error(`prop validation failed: {var2}`)
		end
	end
end