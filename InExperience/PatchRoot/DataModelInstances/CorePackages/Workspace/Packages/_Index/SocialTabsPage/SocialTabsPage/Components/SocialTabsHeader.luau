local socialTabsPage = script:FindFirstAncestor("SocialTabsPage")
local parent = socialTabsPage.Parent
local reactModule = require(parent.React)
local foundationModule = require(parent.Foundation)
local useNavigation = require(parent.Navigation).useNavigation
local useSocialTabsContextModule = require(socialTabsPage.Contexts.useSocialTabsContext)
local view = foundationModule.View
local text = foundationModule.Text
local iconButton = foundationModule.IconButton
local iconName = foundationModule.Enums.IconName
local iconSize = foundationModule.Enums.IconSize
local buttonVariant = foundationModule.Enums.ButtonVariant

return function(value)
	-- upvalues: useSocialTabsContextModule (ref), useNavigation (ref), reactModule (ref), view (ref), iconButton (ref), iconName (ref), iconSize (ref), buttonVariant (ref), text (ref)
	local var4 = useNavigation()
	
	return reactModule.createElement(view, {
		tag = "row align-y-center gap-small size-full-0 auto-y padding-x-xlarge bg-surface-0",
		LayoutOrder = value.layoutOrder
	}, {
		BackButton = reactModule.createElement(iconButton, {
			LayoutOrder = 1,
			icon = iconName.ChevronLargeLeft,
			size = iconSize.Medium,
			variant = buttonVariant.Utility,
			onActivated = reactModule.useCallback(function()
				-- upvalues: var4 (ref)
				var4.goBack()
			end, { var4 })
		}),
		Title = reactModule.createElement(text, {
			tag = "fill auto-y text-heading-medium text-align-x-left text-truncate-end content-emphasis",
			LayoutOrder = 2,
			Text = useSocialTabsContextModule().title or ""
		})
	})
end