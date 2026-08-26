local groups = script:FindFirstAncestor("Groups")
local parent = groups.Parent
local reactModule = require(parent.React)
local signalsReactModule = require(parent.SignalsReact)
local createGroupsListStoreModule = require(groups.Stores.createGroupsListStore)
local _ = require(groups.Common.Types)

return function(p1)
	-- upvalues: reactModule (ref), createGroupsListStoreModule (ref), signalsReactModule (ref)
	local var1 = reactModule.useMemo(function()
		-- upvalues: createGroupsListStoreModule (copy)
		return createGroupsListStoreModule()
	end, {})
	local var2 = signalsReactModule.useSignalState(var1.getState)
	reactModule.useEffect(function()
		-- upvalues: p1 (ref), var1 (ref)
		if p1 and p1 ~= "" then
			var1.fetchGroups(p1)
			
			return function()
				-- upvalues: var1 (copy)
				var1.reset()
			end
		end
		var1.reset()
	end, { var1, p1 })
	
	return var2
end