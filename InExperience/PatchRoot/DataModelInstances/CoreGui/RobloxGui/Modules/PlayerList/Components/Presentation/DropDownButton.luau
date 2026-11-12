local CorePackages = game:GetService("CorePackages")
local RoactModule = require(CorePackages.Packages.Roact)
local RoactRoduxModule = require(CorePackages.Packages.RoactRodux)
local TModule = require(CorePackages.Packages.t)
local UIBloxModule = require(CorePackages.Packages.UIBlox)
local FoundationModule = require(CorePackages.Packages.Foundation)
local IconName = FoundationModule.Enums.IconName
local IconVariant = FoundationModule.Enums.IconVariant
local IconSize = FoundationModule.Enums.IconSize
local NormalizeFontFaceFunction = FoundationModule.Utility.normalizeFontFace
local WithFoundationOrUIBloxStyleFunction = require(CorePackages.Workspace.Packages.CoreGuiCommon).withFoundationOrUIBloxStyle
local FFlagCoreUiMigrateUIBloxToFoundation = require(CorePackages.Workspace.Packages.SharedFlags).FFlagCoreUiMigrateUIBloxToFoundation
local FoundationFontFaceMigration = FoundationModule.Utility.Flags.FoundationFontFaceMigration
local Parent = script.Parent.Parent
local WithLayoutValuesFunction = require(Parent.Connection.LayoutValues).WithLayoutValues
local IconButtonModule = require(Parent.PresentationCommon.IconButton)
local Colors = require(CorePackages.Workspace.Packages.Style).Colors
local ImageSetLabel = UIBloxModule.Core.ImageSet.ImageSetLabel
local Images = UIBloxModule.App.ImageSet.Images
local EnabledFunction = require(CorePackages.Workspace.Packages.Chrome).Enabled
local FFlagAllowDisplayingFoundationIconsForDropdownModule = require(Parent.Parent.Flags.FFlagAllowDisplayingFoundationIconsForDropdown)

local function _(p1): boolean
	-- upvalues: IconName (copy)
	return IconName[p1] ~= nil
end

local DropDownButton = RoactModule.PureComponent:extend("DropDownButton")
DropDownButton.validateProps = TModule.strictInterface({
	text = TModule.string,
	layoutOrder = TModule.optional(TModule.integer),
	icon = TModule.union(TModule.string, TModule.table),
	lastButton = TModule.boolean,
	forceShowOptions = TModule.boolean,
	screenSizeX = TModule.number,
	screenSizeY = TModule.number,
	onActivated = TModule.optional(TModule.callback),
	onDecline = TModule.optional(TModule.callback),
	onDismiss = TModule.optional(TModule.callback),
	animatingAccept = TModule.optional(TModule.boolean),
	animatingDecline = TModule.optional(TModule.boolean),
	animatingPercentage = TModule.optional(TModule.number)
})

function DropDownButton.init(p1)
	p1.state = {
		isHovered = false,
		isPressed = false,
		sizeX = 100,
		absolutePosX = 0,
		absolutePosY = 0
	}
end

function DropDownButton.getColorBackgroundAnimation(p1, p2)
	if p1.props.animatingPercentage == nil then
		return 0, 0
	end
	local SizeXDelta = p1.state.sizeX - p2.DropDownRightOptionSize
	local DropDownRightOptionSize = p2.DropDownRightOptionSize
	
	if p1.props.animatingDecline then
		SizeXDelta -= p2.DropDownRightOptionSize
	end
	local SizeXDelta1 = p1.state.sizeX - p2.DropDownRightOptionSize
	local NewDropDownRightOptionSize = DropDownRightOptionSize + SizeXDelta1 * p1.props.animatingPercentage
	local SizeXDeltaDelta = SizeXDelta - SizeXDelta1 * p1.props.animatingPercentage * 0.5
	
	if p1.state.sizeX < SizeXDeltaDelta + NewDropDownRightOptionSize then
		SizeXDeltaDelta -= SizeXDeltaDelta + NewDropDownRightOptionSize - p1.state.sizeX
	end
	return SizeXDeltaDelta, NewDropDownRightOptionSize
end

