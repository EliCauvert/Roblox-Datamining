local dependenciesModule = require(script:FindFirstAncestor("SocialLibraries").dependencies)
local roact = dependenciesModule.Roact
local UIBlox = dependenciesModule.UIBlox
local cryo = dependenciesModule.Cryo
local imagesModule = require(script.Parent.Images)
local color = Color3.fromRGB(200, 200, 200)
local rect = Rect.new(7, 8, 7, 8)
local alertViewTextbox = roact.PureComponent:extend("AlertViewTextbox")
alertViewTextbox.defaultProps = { LayoutOrder = 0, Text = "", PlaceholderText = nil }

function alertViewTextbox.render(p1)
	-- upvalues: UIBlox (ref), rect (ref), roact (ref), imagesModule (ref), color (ref)
	return UIBlox.Style.withStyle(function(p2)
		-- upvalues: p1 (ref), rect (copy), roact (copy), imagesModule (copy), color (copy)
		local vector2 = Vector2.new(0, 0)
		local vector2_1 = Vector2.new(0, 0)
		local _ = nil
		local font = p2.Font
		local theme = p2.Theme
		
		return roact.createElement("ImageLabel", {
			BackgroundTransparency = 1,
			ImageRectSize = vector2_1,
			Image = imagesModule.buttonStroke.Image,
			ImageColor3 = theme.UIDefault.Color,
			ImageRectOffset = vector2,
			LayoutOrder = p1.props.LayoutOrder,
			ScaleType = Enum.ScaleType.Slice,
			Size = UDim2.new(1, 0, 0, 30),
			SliceCenter = rect
		}, {
			Textbox = roact.createElement("TextBox", {
				BackgroundTransparency = 1,
				ClearTextOnFocus = false,
				Font = font.Header2.Font,
				PlaceholderText = p1.props.PlaceholderText,
				PlaceholderColor3 = color,
				Position = UDim2.new(0, 6, 0, 0),
				Size = UDim2.new(1, -12, 1, 0),
				Text = p1.props.Text,
				TextColor3 = theme.TextDefault.Color,
				TextSize = font.BaseSize * font.CaptionBody.RelativeSize,
				TextTruncate = Enum.TextTruncate.AtEnd,
				TextWrapped = true,
				TextXAlignment = Enum.TextXAlignment.Left,
				[roact.Change.Text] = function(p3)
					-- upvalues: p1 (copy)
					if p1.props.onTextChanged then
						p1.props.onTextChanged(p3.Text)
					end
				end,
				[roact.Ref] = p1.props.forwardRef
			})
		})
	end)
end

return roact.forwardRef(function(p1, p2)
	-- upvalues: roact (ref), alertViewTextbox (ref), cryo (ref)
	return roact.createElement(alertViewTextbox, cryo.Dictionary.join(p1, { forwardRef = p2 }))
end)