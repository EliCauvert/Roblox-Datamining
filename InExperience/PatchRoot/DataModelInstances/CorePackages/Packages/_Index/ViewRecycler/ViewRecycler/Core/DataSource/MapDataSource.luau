local viewRecycler = script:FindFirstAncestor("ViewRecycler")
local dataSourceChangeTypeModule = require(viewRecycler.Core.Enums.DataSourceChangeType)
local _ = require(viewRecycler.Core.Types)
local createEventModule = require(viewRecycler.Internal.createEvent)

local function getItems(p0, p1, p2, p3)
	local list = table.create(math.max(0, p3 - p2 + 1))
	
	for i = p2, math.min(p3, p0) do
		table.insert(list, p1(i))
	end
	return list
end

return function(p4, p5)
	-- upvalues: createEventModule (ref), dataSourceChangeTypeModule (ref), getItems (ref)
	local t = {}
	local var6 = createEventModule()
	local var7 = 0
	local var8 = nil
	
	local function getItem(p6)
		-- upvalues: p4 (ref), var7 (write), p5 (ref), t (write)
		local item = p4.getItem(p6)
		
		if var7 == 0 then
			return p5(item, p6)
		end
		local itemKey = p4.getItemKey(p6)
		local var12 = t[itemKey]
		
		if var12 == nil or var12.input ~= item or var12.index ~= p6 then
			local var13 = p5(item, p6)
			t[itemKey] = { input = item, index = p6, output = var13 }
			
			return var13
		end
		return var12.output
	end
	
	local function _()
		-- upvalues: var8 (write), p4 (ref), dataSourceChangeTypeModule (copy), t (write), var6 (ref)
		var8 = p4.subscribe(function(p7)
			-- upvalues: dataSourceChangeTypeModule (copy), t (copy), var6 (copy)
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
			var6.fire({
				changes = p7.changes,
				previousItemCount = p7.previousItemCount,
				itemCount = p7.itemCount
			})
		end)
	end
	
	return {
		getItemCount = p4.getItemCount,
		getItem = getItem,
		getItemKey = p4.getItemKey,
		getItems = function(p8, p9)
			-- upvalues: getItems (copy), p4 (ref), getItem (ref)
			return getItems(p4.getItemCount(), getItem, p8, p9)
		end,
		subscribe = function(p10)
			-- upvalues: var7 (write), t (write), var8 (write), p4 (ref), dataSourceChangeTypeModule (copy), var6 (ref)
			if var7 == 0 then
				t = {}
				var8 = p4.subscribe(function(p11)
					-- upvalues: dataSourceChangeTypeModule (copy), t (copy), var6 (copy)
					for i, v in p11.changes do
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
					var6.fire({
						changes = p11.changes,
						previousItemCount = p11.previousItemCount,
						itemCount = p11.itemCount
					})
				end)
			end
			var7 += 1
			local var14 = var6.connect(p10)
			local var15 = true
			
			return function()
				-- upvalues: var15 (write), var14 (ref), var7 (copy), var8 (copy), t (copy)
				if not var15 then return end
				var15 = false
				var14()
				var7 -= 1
				
				if var7 == 0 and var8 ~= nil then
					var8()
					var8 = nil
					t = {}
				end
			end
		end
	}
end