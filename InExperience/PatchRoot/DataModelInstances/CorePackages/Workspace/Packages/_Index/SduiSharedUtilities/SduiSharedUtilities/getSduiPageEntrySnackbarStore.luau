local SignalsModule = require(script:FindFirstAncestor("SduiSharedUtilities").Parent.Signals)

local function createSduiPageEntrySnackbarStore() --[[ Line: 20 ]]
	-- upvalues: SignalsModule (copy)
	local t = {}
	
	return {
		getSignal = function(Key) --[[ Line: 23 ]]
			-- upvalues: t (copy), SignalsModule (upval)
			local Entry = t[Key]
			
			if Entry then
				return Entry.get
			else
				local Signal, Signal2 = SignalsModule.createSignal(nil)
				t[Key] = { get = Signal, set = Signal2 }
				
				return Signal
			end
		end,
		show = function(Key, p1) --[[ Line: 37 ]]
			-- upvalues: t (copy), SignalsModule (upval)
			local Entry = t[Key]
			
			if Entry then
				Entry.set(p1)
				
				return
			else
				local Signal, Signal2 = SignalsModule.createSignal(nil)
				t[Key] = { get = Signal, set = Signal2 }
				Signal2(p1)
			end
		end,
		hide = function(Key) --[[ Line: 51 ]]
			-- upvalues: t (copy), SignalsModule (upval)
			local Entry = t[Key]
			
			if Entry then
				Entry.set(nil)
				
				return
			else
				local Signal, Signal2 = SignalsModule.createSignal(nil)
				t[Key] = { get = Signal, set = Signal2 }
				Signal2(nil)
			end
		end
	}
end

local v1 = nil

return function() --[[ Line: 74 | Named "getSduiPageEntrySnackbarStore" ]]
	-- upvalues: v1 (ref), createSduiPageEntrySnackbarStore (copy)
	if v1 == nil then
		v1 = createSduiPageEntrySnackbarStore()
	end
	return v1
end