local httpService = game:GetService("HttpService")
local var1 = httpService:GenerateGUID()
local var2 = nil
local processTime = os.clock()

local function _() --[[ line: 12 | named "getLandingPageTiming" ]]
	-- upvalues: var2 (write), processTime (write), var1 (ref)
	return if var2 then {
		app_session = var1,
		landing_page_session = var2,
		duration = os.clock() - processTime
	} else nil
end

return {
	landingPageLoadStart = function() --[[ line: 32 ]]
		-- upvalues: var2 (write), httpService (ref), processTime (write)
		var2 = httpService:GenerateGUID()
		processTime = os.clock()
	end,
	landingPageLoadFinish = function() --[[ line: 41 ]]
		-- upvalues: var2 (write), processTime (write), var1 (ref)
		local var4 = if not var2 then nil else {
			app_session = var1,
			landing_page_session = var2,
			duration = os.clock() - processTime
		}
		var2 = nil
		
		return var4
	end
}