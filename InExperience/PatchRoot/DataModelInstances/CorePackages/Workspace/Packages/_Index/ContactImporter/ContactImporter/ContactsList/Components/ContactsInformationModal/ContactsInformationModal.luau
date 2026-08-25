local dependenciesModule = require(script.Parent.Parent.Parent.Parent.dependencies)
local t = dependenciesModule.t
local roact = dependenciesModule.Roact
local UIBlox = dependenciesModule.UIBlox
local imageSetLabel = UIBlox.Core.ImageSet.ImageSetLabel
local iconSize = UIBlox.App.Constant.IconSize
local styledTextLabel = UIBlox.App.Text.StyledTextLabel
local withStyle = UIBlox.Style.withStyle
local contactsInformationModal = roact.PureComponent:extend("ContactsInformationModal")
contactsInformationModal.validateProps = t.strictInterface({
	text = t.string,
	image = t.table,
	layoutOrder = t.optional(t.number)
})

function contactsInformationModal.render(p0)
	-- upvalues: withStyle (ref), roact (ref), imageSetLabel (ref), iconSize (ref), styledTextLabel (ref)
	return withStyle(function(p1)
		-- upvalues: p0 (ref), roact (copy), imageSetLabel (copy), iconSize (copy), styledTextLabel (copy)
		local props = p0.props
		
		return roact.createElement("Frame", {
			BackgroundTransparency = 1,
			AutomaticSize = Enum.AutomaticSize.Y,
			Size = UDim2.fromScale(1, 0),
			LayoutOrder = props.layoutOrder
		}, {
			UIListLayout = roact.createElement("UIListLayout", {
				FillDirection = Enum.FillDirection.Vertical,
				SortOrder = Enum.SortOrder.LayoutOrder,
				Padding = UDim.new(0, 12),
				HorizontalAlignment = Enum.HorizontalAlignment.Center
			}),
			UIPadding = roact.createElement("UIPadding", {
				PaddingTop = UDim.new(0, 24),
				PaddingBottom = UDim.new(0, 36)
			}),
			IconContainer = roact.createElement("Frame", {
				BackgroundTransparency = 1,
				LayoutOrder = 1,
				Size = UDim2.fromOffset(120, 132)
			}, {
				Icon = roact.createElement(imageSetLabel, {
					BackgroundTransparency = 1,
					LayoutOrder = 1,
					AnchorPoint = Vector2.new(0.5, 0.5),
					ImageColor3 = p1.Theme.IconEmphasis.Color,
					ImageTransparency = p1.Theme.IconEmphasis.Transparency,
					Image = props.image,
					Size = UDim2.fromOffset(iconSize.XLarge, iconSize.XLarge),
					Position = UDim2.fromScale(0.5, 0.5)
				})
			}),
			Description = roact.createElement(styledTextLabel, {
				lineHeight = 1.2,
				layoutOrder = 2,
				text = props.text,
				fontStyle = p1.Font.CaptionBody,
				colorStyle = p1.Theme.TextEmphasis,
				size = UDim2.fromScale(1, 0),
				automaticSize = Enum.AutomaticSize.Y,
				textTruncate = Enum.TextTruncate.AtEnd,
				textXAlignment = Enum.TextXAlignment.Center,
				textYAlignment = Enum.TextYAlignment.Top
			})
		})
	end)
end

return contactsInformationModal