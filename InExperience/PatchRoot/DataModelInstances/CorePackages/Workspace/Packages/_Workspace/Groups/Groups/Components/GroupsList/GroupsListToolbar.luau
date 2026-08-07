local groups = script:FindFirstAncestor("Groups")
local parent = groups.Parent
local reactModule = require(parent.React)
local foundationModule = require(parent.Foundation)
local useLocalization = require(parent.Localization).Hooks.useLocalization
local view = foundationModule.View
local button = foundationModule.Button
local buttonVariant = foundationModule.Enums.ButtonVariant
local inputSize = foundationModule.Enums.InputSize
local textKeysModule = require(groups.Common.TextKeys)
local useGroupsWrapperContextModule = require(groups.Contexts.useGroupsWrapperContext)
local useGroupsAnalyticsModule = require(groups.Hooks.useGroupsAnalytics)
local eventNamesModule = require(groups.Analytics.EventNames)
local searchBarWrapperModule = require(script.Parent.SearchBarWrapper)

return function(p0) --[[ line: 26 | named "GroupsListToolbar" ]]
	-- upvalues: useGroupsWrapperContextModule (ref), useGroupsAnalyticsModule (ref), useLocalization (ref), textKeysModule (ref), reactModule (ref), eventNamesModule (ref), view (ref), searchBarWrapperModule (ref), button (ref), buttonVariant (ref), inputSize (ref)
	local var8 = useGroupsWrapperContextModule()
	local var9 = useGroupsAnalyticsModule()
	local var10 = useLocalization({
		searchPlaceholder = textKeysModule.LabelSearchMyGroups,
		createGroup = textKeysModule.ActionCreateGroup
	})
	
	return reactModule.createElement(view, {
		tag = "col size-full-0 auto-y align-x-left gap-medium",
		LayoutOrder = p0.layoutOrder
	}, {
		Search = reactModule.createElement(searchBarWrapperModule, {
			LayoutOrder = 1,
			placeholderText = p0.searchPlaceholder or var10.searchPlaceholder,
			onTextChanged = p0.onSearchTextChanged
		}),
		CreateGroupButton = reactModule.createElement(view, {
			LayoutOrder = 2,
			tag = "col",
			Size = UDim2.new(1, 0, 0, 0),
			AutomaticSize = Enum.AutomaticSize.Y
		}, {
			Button = reactModule.createElement(button, {
				text = var10.createGroup,
				variant = buttonVariant.Standard,
				size = inputSize.Medium,
				width = UDim.new(1, 0),
				isDisabled = p0.canCreateGroup == false,
				onActivated = reactModule.useCallback(function() --[[ line: 36 ]]
					-- upvalues: var9 (ref), eventNamesModule (copy), var8 (ref)
					var9.fireAnalyticsEvent(eventNamesModule.GroupsListCreateGroupClicked)
					var8.navigateTo.createGroup()
				end, { var8.navigateTo.createGroup, var9 })
			})
		})
	})
end