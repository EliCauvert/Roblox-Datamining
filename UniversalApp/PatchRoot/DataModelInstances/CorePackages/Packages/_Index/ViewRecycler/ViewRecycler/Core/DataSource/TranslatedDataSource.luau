local ViewRecycler = script:FindFirstAncestor("ViewRecycler")
local _ = require(ViewRecycler.Core.Types)
local CreateEventModule = require(ViewRecycler.Internal.createEvent)
local ReadDenseRangeModule = require(script.Parent.readDenseRange)

return function(Callback2, GetItem, GetItemKey, Callback)
	-- upvalues: CreateEventModule (copy), ReadDenseRangeModule (copy)
	local EventModule = CreateEventModule()
	local Count = 0
	local Callback1 = nil
	
	return {
		getItemCount = Callback2,
		getItem = GetItem,
		getItemKey = GetItemKey,
		getItems = function(p1, p2)
			-- upvalues: ReadDenseRangeModule (upval), Callback2 (copy), GetItem (copy)
			return ReadDenseRangeModule(Callback2(), GetItem, p1, p2)
		end,
		subscribe = function(p1)
			-- upvalues: Count (ref), Callback1 (ref), Callback (copy), EventModule (copy)
			if Count == 0 then
				Callback1 = Callback(EventModule.fire)
			end
			Count += 1
			local ConnectResult = EventModule.connect(p1)
			local Flag = true
			
			return function()
				-- upvalues: Flag (ref), ConnectResult (copy), Count (upval), Callback1 (upval)
				if not Flag then return end
				Flag = false
				ConnectResult()
				Count -= 1
				
				if Count == 0 and Callback1 ~= nil then
					Callback1()
					Callback1 = nil
				end
			end
		end
	}
end