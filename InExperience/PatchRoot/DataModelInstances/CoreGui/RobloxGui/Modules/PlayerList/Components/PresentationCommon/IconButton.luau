local corePackagesService = game:GetService("CorePackages")
local roactModule = require(corePackagesService.Packages.Roact)
local tModule = require(corePackagesService.Packages.t)
local UIBloxModule = require(corePackagesService.Packages.UIBlox)
local withStyle = UIBloxModule.Style.withStyle
local withLayoutValues = require(script.Parent.Parent.Connection.LayoutValues).WithLayoutValues
local imageSetLabel = UIBloxModule.Core.ImageSet.ImageSetLabel
local iconButton = roactModule.PureComponent:extend("IconButton")
iconButton.validateProps = tModule.strictInterface({
	size = tModule.UDim2,
	position = tModule.UDim2,
	backgroundColor = tModule.Color3,
	icon = tModule.union(tModule.string, tModule.table),
	showBackground = tModule.boolean,
	onActivated = tModule.optional(tModule.callback)
})

function iconButton.init(p0) --[[ line: 28 ]]
	p0.state = { isHovered = false, isPressed = false }
end

function iconButton.render(p1) --[[ line: 35 ]]
	-- upvalues: withLayoutValues (ref), withStyle (ref), roactModule (ref), imageSetLabel (ref)
	return withLayoutValues(function(p2) --[[ line: 36 ]]
		-- upvalues: withStyle (copy), p1 (ref), roactModule (copy), imageSetLabel (copy)
		return withStyle(function(p3) --[[ line: 37 ]]
			-- upvalues: p1 (copy), roactModule (copy), p2 (ref), imageSetLabel (copy)
			local t = { Transparency = 1, Color = Color3.new(1, 1, 1) }
			
			if p1.props.onActivated then
				if p1.state.isPressed then
					t = p3.Theme.BackgroundOnPress
				elseif p1.state.isHovered then
					t = p3.Theme.BackgroundOnHover
				end
			end
			return roactModule.createElement("TextButton", {
				Text = "",
				BorderSizePixel = 0,
				BackgroundTransparency = if p1.props.showBackground then p2.IconButtonBackgroundTransparency else 1,
				BackgroundColor3 = p1.props.backgroundColor,
				Position = p1.props.position,
				Size = p1.props.size,
				[roactModule.Event.Activated] = p1.props.onActivated,
				[roactModule.Event.MouseButton1Down] = function() --[[ line: 61 ]]
					-- upvalues: p1 (copy)
					p1:setState({ isPressed = true })
				end,
				[roactModule.Event.MouseButton1Up] = function() --[[ line: 66 ]]
					-- upvalues: p1 (copy)
					p1:setState({ isPressed = false })
				end,
				[roactModule.Event.MouseEnter] = function() --[[ line: 72 ]]
					-- upvalues: p1 (copy)
					p1:setState({ isHovered = true })
				end,
				[roactModule.Event.MouseLeave] = function() --[[ line: 78 ]]
					-- upvalues: p1 (copy)
					p1:setState({ isHovered = false, isPressed = false })
				end
			}, {
				HoverBackground = roactModule.createElement("Frame", {
					ZIndex = 1,
					BorderSizePixel = 0,
					Size = UDim2.new(1, 0, 1, 0),
					BackgroundTransparency = t.Transparency,
					BackgroundColor3 = t.Color
				}),
				ImageButton = roactModule.createElement(imageSetLabel, {
					BackgroundTransparency = 1,
					ZIndex = 2,
					Position = UDim2.new(0.5, 0, 0.5, 0),
					Size = UDim2.new(0, p2.DropDownIconSize, 0, p2.DropDownIconSize),
					Image = p1.props.icon,
					AnchorPoint = Vector2.new(0.5, 0.5)
				})
			})
		end)
	end)
end

return iconButton