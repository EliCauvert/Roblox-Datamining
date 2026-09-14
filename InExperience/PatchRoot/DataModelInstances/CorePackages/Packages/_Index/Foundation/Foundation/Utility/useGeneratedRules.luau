local foundation = script:FindFirstAncestor("Foundation")
local reactModule = require(foundation.Parent.React)
local _ = require(foundation.Enums.ColorMode)
local _ = require(foundation.Enums.Device)
local _ = require(foundation.Enums.ThemeName)
local getGeneratedRulesModule = require(foundation.Utility.getGeneratedRules)

return function(p1, p2, p3)
	-- upvalues: reactModule (ref), getGeneratedRulesModule (ref)
	return reactModule.useMemo(function()
		-- upvalues: getGeneratedRulesModule (copy), p1 (ref), p2 (ref), p3 (ref)
		return getGeneratedRulesModule(p1, p2, p3)
	end, { p1, p2, p3 })
end