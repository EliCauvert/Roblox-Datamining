local viewRecycler = script:FindFirstAncestor("ViewRecycler")
local dataSourceChangeTypeModule = require(viewRecycler.Core.Enums.DataSourceChangeType)
local _ = require(viewRecycler.Core.Types)
local translatedDataSourceModule = require(script.Parent.TranslatedDataSource)

local function _(p0) --[[ line: 17 | named "reversedKeys" ]]
	local list = table.create(#p0)
	
	for i, v in p0 do
		list[#p0 - i + 1] = v
	end
	return list
end

return function(p1) --[[ line: 25 | named "createReverseDataSource" ]]
	-- upvalues: translatedDataSourceModule (ref), dataSourceChangeTypeModule (ref)
	return translatedDataSourceModule(p1.getItemCount, function(p2) --[[ line: 26 ]]
		-- upvalues: p1 (ref)
		return p1.getItem(p1.getItemCount() - p2 + 1)
	end, function(p3) --[[ line: 28 ]]
		-- upvalues: p1 (ref)
		return p1.getItemKey(p1.getItemCount() - p3 + 1)
	end, function(p4) --[[ line: 30 ]]
		-- upvalues: p1 (ref), dataSourceChangeTypeModule (copy)
		return p1.subscribe(function(p5) --[[ line: 31 ]]
			-- upvalues: dataSourceChangeTypeModule (copy), p4 (ref)
			local previousItemCount = p5.previousItemCount
			local t = {}
			
			for i, v in p5.changes do
				if v.type ~= dataSourceChangeTypeModule.Insert then
					if v.type == dataSourceChangeTypeModule.Remove then
						local t_1 = {
							type = dataSourceChangeTypeModule.Remove,
							index = previousItemCount - v.index - #v.keys + 2
						}
						local keys = v.keys
						local list = table.create(#keys)
						
						for i_1, v_1 in keys do
							list[#keys - i_1 + 1] = v_1
						end
						t_1.keys = list
						table.insert(t, t_1)
						previousItemCount -= #v.keys
					elseif v.type == dataSourceChangeTypeModule.Update then
						table.insert(t, {
							type = dataSourceChangeTypeModule.Update,
							keys = table.clone(v.keys)
						})
					elseif v.type == dataSourceChangeTypeModule.Move then
						table.insert(t, {
							type = dataSourceChangeTypeModule.Move,
							fromIndex = previousItemCount - v.fromIndex + 1,
							toIndex = previousItemCount - v.toIndex + 1,
							key = v.key
						})
					elseif v.type == dataSourceChangeTypeModule.Reorder then
						local keys = v.keys
						local list = table.create(#keys)
						
						for i_3, v_3 in keys do
							list[#keys - i_3 + 1] = v_3
						end
						table.insert(t, { type = dataSourceChangeTypeModule.Reorder, keys = list })
					elseif v.type == dataSourceChangeTypeModule.Reset then
						local keys = v.keys
						local list = table.create(#keys)
						
						for i_3, v_3 in keys do
							list[#keys - i_3 + 1] = v_3
						end
						local var11 = list
						table.insert(t, { type = dataSourceChangeTypeModule.Reset, keys = var11 })
						previousItemCount = #var11
					end
				end
				local t_1 = {
					type = dataSourceChangeTypeModule.Insert,
					index = previousItemCount - v.index + 2
				}
				local keys = v.keys
				local list = table.create(#keys)
				
				for i_1, v_1 in keys do
					list[#keys - i_1 + 1] = v_1
				end
				t_1.keys = list
				table.insert(t, t_1)
				previousItemCount += #v.keys
			end
			p4({
				changes = t,
				previousItemCount = p5.previousItemCount,
				itemCount = p5.itemCount
			})
		end)
	end)
end