local corePackagesService = game:GetService("CorePackages")
local roactModule = require(corePackagesService.Packages.Roact)
local roactRoduxModule = require(corePackagesService.Packages.RoactRodux)
local tModule = require(corePackagesService.Packages.t)
local UIBloxModule = require(corePackagesService.Packages.UIBlox)
local foundationModule = require(corePackagesService.Packages.Foundation)
local iconName = foundationModule.Enums.IconName
local iconVariant = foundationModule.Enums.IconVariant
local iconSize = foundationModule.Enums.IconSize
local withFoundationOrUIBloxStyle = require(corePackagesService.Workspace.Packages.CoreGuiCommon).withFoundationOrUIBloxStyle
local fFlagCoreUiMigrateUIBloxToFoundation = require(corePackagesService.Workspace.Packages.SharedFlags).FFlagCoreUiMigrateUIBloxToFoundation
local parent = script.Parent.Parent
local withLayoutValues = require(parent.Connection.LayoutValues).WithLayoutValues
local iconButtonModule = require(parent.PresentationCommon.IconButton)
local colors = require(corePackagesService.Workspace.Packages.Style).Colors
local imageSetLabel = UIBloxModule.Core.ImageSet.ImageSetLabel
local images = UIBloxModule.App.ImageSet.Images
local enabled = require(corePackagesService.Workspace.Packages.Chrome).Enabled
local fFlagAllowDisplayingFoundationIconsForDropdownModule = require(parent.Parent.Flags.FFlagAllowDisplayingFoundationIconsForDropdown)

local function _(p1)
	-- upvalues: iconName (ref)
	return iconName[p1] ~= nil
end

local dropDownButton = roactModule.PureComponent:extend("DropDownButton")
dropDownButton.validateProps = tModule.strictInterface({
	text = tModule.string,
	layoutOrder = tModule.optional(tModule.integer),
	icon = tModule.union(tModule.string, tModule.table),
	lastButton = tModule.boolean,
	forceShowOptions = tModule.boolean,
	screenSizeX = tModule.number,
	screenSizeY = tModule.number,
	onActivated = tModule.optional(tModule.callback),
	onDecline = tModule.optional(tModule.callback),
	onDismiss = tModule.optional(tModule.callback),
	animatingAccept = tModule.optional(tModule.boolean),
	animatingDecline = tModule.optional(tModule.boolean),
	animatingPercentage = tModule.optional(tModule.number)
})

function dropDownButton.init(p1)
	p1.state = {
		isHovered = false,
		isPressed = false,
		sizeX = 100,
		absolutePosX = 0,
		absolutePosY = 0
	}
end

function dropDownButton.getColorBackgroundAnimation(value, p1)
	if value.props.animatingPercentage == nil then
		return 0, 0
	end
	local var1 = value.state.sizeX - p1.DropDownRightOptionSize
	local dropDownRightOptionSize = p1.DropDownRightOptionSize
	
	if value.props.animatingDecline then
		var1 -= p1.DropDownRightOptionSize
	end
	local var2 = value.state.sizeX - p1.DropDownRightOptionSize
	dropDownRightOptionSize += var2 * value.props.animatingPercentage
	var1 -= var2 * value.props.animatingPercentage * 0.5
	
	if value.state.sizeX < var1 + dropDownRightOptionSize then
		var1 -= var1 + dropDownRightOptionSize - value.state.sizeX
	end
	return var1, dropDownRightOptionSize
end

