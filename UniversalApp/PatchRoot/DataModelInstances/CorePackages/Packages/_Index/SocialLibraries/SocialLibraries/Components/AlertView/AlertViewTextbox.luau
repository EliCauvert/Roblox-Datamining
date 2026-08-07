local dependenciesModule = require(script:FindFirstAncestor("SocialLibraries").dependencies)
local roact = dependenciesModule.Roact
local UIBlox = dependenciesModule.UIBlox
local cryo = dependenciesModule.Cryo
local imagesModule = require(script.Parent.Images)
local color = Color3.fromRGB(200, 200, 200)
local rect = Rect.new(7, 8, 7, 8)
local alertViewTextbox = roact.PureComponent:extend("AlertViewTextbox")
alertViewTextbox.defaultProps = { LayoutOrder = 0, Text = "", PlaceholderText = nil }

function alertViewTextbox.render(p0) --[[ line: 19 ]]
	-- upvalues: UIBlox (ref), rect (ref), roact (ref), imagesModule (ref), color (ref)
	return UIBlox.Style.withStyle(function(p1) --[[ line: 20 ]]
		-- upvalues: p0 (ref), rect (copy), roact (copy), imagesModule (copy), color (copy)
		local vector2 = Vector2.new(0, 0)
		local vector2_1 = Vector2.new(0, 0)
		local _ = nil
		local font = p1.Font
		local theme = p1.Theme
		
		return roact.createElement("ImageLabel", {
			BackgroundTransparency = 1,
			ImageRectSize = vector2_1,
			Image = imagesModule.buttonStroke.Image,
			ImageColor3 = theme.UIDefault.Color,
			ImageRectOffset = vector2,
			LayoutOrder = p0.props.LayoutOrder,
			ScaleType = Enum.ScaleType.Slice,
			Size = UDim2.new(1, 0, 0, 30),
			SliceCenter = rect
		}, {
			Textbox = roact.createElement("TextBox", {
				BackgroundTransparency = 1,
				ClearTextOnFocus = false,
				Font = font.Header2.Font,
				PlaceholderText = p0.props.PlaceholderText,
				PlaceholderColor3 = color,
				Position = UDim2.new(0, 6, 0, 0),
				Size = UDim2.new(1, -12, 1, 0),
				Text = p0.props.Text,
				TextColor3 = theme.TextDefault.Color,
				TextSize = font.BaseSize * font.CaptionBody.RelativeSize,
				TextTruncate = Enum.TextTruncate.AtEnd,
				TextWrapped = true,
				TextXAlignment = Enum.TextXAlignment.Left,
				[roact.Change.Text] = function(p2) --[[ line: 57 ]]
					-- upvalues: p0 (copy)
					if p0.props.onTextChanged then
						p0.props.onTextChanged(p2.Text)
					end
				end,
				[roact.Ref] = p0.props.forwardRef
			})
		})
	end)
end

return roact.forwardRef(function(p3, p4) --[[ line: 69 ]]
	-- upvalues: roact (ref), alertViewTextbox (ref), cryo (ref)
	return roact.createElement(alertViewTextbox, cryo.Dictionary.join(p3, { forwardRef = p4 }))
end)