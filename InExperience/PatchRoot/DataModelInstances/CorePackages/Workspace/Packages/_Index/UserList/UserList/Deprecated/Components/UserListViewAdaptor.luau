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

return function(p0)
	-- upvalues: useListFormFactorModule (ref), appFormFactor (ref), reactModule (ref), t (ref), view (ref), userListPeekViewModule (ref)
	local var5 = useListFormFactorModule()
	local var6 = var5.formFactor == appFormFactor.Compact
	local var7 = not var6 and p0.wideModePeekViewLayout ~= nil
	local var8 = reactModule.useMemo(function()
		-- upvalues: var7 (ref), p0 (ref), t (copy)
		return if var7 then p0.wideModePeekViewLayout else t
	end, { var5.formFactor, p0.wideModePeekViewLayout })
	
	return if var6 or var7 then reactModule.createElement(view, {
		Size = var8.size,
		Position = var8.position,
		AnchorPoint = var8.anchorPoint
	}, {
		UserListPeekView = reactModule.createElement(userListPeekViewModule, {
			users = p0.users,
			title = p0.title,
			onLoadMore = p0.onLoadMore,
			onUserSelected = p0.onUserSelected,
			hasMore = p0.hasMore
		})
	}) else nil
end