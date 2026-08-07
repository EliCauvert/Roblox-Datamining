return function(p0, p1) --[[ line: 1 | named "validateProps" ]]
	if _G.__DEV__ or _G.__DISABLE_ALL_WARNINGS_EXCEPT_PROP_VALIDATION__ then
		local var0, var1 = p0(p1)
		
		if not var0 then
			error(`prop validation failed: {var1}`)
		end
	end
end