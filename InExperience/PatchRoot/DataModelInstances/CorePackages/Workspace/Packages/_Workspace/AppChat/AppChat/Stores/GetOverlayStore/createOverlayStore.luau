local signalsModule = require(script:FindFirstAncestor("AppChat").Parent.Signals)
local t = { overlayType = nil, overlayProps = {} }

return function()
	-- upvalues: signalsModule (ref), t (ref)
	local var1, var2 = signalsModule.createSignal(table.clone(t))
	local var3, var4 = signalsModule.createSignal({})
	
	return {
		getCurrentOverlay = var1,
		showOverlay = function(p1, p2)
			-- upvalues: var2 (ref)
			var2({ overlayType = p1, overlayProps = p2 })
		end,
		dismissOverlay = function()
			-- upvalues: var2 (ref), t (copy)
			var2(table.clone(t))
		end,
		getOverlayDefaultProps = var3,
		setOverlayDefaultProps = var4
	}
end