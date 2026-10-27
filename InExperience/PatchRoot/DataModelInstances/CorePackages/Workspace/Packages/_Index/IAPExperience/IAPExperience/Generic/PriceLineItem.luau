local Parent = script:FindFirstAncestor("IAPExperience").Parent
local ReactModule = require(Parent.React)
local FoundationModule = require(Parent.Foundation)
local View = FoundationModule.View
local Text = FoundationModule.Text
local CombineReactTagsFunction = require(Parent.RoactUtils).combineReactTags

return function(Frame)
	-- upvalues: ReactModule (copy), CombineReactTagsFunction (copy), View (copy), Text (copy)
	local TextStyle = Frame.textStyle or "text-body-small content-emphasis"
	
	return ReactModule.createElement(View, {
		LayoutOrder = Frame.LayoutOrder,
		tag = Frame.tag or "row size-full-0 auto-y align-y-top padding-x-xsmall"
	}, {
		Label = ReactModule.createElement(Text, {
			LayoutOrder = 1,
			RichText = true,
			Text = Frame.label,
			Size = UDim2.new(0.8, 0, 0, 0),
			tag = ReactModule.useMemo(function()
				-- upvalues: CombineReactTagsFunction (upval), TextStyle (copy)
				return CombineReactTagsFunction("auto-y", TextStyle, "content-emphasis", "text-align-x-left", "text-wrap")
			end, { TextStyle })
		}),
		Amount = ReactModule.createElement(Text, {
			LayoutOrder = 2,
			RichText = true,
			Text = Frame.amount,
			Size = UDim2.new(0.2, 0, 0, 0),
			tag = ReactModule.useMemo(function()
				-- upvalues: CombineReactTagsFunction (upval), TextStyle (copy)
				return CombineReactTagsFunction("auto-y", TextStyle, "content-emphasis", "text-align-x-right")
			end, { TextStyle })
		})
	})
end