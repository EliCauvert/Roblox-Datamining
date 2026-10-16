local Groups = script:FindFirstAncestor("Groups")
local Parent = Groups.Parent
local ReactModule = require(Parent.React)
local UseLocalizationFunction = require(Parent.Localization).Hooks.useLocalization
local UseNavigationFunction = require(Parent.Navigation).useNavigation
local FoundationModule = require(Parent.Foundation)
local View = FoundationModule.View
local Text = FoundationModule.Text
local Button = FoundationModule.Button
local ButtonVariant = FoundationModule.Enums.ButtonVariant
local InputSize = FoundationModule.Enums.InputSize
local AppHeaderBarModule = require(Parent.AppHeaderBar)
local TextKeysModule = require(Groups.Common.TextKeys)
local UseGroupsWrapperContextModule = require(Groups.Contexts.useGroupsWrapperContext)
local FFlagEnableGroupDetailPane = require(Parent.SharedFlags).FFlagEnableGroupDetailPane

return function(p1) --[[ Line: 34 | Named "GroupsListHeader" ]]
	-- upvalues: UseGroupsWrapperContextModule (copy), UseNavigationFunction (copy), UseLocalizationFunction (copy), TextKeysModule (copy), ReactModule (copy), FFlagEnableGroupDetailPane (copy), AppHeaderBarModule (copy), View (copy), Text (copy), Button (copy), ButtonVariant (copy), InputSize (copy)
	local UseGroupsWrapperContextModuleResult = UseGroupsWrapperContextModule()
	local UseNavigationResult = UseNavigationFunction()
	local UseLocalizationResult = UseLocalizationFunction({
		title = TextKeysModule.HeadingGroups,
		seeAll = TextKeysModule.ActionSeeAll
	})
	local UseResult = ReactModule.useCallback(function() --[[ Line: 43 ]]
		-- upvalues: FFlagEnableGroupDetailPane (upval), UseGroupsWrapperContextModuleResult (copy), UseNavigationResult (copy)
		if FFlagEnableGroupDetailPane and UseGroupsWrapperContextModuleResult.navigateTo.previousView then
			UseGroupsWrapperContextModuleResult.navigateTo.previousView()
			
			return
		else
			UseNavigationResult.goBack()
		end
	end, {
		if FFlagEnableGroupDetailPane then UseGroupsWrapperContextModuleResult.navigateTo.previousView else nil,
		UseNavigationResult
	})
	local UseMemoResult = ReactModule.useMemo(function() --[[ Line: 52 ]]
		-- upvalues: AppHeaderBarModule (upval), UseResult (copy)
		return AppHeaderBarModule.makeBackButton(UseResult)
	end, { UseResult })
	
	return ReactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		LayoutOrder = p1.layoutOrder,
		Size = UDim2.new(1, 0, 0, 0),
		AutomaticSize = Enum.AutomaticSize.Y
	}, {
		LeftSection = ReactModule.createElement(View, { tag = "row align-y-center gap-small auto-xy" }, {
			BackButton = ReactModule.useMemo(function() --[[ Line: 56 ]]
				-- upvalues: UseMemoResult (copy), ReactModule (upval), View (upval)
				return ReactModule.createElement(View, { tag = "align-x-left size-0 auto-xy", LayoutOrder = 1 }, { button = UseMemoResult() })
			end, { UseMemoResult }),
			Title = ReactModule.createElement(Text, {
				tag = "text-heading-medium text-align-x-left content-default",
				LayoutOrder = 2,
				Text = UseLocalizationResult.title
			})
		}),
		SeeAllButton = ReactModule.createElement(Button, {
			text = UseLocalizationResult.seeAll,
			variant = ButtonVariant.Text,
			size = InputSize.Medium,
			onActivated = UseGroupsWrapperContextModuleResult.navigateTo.seeAllGroups,
			AnchorPoint = Vector2.new(1, 0.5),
			Position = UDim2.new(1, 0, 0.5, 0)
		})
	})
end