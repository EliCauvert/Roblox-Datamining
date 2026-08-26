local signalsModule = require(script:FindFirstAncestor("SduiSharedUtilities").Parent.Signals)

local function createSduiPageEntrySnackbarStore()
	-- upvalues: signalsModule (ref)
	local t = {}
	
	return {
		getSignal = function(value)
			-- upvalues: t (ref), signalsModule (copy)
			local var1 = t[value]
			
			if var1 then
				return var1.get
			end
			local var2, var3 = signalsModule.createSignal(nil)
			t[value] = { get = var2, set = var3 }
			
			return var2
		end,
		show = function(p1, p2)
			-- upvalues: t (ref), signalsModule (copy)
			local var1 = t[p1]
			
			if var1 then
				var1.set(p2)
				
				return
			end
			local var2, var3 = signalsModule.createSignal(nil)
			t[p1] = { get = var2, set = var3 }
			var3(p2)
		end,
		hide = function(p1)
			-- upvalues: t (ref), signalsModule (copy)
			local var1 = t[p1]
			
			if var1 then
				var1.set(nil)
				
				return
			end
			local var2, var3 = signalsModule.createSignal(nil)
			t[p1] = { get = var2, set = var3 }
			var3(nil)
		end
	}
end

local var1 = nil

return function()
	-- upvalues: var1 (write), createSduiPageEntrySnackbarStore (ref)
	if var1 == nil then
		var1 = createSduiPageEntrySnackbarStore()
	end
	return var1
end