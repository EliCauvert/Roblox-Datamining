local CorePackages = game:GetService("CorePackages")
local CryoModule = require(CorePackages.Packages.Cryo)
local RoactModule = require(CorePackages.Packages.Roact)
local RoactRoduxModule = require(CorePackages.Packages.RoactRodux)
local TModule = require(CorePackages.Packages.t)
local UIBloxModule = require(CorePackages.Packages.UIBlox)
local PlayerListModule = require(CorePackages.Workspace.Packages.PlayerList)
local FoundationModule = require(CorePackages.Packages.Foundation)
local IconName = FoundationModule.Enums.IconName
local IconVariant = FoundationModule.Enums.IconVariant
local IconSize = FoundationModule.Enums.IconSize
local UseLayoutValuesFunction = PlayerListModule.Common.useLayoutValues
local WithStyleFunction = UIBloxModule.Style.withStyle
local Parent = script.Parent.Parent
local WithLayoutValuesFunction = require(Parent.Connection.LayoutValues).WithLayoutValues
local IconButtonModule = require(Parent.PresentationCommon.IconButton)
local Colors = require(CorePackages.Workspace.Packages.Style).Colors
local ImageSetLabel = UIBloxModule.Core.ImageSet.ImageSetLabel
local Images = UIBloxModule.App.ImageSet.Images
local FFlagEnableMobilePlayerListOnConsole = PlayerListModule.Flags.FFlagEnableMobilePlayerListOnConsole
local FFlagAllowDisplayingFoundationIconsForDropdownModule = require(Parent.Parent.Flags.FFlagAllowDisplayingFoundationIconsForDropdown)

local function _(p1): boolean
	-- upvalues: IconName (copy)
	return IconName[p1] ~= nil
end

