local parent = script:FindFirstAncestor("BuildExperience").Parent
local _ = require(parent.DataHydration.PlaceVersionHistory)
local reactModule = require(parent.React)
local signalsReactModule = require(parent.SignalsReact)

return function(p1, p2, p3)
	-- upvalues: signalsReactModule (ref), reactModule (ref)
	local var1 = if p3 == nil or not p3.hasMore then nil else p3.nextCursor
	local var2 = signalsReactModule.useSignalState(p1.getIsFetchingMoreHistory(p2))
	local var3, var4 = reactModule.useState(nil)
	
	return reactModule.useCallback(function()
		-- upvalues: var1 (ref), var3 (ref), var2 (ref), p1 (ref), p2 (ref), var4 (ref)
		if var1 == nil or var1 == var3 or var2 then
			return
		end
		p1.fetchMoreHistory(p2, var1):catch(function()
			-- upvalues: var4 (copy), var1 (ref)
			var4(var1)
		end)
	end, {
		p1,
		p2,
		var1,
		var3,
		var2
	})
end