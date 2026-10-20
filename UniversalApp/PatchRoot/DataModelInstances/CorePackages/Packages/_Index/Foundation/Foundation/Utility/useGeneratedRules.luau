local Foundation = script:FindFirstAncestor("Foundation")
local ReactModule = require(Foundation.Parent.React)
local _ = require(Foundation.Enums.ColorMode)
local _ = require(Foundation.Enums.Device)
local _ = require(Foundation.Enums.ThemeName)
local GetGeneratedRulesModule = require(Foundation.Utility.getGeneratedRules)

return function(p1, p2, p3)
	-- upvalues: ReactModule (copy), GetGeneratedRulesModule (copy)
	return ReactModule.useMemo(function()
		-- upvalues: GetGeneratedRulesModule (upval), p1 (copy), p2 (copy), p3 (copy)
		return GetGeneratedRulesModule(p1, p2, p3)
	end, { p1, p2, p3 })
end