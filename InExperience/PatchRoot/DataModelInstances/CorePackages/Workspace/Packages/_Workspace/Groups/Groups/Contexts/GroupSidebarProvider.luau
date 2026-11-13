local Groups = script:FindFirstAncestor("Groups")
local ReactModule = require(Groups.Parent.React)
local GroupSidebarContextModule = require(script.Parent.GroupSidebarContext)
local CreateGroupSidebarStateModule = require(Groups.Stores.createGroupSidebarState)

return function(p1)
	-- upvalues: ReactModule (copy), CreateGroupSidebarStateModule (copy), GroupSidebarContextModule (copy)
	local UseMemoResult = ReactModule.useMemo(function()
		-- upvalues: CreateGroupSidebarStateModule (upval), p1 (copy)
		return CreateGroupSidebarStateModule(p1.initialGroupId, p1.initialExpanded, p1.revealGroupId)
	end, { p1.initialGroupId, p1.initialExpanded, p1.revealGroupId })
	ReactModule.useEffect(function()
		-- upvalues: UseMemoResult (copy)
		return UseMemoResult.dispose
	end, { UseMemoResult })
	
	return ReactModule.createElement(GroupSidebarContextModule.Provider, { value = UseMemoResult }, p1.children)
end