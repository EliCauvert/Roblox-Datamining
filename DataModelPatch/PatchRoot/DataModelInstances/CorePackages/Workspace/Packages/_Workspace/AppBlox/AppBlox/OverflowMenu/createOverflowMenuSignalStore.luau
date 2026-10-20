local SignalsModule = require(script:FindFirstAncestor("AppBlox").Parent.Signals)

return function()
	-- upvalues: SignalsModule (copy)
	local Signal, Signal2 = SignalsModule.createSignal(nil)
	
	return {
		getActiveMenuKey = Signal,
		getIsMenuOpen = function(p1): boolean
			-- upvalues: Signal (copy)
			return Signal(false) == p1
		end,
		openMenu = function(p1)
			-- upvalues: Signal2 (copy)
			Signal2(p1)
		end,
		closeMenu = function(p1)
			-- upvalues: Signal (copy), Signal2 (copy)
			if Signal(false) == p1 then
				Signal2(nil)
			end
		end,
		toggleMenu = function(p1)
			-- upvalues: Signal (copy), Signal2 (copy)
			if Signal(false) ~= p1 then
				Signal2(p1)
			elseif Signal(false) == p1 then
				Signal2(nil)
				
				return
			end
		end
	}
end