local DropDownButton = RoactModule.PureComponent:extend("DropDownButton")
DropDownButton.validateProps = TModule.strictInterface({
	contentVisible = TModule.boolean,
	buttonTransparency = TModule.any,
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
	animatingPercentage = TModule.optional(TModule.number),
	layoutValues = TModule.optional(TModule.table)
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
	-- upvalues: WithLayoutValuesFunction (copy), WithStyleFunction (copy), Colors (copy), FFlagAllowDisplayingFoundationIconsForDropdownModule (copy), IconName (copy), RoactModule (copy), FoundationModule (copy), IconVariant (copy), IconSize (copy), ImageSetLabel (copy), FFlagEnableMobilePlayerListOnConsole (copy), IconButtonModule (copy), Images (copy)
	return WithLayoutValuesFunction(function(p2)
		-- upvalues: WithStyleFunction (upval), p1 (copy), Colors (upval), FFlagAllowDisplayingFoundationIconsForDropdownModule (upval), IconName (upval), RoactModule (upval), FoundationModule (upval), IconVariant (upval), IconSize (upval), ImageSetLabel (upval), FFlagEnableMobilePlayerListOnConsole (upval), IconButtonModule (upval), Images (upval)
		return WithStyleFunction(function(p3)
			-- upvalues: p2 (ref), p1 (upval), Colors (upval), FFlagAllowDisplayingFoundationIconsForDropdownModule (upval), IconName (upval), RoactModule (upval), FoundationModule (upval), IconVariant (upval), IconSize (upval), ImageSetLabel (upval), FFlagEnableMobilePlayerListOnConsole (upval), IconButtonModule (upval), Images (upval)
			p2 = p1.props.layoutValues
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
			local Icon = p1.props.icon
			
			return RoactModule.createElement("ImageButton", {
				LayoutOrder = p1.props.layoutOrder,
				Image = BottomRoundedRect8pxPng,
				ScaleType = Enum.ScaleType.Slice,
				SliceCenter = Rect.new(8, 8, 24, 16),
				SliceScale = 0.5,
				ImageTransparency = p1.props.lastButton and p1.props.buttonTransparency or 1,
				ImageColor3 = Color3.fromRGB(0, 0, 0),
				Size = UDim2.new(1, 0, 0, p2.DropDownButtonSizeY),
				BackgroundTransparency = if p1.props.lastButton then 1 else p1.props.buttonTransparency,
				BackgroundColor3 = Color3.fromRGB(0, 0, 0),
				AutoButtonColor = false,
				BorderSizePixel = 0,
				Selectable = not HasOnDecline1,
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
				[RoactModule.Event.MouseButton1Down] = function()
					-- upvalues: HasOnDecline1 (copy), p1 (upval)
					if not HasOnDecline1 then
						p1:setState({ isPressed = true })
					end
				end,
				[RoactModule.Event.MouseButton1Up] = function()
					-- upvalues: p1 (upval)
					p1:setState({ isPressed = false })
				end
			}, {
				ColorBackground = RoactModule.createElement("ImageLabel", {
					ZIndex = 1,
					SliceScale = 0.5,
					BorderSizePixel = 0,
					Visible = p1.props.animatingPercentage ~= nil and p1.props.contentVisible,
					Size = UDim2.new(0, ColorBackgroundAnimation2, 1, 0),
					Position = UDim2.fromOffset(ColorBackgroundAnimation, 0),
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
					Size = UDim2.fromScale(1, 1),
					Visible = p1.props.contentVisible,
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
					Icon = if FFlagAllowDisplayingFoundationIconsForDropdownModule and IconName[Icon] ~= nil then RoactModule.createElement("Frame", {
						LayoutOrder = 1,
						BackgroundTransparency = 1,
						Size = UDim2.new(0, p2.DropDownIconSize, 0, p2.DropDownIconSize)
					}, {
						Icon = RoactModule.createElement(FoundationModule.Icon, {
							name = IconName[Icon],
							variant = IconVariant.Regular,
							size = IconSize.Large,
							style = {
								Color3 = p3.Theme.IconEmphasis.Color,
								Transparency = p3.Theme.IconEmphasis.Transparency
							},
							AnchorPoint = Vector2.new(0.5, 0.5),
							Position = UDim2.new(0.5, 0, 0.5, 0)
						})
					}) else RoactModule.createElement(ImageSetLabel, {
						LayoutOrder = 1,
						BackgroundTransparency = 1,
						Size = UDim2.new(0, p2.DropDownIconSize, 0, p2.DropDownIconSize),
						ImageColor3 = p3.Theme.IconEmphasis.Color,
						Image = p1.props.icon
					}),
					Text = RoactModule.createElement("TextLabel", {
						LayoutOrder = 2,
						BackgroundTransparency = 1,
						Size = UDim2.new(1, -NewDropDownPadding, 1, 0),
						Text = p1.props.text,
						Font = p3.Font.Header2.Font,
						TextSize = if FFlagEnableMobilePlayerListOnConsole then p2.DropDownButtonTextSize else p3.Font.BaseSize * p3.Font.Header2.RelativeSize,
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
							size = UDim2.fromScale(0.5, 1),
							position = UDim2.fromScale(0.5, 0),
							backgroundColor = p1.props.onDecline and Colors.Green or Colors.White,
							icon = Images["icons/actions/accept"],
							showBackground = p1.props.animatingPercentage == nil,
							onActivated = p1.props.onActivated
						}) or nil,
						DeclineButton = HasOnDecline and RoactModule.createElement(IconButtonModule, {
							size = UDim2.fromScale(0.5, 1),
							position = UDim2.new(0, 0, 0, 0),
							backgroundColor = Colors.Red,
							icon = Images["icons/actions/reject"],
							showBackground = p1.props.animatingPercentage == nil,
							onActivated = p1.props.onDecline
						}) or nil
					})
				}),
				DismissInputHandler = RoactModule.createElement("ImageButton", {
					Image = "",
					BackgroundTransparency = 1,
					Size = UDim2.fromOffset(p1.props.screenSizeX, p1.props.screenSizeY),
					Position = UDim2.fromOffset(-p1.state.absolutePosX, -p1.state.absolutePosY),
					Visible = p1.props.onDismiss ~= nil and p1.props.contentVisible,
					[RoactModule.Event.Activated] = p1.props.onDismiss
				}),
				Divider = not p1.props.lastButton and RoactModule.createElement("Frame", {
					ZIndex = 3,
					BorderSizePixel = 0,
					Visible = p1.props.contentVisible,
					Size = UDim2.new(1, 0, 0, 1),
					Position = UDim2.fromScale(0, 1),
					AnchorPoint = Vector2.new(0, 1),
					BackgroundTransparency = p3.Theme.Divider.Transparency,
					BackgroundColor3 = p3.Theme.Divider.Color
				})
			})
		end)
	end)
end

return RoactRoduxModule.connect(function(p1)
	return {
		screenSizeX = p1.screenSize.X,
		screenSizeY = p1.screenSize.Y
	}
end, nil)(function(p1)
	-- upvalues: UseLayoutValuesFunction (copy), RoactModule (copy), DropDownButton (copy), CryoModule (copy)
	return RoactModule.createElement(DropDownButton, CryoModule.Dictionary.join(p1, { layoutValues = UseLayoutValuesFunction() }))
end)