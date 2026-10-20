local UserList = script:FindFirstAncestor("UserList")
local ReactModule = require(UserList.Parent.React)
local VerticalUserListSection = require(UserList.Components.VerticalUserList).VerticalUserListSection
local HorizontalUserList = require(UserList.Components.HorizontalUserList).HorizontalUserList
local EnumsModule = require(UserList.Common.Enums)
local _ = require(UserList.Common.Types)

return ReactModule.memo(function(Tbl)
	-- upvalues: EnumsModule (copy), VerticalUserListSection (copy), HorizontalUserList (copy), ReactModule (copy)
	local Copy = table.clone(Tbl)
	Copy.layoutMode = nil
	
	return ReactModule.createElement(if Tbl.layoutMode == EnumsModule.LayoutMode.Vertical then VerticalUserListSection else HorizontalUserList, Copy)
end)