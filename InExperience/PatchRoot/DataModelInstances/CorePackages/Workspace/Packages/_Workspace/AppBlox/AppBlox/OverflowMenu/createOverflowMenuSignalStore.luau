local SignalsModule = require(script:FindFirstAncestor("AppBlox").Parent.Signals)

return function() --[[ Line: 14 | Named "createOverflowMenuSignalStore" ]]
	-- upvalues: SignalsModule (copy)
	local Signal, Signal2 = SignalsModule.createSignal(nil)
	
	return {
		getActiveMenuKey = Signal,
		getIsMenuOpen = function(p1): boolean --[[ Line: 17 ]]
			-- upvalues: Signal (copy)
			return Signal(false) == p1
		end,
		openMenu = function(p1) --[[ Line: 22 ]]
			-- upvalues: Signal2 (copy)
			Signal2(p1)
		end,
		closeMenu = function(p1) --[[ Line: 26 ]]
			-- upvalues: Signal (copy), Signal2 (copy)
			if Signal(false) == p1 then
				Signal2(nil)
			end
		end,
		toggleMenu = function(p1) --[[ Line: 32 ]]
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