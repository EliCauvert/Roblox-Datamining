local Logger = require(script.Parent.Parent.Parent.Loggers).Logger
local HttpService = game:GetService("HttpService")

local function _(p1) --[[ Line: 9 | Named "attachPackageName" ]]
	if not p1 then
		p1 = {}
	end
	p1.packageName = "IAPExperience"
	
	return p1
end

return {
	debug = function(p1) --[[ Line: 17 ]]
		-- upvalues: Logger (copy), HttpService (copy)
		local P1 = p1 or {}
		P1.packageName = "IAPExperience"
		Logger:debug(HttpService:JSONEncode(P1))
	end,
	info = function(p1) --[[ Line: 20 ]]
		-- upvalues: Logger (copy), HttpService (copy)
		local P2 = p1 or {}
		P2.packageName = "IAPExperience"
		Logger:info(HttpService:JSONEncode(P2))
	end,
	warn = function(p1) --[[ Line: 23 ]]
		-- upvalues: Logger (copy), HttpService (copy)
		local P3 = p1 or {}
		P3.packageName = "IAPExperience"
		Logger:warn(HttpService:JSONEncode(P3))
	end,
	error = function(p1) --[[ Line: 26 ]]
		-- upvalues: Logger (copy), HttpService (copy)
		local P4 = p1 or {}
		P4.packageName = "IAPExperience"
		Logger:error(HttpService:JSONEncode(P4))
	end
}