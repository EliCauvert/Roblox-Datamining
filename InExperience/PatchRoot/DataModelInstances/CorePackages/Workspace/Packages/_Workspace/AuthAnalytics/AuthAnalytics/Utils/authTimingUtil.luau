local httpService = game:GetService("HttpService")
local var1 = httpService:GenerateGUID()
local var2 = nil
local processTime = os.clock()

local function _()
	-- upvalues: var2 (write), processTime (write), var1 (ref)
	return if var2 then {
		app_session = var1,
		landing_page_session = var2,
		duration = os.clock() - processTime
	} else nil
end

return {
	landingPageLoadStart = function()
		-- upvalues: var2 (write), httpService (ref), processTime (write)
		var2 = httpService:GenerateGUID()
		processTime = os.clock()
	end,
	landingPageLoadFinish = function()
		-- upvalues: var2 (write), processTime (write), var1 (ref)
		local var3 = if not var2 then nil else {
			app_session = var1,
			landing_page_session = var2,
			duration = os.clock() - processTime
		}
		var2 = nil
		
		return var3
	end
}