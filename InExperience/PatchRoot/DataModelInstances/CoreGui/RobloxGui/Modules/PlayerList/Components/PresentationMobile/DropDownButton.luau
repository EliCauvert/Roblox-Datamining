local corePackagesService = game:GetService("CorePackages")
local cryoModule = require(corePackagesService.Packages.Cryo)
local roactModule = require(corePackagesService.Packages.Roact)
local roactRoduxModule = require(corePackagesService.Packages.RoactRodux)
local tModule = require(corePackagesService.Packages.t)
local UIBloxModule = require(corePackagesService.Packages.UIBlox)
local playerListModule = require(corePackagesService.Workspace.Packages.PlayerList)
local foundationModule = require(corePackagesService.Packages.Foundation)
local iconName = foundationModule.Enums.IconName
local iconVariant = foundationModule.Enums.IconVariant
local iconSize = foundationModule.Enums.IconSize
local useLayoutValues = playerListModule.Common.useLayoutValues
local withStyle = UIBloxModule.Style.withStyle
local parent = script.Parent.Parent
local withLayoutValues = require(parent.Connection.LayoutValues).WithLayoutValues
local iconButtonModule = require(parent.PresentationCommon.IconButton)
local colors = require(corePackagesService.Workspace.Packages.Style).Colors
local imageSetLabel = UIBloxModule.Core.ImageSet.ImageSetLabel
local images = UIBloxModule.App.ImageSet.Images
local fFlagEnableMobilePlayerListOnConsole = playerListModule.Flags.FFlagEnableMobilePlayerListOnConsole
local fFlagAllowDisplayingFoundationIconsForDropdownModule = require(parent.Parent.Flags.FFlagAllowDisplayingFoundationIconsForDropdown)

local function _(p0) --[[ line: 37 | named "isFoundationIconName" ]]
	-- upvalues: iconName (ref)
	return iconName[p0] ~= nil
end

local dropDownButton = roactModule.PureComponent:extend("DropDownButton")
dropDownButton.validateProps = tModule.strictInterface({
	contentVisible = tModule.boolean,
	buttonTransparency = tModule.any,
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
	animatingPercentage = tModule.optional(tModule.number),
	layoutValues = tModule.optional(tModule.table)
})

function dropDownButton.init(p1) --[[ line: 65 ]]
	p1.state = {
		isHovered = false,
		isPressed = false,
		sizeX = 100,
		absolutePosX = 0,
		absolutePosY = 0
	}
end

function dropDownButton.getColorBackgroundAnimation(value, p2) --[[ line: 75 ]]
	if value.props.animatingPercentage == nil then
		return 0, 0
	end
	local var11 = value.state.sizeX - p2.DropDownRightOptionSize
	local dropDownRightOptionSize = p2.DropDownRightOptionSize
	
	if value.props.animatingDecline then
		var11 -= p2.DropDownRightOptionSize
	end
	local var12 = value.state.sizeX - p2.DropDownRightOptionSize
	dropDownRightOptionSize += var12 * value.props.animatingPercentage
	var11 -= var12 * value.props.animatingPercentage * 0.5
	
	if value.state.sizeX < var11 + dropDownRightOptionSize then
		var11 -= var11 + dropDownRightOptionSize - value.state.sizeX
	end
	return var11, dropDownRightOptionSize
end

