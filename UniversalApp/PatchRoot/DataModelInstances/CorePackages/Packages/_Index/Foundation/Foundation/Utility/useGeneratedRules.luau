local foundation = script:FindFirstAncestor("Foundation")
local reactModule = require(foundation.Parent.React)
local _ = require(foundation.Enums.Device)
local _ = require(foundation.Enums.Theme)
local getGeneratedRulesModule = require(foundation.Utility.getGeneratedRules)

return function(p0, p1) --[[ line: 11 | named "useGeneratedRules" ]]
	-- upvalues: reactModule (ref), getGeneratedRulesModule (ref)
	return reactModule.useMemo(function() --[[ line: 12 ]]
		-- upvalues: getGeneratedRulesModule (copy), p0 (ref), p1 (ref)
		return getGeneratedRulesModule(p0, p1)
	end, { p0, p1 })
end