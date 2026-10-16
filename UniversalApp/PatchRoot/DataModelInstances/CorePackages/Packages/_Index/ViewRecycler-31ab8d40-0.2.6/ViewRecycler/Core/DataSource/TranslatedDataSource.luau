local ViewRecycler = script:FindFirstAncestor("ViewRecycler")
local _ = require(ViewRecycler.Core.Types)
local CreateEventModule = require(ViewRecycler.Internal.createEvent)

local function getItems(p1: number, Callback, p2: number, p3: number) --[[ Line: 15 ]]
	local Buffer = table.create((math.max(0, p3 - p2 + 1)))
	
	for i = p2, math.min(p3, p1) do
		table.insert(Buffer, Callback(i))
	end
	return Buffer
end

return function(Callback2, GetItem, GetItemKey, Callback1) --[[ Line: 23 | Named "createTranslatedDataSource" ]]
	-- upvalues: CreateEventModule (copy), getItems (copy)
	local EventModule = CreateEventModule()
	local Count = 0
	local Callback = nil
	
	return {
		getItemCount = Callback2,
		getItem = GetItem,
		getItemKey = GetItemKey,
		getItems = function(p4, p5) --[[ Line: 58 ]]
			-- upvalues: getItems (upval), Callback2 (copy), GetItem (copy)
			return (getItems(Callback2(), GetItem, p4, p5))
		end,
		subscribe = function(p4) --[[ Line: 33 ]]
			-- upvalues: Count (ref), Callback (ref), Callback1 (copy), EventModule (copy)
			if Count == 0 then
				Callback = Callback1(EventModule.fire)
			end
			Count += 1
			local ConnectResult = EventModule.connect(p4)
			local Flag = true
			
			return function() --[[ Line: 40 ]]
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