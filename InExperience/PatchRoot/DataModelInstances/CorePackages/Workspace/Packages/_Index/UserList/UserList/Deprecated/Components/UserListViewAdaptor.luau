local UserList = script:FindFirstAncestor("UserList")
local Parent = UserList.Parent
local ReactModule = require(Parent.React)
local UserListPeekViewModule = require(script.Parent.UserListPeekView)
local AppFormFactor = require(UserList.Common.Enums).AppFormFactor
local View = require(Parent.Foundation).View
local UseListFormFactorModule = require(UserList.Hooks.useListFormFactor)
local _ = require(UserList.Common.Types)
local config = {
	position = UDim2.fromScale(0, 0),
	size = UDim2.fromScale(1, 1),
	anchorPoint = Vector2.new(0, 0)
}

return function(p1) --[[ Line: 28 | Named "UserListViewAdaptor" ]]
	-- upvalues: UseListFormFactorModule (copy), AppFormFactor (copy), ReactModule (copy), config (copy), View (copy), UserListPeekViewModule (copy)
	local UseListFormFactorModuleResult = UseListFormFactorModule()
	local IsFormFactorMatch = UseListFormFactorModuleResult.formFactor == AppFormFactor.Compact
	local HasWideModePeekViewLayout: boolean = not IsFormFactorMatch and p1.wideModePeekViewLayout ~= nil
	local UseMemoResult = ReactModule.useMemo(function() --[[ Line: 32 ]]
		-- upvalues: HasWideModePeekViewLayout (copy), p1 (copy), config (upval)
		return if HasWideModePeekViewLayout then p1.wideModePeekViewLayout else config
	end, {
		UseListFormFactorModuleResult.formFactor,
		p1.wideModePeekViewLayout
	})
	
	return if IsFormFactorMatch or HasWideModePeekViewLayout then ReactModule.createElement(View, {
		Size = UseMemoResult.size,
		Position = UseMemoResult.position,
		AnchorPoint = UseMemoResult.anchorPoint
	}, {
		UserListPeekView = ReactModule.createElement(UserListPeekViewModule, {
			users = p1.users,
			title = p1.title,
			onLoadMore = p1.onLoadMore,
			onUserSelected = p1.onUserSelected,
			hasMore = p1.hasMore
		})
	}) else nil
end