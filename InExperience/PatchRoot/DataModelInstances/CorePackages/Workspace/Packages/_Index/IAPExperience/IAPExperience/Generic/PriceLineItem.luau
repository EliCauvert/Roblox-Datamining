local parent = script:FindFirstAncestor("IAPExperience").Parent
local reactModule = require(parent.React)
local foundationModule = require(parent.Foundation)
local view = foundationModule.View
local text = foundationModule.Text
local combineReactTags = require(parent.RoactUtils).combineReactTags
local fFlagPurchasePromptFetchCartPricing = require(parent.SharedFlags).FFlagPurchasePromptFetchCartPricing

return function(p0)
	-- upvalues: reactModule (ref), combineReactTags (ref), view (ref), text (ref), fFlagPurchasePromptFetchCartPricing (ref)
	local textStyle = p0.textStyle or "text-body-small content-emphasis"
	
	return reactModule.createElement(view, {
		LayoutOrder = p0.LayoutOrder,
		tag = p0.tag or "row size-full-0 auto-y align-y-center padding-x-xsmall"
	}, {
		Label = reactModule.createElement(text, {
			LayoutOrder = 1,
			Text = p0.label,
			Size = UDim2.new(0.5, 0, 0, 0),
			tag = reactModule.useMemo(function()
				-- upvalues: combineReactTags (copy), textStyle (ref)
				return combineReactTags("auto-y", textStyle, "content-emphasis", "text-align-x-left")
			end, { textStyle }),
			RichText = if fFlagPurchasePromptFetchCartPricing then true else nil
		}),
		Amount = reactModule.createElement(text, {
			LayoutOrder = 2,
			RichText = true,
			Text = p0.amount,
			Size = UDim2.new(0.5, 0, 0, 0),
			tag = reactModule.useMemo(function()
				-- upvalues: combineReactTags (copy), textStyle (ref)
				return combineReactTags("auto-y", textStyle, "content-emphasis", "text-align-x-right")
			end, { textStyle })
		})
	})
end