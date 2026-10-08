local viewRecycler = script:FindFirstAncestor("ViewRecycler")
local dataSourceChangeTypeModule = require(viewRecycler.Core.Enums.DataSourceChangeType)
local _ = require(viewRecycler.Core.Types)

return function()
	-- upvalues: dataSourceChangeTypeModule (ref)
	local var1 = 0
	local var2 = 0
	local t = {}
	
	local function _(p1)
		-- upvalues: var1 (write), t (write)
		for i, v in p1 do
			var1 += 1
			t[v] = var1
		end
	end
	
	return {
		get = function(p2)
			-- upvalues: t (write), var2 (write)
			return t[p2] or var2
		end,
		applyChange = function(p2)
			-- upvalues: dataSourceChangeTypeModule (copy), var1 (write), var2 (write), t (write)
			if p2.type == dataSourceChangeTypeModule.Reset then
				var1 += 1
				var2 = var1
				t = {}
				
				for i, v in p2.keys do
					var1 += 1
					t[v] = var1
				end
				return
			elseif p2.type == dataSourceChangeTypeModule.Update or p2.type == dataSourceChangeTypeModule.Insert then
				for i, v in p2.keys do
					var1 += 1
					t[v] = var1
				end
				return
			elseif p2.type == dataSourceChangeTypeModule.Remove then
				for i, v in p2.keys do
					t[v] = nil
				end
			end
		end
	}
end