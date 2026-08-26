local socialUpsell = script:FindFirstAncestor("SocialUpsell")
local signalsModule = require(socialUpsell.Parent.Signals)
local _ = require(socialUpsell.Types)
local t = { overlayType = nil, overlayProps = {} }

return function()
	-- upvalues: signalsModule (ref), t (ref)
	local var1, var2 = signalsModule.createSignal(table.clone(t))
	
	return {
		getCurrentOverlay = var1,
		setCurrentOverlay = function(value, p1)
			-- upvalues: var2 (ref)
			var2({ overlayType = value, overlayProps = p1 })
		end,
		getCurrentOverlayType = signalsModule.createComputed(function(p1)
			-- upvalues: var1 (ref)
			return var1(p1).overlayType
		end),
		dismissCurrentOverlay = function()
			-- upvalues: var2 (ref), t (copy)
			var2(table.clone(t))
		end
	}
end