local buildExperience = script:FindFirstAncestor("BuildExperience")
local parent = buildExperience.Parent
local foundationModule = require(parent.Foundation)
local reactModule = require(parent.React)
local useUserProfileInfoModule = require(script.Parent.useUserProfileInfo)
local localizationStringsModule = require(buildExperience.LocalizationStrings)
local iconButton = foundationModule.IconButton
local list = foundationModule.List
local loading = foundationModule.Loading
local view = foundationModule.View
local useTokens = foundationModule.Hooks.useTokens
local iconName = foundationModule.Enums.IconName
local iconSize = foundationModule.Enums.IconSize
local accessoryType = foundationModule.Enums.AccessoryType

return function(p0) --[[ line: 34 | named "PickedUserRow" ]]
	-- upvalues: useTokens (ref), useUserProfileInfoModule (ref), reactModule (ref), view (ref), loading (ref), iconSize (ref), iconButton (ref), iconName (ref), list (ref), accessoryType (ref), localizationStringsModule (ref)
	local var5 = useUserProfileInfoModule(p0.userId)
	local size1000 = useTokens().Size.Size_1000
	
	return reactModule.createElement(list.Item, {
		LayoutOrder = p0.LayoutOrder,
		leading = { type = accessoryType.Avatar, userId = p0.userId },
		title = if var5.displayName ~= "" then localizationStringsModule.PRIVATE_INVITES_UNKNOWN_USER else var5.displayName,
		description = localizationStringsModule.formatUserPickerUsername(var5.username),
		trailing = if p0.isRemoving then reactModule.createElement(view, {
			tag = "align-x-center align-y-center",
			Size = UDim2.fromOffset(size1000, size1000),
			testId = `{p0.testId}-removing`
		}, {
			Spinner = reactModule.createElement(loading, { size = iconSize.Small })
		}) else reactModule.createElement(iconButton, {
			icon = iconName.TrashCan,
			onActivated = function() --[[ line: 55 ]]
				-- upvalues: p0 (ref)
				p0.onRemove(p0.userId)
			end,
			testId = `{p0.testId}-remove`
		}),
		testId = p0.testId
	})
end