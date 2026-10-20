local Groups = script:FindFirstAncestor("Groups")
local Parent = Groups.Parent
local ReactModule = require(Parent.React)
local SignalsReactModule = require(Parent.SignalsReact)
local CreateGroupsListStoreModule = require(Groups.Stores.createGroupsListStore)
local _ = require(Groups.Common.Types)

return function(p1)
	-- upvalues: ReactModule (copy), CreateGroupsListStoreModule (copy), SignalsReactModule (copy)
	local UseMemoResult = ReactModule.useMemo(function()
		-- upvalues: CreateGroupsListStoreModule (upval)
		return CreateGroupsListStoreModule()
	end, {})
	local UseSignalStateResult = SignalsReactModule.useSignalState(UseMemoResult.getState)
	ReactModule.useEffect(function()
		-- upvalues: p1 (copy), UseMemoResult (copy)
		if not p1 or p1 == "" then
			UseMemoResult.reset()
			
			return
		end
		UseMemoResult.fetchGroups(p1)
		
		return function()
			-- upvalues: UseMemoResult (upval)
			UseMemoResult.reset()
		end
	end, { UseMemoResult, p1 })
	
	return UseSignalStateResult
end