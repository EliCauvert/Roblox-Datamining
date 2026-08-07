local socialUpsell = script:FindFirstAncestor("SocialUpsell")
local signalsModule = require(socialUpsell.Parent.Signals)
local _ = require(socialUpsell.Types)
local t = { overlayType = nil, overlayProps = {} }

return function() --[[ line: 19 ]]
	-- upvalues: signalsModule (ref), t (ref)
	local var3, var4 = signalsModule.createSignal(table.clone(t))
	
	return {
		getCurrentOverlay = var3,
		setCurrentOverlay = function(value, p0) --[[ line: 27 ]]
			-- upvalues: var4 (ref)
			var4({ overlayType = value, overlayProps = p0 })
		end,
		getCurrentOverlayType = signalsModule.createComputed(function(p1) --[[ line: 21 ]]
			-- upvalues: var3 (ref)
			return var3(p1).overlayType
		end),
		dismissCurrentOverlay = function() --[[ line: 34 ]]
			-- upvalues: var4 (ref), t (copy)
			var4(table.clone(t))
		end
	}
end