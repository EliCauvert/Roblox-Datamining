local foundation = script:FindFirstAncestor("Foundation")
local reactModule = require(foundation.Parent.React)
local _ = require(foundation.Enums.ColorMode)
local _ = require(foundation.Enums.Device)
local flagsModule = require(foundation.Utility.Flags)
local _ = require(foundation.Enums.ThemeName)
local getGeneratedRulesModule = require(foundation.Utility.getGeneratedRules)

return function(p1, p2, p3)
	-- upvalues: reactModule (ref), getGeneratedRulesModule (ref), flagsModule (ref)
	return reactModule.useMemo(function()
		-- upvalues: getGeneratedRulesModule (copy), flagsModule (copy), p1 (ref), p2 (ref), p3 (ref)
		return getGeneratedRulesModule(if flagsModule.FoundationThemeName then p1 else nil, p2, p3)
	end, {
		if flagsModule.FoundationThemeName then p1 else nil,
		p2,
		p3
	})
end