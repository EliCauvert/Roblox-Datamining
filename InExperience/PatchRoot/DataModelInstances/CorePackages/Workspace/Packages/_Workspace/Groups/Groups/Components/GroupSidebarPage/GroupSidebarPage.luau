local ReactModule = require(script:FindFirstAncestor("Groups").Parent.React)
local GroupSidebarPageViewModule = require(script.Parent.GroupSidebarPageView)
local UseGroupSidebarPageViewModelModule = require(script.Parent.useGroupSidebarPageViewModel)

return function()
	-- upvalues: UseGroupSidebarPageViewModelModule (copy), ReactModule (copy), GroupSidebarPageViewModule (copy)
	return ReactModule.createElement(GroupSidebarPageViewModule, (UseGroupSidebarPageViewModelModule()))
end