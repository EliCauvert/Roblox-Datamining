local Parent = script:FindFirstAncestor("IAPExperience").Parent
local ReactModule = require(Parent.React)
local FoundationModule = require(Parent.Foundation)
local View = FoundationModule.View
local Text = FoundationModule.Text
local CombineReactTagsFunction = require(Parent.RoactUtils).combineReactTags
local FFlagPurchasePromptFetchCartPricing = require(Parent.SharedFlags).FFlagPurchasePromptFetchCartPricing

return function(Frame)
	-- upvalues: ReactModule (copy), CombineReactTagsFunction (copy), View (copy), Text (copy), FFlagPurchasePromptFetchCartPricing (copy)
	local TextStyle = Frame.textStyle or "text-body-small content-emphasis"
	
	return ReactModule.createElement(View, {
		LayoutOrder = Frame.LayoutOrder,
		tag = Frame.tag or "row size-full-0 auto-y align-y-center padding-x-xsmall"
	}, {
		Label = ReactModule.createElement(Text, {
			LayoutOrder = 1,
			Text = Frame.label,
			Size = UDim2.new(0.5, 0, 0, 0),
			tag = ReactModule.useMemo(function()
				-- upvalues: CombineReactTagsFunction (upval), TextStyle (copy)
				return CombineReactTagsFunction("auto-y", TextStyle, "content-emphasis", "text-align-x-left")
			end, { TextStyle }),
			RichText = if FFlagPurchasePromptFetchCartPricing then true else nil
		}),
		Amount = ReactModule.createElement(Text, {
			LayoutOrder = 2,
			RichText = true,
			Text = Frame.amount,
			Size = UDim2.new(0.5, 0, 0, 0),
			tag = ReactModule.useMemo(function()
				-- upvalues: CombineReactTagsFunction (upval), TextStyle (copy)
				return CombineReactTagsFunction("auto-y", TextStyle, "content-emphasis", "text-align-x-right")
			end, { TextStyle })
		})
	})
end