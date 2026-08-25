local groups = script:FindFirstAncestor("Groups")
local parent = groups.Parent
local reactModule = require(parent.React)
local signalsReactModule = require(parent.SignalsReact)
local createGroupsListStoreModule = require(groups.Stores.createGroupsListStore)
local _ = require(groups.Common.Types)

return function(p0)
	-- upvalues: reactModule (ref), createGroupsListStoreModule (ref), signalsReactModule (ref)
	local var4 = reactModule.useMemo(function()
		-- upvalues: createGroupsListStoreModule (copy)
		return createGroupsListStoreModule()
	end, {})
	local var5 = signalsReactModule.useSignalState(var4.getState)
	reactModule.useEffect(function()
		-- upvalues: p0 (ref), var4 (ref)
		if p0 and p0 ~= "" then
			var4.fetchGroups(p0)
			
			return function()
				-- upvalues: var4 (copy)
				var4.reset()
			end
		end
		var4.reset()
	end, { var4, p0 })
	
	return var5
end