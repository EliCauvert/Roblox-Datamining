local Parent = script.Parent.Parent
local Parent1 = Parent.Parent
local ReactModule = require(Parent1.React)
local FoundationModule = require(Parent1.Foundation)
local View = FoundationModule.View
local Text = FoundationModule.Text
local LocalizationService = game:GetService("LocalizationService")
local FormatNumberModule = require(Parent.Utility.formatNumber)
local FFlagUnifiedPurchaseFlowMarketplaceUIImprovements = require(Parent.Parent.SharedFlags).FFlagUnifiedPurchaseFlowMarketplaceUIImprovements
local UseRobuxTextModule = require(Parent.Generic.Hooks.useRobuxText)

return function(p1) --[[ Line: 28 | Named "UnifiedPurchaseModalHeader" ]]
	-- upvalues: ReactModule (copy), FormatNumberModule (copy), LocalizationService (copy), FFlagUnifiedPurchaseFlowMarketplaceUIImprovements (copy), UseRobuxTextModule (copy), View (copy), Text (copy)
	local UseRobuxTextModuleResult = if FFlagUnifiedPurchaseFlowMarketplaceUIImprovements then UseRobuxTextModule(p1.robuxBalanceAmount or 0) else ReactModule.useMemo(function(): string --[[ Line: 29 ]]
		-- upvalues: FormatNumberModule (upval), LocalizationService (upval), p1 (copy)
		return utf8.char(57346) .. " " .. FormatNumberModule(LocalizationService.RobloxLocaleId, p1.robuxBalanceAmount or 0)
	end, {
		p1.robuxBalanceAmount,
		LocalizationService.RobloxLocaleId
	})
	
	return ReactModule.createElement(View, { tag = "auto-xy align-y-center align-x-start row" }, {
		LeftSide = ReactModule.createElement(View, {
			LayoutOrder = 1,
			tag = "row gap-small align-y-center align-x-start",
			Size = UDim2.new(0.5, 0, 1, 0)
		}, {
			RobuxAmount = ReactModule.createElement(Text, {
				LayoutOrder = 1,
				tag = "auto-xy text-heading-small content-default text-align-x-left",
				Text = p1.titleText
			})
		}),
		RightSide = if FFlagUnifiedPurchaseFlowMarketplaceUIImprovements and p1.hideUserRobuxBalance then nil else ReactModule.createElement(View, {
			LayoutOrder = 2,
			tag = "row align-y-center align-x-right gap-large",
			Size = UDim2.new(0.5, 0, 1, 0)
		}, {
			RobuxPrice = ReactModule.createElement(Text, {
				LayoutOrder = 2,
				tag = "auto-xy text-label-medium content-emphasis text-align-x-right",
				Text = UseRobuxTextModuleResult,
				RichText = if FFlagUnifiedPurchaseFlowMarketplaceUIImprovements then true else nil
			})
		})
	})
end