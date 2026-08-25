local socialUpsell = script:FindFirstAncestor("SocialUpsell")
local signalsModule = require(socialUpsell.Parent.Signals)
local _ = require(socialUpsell.Types)
local t = { overlayType = nil, overlayProps = {} }

return function()
	-- upvalues: signalsModule (ref), t (ref)
	local var3, var4 = signalsModule.createSignal(table.clone(t))
	
	return {
		getCurrentOverlay = var3,
		setCurrentOverlay = function(value, p0)
			-- upvalues: var4 (ref)
			var4({ overlayType = value, overlayProps = p0 })
		end,
		getCurrentOverlayType = signalsModule.createComputed(function(p1)
			-- upvalues: var3 (ref)
			return var3(p1).overlayType
		end),
		dismissCurrentOverlay = function()
			-- upvalues: var4 (ref), t (copy)
			var4(table.clone(t))
		end
	}
end