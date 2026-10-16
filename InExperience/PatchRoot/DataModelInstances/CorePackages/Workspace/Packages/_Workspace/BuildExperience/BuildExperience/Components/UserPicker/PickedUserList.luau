local Parent = script:FindFirstAncestor("BuildExperience").Parent
local FoundationModule = require(Parent.Foundation)
local ReactModule = require(Parent.React)
local PickedUserRowModule = require(script.Parent.PickedUserRow)
local List = FoundationModule.List
local InputSize = FoundationModule.Enums.InputSize

return function(p1) --[[ Line: 31 | Named "PickedUserList" ]]
	-- upvalues: ReactModule (copy), PickedUserRowModule (copy), List (copy), InputSize (copy)
	local TestId = p1.testId or "picked-user-list"
	local OnRemove = p1.onRemove
	local RemovingUserIds = p1.removingUserIds or {}
	local Elements = {}
	
	if p1.header ~= nil then
		Elements.Header = p1.header
	end
	for i, userId in p1.userIds do
		Elements[`row-{userId}`] = ReactModule.createElement(PickedUserRowModule, {
			userId = userId,
			isRemoving = RemovingUserIds[userId] == true,
			onRemove = OnRemove,
			LayoutOrder = i + 1,
			testId = `{TestId}-user-{userId}`
		})
	end
	return ReactModule.createElement(List.Root, {
		isContained = true,
		LayoutOrder = p1.layoutOrder,
		hasDivider = { hasDivider = true, isInset = false },
		size = InputSize.Medium,
		testId = TestId
	}, Elements)
end