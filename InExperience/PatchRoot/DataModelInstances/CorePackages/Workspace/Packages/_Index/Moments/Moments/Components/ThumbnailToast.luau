local Parent = script:FindFirstAncestor("Moments").Parent
local FoundationModule = require(Parent.Foundation)
local ReactModule = require(Parent.React)
local Button = FoundationModule.Button
local Image = FoundationModule.Image
local Text = FoundationModule.Text
local View = FoundationModule.View
local ButtonVariant = FoundationModule.Enums.ButtonVariant
local FillBehavior = FoundationModule.Enums.FillBehavior
local InputSize = FoundationModule.Enums.InputSize

return function(Frame)
	-- upvalues: ReactModule (copy), Button (copy), ButtonVariant (copy), InputSize (copy), FillBehavior (copy), View (copy), Image (copy), Text (copy)
	local IsNotTextMatch: boolean = Frame.text ~= nil and Frame.text ~= ""
	local Elements = {}
	local Actions = Frame.actions or {}
	local Smallest = math.min(#Actions, 2)
	
	for i = 1, Smallest do
		local Action = Actions[i]
		Elements[`Action{i}`] = ReactModule.createElement(Button, {
			text = Action.text,
			onActivated = Action.onActivated,
			variant = ButtonVariant.Standard,
			size = InputSize.Medium,
			fillBehavior = FillBehavior.Fill,
			LayoutOrder = Smallest - i
		})
	end
	return ReactModule.createElement(View, {
		tag = "col gap-small auto-y padding-medium radius-medium bg-over-media-0",
		testId = "--moments-thumbnail-toast",
		Size = UDim2.new(Frame.width, UDim.new()),
		LayoutOrder = Frame.LayoutOrder
	}, {
		Summary = ReactModule.createElement(View, {
			LayoutOrder = 1,
			tag = "row gap-small align-y-top size-full-0 auto-y"
		}, {
			Thumbnail = ReactModule.createElement(Image, {
				LayoutOrder = 1,
				tag = "size-1200-1200 radius-small bg-shift-200",
				testId = "--moments-thumbnail-toast--thumbnail",
				Image = Frame.thumbnail,
				ScaleType = Enum.ScaleType.Crop
			}),
			Content = ReactModule.createElement(View, { LayoutOrder = 2, tag = "fill auto-y col gap-xxsmall" }, {
				Header = ReactModule.createElement(Text, {
					LayoutOrder = 1,
					tag = "size-full-0 auto-y text-title-small text-align-x-left text-truncate-end content-emphasis",
					Text = Frame.title
				}),
				Body = if IsNotTextMatch then ReactModule.createElement(Text, {
					LayoutOrder = 2,
					tag = "size-full-0 auto-y text-body-small text-wrap text-align-x-left content-default",
					Text = Frame.text
				}) else nil
			})
		}),
		Actions = if Smallest > 0 then ReactModule.createElement(View, {
			LayoutOrder = 2,
			tag = "row gap-small size-full-0 auto-y"
		}, Elements) else nil
	})
end