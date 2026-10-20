local SocialTabsPage = script:FindFirstAncestor("SocialTabsPage")
local Parent = SocialTabsPage.Parent
local ReactModule = require(Parent.React)
local FoundationModule = require(Parent.Foundation)
local UseNavigationFunction = require(Parent.Navigation).useNavigation
local UseSocialTabsContextModule = require(SocialTabsPage.Contexts.useSocialTabsContext)
local View = FoundationModule.View
local Text = FoundationModule.Text
local IconButton = FoundationModule.IconButton
local IconName = FoundationModule.Enums.IconName
local IconSize = FoundationModule.Enums.IconSize
local ButtonVariant = FoundationModule.Enums.ButtonVariant

return function(p1)
	-- upvalues: UseSocialTabsContextModule (copy), UseNavigationFunction (copy), ReactModule (copy), View (copy), IconButton (copy), IconName (copy), IconSize (copy), ButtonVariant (copy), Text (copy)
	local UseSocialTabsContextModuleResult = UseSocialTabsContextModule()
	local UseNavigationResult = UseNavigationFunction()
	
	return ReactModule.createElement(View, {
		tag = "row align-y-center gap-small size-full-0 auto-y padding-x-xlarge bg-surface-0",
		LayoutOrder = p1.layoutOrder
	}, {
		BackButton = ReactModule.createElement(IconButton, {
			LayoutOrder = 1,
			icon = IconName.ChevronLargeLeft,
			size = IconSize.Medium,
			variant = ButtonVariant.Utility,
			onActivated = ReactModule.useCallback(function()
				-- upvalues: UseNavigationResult (copy)
				UseNavigationResult.goBack()
			end, { UseNavigationResult })
		}),
		Title = ReactModule.createElement(Text, {
			tag = "fill auto-y text-heading-medium text-align-x-left text-truncate-end content-emphasis",
			LayoutOrder = 2,
			Text = UseSocialTabsContextModuleResult.title or ""
		})
	})
end