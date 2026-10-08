local viewRecycler = script:FindFirstAncestor("ViewRecycler")
local dataSourceChangeTypeModule = require(viewRecycler.Core.Enums.DataSourceChangeType)
local _ = require(viewRecycler.Core.Types)
local translatedDataSourceModule = require(script.Parent.TranslatedDataSource)

local function _(p1)
	local list = table.create(#p1)
	
	for i, v in p1 do
		list[#p1 - i + 1] = v
	end
	return list
end

return function(p2)
	-- upvalues: translatedDataSourceModule (ref), dataSourceChangeTypeModule (ref)
	return translatedDataSourceModule(p2.getItemCount, function(p3)
		-- upvalues: p2 (ref)
		return p2.getItem(p2.getItemCount() - p3 + 1)
	end, function(p3)
		-- upvalues: p2 (ref)
		return p2.getItemKey(p2.getItemCount() - p3 + 1)
	end, function(p3)
		-- upvalues: p2 (ref), dataSourceChangeTypeModule (copy)
		return p2.subscribe(function(p4)
			-- upvalues: dataSourceChangeTypeModule (copy), p3 (ref)
			local previousItemCount = p4.previousItemCount
			local t = {}
			
			for i, v in p4.changes do
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
						local var1 = list
						table.insert(t, { type = dataSourceChangeTypeModule.Reset, keys = var1 })
						previousItemCount = #var1
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
			p3({
				changes = t,
				previousItemCount = p4.previousItemCount,
				itemCount = p4.itemCount
			})
		end)
	end)
end