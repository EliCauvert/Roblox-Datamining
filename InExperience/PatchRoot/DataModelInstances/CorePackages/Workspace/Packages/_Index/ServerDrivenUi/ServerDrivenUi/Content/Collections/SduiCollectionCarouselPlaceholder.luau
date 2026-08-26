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

local function SduiCollectionCarouselItemPlaceholderRow(p1)
	-- upvalues: reactModule (ref)
	local var1 = reactModule.useMemo(function()
		-- upvalues: p1 (ref)
		return p1.itemSizeBinding:map(function(p2)
			return UDim2.new(0, p2.X, 0, p2.Y)
		end)
	end, { p1.itemSizeBinding })
	local t = {
		UIListLayout = reactModule.createElement("UIListLayout", {
			FillDirection = Enum.FillDirection.Horizontal,
			SortOrder = Enum.SortOrder.LayoutOrder,
			Padding = UDim.new(0, p1.gutter)
		})
	}
	
	for i = 1, if p1.carouselPeek > 0 then p1.itemsPerRow + 1 else p1.itemsPerRow do
		t[`Item{i}`] = reactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			BorderSizePixel = 0,
			LayoutOrder = i,
			Size = var1
		}, {
			ItemPlaceholder = reactModule.cloneElement(p1.itemPlaceholderComponent, { transparencyBinding = p1.transparencyBinding })
		})
	end
	return reactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		BorderSizePixel = 0,
		ClipsDescendants = true,
		LayoutOrder = p1.layoutOrder,
		Size = p1.rowSizeBinding
	}, t)
end

return reactModule.memo(function(p2)
	-- upvalues: useTokens (ref), useCollectionLayout (ref), signalsReactModule (ref), uDim (ref), fFlagSduiCollectionCarouselPlaceholderItem (ref), reactModule (ref), calculateItemWidth (ref), luaAppSduiCarouselPlaceholderHeaderMinWidthPct (ref), luaAppSduiCarouselPlaceholderHeaderMaxWidthPct (ref), sduiPlaceholder (ref), fIntLuaAppSduiCarouselPlaceholderHeaderHeightPx (ref), SduiCollectionCarouselItemPlaceholderRow (ref)
	local var2
	local var3 = useTokens()
	local scale = var3.Config.UI.Scale
	local var4 = useCollectionLayout(p2.collectionItemSize)
	local var5 = signalsReactModule.useSignalBinding(var4.getContainerWidth)
	local itemHeightFromWidth = p2.itemHeightFromWidth or uDim
	local var6 = nil
	local _ = nil
	
	if fFlagSduiCollectionCarouselPlaceholderItem then
		var6 = reactModule.useMemo(function()
			-- upvalues: var5 (ref), calculateItemWidth (copy), var4 (ref), itemHeightFromWidth (ref), scale (ref)
			return var5:map(function(p3)
				-- upvalues: calculateItemWidth (copy), var4 (copy), itemHeightFromWidth (copy), scale (copy)
				local var7 = calculateItemWidth(var4.itemsPerRow, var4.gutter, var4.margin, p3, 0, var4.carouselPeek)
				
				return Vector2.new(var7, math.max(var7 * itemHeightFromWidth.Scale + itemHeightFromWidth.Offset * scale, 0))
			end)
		end, {
			var5, var4.itemsPerRow, var4.gutter, var4.margin, var4.carouselPeek,
			itemHeightFromWidth, scale
		})
		var2 = reactModule.useMemo(function()
			-- upvalues: var6 (write)
			return var6:map(function(p3)
				return UDim2.new(1, 0, 0, p3.Y)
			end)
		end, { var6 })
	else
		var2 = reactModule.useMemo(function()
			-- upvalues: var5 (ref), calculateItemWidth (copy), var4 (ref), itemHeightFromWidth (ref), scale (ref)
			return var5:map(function(p3)
				-- upvalues: calculateItemWidth (copy), var4 (copy), itemHeightFromWidth (copy), scale (copy)
				return UDim2.new(1, 0, 0, math.max(calculateItemWidth(var4.itemsPerRow, var4.gutter, var4.margin, p3, 0, var4.carouselPeek) * itemHeightFromWidth.Scale + itemHeightFromWidth.Offset * scale, 0))
			end)
		end, {
			var5, var4.itemsPerRow, var4.gutter, var4.margin, var4.carouselPeek,
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
			Padding = UDim.new(0, if fFlagSduiCollectionCarouselPlaceholderItem and p2.hideHeader then 0 else var3.Padding.Medium)
		}),
		Header = if fFlagSduiCollectionCarouselPlaceholderItem and p2.hideHeader then nil else reactModule.createElement(sduiPlaceholder, {
			layoutOrder = 1,
			backgroundStyle = p2.backgroundStyle,
			cornerRadius = p2.cornerRadius,
			size = UDim2.new(reactModule.useMemo(function()
				-- upvalues: luaAppSduiCarouselPlaceholderHeaderMinWidthPct (copy), luaAppSduiCarouselPlaceholderHeaderMaxWidthPct (copy)
				local var7 = luaAppSduiCarouselPlaceholderHeaderMinWidthPct / 100
				
				return var7 + math.random() * (luaAppSduiCarouselPlaceholderHeaderMaxWidthPct / 100 - var7)
			end, {}), 0, 0, fIntLuaAppSduiCarouselPlaceholderHeaderHeightPx * scale),
			transparencyBinding = p2.transparencyBinding
		}),
		Row = if fFlagSduiCollectionCarouselPlaceholderItem and p2.itemPlaceholderComponent then reactModule.createElement(SduiCollectionCarouselItemPlaceholderRow, {
			layoutOrder = 2,
			carouselPeek = var4.carouselPeek,
			gutter = var4.gutter,
			itemPlaceholderComponent = p2.itemPlaceholderComponent,
			itemSizeBinding = var6,
			itemsPerRow = var4.itemsPerRow,
			rowSizeBinding = var2,
			transparencyBinding = p2.transparencyBinding
		}) else reactModule.createElement(sduiPlaceholder, {
			layoutOrder = 2,
			backgroundStyle = p2.backgroundStyle,
			cornerRadius = p2.cornerRadius,
			size = var2,
			transparencyBinding = p2.transparencyBinding
		})
	})
end)