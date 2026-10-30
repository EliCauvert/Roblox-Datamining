local ThemeBackground = script:FindFirstAncestor("ThemeBackground")
local SignalsModule = require(ThemeBackground.Parent.Signals)
local _ = require(ThemeBackground.ThemeBackgroundTypes)
local Frozen = table.freeze({ position = Vector2.zero, size = Vector2.zero })

return function()
	-- upvalues: SignalsModule (copy), Frozen (copy)
	local Signal, Signal2 = SignalsModule.createSignal(nil)
	local Signal1, Signal2_1 = SignalsModule.createSignal(Frozen)
	
	return {
		getThemeBackground = Signal,
		getGeometry = Signal1,
		setThemeBackground = function(p1)
			-- upvalues: Signal2 (copy)
			Signal2(p1)
		end,
		setGeometry = function(p1)
			-- upvalues: Signal2_1 (copy)
			Signal2_1(p1)
		end,
		reset = function()
			-- upvalues: Signal2 (copy), Signal2_1 (copy), Frozen (upval)
			Signal2(nil)
			Signal2_1(Frozen)
		end
	}
end