local CorePackages = game:GetService("CorePackages")
local RoactModule = require(CorePackages.Packages.Roact)
local TModule = require(CorePackages.Packages.t)
local FoundationModule = require(CorePackages.Packages.Foundation)
local IconSize = FoundationModule.Enums.IconSize
local WithFoundationOrUIBloxStyleFunction = require(CorePackages.Workspace.Packages.CoreGuiCommon).withFoundationOrUIBloxStyle
local FFlagCoreUiMigrateUIBloxToFoundation = require(CorePackages.Workspace.Packages.SharedFlags).FFlagCoreUiMigrateUIBloxToFoundation
local WithLayoutValuesFunction = require(script.Parent.Parent.Connection.LayoutValues).WithLayoutValues
local ImageSetLabel = require(CorePackages.Packages.UIBlox).Core.ImageSet.ImageSetLabel
local IconButton = RoactModule.PureComponent:extend("IconButton")
IconButton.validateProps = TModule.strictInterface({
	size = TModule.UDim2,
	position = TModule.UDim2,
	backgroundColor = TModule.Color3,
	icon = TModule.union(TModule.string, TModule.table),
	showBackground = TModule.boolean,
	onActivated = TModule.optional(TModule.callback)
})

function IconButton.init(p1)
	p1.state = { isHovered = false, isPressed = false }
end

function IconButton.render(p1)
	-- upvalues: WithLayoutValuesFunction (copy), WithFoundationOrUIBloxStyleFunction (copy), FFlagCoreUiMigrateUIBloxToFoundation (copy), RoactModule (copy), FoundationModule (copy), IconSize (copy), ImageSetLabel (copy)
	return WithLayoutValuesFunction(function(p2)
		-- upvalues: WithFoundationOrUIBloxStyleFunction (upval), p1 (copy), FFlagCoreUiMigrateUIBloxToFoundation (upval), RoactModule (upval), FoundationModule (upval), IconSize (upval), ImageSetLabel (upval)
		return WithFoundationOrUIBloxStyleFunction(function(p3)
			return {
				Theme = {
					BackgroundOnHover = {
						Color = p3.Color.State.Hover.Color3,
						Transparency = p3.Color.State.Hover.Transparency
					},
					BackgroundOnPress = {
						Color = p3.Color.State.Press.Color3,
						Transparency = p3.Color.State.Press.Transparency
					},
					IconEmphasis = {
						Color = p3.Color.Content.Emphasis.Color3,
						Transparency = p3.Color.Content.Emphasis.Transparency
					}
				}
			}
		end, function(p3)
			-- upvalues: p1 (upval), FFlagCoreUiMigrateUIBloxToFoundation (upval), RoactModule (upval), p2 (copy), FoundationModule (upval), IconSize (upval), ImageSetLabel (upval)
			local BackgroundOnHover = { Transparency = 1, Color = Color3.new(1, 1, 1) }
			
			if p1.props.onActivated then
				if p1.state.isPressed then
					BackgroundOnHover = p3.Theme.BackgroundOnPress
				elseif p1.state.isHovered then
					BackgroundOnHover = p3.Theme.BackgroundOnHover
				end
			end
			local Frame = nil
			if FFlagCoreUiMigrateUIBloxToFoundation then
				local Icon = p1.props.icon
				Frame = if typeof(Icon) == "string" then RoactModule.createElement("Frame", {
					BackgroundTransparency = 1,
					ZIndex = 2,
					Position = UDim2.new(0.5, 0, 0.5, 0),
					Size = UDim2.new(0, p2.DropDownIconSize, 0, p2.DropDownIconSize),
					AnchorPoint = Vector2.new(0.5, 0.5)
				}, {
					Icon = RoactModule.createElement(FoundationModule.Icon, {
						name = Icon,
						size = IconSize.Medium,
						style = {
							Color3 = p3.Theme.IconEmphasis.Color,
							Transparency = p3.Theme.IconEmphasis.Transparency
						},
						AnchorPoint = Vector2.new(0.5, 0.5),
						Position = UDim2.new(0.5, 0, 0.5, 0)
					})
				}) else RoactModule.createElement(FoundationModule.Image, {
					BackgroundTransparency = 1,
					ZIndex = 2,
					Image = Icon.Image,
					imageRect = { offset = Icon.ImageRectOffset, size = Icon.ImageRectSize },
					Size = UDim2.new(0, p2.DropDownIconSize, 0, p2.DropDownIconSize),
					imageStyle = {
						Color3 = p3.Theme.IconEmphasis.Color,
						Transparency = p3.Theme.IconEmphasis.Transparency
					},
					AnchorPoint = Vector2.new(0.5, 0.5),
					Position = UDim2.new(0.5, 0, 0.5, 0)
				})
			else
				Frame = RoactModule.createElement(ImageSetLabel, {
					BackgroundTransparency = 1,
					ZIndex = 2,
					Position = UDim2.new(0.5, 0, 0.5, 0),
					Size = UDim2.new(0, p2.DropDownIconSize, 0, p2.DropDownIconSize),
					Image = p1.props.icon,
					AnchorPoint = Vector2.new(0.5, 0.5)
				})
			end
			return RoactModule.createElement("TextButton", {
				Text = "",
				BorderSizePixel = 0,
				BackgroundTransparency = p1.props.showBackground and p2.IconButtonBackgroundTransparency or 1,
				BackgroundColor3 = p1.props.backgroundColor,
				Position = p1.props.position,
				Size = p1.props.size,
				[RoactModule.Event.Activated] = p1.props.onActivated,
				[RoactModule.Event.MouseButton1Down] = function()
					-- upvalues: p1 (upval)
					p1:setState({ isPressed = true })
				end,
				[RoactModule.Event.MouseButton1Up] = function()
					-- upvalues: p1 (upval)
					p1:setState({ isPressed = false })
				end,
				[RoactModule.Event.MouseEnter] = function()
					-- upvalues: p1 (upval)
					p1:setState({ isHovered = true })
				end,
				[RoactModule.Event.MouseLeave] = function()
					-- upvalues: p1 (upval)
					p1:setState({ isHovered = false, isPressed = false })
				end
			}, {
				HoverBackground = RoactModule.createElement("Frame", {
					ZIndex = 1,
					BorderSizePixel = 0,
					Size = UDim2.new(1, 0, 1, 0),
					BackgroundTransparency = BackgroundOnHover.Transparency,
					BackgroundColor3 = BackgroundOnHover.Color
				}),
				ImageButton = Frame
			})
		end)
	end)
end

return IconButton