local viewRecycler = script:FindFirstAncestor("ViewRecycler")
local dataSourceChangeTypeModule = require(viewRecycler.Core.Enums.DataSourceChangeType)
local _ = require(viewRecycler.Core.Types)
local createEventModule = require(viewRecycler.Internal.createEvent)
local readDenseRangeModule = require(script.Parent.readDenseRange)

return function(p1, p2)
	-- upvalues: createEventModule (ref), dataSourceChangeTypeModule (ref), readDenseRangeModule (ref)
	local t = {}
	local var1 = createEventModule()
	local var2 = 0
	local var3 = nil
	
	local function getItem(p3)
		-- upvalues: p1 (ref), var2 (write), p2 (ref), t (write)
		local item = p1.getItem(p3)
		
		if var2 == 0 then
			return p2(item, p3)
		end
		local itemKey = p1.getItemKey(p3)
		local var4 = t[itemKey]
		
		if var4 == nil or var4.input ~= item or var4.index ~= p3 then
			local var5 = p2(item, p3)
			t[itemKey] = { input = item, index = p3, output = var5 }
			
			return var5
		end
		return var4.output
	end
	
	local function _()
		-- upvalues: var3 (write), p1 (ref), dataSourceChangeTypeModule (copy), t (write), var1 (ref)
		var3 = p1.subscribe(function(p3)
			-- upvalues: dataSourceChangeTypeModule (copy), t (copy), var1 (copy)
			for i, v in p3.changes do
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
				changes = p3.changes,
				previousItemCount = p3.previousItemCount,
				itemCount = p3.itemCount
			})
		end)
	end
	
	return {
		getItemCount = p1.getItemCount,
		getItem = getItem,
		getItemKey = p1.getItemKey,
		getItems = function(p4, p5)
			-- upvalues: readDenseRangeModule (copy), p1 (ref), getItem (ref)
			return readDenseRangeModule(p1.getItemCount(), getItem, p4, p5)
		end,
		subscribe = function(p4)
			-- upvalues: var2 (write), t (write), var3 (write), p1 (ref), dataSourceChangeTypeModule (copy), var1 (ref)
			if var2 == 0 then
				t = {}
				var3 = p1.subscribe(function(p5)
					-- upvalues: dataSourceChangeTypeModule (copy), t (copy), var1 (copy)
					for i, v in p5.changes do
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
						changes = p5.changes,
						previousItemCount = p5.previousItemCount,
						itemCount = p5.itemCount
					})
				end)
			end
			var2 += 1
			local var4 = var1.connect(p4)
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