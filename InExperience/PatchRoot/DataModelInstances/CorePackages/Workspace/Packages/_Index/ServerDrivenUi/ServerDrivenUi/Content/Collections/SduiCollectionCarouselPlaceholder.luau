local parent = script:FindFirstAncestor("ServerDrivenUi").Parent
local reactModule = require(parent.React)
local useTokens = require(parent.Foundation).Hooks.useTokens
local signalsReactModule = require(parent.SignalsReact)
local _ = require(parent.SduiCompat)
local collectionViewsModule = require(parent.CollectionViews)
local useCollectionLayout = collectionViewsModule.useCollectionLayout
local calculateItemWidth = collectionViewsModule.calculateItemWidth
local sduiPlaceholder = require(parent.SduiSharedContent).SduiPlaceholder
local sharedFlagsModule = require(parent.SharedFlags)
local fIntLuaAppSduiCarouselPlaceholderHeaderHeightPx = sharedFlagsModule.FIntLuaAppSduiCarouselPlaceholderHeaderHeightPx
local fFlagSduiCollectionCarouselPlaceholderItem = sharedFlagsModule.FFlagSduiCollectionCarouselPlaceholderItem
local luaAppSduiCarouselPlaceholderHeaderMinWidthPct = game:DefineFastInt("LuaAppSduiCarouselPlaceholderHeaderMinWidthPct", 30)
local luaAppSduiCarouselPlaceholderHeaderMaxWidthPct = game:DefineFastInt("LuaAppSduiCarouselPlaceholderHeaderMaxWidthPct", 60)
local uDim = UDim.new(1, 72)

local function SduiCollectionCarouselItemPlaceholderRow(p0) --[[ line: 50 ]]
	-- upvalues: reactModule (ref)
	local var8 = reactModule.useMemo(function() --[[ line: 51 ]]
		-- upvalues: p0 (ref)
		return p0.itemSizeBinding:map(function(p1) --[[ line: 52 ]]
			return UDim2.new(0, p1.X, 0, p1.Y)
		end)
	end, { p0.itemSizeBinding })
	local t = {
		UIListLayout = reactModule.createElement("UIListLayout", {
			FillDirection = Enum.FillDirection.Horizontal,
			SortOrder = Enum.SortOrder.LayoutOrder,
			Padding = UDim.new(0, p0.gutter)
		})
	}
	
	for i = 1, if p0.carouselPeek > 0 then p0.itemsPerRow + 1 else p0.itemsPerRow do
		t[`Item{i}`] = reactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			BorderSizePixel = 0,
			LayoutOrder = i,
			Size = var8
		}, {
			ItemPlaceholder = reactModule.cloneElement(p0.itemPlaceholderComponent, { transparencyBinding = p0.transparencyBinding })
		})
	end
	return reactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		BorderSizePixel = 0,
		ClipsDescendants = true,
		LayoutOrder = p0.layoutOrder,
		Size = p0.rowSizeBinding
	}, t)
end

