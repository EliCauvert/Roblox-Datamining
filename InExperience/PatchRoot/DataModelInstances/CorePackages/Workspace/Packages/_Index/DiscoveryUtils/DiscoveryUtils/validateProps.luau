return function(Callback, p1) --[[ Line: 1 | Named "validateProps" ]]
	if _G.__DEV__ or _G.__DISABLE_ALL_WARNINGS_EXCEPT_PROP_VALIDATION__ then
		local CallbackResult, CallbackResult2 = Callback(p1)
		
		if not CallbackResult then
			error(`prop validation failed: {CallbackResult2}`)
		end
	end
end