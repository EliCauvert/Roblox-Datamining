local Parent = script:FindFirstAncestor("FlyoutSidePanel").Parent
local ReactModule = require(Parent.React)
local UseTokensFunction = require(Parent.Foundation).Hooks.useTokens
local FlyoutNavigationItemModule = require(script.Parent.FlyoutNavigationItem)

return function(p1)
	-- upvalues: UseTokensFunction (copy), ReactModule (copy), FlyoutNavigationItemModule (copy)
	local UseTokensResult = UseTokensFunction()
	
	return ReactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		Size = UDim2.new(1, 0, 0, 0),
		AutomaticSize = Enum.AutomaticSize.Y,
		LayoutOrder = p1.layoutOrder
	}, (ReactModule.useMemo(function()
		-- upvalues: ReactModule (upval), UseTokensResult (copy), p1 (copy), FlyoutNavigationItemModule (upval)
		local config = {
			ListLayout = ReactModule.createElement("UIListLayout", {
				FillDirection = Enum.FillDirection.Vertical,
				SortOrder = Enum.SortOrder.LayoutOrder,
				Padding = UDim.new(0, UseTokensResult.Gap.Small)
			})
		}
		
		for LayoutOrder, navigationItem in ipairs(p1.navigationItems) do
			if navigationItem and navigationItem.textKey then
				config[navigationItem.itemType] = ReactModule.createElement(FlyoutNavigationItemModule, {
					item = navigationItem,
					layoutOrder = LayoutOrder,
					closeDrawer = p1.closeDrawer,
					buildCreatorWebNavUrl = p1.buildCreatorWebNavUrl
				})
			end
		end
		return config
	end, {
		p1.navigationItems,
		p1.buildCreatorWebNavUrl,
		p1.closeDrawer,
		UseTokensResult.Gap.Small
	})))
end