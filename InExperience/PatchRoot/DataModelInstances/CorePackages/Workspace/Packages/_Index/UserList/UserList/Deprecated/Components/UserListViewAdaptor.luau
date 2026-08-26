local userList = script:FindFirstAncestor("UserList")
local parent = userList.Parent
local reactModule = require(parent.React)
local userListPeekViewModule = require(script.Parent.UserListPeekView)
local appFormFactor = require(userList.Common.Enums).AppFormFactor
local view = require(parent.Foundation).View
local useListFormFactorModule = require(userList.Hooks.useListFormFactor)
local _ = require(userList.Common.Types)
local t = {
	position = UDim2.fromScale(0, 0),
	size = UDim2.fromScale(1, 1),
	anchorPoint = Vector2.new(0, 0)
}

return function(p1)
	-- upvalues: useListFormFactorModule (ref), appFormFactor (ref), reactModule (ref), t (ref), view (ref), userListPeekViewModule (ref)
	local var1 = useListFormFactorModule()
	local var2 = var1.formFactor == appFormFactor.Compact
	local var3 = not var2 and p1.wideModePeekViewLayout ~= nil
	local var4 = reactModule.useMemo(function()
		-- upvalues: var3 (ref), p1 (ref), t (copy)
		return if var3 then p1.wideModePeekViewLayout else t
	end, { var1.formFactor, p1.wideModePeekViewLayout })
	
	return if var2 or var3 then reactModule.createElement(view, {
		Size = var4.size,
		Position = var4.position,
		AnchorPoint = var4.anchorPoint
	}, {
		UserListPeekView = reactModule.createElement(userListPeekViewModule, {
			users = p1.users,
			title = p1.title,
			onLoadMore = p1.onLoadMore,
			onUserSelected = p1.onUserSelected,
			hasMore = p1.hasMore
		})
	}) else nil
end