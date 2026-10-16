local AvatarExperienceInspectAndBuy = script:FindFirstAncestor("AvatarExperienceInspectAndBuy")
local Parent = AvatarExperienceInspectAndBuy.Parent
local ReactModule = require(Parent.React)
local FoundationModule = require(Parent.Foundation)
local Skeleton = FoundationModule.Skeleton
local UseTokensFunction = FoundationModule.Hooks.useTokens
local ViewTypeModule = require(AvatarExperienceInspectAndBuy.Enums.ViewType)
local _ = require(AvatarExperienceInspectAndBuy.Types)
local ItemCardRowContainerModule = require(AvatarExperienceInspectAndBuy.Components.ItemsView.ItemCardRowContainer)

local function v8(View, p1) --[[ Line: 45 ]]
	-- upvalues: ViewTypeModule (copy)
	return if View == ViewTypeModule.WideLandscape then {
		left = UDim.new(0, p1.Padding.XLarge),
		right = UDim.new(0, p1.Padding.XLarge),
		bottom = UDim.new(0, p1.Padding.Large)
	} elseif View == ViewTypeModule.Compact then {
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

return (ReactModule.forwardRef(function(p1, Ref) --[[ Line: 68 ]]
	-- upvalues: UseTokensFunction (copy), ReactModule (copy), ViewTypeModule (copy), v8 (copy), ItemCardRowContainerModule (copy), Skeleton (copy)
	local UseTokensResult = UseTokensFunction()
	local HeaderHeightOffset = p1.headerHeightOffset or 0
	local ActionBarHeightOffset = p1.actionBarHeightOffset or 0
	local UseMemoResult = ReactModule.useMemo(function() --[[ Line: 73 ]]
		-- upvalues: p1 (copy), ViewTypeModule (upval), UseTokensResult (copy)
		return if p1.view == ViewTypeModule.Wide then UseTokensResult.Size.Size_2500 else UseTokensResult.Size.Size_2000
	end, { p1.view, UseTokensResult })
	
	return ReactModule.createElement("ScrollingFrame", {
		ScrollBarThickness = 0,
		BackgroundTransparency = 1,
		BorderSizePixel = 0,
		LayoutOrder = 2,
		Size = ReactModule.useMemo(function(): UDim2 --[[ Line: 130 ]]
			-- upvalues: p1 (copy), ViewTypeModule (upval), HeaderHeightOffset (copy), UseTokensResult (copy), ActionBarHeightOffset (copy)
			return if p1.view == ViewTypeModule.Compact then UDim2.new(1, 0, 1, -HeaderHeightOffset - UseTokensResult.Padding.Small - ActionBarHeightOffset) else UDim2.new(1, 0, 1, -HeaderHeightOffset - UseTokensResult.Padding.Small)
		end, {
			p1.view,
			HeaderHeightOffset,
			UseTokensResult,
			ActionBarHeightOffset
		}),
		Position = UDim2.new(0, 0, 0, HeaderHeightOffset),
		CanvasSize = UDim2.new(1, 0, 0, 0),
		AutomaticCanvasSize = Enum.AutomaticSize.Y,
		ScrollingDirection = Enum.ScrollingDirection.Y,
		ref = Ref
	}, ReactModule.useCallback(function() --[[ Line: 81 ]]
		-- upvalues: v8 (upval), p1 (copy), UseTokensResult (copy), ReactModule (upval), ItemCardRowContainerModule (upval), UseMemoResult (copy), Skeleton (upval)
		local v1 = v8(p1.view, UseTokensResult)
		local config = {
			UIListLayout = ReactModule.createElement("UIListLayout", {
				SortOrder = Enum.SortOrder.LayoutOrder,
				FillDirection = Enum.FillDirection.Vertical,
				Padding = UDim.new(0, UseTokensResult.Padding.Large)
			}),
			UIPadding = ReactModule.createElement("UIPadding", {
				PaddingTop = v1.top,
				PaddingLeft = v1.left,
				PaddingRight = v1.right,
				PaddingBottom = v1.bottom
			})
		}
		
		if p1.items and #p1.items > 0 then
			for LayoutOrder, item in p1.items do
				config["Item" .. LayoutOrder] = ReactModule.createElement(ItemCardRowContainerModule, {
					item = item,
					view = p1.view,
					LayoutOrder = LayoutOrder,
					onItemCardActivated = p1.onItemCardActivated,
					itemCardWidth = UseMemoResult
				})
			end
			return config
		else
			for i = 1, 5 do
				config["Skeleton" .. i] = ReactModule.createElement("Frame", {
					BackgroundTransparency = 1,
					Size = UDim2.new(1, 0, 0, UseMemoResult),
					LayoutOrder = i
				}, {
					Skeleton = ReactModule.createElement(Skeleton, { Size = UDim2.new(1, 0, 1, 0) })
				})
			end
			return config
		end
	end, {
		p1.items,
		p1.view,
		ActionBarHeightOffset,
		UseTokensResult
	})())
end))