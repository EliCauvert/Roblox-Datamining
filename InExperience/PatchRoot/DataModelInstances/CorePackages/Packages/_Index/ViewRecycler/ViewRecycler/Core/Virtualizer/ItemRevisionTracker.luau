local viewRecycler = script:FindFirstAncestor("ViewRecycler")
local dataSourceChangeTypeModule = require(viewRecycler.Core.Enums.DataSourceChangeType)
local _ = require(viewRecycler.Core.Types)

return function() --[[ line: 11 | named "createItemRevisionTracker" ]]
	-- upvalues: dataSourceChangeTypeModule (ref)
	local var2 = 0
	local var3 = 0
	local t = {}
	
	local function _(p0) --[[ line: 20 | named "bump" ]]
		-- upvalues: var2 (write), t (write)
		for i, v in p0 do
			var2 += 1
			t[v] = var2
		end
	end
	
	return {
		get = function(p1) --[[ line: 16 ]]
			-- upvalues: t (write), var3 (write)
			return t[p1] or var3
		end,
		applyChange = function(p2) --[[ line: 27 ]]
			-- upvalues: dataSourceChangeTypeModule (copy), var2 (write), var3 (write), t (write)
			if p2.type == dataSourceChangeTypeModule.Reset then
				var2 += 1
				var3 = var2
				t = {}
				
				for i, v in p2.keys do
					var2 += 1
					t[v] = var2
				end
				return
			elseif p2.type == dataSourceChangeTypeModule.Update or p2.type == dataSourceChangeTypeModule.Insert then
				for i, v in p2.keys do
					var2 += 1
					t[v] = var2
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