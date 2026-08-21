local viewRecycler = script:FindFirstAncestor("ViewRecycler")
local _ = require(viewRecycler.Core.DataSource)
local _ = require(viewRecycler.Core.Types)

return function(p0, p1) --[[ line: 15 | named "createStickyIndexResolver" ]]
	local var1 = p0
	local var2 = p1
	local t = {}
	local var4 = true
	
	return {
		setPredicate = function(value) --[[ line: 40 ]]
			-- upvalues: var2 (write), var4 (write)
			if var2 == value then
				return false
			end
			var2 = value
			var4 = true
			
			return true
		end,
		setDataSource = function(value) --[[ line: 48 ]]
			-- upvalues: var1 (write), var4 (write)
			if var1 ~= value then
				var1 = value
				var4 = true
			end
		end,
		applyDataSourceChange = function(_) --[[ line: 54 ]]
			-- upvalues: var4 (write)
			var4 = true
		end,
		resolve = function() --[[ line: 24 ]]
			-- upvalues: var4 (write), t (ref), var2 (write), var1 (write)
			if var4 then
				table.clear(t)
				
				if var2 ~= nil then
					for i = 1, var1.getItemCount() do
						if var2(var1.getItem(i), i) then
							table.insert(t, i)
						end
					end
				end
				var4 = false
			end
			return t
		end
	}
end