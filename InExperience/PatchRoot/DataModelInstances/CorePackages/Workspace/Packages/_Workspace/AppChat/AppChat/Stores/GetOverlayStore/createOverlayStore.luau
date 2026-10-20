local SignalsModule = require(script:FindFirstAncestor("AppChat").Parent.Signals)
local Tbl = { overlayType = nil, overlayProps = {} }

return function()
	-- upvalues: SignalsModule (copy), Tbl (copy)
	local Signal, Signal2 = SignalsModule.createSignal(table.clone(Tbl))
	local Signal1, Signal2_1 = SignalsModule.createSignal({})
	
	return {
		getCurrentOverlay = Signal,
		showOverlay = function(OverlayType, OverlayProps)
			-- upvalues: Signal2 (copy)
			Signal2({ overlayType = OverlayType, overlayProps = OverlayProps })
		end,
		dismissOverlay = function()
			-- upvalues: Signal2 (copy), Tbl (upval)
			Signal2(table.clone(Tbl))
		end,
		getOverlayDefaultProps = Signal1,
		setOverlayDefaultProps = Signal2_1
	}
end