local parent = script:FindFirstAncestor("FlyoutSidePanel").Parent
local reactModule = require(parent.React)
local useTokens = require(parent.Foundation).Hooks.useTokens
local flyoutNavigationItemModule = require(script.Parent.FlyoutNavigationItem)

return function(p0)
	-- upvalues: useTokens (ref), reactModule (ref), flyoutNavigationItemModule (ref)
	local var2 = useTokens()
	
	return reactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		Size = UDim2.new(1, 0, 0, 0),
		AutomaticSize = Enum.AutomaticSize.Y,
		LayoutOrder = p0.layoutOrder
	}, reactModule.useMemo(function()
		-- upvalues: reactModule (copy), var2 (ref), p0 (ref), flyoutNavigationItemModule (copy)
		local t = {
			ListLayout = reactModule.createElement("UIListLayout", {
				FillDirection = Enum.FillDirection.Vertical,
				SortOrder = Enum.SortOrder.LayoutOrder,
				Padding = UDim.new(0, var2.Gap.Small)
			})
		}
		
		for i, v in ipairs(p0.navigationItems) do
			if v and v.textKey then
				t[v.itemType] = reactModule.createElement(flyoutNavigationItemModule, {
					item = v,
					layoutOrder = i,
					closeDrawer = p0.closeDrawer,
					buildCreatorWebNavUrl = p0.buildCreatorWebNavUrl
				})
			end
		end
		return t
	end, {
		p0.navigationItems,
		p0.buildCreatorWebNavUrl,
		p0.closeDrawer,
		var2.Gap.Small
	}))
end