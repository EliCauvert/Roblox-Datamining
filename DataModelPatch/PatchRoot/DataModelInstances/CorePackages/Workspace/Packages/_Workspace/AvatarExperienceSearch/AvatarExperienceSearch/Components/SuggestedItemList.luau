local AvatarExperienceSearch = script:FindFirstAncestor("AvatarExperienceSearch")
local Parent = AvatarExperienceSearch.Parent
local ReactModule = require(Parent.React)
local SuggestedItemModule = require(AvatarExperienceSearch.Components.SuggestedItem)
local DividerModule = require(AvatarExperienceSearch.Components.Divider)
local AXRecentlyViewedSearchItemsIXPTest = require(Parent.AXCommon).Experiments.AXRecentlyViewedSearchItemsIXPTest

return function(p1)
	-- upvalues: ReactModule (copy), SuggestedItemModule (copy), DividerModule (copy), AXRecentlyViewedSearchItemsIXPTest (copy)
	return ReactModule.createElement("ScrollingFrame", {
		BorderSizePixel = 0,
		BackgroundTransparency = 1,
		ScrollBarThickness = 0,
		Selectable = false,
		AutomaticCanvasSize = Enum.AutomaticSize.XY,
		AutomaticSize = if AXRecentlyViewedSearchItemsIXPTest.isEnabled() and p1.disableScroll then Enum.AutomaticSize.Y else nil,
		CanvasSize = UDim2.fromScale(1, 1),
		ScrollingDirection = Enum.ScrollingDirection.Y,
		Size = UDim2.fromScale(1, 1)
	}, (ReactModule.useMemo(function()
		-- upvalues: ReactModule (upval), p1 (copy), SuggestedItemModule (upval), DividerModule (upval)
		local config = {
			Layout = ReactModule.createElement("UIListLayout", {
				SortOrder = Enum.SortOrder.LayoutOrder,
				FillDirection = Enum.FillDirection.Vertical
			})
		}
		
		for LayoutOrder, item in p1.items do
			config[`SuggestedItem{LayoutOrder}`] = ReactModule.createElement("Frame", {
				BorderSizePixel = 0,
				BackgroundTransparency = 1,
				Size = UDim2.new(1, 0, 0, 0),
				AutomaticSize = Enum.AutomaticSize.XY,
				AnchorPoint = Vector2.new(0, 0),
				Position = UDim2.new(0, 0, 0, 0),
				LayoutOrder = LayoutOrder
			}, {
				ItemLayout = ReactModule.createElement("UIListLayout", {
					SortOrder = Enum.SortOrder.LayoutOrder,
					FillDirection = Enum.FillDirection.Vertical
				}),
				Item = ReactModule.createElement(SuggestedItemModule, {
					layoutOrder = 0,
					text = item.text,
					type = item.type,
					onActivate = item.onActivate,
					onTrailingButtonActivate = item.onRemove,
					ref = if LayoutOrder == 1 then p1.firstSuggestedItemRef else nil
				}),
				Divider = if LayoutOrder < #p1.items then ReactModule.createElement(DividerModule, { layoutOrder = 1 }) else nil
			})
		end
		return config
	end, { p1.items })))
end