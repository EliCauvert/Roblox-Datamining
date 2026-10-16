local Groups = script:FindFirstAncestor("Groups")
local Parent = Groups.Parent
local ReactModule = require(Parent.React)
local FoundationModule = require(Parent.Foundation)
local UseLocalizationFunction = require(Parent.Localization).Hooks.useLocalization
local View = FoundationModule.View
local Button = FoundationModule.Button
local ButtonVariant = FoundationModule.Enums.ButtonVariant
local InputSize = FoundationModule.Enums.InputSize
local TextKeysModule = require(Groups.Common.TextKeys)
local UseGroupsWrapperContextModule = require(Groups.Contexts.useGroupsWrapperContext)
local UseGroupsAnalyticsModule = require(Groups.Hooks.useGroupsAnalytics)
local EventNamesModule = require(Groups.Analytics.EventNames)
local SearchBarWrapperModule = require(script.Parent.SearchBarWrapper)

return function(p1) --[[ Line: 26 | Named "GroupsListToolbar" ]]
	-- upvalues: UseGroupsWrapperContextModule (copy), UseGroupsAnalyticsModule (copy), UseLocalizationFunction (copy), TextKeysModule (copy), ReactModule (copy), EventNamesModule (copy), View (copy), SearchBarWrapperModule (copy), Button (copy), ButtonVariant (copy), InputSize (copy)
	local UseGroupsWrapperContextModuleResult = UseGroupsWrapperContextModule()
	local UseGroupsAnalyticsModuleResult = UseGroupsAnalyticsModule()
	local UseLocalizationResult = UseLocalizationFunction({
		searchPlaceholder = TextKeysModule.LabelSearchMyGroups,
		createGroup = TextKeysModule.ActionCreateGroup
	})
	
	return ReactModule.createElement(View, {
		tag = "col size-full-0 auto-y align-x-left gap-medium",
		LayoutOrder = p1.layoutOrder
	}, {
		Search = ReactModule.createElement(SearchBarWrapperModule, {
			LayoutOrder = 1,
			placeholderText = p1.searchPlaceholder or UseLocalizationResult.searchPlaceholder,
			onTextChanged = p1.onSearchTextChanged
		}),
		CreateGroupButton = ReactModule.createElement(View, {
			LayoutOrder = 2,
			tag = "col",
			Size = UDim2.new(1, 0, 0, 0),
			AutomaticSize = Enum.AutomaticSize.Y
		}, {
			Button = ReactModule.createElement(Button, {
				text = UseLocalizationResult.createGroup,
				variant = ButtonVariant.Standard,
				size = InputSize.Medium,
				width = UDim.new(1, 0),
				isDisabled = p1.canCreateGroup == false,
				onActivated = ReactModule.useCallback(function() --[[ Line: 36 ]]
					-- upvalues: UseGroupsAnalyticsModuleResult (copy), EventNamesModule (upval), UseGroupsWrapperContextModuleResult (copy)
					UseGroupsAnalyticsModuleResult.fireAnalyticsEvent(EventNamesModule.GroupsListCreateGroupClicked)
					UseGroupsWrapperContextModuleResult.navigateTo.createGroup()
				end, {
					UseGroupsWrapperContextModuleResult.navigateTo.createGroup,
					UseGroupsAnalyticsModuleResult
				})
			})
		})
	})
end