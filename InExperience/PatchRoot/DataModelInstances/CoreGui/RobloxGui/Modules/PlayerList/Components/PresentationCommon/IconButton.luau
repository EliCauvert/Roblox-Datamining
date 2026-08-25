local corePackagesService = game:GetService("CorePackages")
local roactModule = require(corePackagesService.Packages.Roact)
local tModule = require(corePackagesService.Packages.t)
local UIBloxModule = require(corePackagesService.Packages.UIBlox)
local foundationModule = require(corePackagesService.Packages.Foundation)
local iconSize = foundationModule.Enums.IconSize
local withFoundationOrUIBloxStyle = require(corePackagesService.Workspace.Packages.CoreGuiCommon).withFoundationOrUIBloxStyle
local fFlagCoreUiMigrateUIBloxToFoundation = require(corePackagesService.Workspace.Packages.SharedFlags).FFlagCoreUiMigrateUIBloxToFoundation
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

function iconButton.init(p0)
	p0.state = { isHovered = false, isPressed = false }
end

function iconButton.render(p1)
	-- upvalues: withLayoutValues (ref), withFoundationOrUIBloxStyle (ref), fFlagCoreUiMigrateUIBloxToFoundation (ref), roactModule (ref), foundationModule (ref), iconSize (ref), imageSetLabel (ref)
	return withLayoutValues(function(p2)
		-- upvalues: withFoundationOrUIBloxStyle (copy), p1 (ref), fFlagCoreUiMigrateUIBloxToFoundation (copy), roactModule (copy), foundationModule (copy), iconSize (copy), imageSetLabel (copy)
		return withFoundationOrUIBloxStyle(function(p3)
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
		end, function(p4)
			-- upvalues: p1 (copy), fFlagCoreUiMigrateUIBloxToFoundation (copy), roactModule (copy), p2 (ref), foundationModule (copy), iconSize (copy), imageSetLabel (copy)
			local t = { Transparency = 1, Color = Color3.new(1, 1, 1) }
			
			if p1.props.onActivated then
				if p1.state.isPressed then
					t = p4.Theme.BackgroundOnPress
				elseif p1.state.isHovered then
					t = p4.Theme.BackgroundOnHover
				end
			end
			local var7
			local _ = nil
			
			if fFlagCoreUiMigrateUIBloxToFoundation then
				local icon = p1.props.icon
				var7 = if typeof(icon) == "string" then roactModule.createElement("Frame", {
					BackgroundTransparency = 1,
					ZIndex = 2,
					Position = UDim2.new(0.5, 0, 0.5, 0),
					Size = UDim2.new(0, p2.DropDownIconSize, 0, p2.DropDownIconSize),
					AnchorPoint = Vector2.new(0.5, 0.5)
				}, {
					Icon = roactModule.createElement(foundationModule.Icon, {
						name = icon,
						size = iconSize.Medium,
						style = {
							Color3 = p4.Theme.IconEmphasis.Color,
							Transparency = p4.Theme.IconEmphasis.Transparency
						},
						AnchorPoint = Vector2.new(0.5, 0.5),
						Position = UDim2.new(0.5, 0, 0.5, 0)
					})
				}) else roactModule.createElement(foundationModule.Image, {
					BackgroundTransparency = 1,
					ZIndex = 2,
					Image = icon.Image,
					imageRect = { offset = icon.ImageRectOffset, size = icon.ImageRectSize },
					Size = UDim2.new(0, p2.DropDownIconSize, 0, p2.DropDownIconSize),
					imageStyle = {
						Color3 = p4.Theme.IconEmphasis.Color,
						Transparency = p4.Theme.IconEmphasis.Transparency
					},
					AnchorPoint = Vector2.new(0.5, 0.5),
					Position = UDim2.new(0.5, 0, 0.5, 0)
				})
			else
				var7 = roactModule.createElement(imageSetLabel, {
					BackgroundTransparency = 1,
					ZIndex = 2,
					Position = UDim2.new(0.5, 0, 0.5, 0),
					Size = UDim2.new(0, p2.DropDownIconSize, 0, p2.DropDownIconSize),
					Image = p1.props.icon,
					AnchorPoint = Vector2.new(0.5, 0.5)
				})
			end
			return roactModule.createElement("TextButton", {
				Text = "",
				BorderSizePixel = 0,
				BackgroundTransparency = if p1.props.showBackground then p2.IconButtonBackgroundTransparency else 1,
				BackgroundColor3 = p1.props.backgroundColor,
				Position = p1.props.position,
				Size = p1.props.size,
				[roactModule.Event.Activated] = p1.props.onActivated,
				[roactModule.Event.MouseButton1Down] = function()
					-- upvalues: p1 (copy)
					p1:setState({ isPressed = true })
				end,
				[roactModule.Event.MouseButton1Up] = function()
					-- upvalues: p1 (copy)
					p1:setState({ isPressed = false })
				end,
				[roactModule.Event.MouseEnter] = function()
					-- upvalues: p1 (copy)
					p1:setState({ isHovered = true })
				end,
				[roactModule.Event.MouseLeave] = function()
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
				ImageButton = var7
			})
		end)
	end)
end

return iconButton