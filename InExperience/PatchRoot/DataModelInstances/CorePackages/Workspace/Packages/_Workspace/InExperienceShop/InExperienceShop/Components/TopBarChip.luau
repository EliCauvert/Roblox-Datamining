local Parent = script:FindFirstAncestor("InExperienceShop").Parent
local ReactModule = require(Parent.React)
local FoundationModule = require(Parent.Foundation)
local Image = FoundationModule.Image
local Text = FoundationModule.Text
local View = FoundationModule.View
local UseTokensFunction = FoundationModule.Hooks.useTokens

return function(Frame)
	-- upvalues: UseTokensFunction (copy), ReactModule (copy), View (copy), Image (copy), Text (copy)
	local UseTokensResult = UseTokensFunction()
	local Floored = math.floor(UseTokensResult.Stroke.Thicker)
	local IsIsEmphasis = Frame.isEmphasis == true
	
	return ReactModule.createElement(View, {
		tag = {
			["row align-x-center align-y-center shrink size-0-1000 auto-x radius-circle clip bg-system-emphasis"] = IsIsEmphasis,
			["row align-x-center align-y-center shrink size-0-1000 auto-x radius-circle clip bg-over-media-300"] = not IsIsEmphasis
		},
		onActivated = Frame.onActivated,
		onStateChanged = Frame.onStateChanged,
		isDisabled = Frame.isDisabled,
		GroupTransparency = if Frame.isDisabled then 0.5 else 0,
		selection = { Selectable = Frame.isDisabled ~= true },
		LayoutOrder = Frame.LayoutOrder,
		ref = Frame.chipRef,
		testId = Frame.testId,
		sizeConstraint = if Frame.maxWidth == nil then nil else { MaxSize = Vector2.new(Frame.maxWidth, 1e999) },
		cursor = {
			radius = UDim.new(0, UseTokensResult.Radius.Circle),
			offset = Floored * 2,
			borderWidth = Floored
		}
	}, {
		Leading = ReactModule.createElement(View, {
			tag = "auto-xy",
			LayoutOrder = 1,
			padding = { left = UDim.new(0, UseTokensResult.Size.Size_250) }
		}, {
			ImagePlate = ReactModule.createElement(View, { tag = "size-600 radius-circle clip bg-shift-200" }, {
				Image = ReactModule.createElement(Image, {
					tag = "size-full",
					Image = Frame.image,
					testId = if Frame.testId == nil then nil else `{Frame.testId}--image`
				})
			})
		}),
		Label = ReactModule.createElement(Text, {
			LayoutOrder = 2,
			Text = Frame.text,
			tag = {
				["shrink size-0-full auto-x text-label-large text-no-wrap text-align-x-center text-align-y-center text-truncate-end content-action-emphasis"] = IsIsEmphasis,
				["shrink size-0-full auto-x text-label-large text-no-wrap text-align-x-center text-align-y-center text-truncate-end content-action-standard"] = not IsIsEmphasis
			},
			padding = {
				left = UDim.new(0, UseTokensResult.Padding.Small),
				right = UDim.new(0, UseTokensResult.Padding.Large)
			}
		})
	})
end