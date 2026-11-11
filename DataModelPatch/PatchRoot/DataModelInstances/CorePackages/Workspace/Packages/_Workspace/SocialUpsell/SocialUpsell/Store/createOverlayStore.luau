local SocialUpsell = script:FindFirstAncestor("SocialUpsell")
local SignalsModule = require(SocialUpsell.Parent.Signals)
local _ = require(SocialUpsell.Types)
local Tbl = { overlayType = nil, overlayProps = {} }

return function()
	-- upvalues: SignalsModule (copy), Tbl (copy)
	local Signal, Signal2 = SignalsModule.createSignal(table.clone(Tbl))
	
	return {
		getCurrentOverlay = Signal,
		setCurrentOverlay = function(OverlayType, OverlayProps)
			-- upvalues: Signal2 (copy)
			Signal2({ overlayType = OverlayType, overlayProps = OverlayProps })
		end,
		getCurrentOverlayType = SignalsModule.createComputed(function(p1)
			-- upvalues: Signal (copy)
			return Signal(p1).overlayType
		end),
		dismissCurrentOverlay = function()
			-- upvalues: Signal2 (copy), Tbl (upval)
			Signal2(table.clone(Tbl))
		end
	}
end