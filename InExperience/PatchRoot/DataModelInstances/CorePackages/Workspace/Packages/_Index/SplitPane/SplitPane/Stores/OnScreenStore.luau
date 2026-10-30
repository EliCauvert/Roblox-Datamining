local SignalsModule = require(script:FindFirstAncestor("SplitPane").Parent.Signals)
local Tbl = {}

local function _(Key)
	-- upvalues: Tbl (copy), SignalsModule (copy)
	local Entry = Tbl[Key]
	
	if Entry == nil then
		local Signal, Signal2 = SignalsModule.createSignal(nil)
		Entry = { get = Signal, set = Signal2 }
		Tbl[Key] = Entry
	end
	return Entry
end

return {
	setRouteOnScreen = function(Key, p1)
		-- upvalues: Tbl (copy), SignalsModule (copy)
		local Entry = Tbl[Key]
		
		if Entry == nil then
			local Signal, Signal2 = SignalsModule.createSignal(nil)
			Entry = { get = Signal, set = Signal2 }
			Tbl[Key] = Entry
		end
		Entry.set(p1)
	end,
	getRouteOnScreen = function(p1, Key)
		-- upvalues: Tbl (copy), SignalsModule (copy)
		local Entry = Tbl[Key]
		
		if Entry == nil then
			local Signal, Signal2 = SignalsModule.createSignal(nil)
			Entry = { get = Signal, set = Signal2 }
			Tbl[Key] = Entry
		end
		return Entry.get(p1)
	end,
	_resetForTest = function()
		-- upvalues: Tbl (copy)
		table.clear(Tbl)
	end
}