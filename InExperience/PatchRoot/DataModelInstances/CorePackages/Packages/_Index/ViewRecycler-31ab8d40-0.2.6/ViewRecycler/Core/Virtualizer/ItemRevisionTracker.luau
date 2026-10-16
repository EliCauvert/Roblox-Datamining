local ViewRecycler = script:FindFirstAncestor("ViewRecycler")
local DataSourceChangeTypeModule = require(ViewRecycler.Core.Enums.DataSourceChangeType)
local _ = require(ViewRecycler.Core.Types)

return function() --[[ Line: 11 | Named "createItemRevisionTracker" ]]
	-- upvalues: DataSourceChangeTypeModule (copy)
	local Count = 0
	local v1 = 0
	local t = {}
	
	local function _(List) --[[ Line: 20 | Named "bump" ]]
		-- upvalues: Count (ref), t (ref)
		for _, value in List do
			Count += 1
			t[value] = Count
		end
	end
	
	return {
		get = function(p1) --[[ Line: 16 ]]
			-- upvalues: t (ref), v1 (ref)
			return t[p1] or v1
		end,
		applyChange = function(p1) --[[ Line: 27 ]]
			-- upvalues: DataSourceChangeTypeModule (upval), Count (ref), v1 (ref), t (ref)
			if p1.type == DataSourceChangeTypeModule.Reset then
				Count += 1
				v1 = Count
				t = {}
				
				for _, key in p1.keys do
					Count += 1
					t[key] = Count
				end
				return
			elseif p1.type == DataSourceChangeTypeModule.Update or p1.type == DataSourceChangeTypeModule.Insert then
				for _, key1 in p1.keys do
					Count += 1
					t[key1] = Count
				end
				return
			else
				if p1.type == DataSourceChangeTypeModule.Remove then
					for _, key2 in p1.keys do
						t[key2] = nil
					end
				end
			end
		end
	}
end