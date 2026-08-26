local parent = script:FindFirstAncestor("FlyoutSidePanel").Parent
local reactModule = require(parent.React)
local useTokens = require(parent.Foundation).Hooks.useTokens
local flyoutNavigationItemModule = require(script.Parent.FlyoutNavigationItem)

return function(p1)
	-- upvalues: useTokens (ref), reactModule (ref), flyoutNavigationItemModule (ref)
	local var1 = useTokens()
	
	return reactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		Size = UDim2.new(1, 0, 0, 0),
		AutomaticSize = Enum.AutomaticSize.Y,
		LayoutOrder = p1.layoutOrder
	}, reactModule.useMemo(function()
		-- upvalues: reactModule (copy), var1 (ref), p1 (ref), flyoutNavigationItemModule (copy)
		local t = {
			ListLayout = reactModule.createElement("UIListLayout", {
				FillDirection = Enum.FillDirection.Vertical,
				SortOrder = Enum.SortOrder.LayoutOrder,
				Padding = UDim.new(0, var1.Gap.Small)
			})
		}
		
		for i, v in ipairs(p1.navigationItems) do
			if v and v.textKey then
				t[v.itemType] = reactModule.createElement(flyoutNavigationItemModule, {
					item = v,
					layoutOrder = i,
					closeDrawer = p1.closeDrawer,
					buildCreatorWebNavUrl = p1.buildCreatorWebNavUrl
				})
			end
		end
		return t
	end, {
		p1.navigationItems,
		p1.buildCreatorWebNavUrl,
		p1.closeDrawer,
		var1.Gap.Small
	}))
end