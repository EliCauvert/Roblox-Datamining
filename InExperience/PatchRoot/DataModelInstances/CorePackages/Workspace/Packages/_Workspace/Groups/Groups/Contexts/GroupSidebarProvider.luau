local Groups = script:FindFirstAncestor("Groups")
local Parent = Groups.Parent
local ReactModule = require(Parent.React)
local GroupSidebarContextModule = require(script.Parent.GroupSidebarContext)
local CreateGroupSidebarStateModule = require(Groups.Stores.createGroupSidebarState)
local FFlagEnableGroupSidebarSdui = require(Parent.SharedFlags).FFlagEnableGroupSidebarSdui

return function(p1)
	-- upvalues: FFlagEnableGroupSidebarSdui (copy), ReactModule (copy), CreateGroupSidebarStateModule (copy), GroupSidebarContextModule (copy)
	local UseMemoResult = ReactModule.useMemo(function()
		-- upvalues: CreateGroupSidebarStateModule (upval), p1 (copy)
		return CreateGroupSidebarStateModule(p1.initialGroupId, p1.initialExpanded, p1.revealGroupId)
	end, {
		if FFlagEnableGroupSidebarSdui then p1.resetKey else nil,
		p1.initialGroupId,
		p1.initialExpanded,
		p1.revealGroupId
	})
	ReactModule.useEffect(function()
		-- upvalues: UseMemoResult (copy)
		return UseMemoResult.dispose
	end, { UseMemoResult })
	
	return ReactModule.createElement(GroupSidebarContextModule.Provider, { value = UseMemoResult }, p1.children)
end