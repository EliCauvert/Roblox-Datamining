local HttpService = game:GetService("HttpService")

return function(Text) --[[ Line: 3 | Named "getDecodedJSON" ]]
	-- upvalues: HttpService (copy)
	local Success, Result = pcall(function() --[[ Line: 4 ]]
		-- upvalues: HttpService (upval), Text (copy)
		return HttpService:JSONDecode(Text)
	end)
	
	if Success then
		return Result
	elseif _G.__TEST_SUITE_PACKAGE__ or _G.__TESTEZ_RUNNING_TEST__ then
		return nil
	else
		warn(debug.traceback("Failed to decode JSON: " .. Text))
		
		return nil
	end
end