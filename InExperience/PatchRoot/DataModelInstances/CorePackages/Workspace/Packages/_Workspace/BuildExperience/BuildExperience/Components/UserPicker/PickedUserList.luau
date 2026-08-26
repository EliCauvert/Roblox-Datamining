local parent = script:FindFirstAncestor("BuildExperience").Parent
local foundationModule = require(parent.Foundation)
local reactModule = require(parent.React)
local pickedUserRowModule = require(script.Parent.PickedUserRow)
local list = foundationModule.List
local inputSize = foundationModule.Enums.InputSize

return function(p1)
	-- upvalues: reactModule (ref), pickedUserRowModule (ref), list (ref), inputSize (ref)
	local testId = p1.testId or "picked-user-list"
	local onRemove = p1.onRemove
	local removingUserIds = p1.removingUserIds or {}
	local t = {}
	
	if p1.header ~= nil then
		t.Header = p1.header
	end
	for i, v in p1.userIds do
		t[`row-{v}`] = reactModule.createElement(pickedUserRowModule, {
			userId = v,
			isRemoving = removingUserIds[v] == true,
			onRemove = onRemove,
			LayoutOrder = i + 1,
			testId = `{testId}-user-{v}`
		})
	end
	return reactModule.createElement(list.Root, {
		isContained = true,
		LayoutOrder = p1.layoutOrder,
		hasDivider = { hasDivider = true, isInset = false },
		size = inputSize.Medium,
		testId = testId
	}, t)
end