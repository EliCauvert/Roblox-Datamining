local signalsModule = require(script:FindFirstAncestor("AppChat").Parent.Signals)
local t = { overlayType = nil, overlayProps = {} }

return function() --[[ line: 32 | named "createOverlayStore" ]]
	-- upvalues: signalsModule (ref), t (ref)
	local var2, var3 = signalsModule.createSignal(table.clone(t))
	local var4, var5 = signalsModule.createSignal({})
	
	return {
		getCurrentOverlay = var2,
		showOverlay = function(p0, p1) --[[ line: 38 ]]
			-- upvalues: var3 (ref)
			var3({ overlayType = p0, overlayProps = p1 })
		end,
		dismissOverlay = function() --[[ line: 44 ]]
			-- upvalues: var3 (ref), t (copy)
			var3(table.clone(t))
		end,
		getOverlayDefaultProps = var4,
		setOverlayDefaultProps = var5
	}
end