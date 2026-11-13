local AvatarWorkshop = script:FindFirstAncestor("AvatarWorkshop")
local Parent = AvatarWorkshop.Parent
local ReactModule = require(Parent.React)
local UseTokensFunction = require(Parent.Foundation).Hooks.useTokens
local RoactNavigationModule = require(Parent.RoactNavigation)
local WorkshopWindowContextModule = require(AvatarWorkshop.Contexts.WorkshopWindowContext)
local AppContainer = RoactNavigationModule.createAppContainer((require(AvatarWorkshop.Navigation.Navigators.WorkshopNavigator)))

return function(p1)
	-- upvalues: UseTokensFunction (copy), ReactModule (copy), WorkshopWindowContextModule (copy), AppContainer (copy)
	local UseTokensResult = UseTokensFunction()
	
	return ReactModule.createElement("Frame", {
		Active = true,
		Size = UDim2.fromScale(1, 1),
		BackgroundColor3 = UseTokensResult.Color.Surface.Surface_100.Color3,
		BackgroundTransparency = UseTokensResult.Color.Surface.Surface_100.Transparency
	}, {
		Corner = ReactModule.createElement("UICorner", {
			CornerRadius = UDim.new(0, UseTokensResult.Radius.Medium)
		}),
		Navigation = ReactModule.createElement(WorkshopWindowContextModule.Provider, {
			value = ReactModule.useMemo(function()
				-- upvalues: p1 (copy)
				return { verticalLayout = p1.verticalLayout, onClose = p1.onClose }
			end, { p1.verticalLayout, p1.onClose })
		}, ReactModule.createElement(AppContainer))
	})
end