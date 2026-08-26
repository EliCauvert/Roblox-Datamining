local inExperienceShop = script:FindFirstAncestor("InExperienceShop")
local parent = inExperienceShop.Parent
local reactModule = require(parent.React)
local signal = require(parent.AppCommonLib).Signal
local categorySectionModule = require(inExperienceShop.Components.CategorySection)
local fFlagEnableInExperienceShopUnifiedLoggingModule = require(inExperienceShop.Flags.FFlagEnableInExperienceShopUnifiedLogging)
local _ = require(inExperienceShop.Types)
local _ = require(script.Parent.ShopHomePageView)

return function(p1)
	-- upvalues: reactModule (ref), fFlagEnableInExperienceShopUnifiedLoggingModule (ref), signal (ref), categorySectionModule (ref)
	local itemsPerRow = p1.itemsPerRow
	local var1 = reactModule.useMemo(function()
		-- upvalues: fFlagEnableInExperienceShopUnifiedLoggingModule (copy), signal (copy)
		return if fFlagEnableInExperienceShopUnifiedLoggingModule then signal.new() else nil
	end, {})
	
	return {
		data = p1.sections,
		renderItem = reactModule.useCallback(function(p2)
			-- upvalues: reactModule (copy), categorySectionModule (copy), itemsPerRow (ref), p1 (ref), fFlagEnableInExperienceShopUnifiedLoggingModule (copy), var1 (ref)
			local item = p2.item
			
			return reactModule.createElement(categorySectionModule, {
				sectionId = item.id,
				title = item.name,
				items = item.items,
				robuxPackages = item.robuxPackages,
				featuredRobuxPackage = item.featuredRobuxPackage,
				paymentSessionId = item.paymentSessionId,
				itemsPerRow = itemsPerRow,
				onCategoryActivated = p1.onCategoryActivated,
				onItemActivated = p1.onItemActivated,
				isPageVisible = p1.Visible ~= false,
				scrollImpressionsSignal = if fFlagEnableInExperienceShopUnifiedLoggingModule then var1 else nil,
				LayoutOrder = p2.index
			})
		end, {
			itemsPerRow,
			p1.onCategoryActivated,
			p1.onItemActivated,
			p1.Visible,
			var1
		}),
		keyExtractor = reactModule.useCallback(function(p2)
			return p2.id
		end, {}),
		LayoutOrder = p1.LayoutOrder,
		Visible = p1.Visible,
		onScroll = if fFlagEnableInExperienceShopUnifiedLoggingModule then reactModule.useCallback(function(_)
			-- upvalues: fFlagEnableInExperienceShopUnifiedLoggingModule (copy), var1 (ref)
			if fFlagEnableInExperienceShopUnifiedLoggingModule and var1 then
				var1:fire()
			end
		end, { var1 }) else nil
	}
end