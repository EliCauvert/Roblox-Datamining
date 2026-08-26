local logger = require(script.Parent.Parent.Parent.Loggers).Logger
local httpService = game:GetService("HttpService")

local function _(p1)
	if not p1 then
		p1 = {}
	end
	p1.packageName = "IAPExperience"
	
	return p1
end

return {
	debug = function(p1)
		-- upvalues: logger (ref), httpService (ref)
		p1 = p1 or {}
		p1.packageName = "IAPExperience"
		logger:debug(httpService:JSONEncode(p1))
	end,
	info = function(p1)
		-- upvalues: logger (ref), httpService (ref)
		p1 = p1 or {}
		p1.packageName = "IAPExperience"
		logger:info(httpService:JSONEncode(p1))
	end,
	warn = function(p1)
		-- upvalues: logger (ref), httpService (ref)
		p1 = p1 or {}
		p1.packageName = "IAPExperience"
		logger:warn(httpService:JSONEncode(p1))
	end,
	error = function(p1)
		-- upvalues: logger (ref), httpService (ref)
		p1 = p1 or {}
		p1.packageName = "IAPExperience"
		logger:error(httpService:JSONEncode(p1))
	end
}