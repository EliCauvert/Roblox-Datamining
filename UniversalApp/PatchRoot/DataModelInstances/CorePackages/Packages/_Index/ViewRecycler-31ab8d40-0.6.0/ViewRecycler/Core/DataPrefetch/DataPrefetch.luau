local _ = require(script:FindFirstAncestor("ViewRecycler").Core.Types)

return table.freeze({
	Edge = table.freeze({ Start = "start", End = "end" }),
	resolve = function(p1) --[[ Line: 32 ]]
		local StartItems = if p1 == nil then 0 else p1.startItems or 0
		local EndItems = if p1 == nil then 0 else p1.endItems or 0
		assert(StartItems >= 0 and StartItems % 1 == 0, "DataPrefetch: startItems must be a non-negative integer")
		assert(EndItems >= 0 and EndItems % 1 == 0, "DataPrefetch: endItems must be a non-negative integer")
		
		return { startItems = StartItems, endItems = EndItems }
	end
})