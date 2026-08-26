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

return function(p1)
	-- upvalues: useGroupsWrapperContextModule (ref), useGroupsAnalyticsModule (ref), useLocalization (ref), textKeysModule (ref), reactModule (ref), eventNamesModule (ref), view (ref), searchBarWrapperModule (ref), button (ref), buttonVariant (ref), inputSize (ref)
	local var1 = useGroupsWrapperContextModule()
	local var2 = useGroupsAnalyticsModule()
	local var3 = useLocalization({
		searchPlaceholder = textKeysModule.LabelSearchMyGroups,
		createGroup = textKeysModule.ActionCreateGroup
	})
	
	return reactModule.createElement(view, {
		tag = "col size-full-0 auto-y align-x-left gap-medium",
		LayoutOrder = p1.layoutOrder
	}, {
		Search = reactModule.createElement(searchBarWrapperModule, {
			LayoutOrder = 1,
			placeholderText = p1.searchPlaceholder or var3.searchPlaceholder,
			onTextChanged = p1.onSearchTextChanged
		}),
		CreateGroupButton = reactModule.createElement(view, {
			LayoutOrder = 2,
			tag = "col",
			Size = UDim2.new(1, 0, 0, 0),
			AutomaticSize = Enum.AutomaticSize.Y
		}, {
			Button = reactModule.createElement(button, {
				text = var3.createGroup,
				variant = buttonVariant.Standard,
				size = inputSize.Medium,
				width = UDim.new(1, 0),
				isDisabled = p1.canCreateGroup == false,
				onActivated = reactModule.useCallback(function()
					-- upvalues: var2 (ref), eventNamesModule (copy), var1 (ref)
					var2.fireAnalyticsEvent(eventNamesModule.GroupsListCreateGroupClicked)
					var1.navigateTo.createGroup()
				end, { var1.navigateTo.createGroup, var2 })
			})
		})
	})
end