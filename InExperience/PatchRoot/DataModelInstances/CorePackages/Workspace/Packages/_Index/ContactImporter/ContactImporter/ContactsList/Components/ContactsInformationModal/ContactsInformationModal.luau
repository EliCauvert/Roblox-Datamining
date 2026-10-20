local DependenciesModule = require(script.Parent.Parent.Parent.Parent.dependencies)
local T = DependenciesModule.t
local Roact = DependenciesModule.Roact
local UIBlox = DependenciesModule.UIBlox
local ImageSetLabel = UIBlox.Core.ImageSet.ImageSetLabel
local IconSize = UIBlox.App.Constant.IconSize
local StyledTextLabel = UIBlox.App.Text.StyledTextLabel
local WithStyleFunction = UIBlox.Style.withStyle
local ContactsInformationModal = Roact.PureComponent:extend("ContactsInformationModal")
ContactsInformationModal.validateProps = T.strictInterface({
	text = T.string,
	image = T.table,
	layoutOrder = T.optional(T.number)
})

function ContactsInformationModal.render(p1)
	-- upvalues: WithStyleFunction (copy), Roact (copy), ImageSetLabel (copy), IconSize (copy), StyledTextLabel (copy)
	return WithStyleFunction(function(p2)
		-- upvalues: p1 (copy), Roact (upval), ImageSetLabel (upval), IconSize (upval), StyledTextLabel (upval)
		local Props = p1.props
		
		return Roact.createElement("Frame", {
			BackgroundTransparency = 1,
			AutomaticSize = Enum.AutomaticSize.Y,
			Size = UDim2.fromScale(1, 0),
			LayoutOrder = Props.layoutOrder
		}, {
			UIListLayout = Roact.createElement("UIListLayout", {
				FillDirection = Enum.FillDirection.Vertical,
				SortOrder = Enum.SortOrder.LayoutOrder,
				Padding = UDim.new(0, 12),
				HorizontalAlignment = Enum.HorizontalAlignment.Center
			}),
			UIPadding = Roact.createElement("UIPadding", {
				PaddingTop = UDim.new(0, 24),
				PaddingBottom = UDim.new(0, 36)
			}),
			IconContainer = Roact.createElement("Frame", {
				BackgroundTransparency = 1,
				LayoutOrder = 1,
				Size = UDim2.fromOffset(120, 132)
			}, {
				Icon = Roact.createElement(ImageSetLabel, {
					BackgroundTransparency = 1,
					LayoutOrder = 1,
					AnchorPoint = Vector2.new(0.5, 0.5),
					ImageColor3 = p2.Theme.IconEmphasis.Color,
					ImageTransparency = p2.Theme.IconEmphasis.Transparency,
					Image = Props.image,
					Size = UDim2.fromOffset(IconSize.XLarge, IconSize.XLarge),
					Position = UDim2.fromScale(0.5, 0.5)
				})
			}),
			Description = Roact.createElement(StyledTextLabel, {
				lineHeight = 1.2,
				layoutOrder = 2,
				text = Props.text,
				fontStyle = p2.Font.CaptionBody,
				colorStyle = p2.Theme.TextEmphasis,
				size = UDim2.fromScale(1, 0),
				automaticSize = Enum.AutomaticSize.Y,
				textTruncate = Enum.TextTruncate.AtEnd,
				textXAlignment = Enum.TextXAlignment.Center,
				textYAlignment = Enum.TextYAlignment.Top
			})
		})
	end)
end

return ContactsInformationModal