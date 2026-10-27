local ViewRecycler = script:FindFirstAncestor("ViewRecycler")
local DataSourceChangeTypeModule = require(ViewRecycler.Core.Enums.DataSourceChangeType)
local _ = require(ViewRecycler.Core.Types)
local CreateEventModule = require(ViewRecycler.Internal.createEvent)

local function getItems(ItemCount: number, Callback, p1: number, p2: number)
	local Buffer = table.create((math.max(0, p2 - p1 + 1)))
	
	for i = p1, math.min(p2, ItemCount) do
		table.insert(Buffer, Callback(i))
	end
	return Buffer
end

return function(p3, Callback)
	-- upvalues: CreateEventModule (copy), DataSourceChangeTypeModule (copy), getItems (copy)
	local T = {}
	local EventModule = CreateEventModule()
	local Count = 0
	local SubscribeResult = nil
	
	local function getItem(Index)
		-- upvalues: p3 (copy), Count (ref), Callback (copy), T (ref)
		local Item = p3.getItem(Index)
		
		if Count == 0 then
			return Callback(Item, Index)
		end
		local ItemKey = p3.getItemKey(Index)
		local Entry = T[ItemKey]
		
		if Entry == nil or Entry.input ~= Item or Entry.index ~= Index then
			local CallbackResult = Callback(Item, Index)
			T[ItemKey] = { input = Item, index = Index, output = CallbackResult }
			
			return CallbackResult
		else
			return Entry.output
		end
	end
	
	local function _()
		-- upvalues: SubscribeResult (ref), p3 (copy), DataSourceChangeTypeModule (upval), T (ref), EventModule (copy)
		SubscribeResult = p3.subscribe(function(p4)
			-- upvalues: DataSourceChangeTypeModule (upval), T (upval), EventModule (upval)
			for _, change in p4.changes do
				if change.type == DataSourceChangeTypeModule.Reset then
					T = {}
					break
				else
					if change.type == DataSourceChangeTypeModule.Update or change.type == DataSourceChangeTypeModule.Remove then
						local Keys = if change.type == DataSourceChangeTypeModule.Update then change.keys else change.keys
						for _, key in Keys do
							T[key] = nil
						end
					end
				end
			end
			EventModule.fire({
				changes = p4.changes,
				previousItemCount = p4.previousItemCount,
				itemCount = p4.itemCount
			})
		end)
	end
	
	return {
		getItemCount = p3.getItemCount,
		getItem = getItem,
		getItemKey = p3.getItemKey,
		getItems = function(p5, p6)
			-- upvalues: getItems (upval), p3 (copy), getItem (copy)
			return (getItems(p3.getItemCount(), getItem, p5, p6))
		end,
		subscribe = function(p5)
			-- upvalues: Count (ref), T (ref), SubscribeResult (ref), p3 (copy), DataSourceChangeTypeModule (upval), EventModule (copy)
			if Count == 0 then
				T = {}
				SubscribeResult = p3.subscribe(function(p6)
					-- upvalues: DataSourceChangeTypeModule (upval), T (upval), EventModule (upval)
					for _, change in p6.changes do
						if change.type == DataSourceChangeTypeModule.Reset then
							T = {}
							break
						else
							if change.type == DataSourceChangeTypeModule.Update or change.type == DataSourceChangeTypeModule.Remove then
								local Keys = if change.type == DataSourceChangeTypeModule.Update then change.keys else change.keys
								for _, key in Keys do
									T[key] = nil
								end
							end
						end
					end
					EventModule.fire({
						changes = p6.changes,
						previousItemCount = p6.previousItemCount,
						itemCount = p6.itemCount
					})
				end)
			end
			Count += 1
			local ConnectResult = EventModule.connect(p5)
			local Flag = true
			
			return function()
				-- upvalues: Flag (ref), ConnectResult (copy), Count (upval), SubscribeResult (upval), T (upval)
				if not Flag then return end
				Flag = false
				ConnectResult()
				Count -= 1
				
				if Count == 0 and SubscribeResult ~= nil then
					SubscribeResult()
					SubscribeResult = nil
					T = {}
				end
			end
		end
	}
end