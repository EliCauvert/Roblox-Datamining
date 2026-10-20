local IAPExperience = script:FindFirstAncestor("IAPExperience")
local Parent = IAPExperience.Parent
local ReactModule = require(Parent.React)
local FoundationModule = require(Parent.Foundation)
local View = FoundationModule.View
local Text = FoundationModule.Text
local CombineReactTagsFunction = require(Parent.RoactUtils).combineReactTags
local FFlagAXFixDiscountSummaryTextWrapPlusModule = require(IAPExperience.Flags.FFlagAXFixDiscountSummaryTextWrapPlus)
local RowSizeFull0AutoYAlignYTopPaddingXXsmall: string = if FFlagAXFixDiscountSummaryTextWrapPlusModule then "row size-full-0 auto-y align-y-top padding-x-xsmall" else "row size-full-0 auto-y align-y-center padding-x-xsmall"

return function(Frame) --[[ Line: 28 | Named "PriceLineItem" ]]
	-- upvalues: ReactModule (copy), FFlagAXFixDiscountSummaryTextWrapPlusModule (copy), CombineReactTagsFunction (copy), View (copy), RowSizeFull0AutoYAlignYTopPaddingXXsmall (copy), Text (copy)
	local TextStyle = Frame.textStyle or "text-body-small content-emphasis"
	
	return ReactModule.createElement(View, {
		LayoutOrder = Frame.LayoutOrder,
		tag = Frame.tag or RowSizeFull0AutoYAlignYTopPaddingXXsmall
	}, {
		Label = ReactModule.createElement(Text, {
			LayoutOrder = 1,
			RichText = true,
			Text = Frame.label,
			Size = if FFlagAXFixDiscountSummaryTextWrapPlusModule then UDim2.new(0.8, 0, 0, 0) else UDim2.new(0.5, 0, 0, 0),
			tag = ReactModule.useMemo(function() --[[ Line: 30 ]]
				-- upvalues: FFlagAXFixDiscountSummaryTextWrapPlusModule (upval), CombineReactTagsFunction (upval), TextStyle (copy)
				return if FFlagAXFixDiscountSummaryTextWrapPlusModule then CombineReactTagsFunction("auto-y", TextStyle, "content-emphasis", "text-align-x-left", "text-wrap") else CombineReactTagsFunction("auto-y", TextStyle, "content-emphasis", "text-align-x-left")
			end, { TextStyle })
		}),
		Amount = ReactModule.createElement(Text, {
			LayoutOrder = 2,
			RichText = true,
			Text = Frame.amount,
			Size = if FFlagAXFixDiscountSummaryTextWrapPlusModule then UDim2.new(0.2, 0, 0, 0) else UDim2.new(0.5, 0, 0, 0),
			tag = ReactModule.useMemo(function() --[[ Line: 36 ]]
				-- upvalues: CombineReactTagsFunction (upval), TextStyle (copy)
				return CombineReactTagsFunction("auto-y", TextStyle, "content-emphasis", "text-align-x-right")
			end, { TextStyle })
		})
	})
end