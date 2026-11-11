local DependenciesModule = require(script:FindFirstAncestor("SocialLibraries").dependencies)
local Roact = DependenciesModule.Roact
local UIBlox = DependenciesModule.UIBlox
local Cryo = DependenciesModule.Cryo
local ImagesModule = require(script.Parent.Images)
local _Color3 = Color3.fromRGB(200, 200, 200)
local _Rect = Rect.new(7, 8, 7, 8)
local AlertViewTextbox = Roact.PureComponent:extend("AlertViewTextbox")
AlertViewTextbox.defaultProps = { LayoutOrder = 0, Text = "", PlaceholderText = nil }

function AlertViewTextbox.render(p1)
	-- upvalues: UIBlox (copy), _Rect (copy), Roact (copy), ImagesModule (copy), _Color3 (copy)
	return UIBlox.Style.withStyle(function(p2)
		-- upvalues: p1 (copy), _Rect (upval), Roact (upval), ImagesModule (upval), _Color3 (upval)
		local _Font = p2.Font
		local Theme = p2.Theme
		
		return Roact.createElement("ImageLabel", {
			BackgroundTransparency = 1,
			ImageRectSize = Vector2.new(0, 0),
			Image = ImagesModule.buttonStroke.Image,
			ImageColor3 = Theme.UIDefault.Color,
			ImageRectOffset = Vector2.new(0, 0),
			LayoutOrder = p1.props.LayoutOrder,
			ScaleType = Enum.ScaleType.Slice,
			Size = UDim2.new(1, 0, 0, 30),
			SliceCenter = _Rect
		}, {
			Textbox = Roact.createElement("TextBox", {
				BackgroundTransparency = 1,
				ClearTextOnFocus = false,
				Font = _Font.Header2.Font,
				PlaceholderText = p1.props.PlaceholderText,
				PlaceholderColor3 = _Color3,
				Position = UDim2.new(0, 6, 0, 0),
				Size = UDim2.new(1, -12, 1, 0),
				Text = p1.props.Text,
				TextColor3 = Theme.TextDefault.Color,
				TextSize = _Font.BaseSize * _Font.CaptionBody.RelativeSize,
				TextTruncate = Enum.TextTruncate.AtEnd,
				TextWrapped = true,
				TextXAlignment = Enum.TextXAlignment.Left,
				[Roact.Change.Text] = function(p3)
					-- upvalues: p1 (upval)
					if p1.props.onTextChanged then
						p1.props.onTextChanged(p3.Text)
					end
				end,
				[Roact.Ref] = p1.props.forwardRef
			})
		})
	end)
end

return Roact.forwardRef(function(p1, ForwardRef)
	-- upvalues: Roact (copy), AlertViewTextbox (copy), Cryo (copy)
	return Roact.createElement(AlertViewTextbox, Cryo.Dictionary.join(p1, { forwardRef = ForwardRef }))
end)