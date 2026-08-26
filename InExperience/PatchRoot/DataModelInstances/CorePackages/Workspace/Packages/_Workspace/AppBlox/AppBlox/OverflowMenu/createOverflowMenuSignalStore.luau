local signalsModule = require(script:FindFirstAncestor("AppBlox").Parent.Signals)

return function()
	-- upvalues: signalsModule (ref)
	local var1, var2 = signalsModule.createSignal(nil)
	
	return {
		getActiveMenuKey = var1,
		getIsMenuOpen = function(p1)
			-- upvalues: var1 (ref)
			return var1(false) == p1
		end,
		openMenu = function(p1)
			-- upvalues: var2 (ref)
			var2(p1)
		end,
		closeMenu = function(p1)
			-- upvalues: var1 (ref), var2 (ref)
			if var1(false) == p1 then
				var2(nil)
			end
		end,
		toggleMenu = function(p1)
			-- upvalues: var1 (ref), var2 (ref)
			if var1(false) == p1 then
				if var1(false) == p1 then
					var2(nil)
					
					return
				end
			else
				var2(p1)
			end
		end
	}
end