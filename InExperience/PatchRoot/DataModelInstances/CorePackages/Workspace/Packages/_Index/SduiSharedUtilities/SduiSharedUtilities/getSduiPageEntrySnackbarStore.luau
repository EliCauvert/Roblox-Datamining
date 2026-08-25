local signalsModule = require(script:FindFirstAncestor("SduiSharedUtilities").Parent.Signals)

local function createSduiPageEntrySnackbarStore()
	-- upvalues: signalsModule (ref)
	local t = {}
	
	return {
		getSignal = function(value)
			-- upvalues: t (ref), signalsModule (copy)
			local var4 = t[value]
			
			if var4 then
				return var4.get
			end
			local var5, var6 = signalsModule.createSignal(nil)
			t[value] = { get = var5, set = var6 }
			
			return var5
		end,
		show = function(p0, p1)
			-- upvalues: t (ref), signalsModule (copy)
			local var7 = t[p0]
			
			if var7 then
				var7.set(p1)
				
				return
			end
			local var8, var9 = signalsModule.createSignal(nil)
			t[p0] = { get = var8, set = var9 }
			var9(p1)
		end,
		hide = function(p2)
			-- upvalues: t (ref), signalsModule (copy)
			local var10 = t[p2]
			
			if var10 then
				var10.set(nil)
				
				return
			end
			local var11, var12 = signalsModule.createSignal(nil)
			t[p2] = { get = var11, set = var12 }
			var12(nil)
		end
	}
end

local var2 = nil

return function()
	-- upvalues: var2 (write), createSduiPageEntrySnackbarStore (ref)
	if var2 == nil then
		var2 = createSduiPageEntrySnackbarStore()
	end
	return var2
end