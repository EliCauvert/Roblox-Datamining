local logger = require(script.Parent.Parent.Parent.Loggers).Logger
local httpService = game:GetService("HttpService")

local function _(p0) --[[ line: 9 | named "attachPackageName" ]]
	if not p0 then
		p0 = {}
	end
	p0.packageName = "IAPExperience"
	
	return p0
end

return {
	debug = function(p1) --[[ line: 17 ]]
		-- upvalues: logger (ref), httpService (ref)
		p1 = p1 or {}
		p1.packageName = "IAPExperience"
		logger:debug(httpService:JSONEncode(p1))
	end,
	info = function(p2) --[[ line: 20 ]]
		-- upvalues: logger (ref), httpService (ref)
		p2 = p2 or {}
		p2.packageName = "IAPExperience"
		logger:info(httpService:JSONEncode(p2))
	end,
	warn = function(p3) --[[ line: 23 ]]
		-- upvalues: logger (ref), httpService (ref)
		p3 = p3 or {}
		p3.packageName = "IAPExperience"
		logger:warn(httpService:JSONEncode(p3))
	end,
	error = function(p4) --[[ line: 26 ]]
		-- upvalues: logger (ref), httpService (ref)
		p4 = p4 or {}
		p4.packageName = "IAPExperience"
		logger:error(httpService:JSONEncode(p4))
	end
}