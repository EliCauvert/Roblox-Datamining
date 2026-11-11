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

return function(p1)
	-- upvalues: UseGroupsWrapperContextModule (copy), UseNavigationFunction (copy), UseLocalizationFunction (copy), TextKeysModule (copy), ReactModule (copy), AppHeaderBarModule (copy), View (copy), Text (copy), Button (copy), ButtonVariant (copy), InputSize (copy)
	local UseGroupsWrapperContextModuleResult = UseGroupsWrapperContextModule()
	local UseNavigationResult = UseNavigationFunction()
	local UseLocalizationResult = UseLocalizationFunction({
		title = TextKeysModule.HeadingGroups,
		seeAll = TextKeysModule.ActionSeeAll
	})
	local UseResult = ReactModule.useCallback(function()
		-- upvalues: UseNavigationResult (copy)
		UseNavigationResult.goBack()
	end, { UseNavigationResult })
	local UseMemoResult = ReactModule.useMemo(function()
		-- upvalues: AppHeaderBarModule (upval), UseResult (copy)
		return AppHeaderBarModule.makeBackButton(UseResult)
	end, { UseResult })
	
	return ReactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		LayoutOrder = p1.layoutOrder,
		Size = UDim2.new(1, 0, 0, 0),
		AutomaticSize = Enum.AutomaticSize.Y
	}, {
		LeftSection = ReactModule.createElement(View, { tag = "row auto-xy align-y-center gap-small" }, {
			BackButton = ReactModule.useMemo(function()
				-- upvalues: UseMemoResult (copy), ReactModule (upval), View (upval)
				return ReactModule.createElement(View, { tag = "size-0 auto-xy align-x-left", LayoutOrder = 1 }, { button = UseMemoResult() })
			end, { UseMemoResult }),
			Title = ReactModule.createElement(Text, {
				tag = "text-align-x-left content-default text-heading-medium",
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