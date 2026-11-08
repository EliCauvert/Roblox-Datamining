local Parent = script:FindFirstAncestor("DictationCore").Parent
local ReactModule = require(Parent.React)
local FoundationModule = require(Parent.Foundation)

local function toPercent(Value: number): number
	return math.clamp(Value, 0, 1) * 100
end

return ReactModule.memo(function(p1)
	-- upvalues: ReactModule (copy), toPercent (copy), FoundationModule (copy)
	return ReactModule.createElement(FoundationModule.Progress, {
		tag = "position-center-center anchor-center-center",
		ZIndex = 2,
		shape = FoundationModule.Enums.ProgressShape.Circle,
		size = FoundationModule.Enums.ProgressSize.Medium,
		value = ReactModule.useMemo(function()
			-- upvalues: p1 (copy), toPercent (upval)
			return p1.countdownProgress:map(toPercent)
		end, { p1.countdownProgress })
	})
end)