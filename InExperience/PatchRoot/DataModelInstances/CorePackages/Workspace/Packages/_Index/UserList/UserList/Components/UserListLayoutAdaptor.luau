local userList = script:FindFirstAncestor("UserList")
local reactModule = require(userList.Parent.React)
local verticalUserListSection = require(userList.Components.VerticalUserList).VerticalUserListSection
local horizontalUserList = require(userList.Components.HorizontalUserList).HorizontalUserList
local enumsModule = require(userList.Common.Enums)
local _ = require(userList.Common.Types)

return reactModule.memo(function(p1)
	-- upvalues: enumsModule (ref), verticalUserListSection (ref), horizontalUserList (ref), reactModule (ref)
	local var1 = if p1.layoutMode == enumsModule.LayoutMode.Vertical then verticalUserListSection else horizontalUserList
	local cloned = table.clone(p1)
	cloned.layoutMode = nil
	
	return reactModule.createElement(var1, cloned)
end)