function dropDownButton.render(p3) --[[ line: 96 ]]
	-- upvalues: withLayoutValues (ref), withStyle (ref), colors (ref), fFlagAllowDisplayingFoundationIconsForDropdownModule (ref), iconName (ref), roactModule (ref), foundationModule (ref), iconVariant (ref), iconSize (ref), imageSetLabel (ref), fFlagEnableMobilePlayerListOnConsole (ref), iconButtonModule (ref), images (ref)
	return withLayoutValues(function(p4) --[[ line: 97 ]]
		-- upvalues: withStyle (copy), p3 (ref), colors (copy), fFlagAllowDisplayingFoundationIconsForDropdownModule (copy), iconName (copy), roactModule (copy), foundationModule (copy), iconVariant (copy), iconSize (copy), imageSetLabel (copy), fFlagEnableMobilePlayerListOnConsole (copy), iconButtonModule (copy), images (copy)
		return withStyle(function(p5) --[[ line: 98 ]]
			-- upvalues: p4 (write), p3 (copy), colors (copy), fFlagAllowDisplayingFoundationIconsForDropdownModule (copy), iconName (copy), roactModule (copy), foundationModule (copy), iconVariant (copy), iconSize (copy), imageSetLabel (copy), fFlagEnableMobilePlayerListOnConsole (copy), iconButtonModule (copy), images (copy)
			p4 = p3.props.layoutValues
			local t = { Transparency = 1, Color = Color3.new(1, 1, 1) }
			
			if p3.state.isPressed then
				t = p5.Theme.BackgroundOnPress
			elseif p3.state.isHovered then
				t = p5.Theme.BackgroundOnHover
			end
			local var14 = if p3.props.lastButton then "rbxasset://textures/ui/BottomRoundedRect8px.png" else ""
			local var15 = if p3.props.onActivated == nil then p3.props.animatingAccept else true
			local var16 = if p3.props.onDecline == nil then p3.props.animatingDecline else true
			local var17 = if p3.props.onDecline == nil then if p3.props.animatingPercentage == nil then p3.props.forceShowOptions else true else true
			local var18, var19 = p3:getColorBackgroundAnimation(p4)
			local green = colors.Green
			
			if p3.props.animatingDecline then
				green = colors.Red
			elseif p3.props.forceShowOptions then
				green = colors.White
			end
			local var20 = p4.DropDownPadding * 2 + p4.DropDownIconSize
			local var21 = p4.DropDownRightOptionSize * 2
			
			if var17 then
				var20 += var21
			end
			local _ = nil
			local icon = p3.props.icon
			
			return roactModule.createElement("ImageButton", {
				LayoutOrder = p3.props.layoutOrder,
				Image = var14,
				ScaleType = Enum.ScaleType.Slice,
				SliceCenter = Rect.new(8, 8, 24, 16),
				SliceScale = 0.5,
				ImageTransparency = if p3.props.lastButton then p3.props.buttonTransparency else 1,
				ImageColor3 = Color3.fromRGB(0, 0, 0),
				Size = UDim2.new(1, 0, 0, p4.DropDownButtonSizeY),
				BackgroundTransparency = if p3.props.lastButton then 1 else p3.props.buttonTransparency,
				BackgroundColor3 = Color3.fromRGB(0, 0, 0),
				AutoButtonColor = false,
				BorderSizePixel = 0,
				Selectable = not var17,
				[roactModule.Event.Activated] = if not var17 then p3.props.onActivated else nil,
				[roactModule.Event.MouseEnter] = function() --[[ line: 198 ]]
					-- upvalues: var17 (ref), p3 (copy)
					if not var17 then
						p3:setState({ isHovered = true })
					end
				end,
				[roactModule.Event.MouseLeave] = function() --[[ line: 206 ]]
					-- upvalues: p3 (copy)
					p3:setState({ isHovered = false, isPressed = false })
				end,
				[roactModule.Change.AbsoluteSize] = function(p6) --[[ line: 213 ]]
					-- upvalues: p3 (copy)
					p3:setState({ sizeX = p6.AbsoluteSize.X })
				end,
				[roactModule.Change.AbsolutePosition] = function(p7) --[[ line: 219 ]]
					-- upvalues: p3 (copy)
					p3:setState({
						absolutePosX = p7.AbsolutePosition.X,
						absolutePosY = p7.AbsolutePosition.Y
					})
				end,
				[roactModule.Event.MouseButton1Down] = function() --[[ line: 166 ]]
					-- upvalues: var17 (ref), p3 (copy)
					if not var17 then
						p3:setState({ isPressed = true })
					end
				end,
				[roactModule.Event.MouseButton1Up] = function() --[[ line: 174 ]]
					-- upvalues: p3 (copy)
					p3:setState({ isPressed = false })
				end
			}, {
				ColorBackground = roactModule.createElement("ImageLabel", {
					ZIndex = 1,
					SliceScale = 0.5,
					BorderSizePixel = 0,
					Visible = p3.props.animatingPercentage ~= nil and p3.props.contentVisible,
					Size = UDim2.new(0, var19, 1, 0),
					Position = UDim2.fromOffset(var18, 0),
					Image = var14,
					ScaleType = Enum.ScaleType.Slice,
					SliceCenter = Rect.new(8, 8, 24, 16),
					ImageTransparency = if p3.props.lastButton then p4.IconButtonBackgroundTransparency else 1,
					ImageColor3 = green,
					BackgroundTransparency = if p3.props.lastButton then 1 else p4.IconButtonBackgroundTransparency,
					BackgroundColor3 = green
				}),
				HoverBackground = roactModule.createElement("ImageLabel", {
					ZIndex = 2,
					SliceScale = 0.5,
					BorderSizePixel = 0,
					Size = UDim2.fromScale(1, 1),
					Visible = p3.props.contentVisible,
					Image = var14,
					ScaleType = Enum.ScaleType.Slice,
					SliceCenter = Rect.new(8, 8, 24, 16),
					ImageTransparency = if p3.props.lastButton then t.Transparency else 1,
					ImageColor3 = t.Color,
					BackgroundTransparency = if p3.props.lastButton then 1 else t.Transparency,
					BackgroundColor3 = t.Color
				}, {
					InitalPadding = roactModule.createElement("UIPadding", { PaddingLeft = UDim.new(0, p4.DropDownPadding) }),
					ListLayout = roactModule.createElement("UIListLayout", {
						SortOrder = Enum.SortOrder.LayoutOrder,
						FillDirection = Enum.FillDirection.Horizontal,
						VerticalAlignment = Enum.VerticalAlignment.Center,
						Padding = UDim.new(0, p4.DropDownPadding)
					}),
					Icon = if fFlagAllowDisplayingFoundationIconsForDropdownModule and iconName[icon] ~= nil then roactModule.createElement("Frame", {
						LayoutOrder = 1,
						BackgroundTransparency = 1,
						Size = UDim2.new(0, p4.DropDownIconSize, 0, p4.DropDownIconSize)
					}, {
						Icon = roactModule.createElement(foundationModule.Icon, {
							name = iconName[icon],
							variant = iconVariant.Regular,
							size = iconSize.Large,
							style = {
								Color3 = p5.Theme.IconEmphasis.Color,
								Transparency = p5.Theme.IconEmphasis.Transparency
							},
							AnchorPoint = Vector2.new(0.5, 0.5),
							Position = UDim2.new(0.5, 0, 0.5, 0)
						})
					}) else roactModule.createElement(imageSetLabel, {
						LayoutOrder = 1,
						BackgroundTransparency = 1,
						Size = UDim2.new(0, p4.DropDownIconSize, 0, p4.DropDownIconSize),
						ImageColor3 = p5.Theme.IconEmphasis.Color,
						Image = p3.props.icon
					}),
					Text = roactModule.createElement("TextLabel", {
						LayoutOrder = 2,
						BackgroundTransparency = 1,
						Size = UDim2.new(1, -var20, 1, 0),
						Text = p3.props.text,
						Font = p5.Font.Header2.Font,
						TextSize = if fFlagEnableMobilePlayerListOnConsole then p4.DropDownButtonTextSize else p5.Font.BaseSize * p5.Font.Header2.RelativeSize,
						TextColor3 = p5.Theme.TextEmphasis.Color,
						TextTransparency = p5.Theme.TextEmphasis.Transparency,
						TextXAlignment = Enum.TextXAlignment.Left,
						TextTruncate = Enum.TextTruncate.AtEnd
					}),
					ButtonContainer = roactModule.createElement("Frame", {
						LayoutOrder = 3,
						BackgroundTransparency = 1,
						Visible = var17,
						Size = UDim2.new(0, var21, 1, 0)
					}, {
						ConfirmButton = var15 and roactModule.createElement(iconButtonModule, {
							size = UDim2.fromScale(0.5, 1),
							position = UDim2.fromScale(0.5, 0),
							backgroundColor = if p3.props.onDecline then colors.Green else colors.White,
							icon = images["icons/actions/accept"],
							showBackground = p3.props.animatingPercentage == nil,
							onActivated = p3.props.onActivated
						}) or nil,
						DeclineButton = var16 and (roactModule.createElement(iconButtonModule, {
							size = UDim2.fromScale(0.5, 1),
							position = UDim2.new(0, 0, 0, 0),
							backgroundColor = colors.Red,
							icon = images["icons/actions/reject"],
							showBackground = p3.props.animatingPercentage == nil,
							onActivated = p3.props.onDecline
						}) or nil)
					})
				}),
				DismissInputHandler = roactModule.createElement("ImageButton", {
					Image = "",
					BackgroundTransparency = 1,
					Size = UDim2.fromOffset(p3.props.screenSizeX, p3.props.screenSizeY),
					Position = UDim2.fromOffset(-p3.state.absolutePosX, -p3.state.absolutePosY),
					Visible = p3.props.onDismiss ~= nil and p3.props.contentVisible,
					[roactModule.Event.Activated] = p3.props.onDismiss
				}),
				Divider = not p3.props.lastButton and roactModule.createElement("Frame", {
					ZIndex = 3,
					BorderSizePixel = 0,
					Visible = p3.props.contentVisible,
					Size = UDim2.new(1, 0, 0, 1),
					Position = UDim2.fromScale(0, 1),
					AnchorPoint = Vector2.new(0, 1),
					BackgroundTransparency = p5.Theme.Divider.Transparency,
					BackgroundColor3 = p5.Theme.Divider.Color
				})
			})
		end)
	end)
end

return roactRoduxModule.connect(function(p9) --[[ line: 350 | named "mapStateToProps" ]]
	return {
		screenSizeX = p9.screenSize.X,
		screenSizeY = p9.screenSize.Y
	}
end, nil)(function(p8) --[[ line: 342 ]]
	-- upvalues: useLayoutValues (ref), roactModule (ref), dropDownButton (ref), cryoModule (ref)
	return roactModule.createElement(dropDownButton, cryoModule.Dictionary.join(p8, { layoutValues = useLayoutValues() }))
end)