function DropDownButton.render(p1)
	-- upvalues: WithLayoutValuesFunction (copy), WithFoundationOrUIBloxStyleFunction (copy), FoundationFontFaceMigration (copy), EnabledFunction (copy), Colors (copy), FFlagAllowDisplayingFoundationIconsForDropdownModule (copy), IconName (copy), FFlagCoreUiMigrateUIBloxToFoundation (copy), IconSize (copy), RoactModule (copy), FoundationModule (copy), IconVariant (copy), ImageSetLabel (copy), NormalizeFontFaceFunction (copy), IconButtonModule (copy), Images (copy)
	return WithLayoutValuesFunction(function(p2)
		-- upvalues: WithFoundationOrUIBloxStyleFunction (upval), FoundationFontFaceMigration (upval), EnabledFunction (upval), p1 (copy), Colors (upval), FFlagAllowDisplayingFoundationIconsForDropdownModule (upval), IconName (upval), FFlagCoreUiMigrateUIBloxToFoundation (upval), IconSize (upval), RoactModule (upval), FoundationModule (upval), IconVariant (upval), ImageSetLabel (upval), NormalizeFontFaceFunction (upval), IconButtonModule (upval), Images (upval)
		return WithFoundationOrUIBloxStyleFunction(function(p3, p4)
			-- upvalues: FoundationFontFaceMigration (upval)
			return {
				Tokens = if FoundationFontFaceMigration then p3 else nil,
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
			-- upvalues: EnabledFunction (upval), p2 (copy), p1 (upval), Colors (upval), FFlagAllowDisplayingFoundationIconsForDropdownModule (upval), IconName (upval), FFlagCoreUiMigrateUIBloxToFoundation (upval), IconSize (upval), RoactModule (upval), FoundationModule (upval), IconVariant (upval), ImageSetLabel (upval), FoundationFontFaceMigration (upval), NormalizeFontFaceFunction (upval), IconButtonModule (upval), Images (upval)
			local config = {
				Color = if EnabledFunction() then p3.Theme.BackgroundUIContrast.Color else p3.Theme.BackgroundContrast.Color,
				Transparency = p2.OverrideBackgroundTransparency * p3.Settings.PreferredTransparency
			}
			local BackgroundOnPress = if p1.state.isPressed then p3.Theme.BackgroundOnPress elseif p1.state.isHovered then p3.Theme.BackgroundOnHover else { Transparency = 1, Color = Color3.new(1, 1, 1) }
			local BottomRoundedRect8pxPng: string = if p1.props.lastButton then "rbxasset://textures/ui/BottomRoundedRect8px.png" else ""
			local HasOnActivated = p1.props.onActivated ~= nil or p1.props.animatingAccept
			local HasOnDecline = p1.props.onDecline ~= nil or p1.props.animatingDecline
			local HasOnDecline1 = p1.props.onDecline ~= nil or p1.props.animatingPercentage ~= nil or p1.props.forceShowOptions
			local ColorBackgroundAnimation, ColorBackgroundAnimation2 = p1:getColorBackgroundAnimation(p2)
			local Red = if p1.props.animatingDecline then Colors.Red elseif p1.props.forceShowOptions then Colors.White else Colors.Green
			local NewDropDownPadding = p2.DropDownPadding * 2 + p2.DropDownIconSize
			local ScaledDropDownRightOptionSize = p2.DropDownRightOptionSize * 2
			
			if HasOnDecline1 then
				NewDropDownPadding += ScaledDropDownRightOptionSize
			end
			local function onMouseButton1Down()
				-- upvalues: HasOnDecline1 (copy), p1 (upval)
				if not HasOnDecline1 then
					p1:setState({ isPressed = true })
				end
			end
			
			local function onMouseButton1Up()
				-- upvalues: p1 (upval)
				p1:setState({ isPressed = false })
			end
			
			local Icon = p1.props.icon
			local Element = nil
			
			if FFlagAllowDisplayingFoundationIconsForDropdownModule and IconName[Icon] ~= nil or FFlagCoreUiMigrateUIBloxToFoundation then
				local Name = nil
				local Large = nil
				
				if IconName[Icon] ~= nil then
					Name = IconName[Icon]
					Large = IconSize.Large
				elseif FFlagCoreUiMigrateUIBloxToFoundation then
					Name = if typeof(Icon) == "string" then Icon else nil
					Large = IconSize.Medium
				end
				Element = if Name then RoactModule.createElement("Frame", {
					LayoutOrder = 1,
					BackgroundTransparency = 1,
					Size = UDim2.new(0, p2.DropDownIconSize, 0, p2.DropDownIconSize)
				}, {
					Icon = RoactModule.createElement(FoundationModule.Icon, {
						name = Name,
						variant = IconVariant.Regular,
						size = Large,
						style = {
							Color3 = p3.Theme.IconEmphasis.Color,
							Transparency = p3.Theme.IconEmphasis.Transparency
						},
						AnchorPoint = Vector2.new(0.5, 0.5),
						Position = UDim2.new(0.5, 0, 0.5, 0)
					})
				}) else RoactModule.createElement(FoundationModule.Image, {
					BackgroundTransparency = 1,
					LayoutOrder = 1,
					Image = Icon.Image,
					imageRect = { offset = Icon.ImageRectOffset, size = Icon.ImageRectSize },
					Size = UDim2.new(0, p2.DropDownIconSize, 0, p2.DropDownIconSize),
					imageStyle = {
						Color3 = p3.Theme.IconEmphasis.Color,
						Transparency = p3.Theme.IconEmphasis.Transparency
					}
				})
			else
				Element = RoactModule.createElement(ImageSetLabel, {
					LayoutOrder = 1,
					BackgroundTransparency = 1,
					Size = UDim2.new(0, p2.DropDownIconSize, 0, p2.DropDownIconSize),
					ImageColor3 = p3.Theme.IconEmphasis.Color,
					Image = p1.props.icon
				})
			end
			return RoactModule.createElement("ImageButton", {
				LayoutOrder = p1.props.layoutOrder,
				Image = BottomRoundedRect8pxPng,
				ScaleType = Enum.ScaleType.Slice,
				SliceCenter = Rect.new(8, 8, 24, 16),
				SliceScale = 0.5,
				ImageTransparency = p1.props.lastButton and config.Transparency or 1,
				ImageColor3 = config.Color,
				Size = UDim2.new(1, 0, 0, p2.DropDownButtonSizeY),
				BackgroundTransparency = if p1.props.lastButton then 1 else config.Transparency,
				BackgroundColor3 = config.Color,
				AutoButtonColor = false,
				BorderSizePixel = 0,
				[RoactModule.Event.Activated] = if HasOnDecline1 then nil else p1.props.onActivated or nil,
				[RoactModule.Event.MouseEnter] = function()
					-- upvalues: HasOnDecline1 (copy), p1 (upval)
					if not HasOnDecline1 then
						p1:setState({ isHovered = true })
					end
				end,
				[RoactModule.Event.MouseLeave] = function()
					-- upvalues: p1 (upval)
					p1:setState({ isHovered = false, isPressed = false })
				end,
				[RoactModule.Change.AbsoluteSize] = function(Frame)
					-- upvalues: p1 (upval)
					p1:setState({ sizeX = Frame.AbsoluteSize.X })
				end,
				[RoactModule.Change.AbsolutePosition] = function(Frame: Frame)
					-- upvalues: p1 (upval)
					p1:setState({
						absolutePosX = Frame.AbsolutePosition.X,
						absolutePosY = Frame.AbsolutePosition.Y
					})
				end,
				[RoactModule.Event.MouseButton1Down] = onMouseButton1Down,
				[RoactModule.Event.MouseButton1Up] = onMouseButton1Up
			}, {
				ColorBackground = RoactModule.createElement("ImageLabel", {
					ZIndex = 1,
					SliceScale = 0.5,
					BorderSizePixel = 0,
					Visible = p1.props.animatingPercentage ~= nil,
					Size = UDim2.new(0, ColorBackgroundAnimation2, 1, 0),
					Position = UDim2.new(0, ColorBackgroundAnimation, 0, 0),
					Image = BottomRoundedRect8pxPng,
					ScaleType = Enum.ScaleType.Slice,
					SliceCenter = Rect.new(8, 8, 24, 16),
					ImageTransparency = p1.props.lastButton and p2.IconButtonBackgroundTransparency or 1,
					ImageColor3 = Red,
					BackgroundTransparency = if p1.props.lastButton then 1 else p2.IconButtonBackgroundTransparency,
					BackgroundColor3 = Red
				}),
				HoverBackground = RoactModule.createElement("ImageLabel", {
					ZIndex = 2,
					SliceScale = 0.5,
					BorderSizePixel = 0,
					Size = UDim2.new(1, 0, 1, 0),
					Image = BottomRoundedRect8pxPng,
					ScaleType = Enum.ScaleType.Slice,
					SliceCenter = Rect.new(8, 8, 24, 16),
					ImageTransparency = p1.props.lastButton and BackgroundOnPress.Transparency or 1,
					ImageColor3 = BackgroundOnPress.Color,
					BackgroundTransparency = if p1.props.lastButton then 1 else BackgroundOnPress.Transparency,
					BackgroundColor3 = BackgroundOnPress.Color
				}, {
					InitalPadding = RoactModule.createElement("UIPadding", { PaddingLeft = UDim.new(0, p2.DropDownPadding) }),
					ListLayout = RoactModule.createElement("UIListLayout", {
						SortOrder = Enum.SortOrder.LayoutOrder,
						FillDirection = Enum.FillDirection.Horizontal,
						VerticalAlignment = Enum.VerticalAlignment.Center,
						Padding = UDim.new(0, p2.DropDownPadding)
					}),
					Icon = Element,
					Text = RoactModule.createElement("TextLabel", {
						LayoutOrder = 2,
						BackgroundTransparency = 1,
						Size = UDim2.new(1, -NewDropDownPadding, 1, 0),
						Text = p1.props.text,
						Font = if FoundationFontFaceMigration then nil else p3.Font.Header2.Font,
						FontFace = if FoundationFontFaceMigration then NormalizeFontFaceFunction(p3.Tokens.Typography.TitleLarge.Font) else nil,
						TextSize = p3.Font.BaseSize * p3.Font.Header2.RelativeSize,
						TextColor3 = p3.Theme.TextEmphasis.Color,
						TextTransparency = p3.Theme.TextEmphasis.Transparency,
						TextXAlignment = Enum.TextXAlignment.Left,
						TextTruncate = Enum.TextTruncate.AtEnd
					}),
					ButtonContainer = RoactModule.createElement("Frame", {
						LayoutOrder = 3,
						BackgroundTransparency = 1,
						Visible = HasOnDecline1,
						Size = UDim2.new(0, ScaledDropDownRightOptionSize, 1, 0)
					}, {
						ConfirmButton = HasOnActivated and RoactModule.createElement(IconButtonModule, {
							size = UDim2.new(0.5, 0, 1, 0),
							position = UDim2.new(0.5, 0, 0, 0),
							backgroundColor = p1.props.onDecline and Colors.Green or Colors.White,
							icon = if FFlagCoreUiMigrateUIBloxToFoundation then "icons/actions/accept" else Images["icons/actions/accept"],
							showBackground = p1.props.animatingPercentage == nil,
							onActivated = p1.props.onActivated
						}) or nil,
						DeclineButton = HasOnDecline and RoactModule.createElement(IconButtonModule, {
							size = UDim2.new(0.5, 0, 1, 0),
							position = UDim2.new(0, 0, 0, 0),
							backgroundColor = Colors.Red,
							icon = if FFlagCoreUiMigrateUIBloxToFoundation then "icons/actions/reject" else Images["icons/actions/reject"],
							showBackground = p1.props.animatingPercentage == nil,
							onActivated = p1.props.onDecline
						}) or nil
					})
				}),
				DismissInputHandler = RoactModule.createElement("ImageButton", {
					Image = "",
					BackgroundTransparency = 1,
					Size = UDim2.new(0, p1.props.screenSizeX, 0, p1.props.screenSizeY),
					Position = UDim2.new(0, -p1.state.absolutePosX, 0, -p1.state.absolutePosY),
					Visible = p1.props.onDismiss ~= nil,
					[RoactModule.Event.Activated] = p1.props.onDismiss
				}),
				Divider = not p1.props.lastButton and RoactModule.createElement("Frame", {
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

return RoactRoduxModule.UNSTABLE_connect2(function(p1)
	return {
		screenSizeX = p1.screenSize.X,
		screenSizeY = p1.screenSize.Y
	}
end, nil)(DropDownButton)