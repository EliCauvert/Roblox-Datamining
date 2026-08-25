local userList = script:FindFirstAncestor("UserList")
local reactModule = require(userList.Parent.React)
local verticalUserListSection = require(userList.Components.VerticalUserList).VerticalUserListSection
local horizontalUserList = require(userList.Components.HorizontalUserList).HorizontalUserList
local enumsModule = require(userList.Common.Enums)
local _ = require(userList.Common.Types)

return reactModule.memo(function(p0)
	-- upvalues: enumsModule (ref), verticalUserListSection (ref), horizontalUserList (ref), reactModule (ref)
	local var3 = if p0.layoutMode == enumsModule.LayoutMode.Vertical then verticalUserListSection else horizontalUserList
	local cloned = table.clone(p0)
	cloned.layoutMode = nil
	
	return reactModule.createElement(var3, cloned)
end)