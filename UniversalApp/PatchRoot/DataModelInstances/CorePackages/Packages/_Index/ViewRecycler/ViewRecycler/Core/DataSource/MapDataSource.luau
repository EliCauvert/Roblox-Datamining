local viewRecycler = script:FindFirstAncestor("ViewRecycler")
local dataSourceChangeTypeModule = require(viewRecycler.Core.Enums.DataSourceChangeType)
local _ = require(viewRecycler.Core.Types)
local createEventModule = require(viewRecycler.Internal.createEvent)

local function getItems(p1, p2, p3, p4)
	local list = table.create(math.max(0, p4 - p3 + 1))
	
	for i = p3, math.min(p4, p1) do
		table.insert(list, p2(i))
	end
	return list
end

return function(p5, p6)
	-- upvalues: createEventModule (ref), dataSourceChangeTypeModule (ref), getItems (ref)
	local t = {}
	local var1 = createEventModule()
	local var2 = 0
	local var3 = nil
	
	local function getItem(p7)
		-- upvalues: p5 (ref), var2 (write), p6 (ref), t (write)
		local item = p5.getItem(p7)
		
		if var2 == 0 then
			return p6(item, p7)
		end
		local itemKey = p5.getItemKey(p7)
		local var4 = t[itemKey]
		
		if var4 == nil or var4.input ~= item or var4.index ~= p7 then
			local var5 = p6(item, p7)
			t[itemKey] = { input = item, index = p7, output = var5 }
			
			return var5
		end
		return var4.output
	end
	
	local function _()
		-- upvalues: var3 (write), p5 (ref), dataSourceChangeTypeModule (copy), t (write), var1 (ref)
		var3 = p5.subscribe(function(p7)
			-- upvalues: dataSourceChangeTypeModule (copy), t (copy), var1 (copy)
			for i, v in p7.changes do
				if v.type ~= dataSourceChangeTypeModule.Reset then
					if v.type == dataSourceChangeTypeModule.Update or v.type == dataSourceChangeTypeModule.Remove then
						for i_1, v_1 in if v.type == dataSourceChangeTypeModule.Update then v.keys else v.keys do
							t[v_1] = nil
						end
					end
				end
				t = {}
				break
			end
			var1.fire({
				changes = p7.changes,
				previousItemCount = p7.previousItemCount,
				itemCount = p7.itemCount
			})
		end)
	end
	
	return {
		getItemCount = p5.getItemCount,
		getItem = getItem,
		getItemKey = p5.getItemKey,
		getItems = function(p8, p9)
			-- upvalues: getItems (copy), p5 (ref), getItem (ref)
			return getItems(p5.getItemCount(), getItem, p8, p9)
		end,
		subscribe = function(p8)
			-- upvalues: var2 (write), t (write), var3 (write), p5 (ref), dataSourceChangeTypeModule (copy), var1 (ref)
			if var2 == 0 then
				t = {}
				var3 = p5.subscribe(function(p9)
					-- upvalues: dataSourceChangeTypeModule (copy), t (copy), var1 (copy)
					for i, v in p9.changes do
						if v.type ~= dataSourceChangeTypeModule.Reset then
							if v.type == dataSourceChangeTypeModule.Update or v.type == dataSourceChangeTypeModule.Remove then
								for i_1, v_1 in if v.type == dataSourceChangeTypeModule.Update then v.keys else v.keys do
									t[v_1] = nil
								end
							end
						end
						t = {}
						break
					end
					var1.fire({
						changes = p9.changes,
						previousItemCount = p9.previousItemCount,
						itemCount = p9.itemCount
					})
				end)
			end
			var2 += 1
			local var4 = var1.connect(p8)
			local var5 = true
			
			return function()
				-- upvalues: var5 (write), var4 (ref), var2 (copy), var3 (copy), t (copy)
				if not var5 then return end
				var5 = false
				var4()
				var2 -= 1
				
				if var2 == 0 and var3 ~= nil then
					var3()
					var3 = nil
					t = {}
				end
			end
		end
	}
end