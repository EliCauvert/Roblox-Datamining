local ViewRecycler = script:FindFirstAncestor("ViewRecycler")
local _ = require(ViewRecycler.Core.Types)
local CreateEventModule = require(ViewRecycler.Internal.createEvent)
local ReadDenseRangeModule = require(script.Parent.readDenseRange)

return function(Callback2, GetItem, GetItemKey, Callback1) --[[ Line: 16 | Named "createTranslatedDataSource" ]]
	-- upvalues: CreateEventModule (copy), ReadDenseRangeModule (copy)
	local EventModule = CreateEventModule()
	local Count = 0
	local Callback = nil
	
	return {
		getItemCount = Callback2,
		getItem = GetItem,
		getItemKey = GetItemKey,
		getItems = function(p1, p2) --[[ Line: 51 ]]
			-- upvalues: ReadDenseRangeModule (upval), Callback2 (copy), GetItem (copy)
			return ReadDenseRangeModule(Callback2(), GetItem, p1, p2)
		end,
		subscribe = function(p1) --[[ Line: 26 ]]
			-- upvalues: Count (ref), Callback (ref), Callback1 (copy), EventModule (copy)
			if Count == 0 then
				Callback = Callback1(EventModule.fire)
			end
			Count += 1
			local ConnectResult = EventModule.connect(p1)
			local Flag = true
			
			return function() --[[ Line: 33 ]]
				-- upvalues: Flag (ref), ConnectResult (copy), Count (upval), Callback (upval)
				if not Flag then return end
				Flag = false
				ConnectResult()
				Count -= 1
				
				if Count == 0 and Callback ~= nil then
					Callback()
					Callback = nil
				end
			end
		end
	}
end