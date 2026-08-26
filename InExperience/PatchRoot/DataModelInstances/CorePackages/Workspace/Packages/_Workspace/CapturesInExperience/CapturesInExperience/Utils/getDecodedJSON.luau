local httpService = game:GetService("HttpService")

return function(p1)
	-- upvalues: httpService (ref)
	local ok, status = pcall(function()
		-- upvalues: httpService (copy), p1 (ref)
		return httpService:JSONDecode(p1)
	end)
	
	if ok then
		return status
	elseif _G.__TEST_SUITE_PACKAGE__ or _G.__TESTEZ_RUNNING_TEST__ then
		return nil
	end
	warn(debug.traceback("Failed to decode JSON: " .. p0))
	
	return nil
end