return reactModule.memo(function(p2) --[[ line: 114 | named "SduiCollectionCarouselPlaceholder" ]]
	-- upvalues: useTokens (ref), useCollectionLayout (ref), signalsReactModule (ref), uDim (ref), fFlagSduiCollectionCarouselPlaceholderItem (ref), reactModule (ref), calculateItemWidth (ref), luaAppSduiCarouselPlaceholderHeaderMinWidthPct (ref), luaAppSduiCarouselPlaceholderHeaderMaxWidthPct (ref), sduiPlaceholder (ref), fIntLuaAppSduiCarouselPlaceholderHeaderHeightPx (ref), SduiCollectionCarouselItemPlaceholderRow (ref)
	local var15
	local var10 = useTokens()
	local scale = var10.Config.UI.Scale
	local var11 = useCollectionLayout(p2.collectionItemSize)
	local var12 = signalsReactModule.useSignalBinding(var11.getContainerWidth)
	local itemHeightFromWidth = p2.itemHeightFromWidth or uDim
	local var14 = nil
	local _ = nil
	
	if fFlagSduiCollectionCarouselPlaceholderItem then
		var14 = reactModule.useMemo(function() --[[ line: 128 ]]
			-- upvalues: var12 (ref), calculateItemWidth (copy), var11 (ref), itemHeightFromWidth (ref), scale (ref)
			return var12:map(function(p3) --[[ line: 129 ]]
				-- upvalues: calculateItemWidth (copy), var11 (copy), itemHeightFromWidth (copy), scale (copy)
				local var16 = calculateItemWidth(var11.itemsPerRow, var11.gutter, var11.margin, p3, 0, var11.carouselPeek)
				
				return Vector2.new(var16, math.max(var16 * itemHeightFromWidth.Scale + itemHeightFromWidth.Offset * scale, 0))
			end)
		end, {
			var12, var11.itemsPerRow, var11.gutter, var11.margin, var11.carouselPeek,
			itemHeightFromWidth, scale
		})
		var15 = reactModule.useMemo(function() --[[ line: 154 ]]
			-- upvalues: var14 (write)
			return var14:map(function(p4) --[[ line: 155 ]]
				return UDim2.new(1, 0, 0, p4.Y)
			end)
		end, { var14 })
	else
		var15 = reactModule.useMemo(function() --[[ line: 161 ]]
			-- upvalues: var12 (ref), calculateItemWidth (copy), var11 (ref), itemHeightFromWidth (ref), scale (ref)
			return var12:map(function(p5) --[[ line: 162 ]]
				-- upvalues: calculateItemWidth (copy), var11 (copy), itemHeightFromWidth (copy), scale (copy)
				return UDim2.new(1, 0, 0, math.max(calculateItemWidth(var11.itemsPerRow, var11.gutter, var11.margin, p5, 0, var11.carouselPeek) * itemHeightFromWidth.Scale + itemHeightFromWidth.Offset * scale, 0))
			end)
		end, {
			var12, var11.itemsPerRow, var11.gutter, var11.margin, var11.carouselPeek,
			itemHeightFromWidth, scale
		})
	end
	return reactModule.createElement("Frame", {
		AnchorPoint = p2.anchorPoint,
		AutomaticSize = Enum.AutomaticSize.Y,
		BackgroundTransparency = 1,
		BorderSizePixel = 0,
		LayoutOrder = p2.layoutOrder,
		Position = p2.position,
		Size = UDim2.fromScale(1, 0),
		ZIndex = p2.zIndex,
		[reactModule.Tag] = if p2.testId then `data-testid={p2.testId}` else nil
	}, {
		UIListLayout = reactModule.createElement("UIListLayout", {
			FillDirection = Enum.FillDirection.Vertical,
			HorizontalAlignment = Enum.HorizontalAlignment.Left,
			SortOrder = Enum.SortOrder.LayoutOrder,
			Padding = UDim.new(0, if fFlagSduiCollectionCarouselPlaceholderItem and p2.hideHeader then 0 else var10.Padding.Medium)
		}),
		Header = if fFlagSduiCollectionCarouselPlaceholderItem and p2.hideHeader then nil else reactModule.createElement(sduiPlaceholder, {
			layoutOrder = 1,
			backgroundStyle = p2.backgroundStyle,
			cornerRadius = p2.cornerRadius,
			size = UDim2.new(reactModule.useMemo(function() --[[ line: 193 ]]
				-- upvalues: luaAppSduiCarouselPlaceholderHeaderMinWidthPct (copy), luaAppSduiCarouselPlaceholderHeaderMaxWidthPct (copy)
				local var17 = luaAppSduiCarouselPlaceholderHeaderMinWidthPct / 100
				
				return var17 + math.random() * (luaAppSduiCarouselPlaceholderHeaderMaxWidthPct / 100 - var17)
			end, {}), 0, 0, fIntLuaAppSduiCarouselPlaceholderHeaderHeightPx * scale),
			transparencyBinding = p2.transparencyBinding
		}),
		Row = if fFlagSduiCollectionCarouselPlaceholderItem and p2.itemPlaceholderComponent then reactModule.createElement(SduiCollectionCarouselItemPlaceholderRow, {
			layoutOrder = 2,
			carouselPeek = var11.carouselPeek,
			gutter = var11.gutter,
			itemPlaceholderComponent = p2.itemPlaceholderComponent,
			itemSizeBinding = var14,
			itemsPerRow = var11.itemsPerRow,
			rowSizeBinding = var15,
			transparencyBinding = p2.transparencyBinding
		}) else reactModule.createElement(sduiPlaceholder, {
			layoutOrder = 2,
			backgroundStyle = p2.backgroundStyle,
			cornerRadius = p2.cornerRadius,
			size = var15,
			transparencyBinding = p2.transparencyBinding
		})
	})
end)