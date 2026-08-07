local inExperienceShop = script:FindFirstAncestor("InExperienceShop")
local parent = inExperienceShop.Parent
local reactModule = require(parent.React)
local signal = require(parent.AppCommonLib).Signal
local categorySectionModule = require(inExperienceShop.Components.CategorySection)
local fFlagEnableInExperienceShopUnifiedLoggingModule = require(inExperienceShop.Flags.FFlagEnableInExperienceShopUnifiedLogging)
local _ = require(inExperienceShop.Types)
local _ = require(script.Parent.ShopHomePageView)

return function(p0) --[[ line: 32 | named "useShopHomePageViewModel" ]]
	-- upvalues: reactModule (ref), fFlagEnableInExperienceShopUnifiedLoggingModule (ref), signal (ref), categorySectionModule (ref)
	local itemsPerRow = p0.itemsPerRow
	local var4 = reactModule.useMemo(function() --[[ line: 34 ]]
		-- upvalues: fFlagEnableInExperienceShopUnifiedLoggingModule (copy), signal (copy)
		return if fFlagEnableInExperienceShopUnifiedLoggingModule then signal.new() else nil
	end, {})
	
	return {
		data = p0.sections,
		renderItem = reactModule.useCallback(function(p1) --[[ line: 48 ]]
			-- upvalues: reactModule (copy), categorySectionModule (copy), itemsPerRow (ref), p0 (ref), fFlagEnableInExperienceShopUnifiedLoggingModule (copy), var4 (ref)
			local item = p1.item
			
			return reactModule.createElement(categorySectionModule, {
				sectionId = item.id,
				title = item.name,
				items = item.items,
				robuxPackages = item.robuxPackages,
				featuredRobuxPackage = item.featuredRobuxPackage,
				paymentSessionId = item.paymentSessionId,
				itemsPerRow = itemsPerRow,
				onCategoryActivated = p0.onCategoryActivated,
				onItemActivated = p0.onItemActivated,
				isPageVisible = p0.Visible ~= false,
				scrollImpressionsSignal = if fFlagEnableInExperienceShopUnifiedLoggingModule then var4 else nil,
				LayoutOrder = p1.index
			})
		end, {
			itemsPerRow,
			p0.onCategoryActivated,
			p0.onItemActivated,
			p0.Visible,
			var4
		}),
		keyExtractor = reactModule.useCallback(function(p2) --[[ line: 76 ]]
			return p2.id
		end, {}),
		LayoutOrder = p0.LayoutOrder,
		Visible = p0.Visible,
		onScroll = if fFlagEnableInExperienceShopUnifiedLoggingModule then reactModule.useCallback(function(_) --[[ line: 41 ]]
			-- upvalues: fFlagEnableInExperienceShopUnifiedLoggingModule (copy), var4 (ref)
			if fFlagEnableInExperienceShopUnifiedLoggingModule and var4 then
				var4:fire()
			end
		end, { var4 }) else nil
	}
end