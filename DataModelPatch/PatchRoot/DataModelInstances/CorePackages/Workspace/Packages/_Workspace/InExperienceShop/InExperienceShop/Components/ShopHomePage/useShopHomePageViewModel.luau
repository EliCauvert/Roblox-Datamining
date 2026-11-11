local InExperienceShop = script:FindFirstAncestor("InExperienceShop")
local Parent = InExperienceShop.Parent
local ReactModule = require(Parent.React)
local Signal = require(Parent.AppCommonLib).Signal
local CategorySectionModule = require(InExperienceShop.Components.CategorySection)
local FFlagEnableInExperienceShopUnifiedLoggingModule = require(InExperienceShop.Flags.FFlagEnableInExperienceShopUnifiedLogging)
local _ = require(InExperienceShop.Types)
local _ = require(script.Parent.ShopHomePageView)

return function(Frame)
	-- upvalues: ReactModule (copy), FFlagEnableInExperienceShopUnifiedLoggingModule (copy), Signal (copy), CategorySectionModule (copy)
	local ItemsPerRow = Frame.itemsPerRow
	local UseMemoResult = ReactModule.useMemo(function()
		-- upvalues: FFlagEnableInExperienceShopUnifiedLoggingModule (upval), Signal (upval)
		return if FFlagEnableInExperienceShopUnifiedLoggingModule then Signal.new() else nil
	end, {})
	local UseResult = ReactModule.useCallback(function(_)
		-- upvalues: FFlagEnableInExperienceShopUnifiedLoggingModule (upval), UseMemoResult (copy)
		if FFlagEnableInExperienceShopUnifiedLoggingModule and UseMemoResult then
			UseMemoResult:fire()
		end
	end, { UseMemoResult })
	
	return {
		data = Frame.sections,
		renderItem = ReactModule.useCallback(function(p1)
			-- upvalues: ReactModule (upval), CategorySectionModule (upval), ItemsPerRow (copy), Frame (copy), FFlagEnableInExperienceShopUnifiedLoggingModule (upval), UseMemoResult (copy)
			local Item = p1.item
			
			return ReactModule.createElement(CategorySectionModule, {
				sectionId = Item.id,
				title = Item.name,
				items = Item.items,
				robuxPackages = Item.robuxPackages,
				featuredRobuxPackage = Item.featuredRobuxPackage,
				paymentSessionId = Item.paymentSessionId,
				itemsPerRow = ItemsPerRow,
				onCategoryActivated = Frame.onCategoryActivated,
				onItemActivated = Frame.onItemActivated,
				isPageVisible = Frame.Visible ~= false,
				scrollImpressionsSignal = if FFlagEnableInExperienceShopUnifiedLoggingModule then UseMemoResult else nil,
				LayoutOrder = p1.index
			})
		end, {
			ItemsPerRow,
			Frame.onCategoryActivated,
			Frame.onItemActivated,
			Frame.Visible,
			UseMemoResult
		}),
		keyExtractor = ReactModule.useCallback(function(p1)
			return p1.id
		end, {}),
		LayoutOrder = Frame.LayoutOrder,
		Visible = Frame.Visible,
		onScroll = if FFlagEnableInExperienceShopUnifiedLoggingModule then UseResult else nil
	}
end