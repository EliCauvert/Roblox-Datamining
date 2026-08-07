local avatarExperienceInspectAndBuy = script:FindFirstAncestor("AvatarExperienceInspectAndBuy")
local parent = avatarExperienceInspectAndBuy.Parent
local reactModule = require(parent.React)
local foundationModule = require(parent.Foundation)
local skeleton = foundationModule.Skeleton
local useTokens = foundationModule.Hooks.useTokens
local viewTypeModule = require(avatarExperienceInspectAndBuy.Enums.ViewType)
local _ = require(avatarExperienceInspectAndBuy.Types)
local itemCardRowContainerModule = require(avatarExperienceInspectAndBuy.Components.ItemsView.ItemCardRowContainer)

local var5 = function(p0, p1) --[[ line: 45 ]]
	-- upvalues: viewTypeModule (ref)
	return if p0 == viewTypeModule.WideLandscape then {
		left = UDim.new(0, p1.Padding.XLarge),
		right = UDim.new(0, p1.Padding.XLarge),
		bottom = UDim.new(0, p1.Padding.Large)
	} elseif p0 == viewTypeModule.Compact then {
		left = UDim.new(0, p1.Padding.Large),
		right = UDim.new(0, p1.Padding.Large),
		bottom = UDim.new(0, p1.Padding.Large)
	} else {
		top = UDim.new(0, p1.Padding.Medium),
		left = UDim.new(0, p1.Margin.Large * 2),
		right = UDim.new(0, p1.Margin.Large * 2),
		bottom = UDim.new(0, p1.Padding.Large)
	}
end

return reactModule.forwardRef(function(p2, p3) --[[ line: 68 ]]
	-- upvalues: useTokens (ref), reactModule (ref), viewTypeModule (ref), var5 (ref), itemCardRowContainerModule (ref), skeleton (ref)
	local var6 = useTokens()
	local headerHeightOffset = p2.headerHeightOffset or 0
	local actionBarHeightOffset = p2.actionBarHeightOffset or 0
	local var9 = reactModule.useMemo(function() --[[ line: 73 ]]
		-- upvalues: p2 (ref), viewTypeModule (copy), var6 (ref)
		return if p2.view == viewTypeModule.Wide then var6.Size.Size_2500 else var6.Size.Size_2000
	end, { p2.view, var6 })
	
	return reactModule.createElement("ScrollingFrame", {
		ScrollBarThickness = 0,
		BackgroundTransparency = 1,
		BorderSizePixel = 0,
		LayoutOrder = 2,
		Size = reactModule.useMemo(function() --[[ line: 130 ]]
			-- upvalues: p2 (ref), viewTypeModule (copy), headerHeightOffset (ref), var6 (ref), actionBarHeightOffset (ref)
			return if p2.view == viewTypeModule.Compact then UDim2.new(1, 0, 1, (-headerHeightOffset) - var6.Padding.Small - actionBarHeightOffset) else UDim2.new(1, 0, 1, (-headerHeightOffset) - var6.Padding.Small)
		end, { p2.view, headerHeightOffset, var6, actionBarHeightOffset }),
		Position = UDim2.new(0, 0, 0, headerHeightOffset),
		CanvasSize = UDim2.new(1, 0, 0, 0),
		AutomaticCanvasSize = Enum.AutomaticSize.Y,
		ScrollingDirection = Enum.ScrollingDirection.Y,
		ref = p3
	}, reactModule.useCallback(function() --[[ line: 81 ]]
		-- upvalues: var5 (copy), p2 (ref), var6 (ref), reactModule (copy), itemCardRowContainerModule (copy), var9 (ref), skeleton (copy)
		local var10 = var5(p2.view, var6)
		local t = {
			UIListLayout = reactModule.createElement("UIListLayout", {
				SortOrder = Enum.SortOrder.LayoutOrder,
				FillDirection = Enum.FillDirection.Vertical,
				Padding = UDim.new(0, var6.Padding.Large)
			}),
			UIPadding = reactModule.createElement("UIPadding", {
				PaddingTop = var10.top,
				PaddingLeft = var10.left,
				PaddingRight = var10.right,
				PaddingBottom = var10.bottom
			})
		}
		
		if p2.items and #p2.items > 0 then
			for i, v in p2.items do
				t["Item" .. i] = reactModule.createElement(itemCardRowContainerModule, {
					item = v,
					view = p2.view,
					LayoutOrder = i,
					onItemCardActivated = p2.onItemCardActivated,
					itemCardWidth = var9
				})
			end
			return t
		else
			for i = 1, 5 do
				t["Skeleton" .. i] = reactModule.createElement("Frame", {
					BackgroundTransparency = 1,
					Size = UDim2.new(1, 0, 0, var9),
					LayoutOrder = i
				}, {
					Skeleton = reactModule.createElement(skeleton, { Size = UDim2.new(1, 0, 1, 0) })
				})
			end
			return t
		end
	end, { p2.items, p2.view, actionBarHeightOffset, var6 })())
end)