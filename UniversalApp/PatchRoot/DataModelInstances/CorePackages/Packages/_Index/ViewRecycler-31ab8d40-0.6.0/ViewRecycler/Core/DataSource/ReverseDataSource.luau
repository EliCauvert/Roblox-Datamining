local ViewRecycler = script:FindFirstAncestor("ViewRecycler")
local DataSourceChangeTypeModule = require(ViewRecycler.Core.Enums.DataSourceChangeType)
local _ = require(ViewRecycler.Core.Types)
local TranslatedDataSourceModule = require(script.Parent.TranslatedDataSource)

local function _(List) --[[ Line: 17 | Named "reversedKeys" ]]
	local Buffer = table.create(#List)
	
	for i, value in List do
		Buffer[#List - i + 1] = value
	end
	return Buffer
end

return function(p1) --[[ Line: 25 | Named "createReverseDataSource" ]]
	-- upvalues: TranslatedDataSourceModule (copy), DataSourceChangeTypeModule (copy)
	return TranslatedDataSourceModule(p1.getItemCount, function(p2) --[[ Line: 26 ]]
		-- upvalues: p1 (copy)
		return p1.getItem(p1.getItemCount() - p2 + 1)
	end, function(p2) --[[ Line: 28 ]]
		-- upvalues: p1 (copy)
		return p1.getItemKey(p1.getItemCount() - p2 + 1)
	end, function(Callback) --[[ Line: 30 ]]
		-- upvalues: p1 (copy), DataSourceChangeTypeModule (upval)
		return p1.subscribe(function(p2) --[[ Line: 31 ]]
			-- upvalues: DataSourceChangeTypeModule (upval), Callback (copy)
			local PreviousItemCount = p2.previousItemCount
			local List = {}
			
			for _, change in p2.changes do
				if change.type == DataSourceChangeTypeModule.Insert then
					local config = {
						type = DataSourceChangeTypeModule.Insert,
						index = PreviousItemCount - change.index + 2
					}
					local Keys = change.keys
					local Buffer = table.create(#Keys)
					
					for i, key in Keys do
						Buffer[#Keys - i + 1] = key
					end
					config.keys = Buffer
					table.insert(List, config)
					PreviousItemCount += #change.keys
					continue
				elseif change.type == DataSourceChangeTypeModule.Remove then
					local config = {
						type = DataSourceChangeTypeModule.Remove,
						index = PreviousItemCount - change.index - #change.keys + 2
					}
					local Keys = change.keys
					local Buffer = table.create(#Keys)
					
					for i1, key1 in Keys do
						Buffer[#Keys - i1 + 1] = key1
					end
					config.keys = Buffer
					table.insert(List, config)
					PreviousItemCount -= #change.keys
					continue
				else
					if change.type == DataSourceChangeTypeModule.Update then
						table.insert(List, {
							type = DataSourceChangeTypeModule.Update,
							keys = table.clone(change.keys)
						})
						continue
					elseif change.type == DataSourceChangeTypeModule.Move then
						table.insert(List, {
							type = DataSourceChangeTypeModule.Move,
							fromIndex = PreviousItemCount - change.fromIndex + 1,
							toIndex = PreviousItemCount - change.toIndex + 1,
							key = change.key
						})
						continue
					elseif change.type == DataSourceChangeTypeModule.Reorder then
						local Keys = change.keys
						local Buffer = table.create(#Keys)
						
						for i2, key2 in Keys do
							Buffer[#Keys - i2 + 1] = key2
						end
						table.insert(List, { type = DataSourceChangeTypeModule.Reorder, keys = Buffer })
						continue
					elseif change.type == DataSourceChangeTypeModule.Reset then
						local Keys = change.keys
						local Buffer = table.create(#Keys)
						
						for i3, key3 in Keys do
							Buffer[#Keys - i3 + 1] = key3
						end
						table.insert(List, { type = DataSourceChangeTypeModule.Reset, keys = Buffer })
						PreviousItemCount = #Buffer
						continue
					end
				end
			end
			Callback({
				changes = List,
				previousItemCount = p2.previousItemCount,
				itemCount = p2.itemCount
			})
		end)
	end)
end