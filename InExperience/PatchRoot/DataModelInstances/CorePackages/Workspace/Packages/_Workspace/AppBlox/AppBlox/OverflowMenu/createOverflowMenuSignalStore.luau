local signalsModule = require(script:FindFirstAncestor("AppBlox").Parent.Signals)

return function() --[[ line: 14 | named "createOverflowMenuSignalStore" ]]
	-- upvalues: signalsModule (ref)
	local var1, var2 = signalsModule.createSignal(nil)
	
	return {
		getActiveMenuKey = var1,
		getIsMenuOpen = function(p0) --[[ line: 17 ]]
			-- upvalues: var1 (ref)
			return var1(false) == p0
		end,
		openMenu = function(p1) --[[ line: 22 ]]
			-- upvalues: var2 (ref)
			var2(p1)
		end,
		closeMenu = function(p2) --[[ line: 26 ]]
			-- upvalues: var1 (ref), var2 (ref)
			if var1(false) == p2 then
				var2(nil)
			end
		end,
		toggleMenu = function(p3) --[[ line: 32 ]]
			-- upvalues: var1 (ref), var2 (ref)
			if var1(false) == p3 then
				if var1(false) == p3 then
					var2(nil)
					
					return
				end
			else
				var2(p3)
			end
		end
	}
end