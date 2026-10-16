local ViewRecycler = script:FindFirstAncestor("ViewRecycler")
local _ = require(ViewRecycler.Core.DataSource)
local _ = require(ViewRecycler.Core.Types)

return function(DataSource, Predicate) --[[ Line: 15 | Named "createStickyIndexResolver" ]]
	local DataSource1 = DataSource
	local Callback = Predicate
	local List = {}
	local Flag = true
	
	return {
		setPredicate = function(Value): boolean --[[ Line: 40 ]]
			-- upvalues: Callback (ref), Flag (ref)
			if Callback == Value then
				return false
			else
				Callback = Value
				Flag = true
				
				return true
			end
		end,
		setDataSource = function(Value) --[[ Line: 48 ]]
			-- upvalues: DataSource1 (ref), Flag (ref)
			if DataSource1 ~= Value then
				DataSource1 = Value
				Flag = true
			end
		end,
		applyDataSourceChange = function(_) --[[ Line: 54 ]]
			-- upvalues: Flag (ref)
			Flag = true
		end,
		resolve = function() --[[ Line: 24 ]]
			-- upvalues: Flag (ref), List (copy), Callback (ref), DataSource1 (ref)
			if Flag then
				table.clear(List)
				
				if Callback ~= nil then
					for i = 1, DataSource1.getItemCount() do
						if Callback(DataSource1.getItem(i), i) then
							table.insert(List, i)
						end
					end
				end
				Flag = false
			end
			return List
		end
	}
end