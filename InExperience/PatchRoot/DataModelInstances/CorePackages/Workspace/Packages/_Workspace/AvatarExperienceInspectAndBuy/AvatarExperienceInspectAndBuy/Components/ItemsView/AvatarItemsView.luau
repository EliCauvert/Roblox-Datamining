local avatarExperienceInspectAndBuy = script:FindFirstAncestor("AvatarExperienceInspectAndBuy")
local parent = avatarExperienceInspectAndBuy.Parent
local reactModule = require(parent.React)
local foundationModule = require(parent.Foundation)
local skeleton = foundationModule.Skeleton
local useTokens = foundationModule.Hooks.useTokens
local viewTypeModule = require(avatarExperienceInspectAndBuy.Enums.ViewType)
local _ = require(avatarExperienceInspectAndBuy.Types)
local itemCardRowContainerModule = require(avatarExperienceInspectAndBuy.Components.ItemsView.ItemCardRowContainer)

local var1 = function(p1, p2)
	-- upvalues: viewTypeModule (ref)
	return if p1 == viewTypeModule.WideLandscape then {
		left = UDim.new(0, p2.Padding.XLarge),
		right = UDim.new(0, p2.Padding.XLarge),
		bottom = UDim.new(0, p2.Padding.Large)
	} elseif p1 == viewTypeModule.Compact then {
		left = UDim.new(0, p2.Padding.Large),
		right = UDim.new(0, p2.Padding.Large),
		bottom = UDim.new(0, p2.Padding.Large)
	} else {
		top = UDim.new(0, p2.Padding.Medium),
		left = UDim.new(0, p2.Margin.Large * 2),
		right = UDim.new(0, p2.Margin.Large * 2),
		bottom = UDim.new(0, p2.Padding.Large)
	}
end

return reactModule.forwardRef(function(p1, p2)
	-- upvalues: useTokens (ref), reactModule (ref), viewTypeModule (ref), var1 (ref), itemCardRowContainerModule (ref), skeleton (ref)
	local var2 = useTokens()
	local headerHeightOffset = p1.headerHeightOffset or 0
	local actionBarHeightOffset = p1.actionBarHeightOffset or 0
	local var3 = reactModule.useMemo(function()
		-- upvalues: p1 (ref), viewTypeModule (copy), var2 (ref)
		return if p1.view == viewTypeModule.Wide then var2.Size.Size_2500 else var2.Size.Size_2000
	end, { p1.view, var2 })
	
	return reactModule.createElement("ScrollingFrame", {
		ScrollBarThickness = 0,
		BackgroundTransparency = 1,
		BorderSizePixel = 0,
		LayoutOrder = 2,
		Size = reactModule.useMemo(function()
			-- upvalues: p1 (ref), viewTypeModule (copy), headerHeightOffset (ref), var2 (ref), actionBarHeightOffset (ref)
			return if p1.view == viewTypeModule.Compact then UDim2.new(1, 0, 1, (-headerHeightOffset) - var2.Padding.Small - actionBarHeightOffset) else UDim2.new(1, 0, 1, (-headerHeightOffset) - var2.Padding.Small)
		end, { p1.view, headerHeightOffset, var2, actionBarHeightOffset }),
		Position = UDim2.new(0, 0, 0, headerHeightOffset),
		CanvasSize = UDim2.new(1, 0, 0, 0),
		AutomaticCanvasSize = Enum.AutomaticSize.Y,
		ScrollingDirection = Enum.ScrollingDirection.Y,
		ref = p2
	}, reactModule.useCallback(function()
		-- upvalues: var1 (copy), p1 (ref), var2 (ref), reactModule (copy), itemCardRowContainerModule (copy), var3 (ref), skeleton (copy)
		local var4 = var1(p1.view, var2)
		local t = {
			UIListLayout = reactModule.createElement("UIListLayout", {
				SortOrder = Enum.SortOrder.LayoutOrder,
				FillDirection = Enum.FillDirection.Vertical,
				Padding = UDim.new(0, var2.Padding.Large)
			}),
			UIPadding = reactModule.createElement("UIPadding", {
				PaddingTop = var4.top,
				PaddingLeft = var4.left,
				PaddingRight = var4.right,
				PaddingBottom = var4.bottom
			})
		}
		
		if p1.items and #p1.items > 0 then
			for i, v in p1.items do
				t["Item" .. i] = reactModule.createElement(itemCardRowContainerModule, {
					item = v,
					view = p1.view,
					LayoutOrder = i,
					onItemCardActivated = p1.onItemCardActivated,
					itemCardWidth = var3
				})
			end
			return t
		else
			for i = 1, 5 do
				t["Skeleton" .. i] = reactModule.createElement("Frame", {
					BackgroundTransparency = 1,
					Size = UDim2.new(1, 0, 0, var3),
					LayoutOrder = i
				}, {
					Skeleton = reactModule.createElement(skeleton, { Size = UDim2.new(1, 0, 1, 0) })
				})
			end
			return t
		end
	end, { p1.items, p1.view, actionBarHeightOffset, var2 })())
end)