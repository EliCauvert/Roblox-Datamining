local Modules = game:GetService("CoreGui").RobloxGui.Modules
local CorePackages = game:GetService("CorePackages")
local DashModule = require(CorePackages.Packages.Dash)
local ReactModule = require(CorePackages.Packages.React)
local UseLocalizationFunction = require(CorePackages.Workspace.Packages.Localization).Hooks.useLocalization
local UseDesignTokensFunction = require(CorePackages.Workspace.Packages.Style).useDesignTokens
local AnimatedFlatList = require(CorePackages.Packages.VirtualizedList).AnimatedFlatList
local MoreSectionModule = require(Modules.LuaApp.TenFootUI.MoreComponents.MoreSection)
local MoreItemsMapModule = require(Modules.LuaApp.Components.More.MoreItemsMap)
local UseSignalStateFunction = require(CorePackages.Packages.SignalsReact).useSignalState
local DisplayModule = require(CorePackages.Workspace.Packages.Display)
local FFlagEnableLeftNavOnConsole = require(CorePackages.Workspace.Packages.SharedFlags).FFlagEnableLeftNavOnConsole
local FFlagExtendScrollingFramesBySafeInsets = require(CorePackages.Workspace.Packages.SharedFlags).FFlagExtendScrollingFramesBySafeInsets

local function Section(p1)
	-- upvalues: UseLocalizationFunction (copy), DashModule (copy), MoreItemsMapModule (copy), ReactModule (copy), MoreSectionModule (copy)
	local Items = p1.items
	
	return ReactModule.createElement(MoreSectionModule, {
		layoutOrder = p1.layoutOrder,
		withDivider = p1.withDivider,
		title = UseLocalizationFunction({ title = p1.titleKey }).title
	}, if Items == nil then {} else DashModule.reduce(Items, function(List, ItemData, LayoutOrder)
		-- upvalues: MoreItemsMapModule (upval), ReactModule (upval)
		local ItemComponent = MoreItemsMapModule.getItemComponent(ItemData.itemType)
		
		if ItemComponent then
			table.insert(List, ReactModule.createElement(ItemComponent, { layoutOrder = LayoutOrder, itemData = ItemData }))
		end
		return List
	end, {}))
end

local function renderItem(p1)
	return p1.item
end

return ReactModule.memo(function(p1)
	-- upvalues: UseDesignTokensFunction (copy), DashModule (copy), MoreItemsMapModule (copy), Section (copy), ReactModule (copy), FFlagExtendScrollingFramesBySafeInsets (copy), UseSignalStateFunction (copy), DisplayModule (copy), FFlagEnableLeftNavOnConsole (copy), AnimatedFlatList (copy), renderItem (copy)
	local ItemList = p1.itemList
	local TopbarHeight = p1.topbarHeight or 0
	local UseDesignTokensResult = UseDesignTokensFunction()
	local PageTopMargin = UseDesignTokensResult.LuaApps.More.PageTopMargin
	local BackgroundGradientOffset = UseDesignTokensResult.LuaApps.More.BackgroundGradientOffset
	local SafeAreaMargin = UseDesignTokensResult.LuaApps.More.SafeAreaMargin
	local T = if ItemList == nil then {} else DashModule.reduce(ItemList, function(p2, p3)
		-- upvalues: DashModule (upval)
		return DashModule.append(p2, p3)
	end, {})
	local MapResult = DashModule.map(T, function(p2, LayoutOrder)
		-- upvalues: MoreItemsMapModule (upval), Section (upval), ReactModule (upval), T (ref)
		local ItemInfo = p2.itemInfo
		
		return ReactModule.createElement(MoreItemsMapModule.getSectionComponent(ItemInfo.itemType) or Section, {
			layoutOrder = LayoutOrder,
			withDivider = LayoutOrder < #T,
			titleKey = ItemInfo.textKey,
			items = p2.subItems
		})
	end)
	local UseSignalStateResult = if FFlagExtendScrollingFramesBySafeInsets then UseSignalStateFunction(DisplayModule.GetDisplayStore().getDeviceSafePadding) else nil
	
	return ReactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		Position = UDim2.new(0, SafeAreaMargin.X, 0, PageTopMargin + TopbarHeight),
		Size = UDim2.new(1, -2 * SafeAreaMargin.X, 1, (if FFlagExtendScrollingFramesBySafeInsets then UseSignalStateResult.bottom - SafeAreaMargin.Y else -SafeAreaMargin.Y) - PageTopMargin - TopbarHeight)
	}, {
		BackgroundFrame = ReactModule.createElement("Frame", {
			ZIndex = -1,
			Position = UDim2.new(0, -SafeAreaMargin.X, 0, -BackgroundGradientOffset),
			Size = UDim2.new(1, SafeAreaMargin.X + SafeAreaMargin.X, 1, BackgroundGradientOffset + SafeAreaMargin.Y),
			BackgroundColor3 = if FFlagEnableLeftNavOnConsole then UseDesignTokensResult.Color.Surface.Surface_0.Color3 else nil,
			BackgroundTransparency = if FFlagEnableLeftNavOnConsole then UseDesignTokensResult.Color.Surface.Surface_0.Transparency else 1
		}, {
			UIGradient = if FFlagEnableLeftNavOnConsole then nil else ReactModule.createElement("UIGradient", {
				Rotation = 90,
				Color = ColorSequence.new(Color3.new(0, 0, 0)),
				Transparency = NumberSequence.new(1, 0.4)
			})
		}),
		ContentList = ReactModule.createElement(AnimatedFlatList, {
			animated = true,
			animationConfig = UseDesignTokensResult.LuaApps.App.Page.ScrollAnimationConfig,
			initialNumToRender = #MapResult,
			data = MapResult,
			renderItem = renderItem,
			contentContainerStyle = { BackgroundTransparency = 1 },
			style = {
				Selectable = false,
				ClipsDescendants = true,
				BackgroundTransparency = 1,
				ScrollBarThickness = 0,
				ScrollingEnabled = false,
				VerticalScrollBarInset = Enum.ScrollBarInset.None
			},
			ItemSeparatorComponent = ReactModule.useCallback(function()
				-- upvalues: ReactModule (upval), UseDesignTokensResult (copy)
				return ReactModule.createElement("Frame", {
					BackgroundTransparency = 1,
					BorderSizePixel = 0,
					LayoutOrder = 10000000,
					Size = UDim2.new(1, 0, 0, UseDesignTokensResult.Size.Size_600)
				})
			end, { UseDesignTokensResult.Size.Size_600 }),
			ListHeaderComponent = ReactModule.createElement("Frame", {
				BackgroundTransparency = 1,
				BorderSizePixel = 0,
				Size = UDim2.new(1, 0, 0, UseDesignTokensResult.Size.Size_400)
			}),
			ListFooterComponent = ReactModule.createElement("Frame", {
				BackgroundTransparency = 1,
				BorderSizePixel = 0,
				Size = UDim2.new(1, 0, 0, UseDesignTokensResult.Size.Size_800)
			})
		})
	})
end)