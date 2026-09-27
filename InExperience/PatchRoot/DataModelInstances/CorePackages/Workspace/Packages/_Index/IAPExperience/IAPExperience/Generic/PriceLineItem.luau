local IAPExperience = script:FindFirstAncestor("IAPExperience")
local parent = IAPExperience.Parent
local reactModule = require(parent.React)
local foundationModule = require(parent.Foundation)
local view = foundationModule.View
local text = foundationModule.Text
local combineReactTags = require(parent.RoactUtils).combineReactTags
local fFlagPurchasePromptFetchCartPricing = require(parent.SharedFlags).FFlagPurchasePromptFetchCartPricing
local fFlagAXFixDiscountSummaryTextWrapPlusModule = require(IAPExperience.Flags.FFlagAXFixDiscountSummaryTextWrapPlus)
local var1 = if fFlagAXFixDiscountSummaryTextWrapPlusModule then "row size-full-0 auto-y align-y-top padding-x-xsmall" else "row size-full-0 auto-y align-y-center padding-x-xsmall"

return function(p1)
	-- upvalues: reactModule (ref), fFlagAXFixDiscountSummaryTextWrapPlusModule (ref), combineReactTags (ref), view (ref), var1 (ref), text (ref), fFlagPurchasePromptFetchCartPricing (ref)
	local textStyle = p1.textStyle or "text-body-small content-emphasis"
	
	return reactModule.createElement(view, { LayoutOrder = p1.LayoutOrder, tag = p1.tag or var1 }, {
		Label = reactModule.createElement(text, {
			LayoutOrder = 1,
			Text = p1.label,
			Size = if fFlagAXFixDiscountSummaryTextWrapPlusModule then UDim2.new(0.8, 0, 0, 0) else UDim2.new(0.5, 0, 0, 0),
			tag = reactModule.useMemo(function()
				-- upvalues: fFlagAXFixDiscountSummaryTextWrapPlusModule (copy), combineReactTags (copy), textStyle (ref)
				return if fFlagAXFixDiscountSummaryTextWrapPlusModule then combineReactTags("auto-y", textStyle, "content-emphasis", "text-align-x-left", "text-wrap") else combineReactTags("auto-y", textStyle, "content-emphasis", "text-align-x-left")
			end, { textStyle }),
			RichText = if fFlagPurchasePromptFetchCartPricing then true else nil
		}),
		Amount = reactModule.createElement(text, {
			LayoutOrder = 2,
			RichText = true,
			Text = p1.amount,
			Size = if fFlagAXFixDiscountSummaryTextWrapPlusModule then UDim2.new(0.2, 0, 0, 0) else UDim2.new(0.5, 0, 0, 0),
			tag = reactModule.useMemo(function()
				-- upvalues: combineReactTags (copy), textStyle (ref)
				return combineReactTags("auto-y", textStyle, "content-emphasis", "text-align-x-right")
			end, { textStyle })
		})
	})
end