local HttpService = game:GetService("HttpService")
local Guid = HttpService:GenerateGUID()
local Guid1 = nil
local ClockTime = os.clock()

local function _()
	-- upvalues: Guid1 (ref), ClockTime (ref), Guid (copy)
	local ClockTime1 = os.clock()
	
	return if Guid1 then {
		app_session = Guid,
		landing_page_session = Guid1,
		duration = ClockTime1 - ClockTime
	} else nil
end

return {
	landingPageLoadStart = function()
		-- upvalues: Guid1 (ref), HttpService (copy), ClockTime (ref)
		Guid1 = HttpService:GenerateGUID()
		ClockTime = os.clock()
	end,
	landingPageLoadFinish = function()
		-- upvalues: Guid1 (ref), ClockTime (ref), Guid (copy)
		local ClockTime1 = os.clock()
		Guid1 = nil
		
		return if Guid1 then {
			app_session = Guid,
			landing_page_session = Guid1,
			duration = ClockTime1 - ClockTime
		} else nil
	end
}