function dropDownButton.render(p1)
	-- upvalues: withLayoutValues (ref), withFoundationOrUIBloxStyle (ref), enabled (ref), colors (ref), fFlagAllowDisplayingFoundationIconsForDropdownModule (ref), iconName (ref), fFlagCoreUiMigrateUIBloxToFoundation (ref), iconSize (ref), roactModule (ref), foundationModule (ref), iconVariant (ref), imageSetLabel (ref), iconButtonModule (ref), images (ref)
	return withLayoutValues(function(p2)
		-- upvalues: withFoundationOrUIBloxStyle (copy), enabled (copy), p1 (ref), colors (copy), fFlagAllowDisplayingFoundationIconsForDropdownModule (copy), iconName (copy), fFlagCoreUiMigrateUIBloxToFoundation (copy), iconSize (copy), roactModule (copy), foundationModule (copy), iconVariant (copy), imageSetLabel (copy), iconButtonModule (copy), images (copy)
		return withFoundationOrUIBloxStyle(function(p3, p4)
			return {
				Theme = {
					BackgroundContrast = {
						Color = p3.Color.Surface.Surface_100.Color3,
						Transparency = p3.Color.Surface.Surface_100.Transparency
					},
					BackgroundOnHover = {
						Color = p3.Color.State.Hover.Color3,
						Transparency = p3.Color.State.Hover.Transparency
					},
					BackgroundOnPress = {
						Color = p3.Color.State.Press.Color3,
						Transparency = p3.Color.State.Press.Transparency
					},
					BackgroundUIContrast = {
						Color = p3.Color.OverMedia.OverMedia_0.Color3,
						Transparency = p3.Color.OverMedia.OverMedia_0.Transparency
					},
					Divider = {
						Color = p3.Color.Stroke.Emphasis.Color3,
						Transparency = p3.Color.Stroke.Emphasis.Transparency
					},
					IconEmphasis = {
						Color = p3.Color.Content.Emphasis.Color3,
						Transparency = p3.Color.Content.Emphasis.Transparency
					},
					TextEmphasis = {
						Color = p3.Color.Content.Emphasis.Color3,
						Transparency = p3.Color.Content.Emphasis.Transparency
					}
				},
				Font = {
					BaseSize = 1,
					Header2 = {
						Font = p3.Typography.TitleLarge.Font,
						RelativeSize = p3.Typography.TitleLarge.FontSize
					}
				},
				Settings = { PreferredTransparency = p4.preferredTransparency }
			}
		end, function(p3)
			-- upvalues: enabled (copy), p2 (ref), p1 (copy), colors (copy), fFlagAllowDisplayingFoundationIconsForDropdownModule (copy), iconName (copy), fFlagCoreUiMigrateUIBloxToFoundation (copy), iconSize (copy), roactModule (copy), foundationModule (copy), iconVariant (copy), imageSetLabel (copy), iconButtonModule (copy), images (copy)
			local t = {
				Color = if enabled() then p3.Theme.BackgroundUIContrast.Color else p3.Theme.BackgroundContrast.Color,
				Transparency = p2.OverrideBackgroundTransparency * p3.Settings.PreferredTransparency
			}
			local t_1 = { Transparency = 1, Color = Color3.new(1, 1, 1) }
			
			if p1.state.isPressed then
				t_1 = p3.Theme.BackgroundOnPress
			elseif p1.state.isHovered then
				t_1 = p3.Theme.BackgroundOnHover
			end
			local var1 = if p1.props.lastButton then "rbxasset://textures/ui/BottomRoundedRect8px.png" else ""
			local var2 = if p1.props.onActivated == nil then p1.props.animatingAccept else true
			local var3 = if p1.props.onDecline == nil then p1.props.animatingDecline else true
			local var4 = if p1.props.onDecline == nil then if p1.props.animatingPercentage == nil then p1.props.forceShowOptions else true else true
			local var5, var6 = p1:getColorBackgroundAnimation(p2)
			local green = colors.Green
			
			if p1.props.animatingDecline then
				green = colors.Red
			elseif p1.props.forceShowOptions then
				green = colors.White
			end
			local var7 = p2.DropDownPadding * 2 + p2.DropDownIconSize
			local var8 = p2.DropDownRightOptionSize * 2
			
			if var4 then
				var7 += var8
			end
			local var9
			local function onMouseButton1Down()
				-- upvalues: var4 (ref), p1 (copy)
				if not var4 then
					p1:setState({ isPressed = true })
				end
			end
			
			local function onMouseButton1Up()
				-- upvalues: p1 (copy)
				p1:setState({ isPressed = false })
			end
			
			local _ = nil
			local icon = p1.props.icon
			
			if fFlagAllowDisplayingFoundationIconsForDropdownModule and iconName[icon] ~= nil or fFlagCoreUiMigrateUIBloxToFoundation then
				local var10 = nil
				local medium = nil
				
				if iconName[icon] ~= nil then
					var10 = iconName[icon]
					medium = iconSize.Large
				elseif fFlagCoreUiMigrateUIBloxToFoundation then
					var10 = if typeof(icon) == "string" then icon else nil
					medium = iconSize.Medium
				end
				var9 = if var10 then roactModule.createElement("Frame", {
					LayoutOrder = 1,
					BackgroundTransparency = 1,
					Size = UDim2.new(0, p2.DropDownIconSize, 0, p2.DropDownIconSize)
				}, {
					Icon = roactModule.createElement(foundationModule.Icon, {
						name = var10,
						variant = iconVariant.Regular,
						size = medium,
						style = {
							Color3 = p3.Theme.IconEmphasis.Color,
							Transparency = p3.Theme.IconEmphasis.Transparency
						},
						AnchorPoint = Vector2.new(0.5, 0.5),
						Position = UDim2.new(0.5, 0, 0.5, 0)
					})
				}) else roactModule.createElement(foundationModule.Image, {
					BackgroundTransparency = 1,
					LayoutOrder = 1,
					Image = icon.Image,
					imageRect = { offset = icon.ImageRectOffset, size = icon.ImageRectSize },
					Size = UDim2.new(0, p2.DropDownIconSize, 0, p2.DropDownIconSize),
					imageStyle = {
						Color3 = p3.Theme.IconEmphasis.Color,
						Transparency = p3.Theme.IconEmphasis.Transparency
					}
				})
			else
				var9 = roactModule.createElement(imageSetLabel, {
					LayoutOrder = 1,
					BackgroundTransparency = 1,
					Size = UDim2.new(0, p2.DropDownIconSize, 0, p2.DropDownIconSize),
					ImageColor3 = p3.Theme.IconEmphasis.Color,
					Image = p1.props.icon
				})
			end
			return roactModule.createElement("ImageButton", {
				LayoutOrder = p1.props.layoutOrder,
				Image = var1,
				ScaleType = Enum.ScaleType.Slice,
				SliceCenter = Rect.new(8, 8, 24, 16),
				SliceScale = 0.5,
				ImageTransparency = if p1.props.lastButton then t.Transparency else 1,
				ImageColor3 = t.Color,
				Size = UDim2.new(1, 0, 0, p2.DropDownButtonSizeY),
				BackgroundTransparency = if p1.props.lastButton then 1 else t.Transparency,
				BackgroundColor3 = t.Color,
				AutoButtonColor = false,
				BorderSizePixel = 0,
				[roactModule.Event.Activated] = if not var4 then p1.props.onActivated else nil,
				[roactModule.Event.MouseEnter] = function()
					-- upvalues: var4 (ref), p1 (copy)
					if not var4 then
						p1:setState({ isHovered = true })
					end
				end,
				[roactModule.Event.MouseLeave] = function()
					-- upvalues: p1 (copy)
					p1:setState({ isHovered = false, isPressed = false })
				end,
				[roactModule.Change.AbsoluteSize] = function(p4)
					-- upvalues: p1 (copy)
					p1:setState({ sizeX = p4.AbsoluteSize.X })
				end,
				[roactModule.Change.AbsolutePosition] = function(p4)
					-- upvalues: p1 (copy)
					p1:setState({
						absolutePosX = p4.AbsolutePosition.X,
						absolutePosY = p4.AbsolutePosition.Y
					})
				end,
				[roactModule.Event.MouseButton1Down] = onMouseButton1Down,
				[roactModule.Event.MouseButton1Up] = onMouseButton1Up
			}, {
				ColorBackground = roactModule.createElement("ImageLabel", {
					ZIndex = 1,
					SliceScale = 0.5,
					BorderSizePixel = 0,
					Visible = p1.props.animatingPercentage ~= nil,
					Size = UDim2.new(0, var6, 1, 0),
					Position = UDim2.new(0, var5, 0, 0),
					Image = var1,
					ScaleType = Enum.ScaleType.Slice,
					SliceCenter = Rect.new(8, 8, 24, 16),
					ImageTransparency = if p1.props.lastButton then p2.IconButtonBackgroundTransparency else 1,
					ImageColor3 = green,
					BackgroundTransparency = if p1.props.lastButton then 1 else p2.IconButtonBackgroundTransparency,
					BackgroundColor3 = green
				}),
				HoverBackground = roactModule.createElement("ImageLabel", {
					ZIndex = 2,
					SliceScale = 0.5,
					BorderSizePixel = 0,
					Size = UDim2.new(1, 0, 1, 0),
					Image = var1,
					ScaleType = Enum.ScaleType.Slice,
					SliceCenter = Rect.new(8, 8, 24, 16),
					ImageTransparency = if p1.props.lastButton then t_1.Transparency else 1,
					ImageColor3 = t_1.Color,
					BackgroundTransparency = if p1.props.lastButton then 1 else t_1.Transparency,
					BackgroundColor3 = t_1.Color
				}, {
					InitalPadding = roactModule.createElement("UIPadding", { PaddingLeft = UDim.new(0, p2.DropDownPadding) }),
					ListLayout = roactModule.createElement("UIListLayout", {
						SortOrder = Enum.SortOrder.LayoutOrder,
						FillDirection = Enum.FillDirection.Horizontal,
						VerticalAlignment = Enum.VerticalAlignment.Center,
						Padding = UDim.new(0, p2.DropDownPadding)
					}),
					Icon = var9,
					Text = roactModule.createElement("TextLabel", {
						LayoutOrder = 2,
						BackgroundTransparency = 1,
						Size = UDim2.new(1, -var7, 1, 0),
						Text = p1.props.text,
						Font = p3.Font.Header2.Font,
						TextSize = p3.Font.BaseSize * p3.Font.Header2.RelativeSize,
						TextColor3 = p3.Theme.TextEmphasis.Color,
						TextTransparency = p3.Theme.TextEmphasis.Transparency,
						TextXAlignment = Enum.TextXAlignment.Left,
						TextTruncate = Enum.TextTruncate.AtEnd
					}),
					ButtonContainer = roactModule.createElement("Frame", {
						LayoutOrder = 3,
						BackgroundTransparency = 1,
						Visible = var4,
						Size = UDim2.new(0, var8, 1, 0)
					}, {
						ConfirmButton = var2 and (roactModule.createElement(iconButtonModule, {
							size = UDim2.new(0.5, 0, 1, 0),
							position = UDim2.new(0.5, 0, 0, 0),
							backgroundColor = if p1.props.onDecline then colors.Green else colors.White,
							icon = if fFlagCoreUiMigrateUIBloxToFoundation then "icons/actions/accept" else images["icons/actions/accept"],
							showBackground = p1.props.animatingPercentage == nil,
							onActivated = p1.props.onActivated
						}) or nil),
						DeclineButton = var3 and (roactModule.createElement(iconButtonModule, {
							size = UDim2.new(0.5, 0, 1, 0),
							position = UDim2.new(0, 0, 0, 0),
							backgroundColor = colors.Red,
							icon = if fFlagCoreUiMigrateUIBloxToFoundation then "icons/actions/reject" else images["icons/actions/reject"],
							showBackground = p1.props.animatingPercentage == nil,
							onActivated = p1.props.onDecline
						}) or nil)
					})
				}),
				DismissInputHandler = roactModule.createElement("ImageButton", {
					Image = "",
					BackgroundTransparency = 1,
					Size = UDim2.new(0, p1.props.screenSizeX, 0, p1.props.screenSizeY),
					Position = UDim2.new(0, -p1.state.absolutePosX, 0, -p1.state.absolutePosY),
					Visible = p1.props.onDismiss ~= nil,
					[roactModule.Event.Activated] = p1.props.onDismiss
				}),
				Divider = not p1.props.lastButton and roactModule.createElement("Frame", {
					ZIndex = 3,
					BorderSizePixel = 0,
					Size = UDim2.new(1, 0, 0, 1),
					Position = UDim2.new(0, 0, 1, 0),
					AnchorPoint = Vector2.new(0, 1),
					BackgroundTransparency = p3.Theme.Divider.Transparency,
					BackgroundColor3 = p3.Theme.Divider.Color
				})
			})
		end)
	end)
end

return roactRoduxModule.UNSTABLE_connect2(function(p1)
	return {
		screenSizeX = p1.screenSize.X,
		screenSizeY = p1.screenSize.Y
	}
end, nil)(dropDownButton)