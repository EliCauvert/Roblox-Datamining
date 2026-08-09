local corePackagesService = game:GetService("CorePackages")
local roactModule = require(corePackagesService.Packages.Roact)
local roactRoduxModule = require(corePackagesService.Packages.RoactRodux)
local tModule = require(corePackagesService.Packages.t)
local UIBloxModule = require(corePackagesService.Packages.UIBlox)
local foundationModule = require(corePackagesService.Packages.Foundation)
local iconName = foundationModule.Enums.IconName
local iconVariant = foundationModule.Enums.IconVariant
local iconSize = foundationModule.Enums.IconSize
local withStyle = UIBloxModule.Style.withStyle
local parent = script.Parent.Parent
local withLayoutValues = require(parent.Connection.LayoutValues).WithLayoutValues
local iconButtonModule = require(parent.PresentationCommon.IconButton)
local colors = require(corePackagesService.Workspace.Packages.Style).Colors
local imageSetLabel = UIBloxModule.Core.ImageSet.ImageSetLabel
local images = UIBloxModule.App.ImageSet.Images
local enabled = require(corePackagesService.Workspace.Packages.Chrome).Enabled
local fFlagAllowDisplayingFoundationIconsForDropdownModule = require(parent.Parent.Flags.FFlagAllowDisplayingFoundationIconsForDropdown)

local function _(p0) --[[ line: 32 | named "isFoundationIconName" ]]
	-- upvalues: iconName (ref)
	return iconName[p0] ~= nil
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

function dropDownButton.init(p1) --[[ line: 55 ]]
	p1.state = {
		isHovered = false,
		isPressed = false,
		sizeX = 100,
		absolutePosX = 0,
		absolutePosY = 0
	}
end

function dropDownButton.getColorBackgroundAnimation(value, p2) --[[ line: 65 ]]
	if value.props.animatingPercentage == nil then
		return 0, 0
	end
	local var9 = value.state.sizeX - p2.DropDownRightOptionSize
	local dropDownRightOptionSize = p2.DropDownRightOptionSize
	
	if value.props.animatingDecline then
		var9 -= p2.DropDownRightOptionSize
	end
	local var10 = value.state.sizeX - p2.DropDownRightOptionSize
	dropDownRightOptionSize += var10 * value.props.animatingPercentage
	var9 -= var10 * value.props.animatingPercentage * 0.5
	
	if value.state.sizeX < var9 + dropDownRightOptionSize then
		var9 -= var9 + dropDownRightOptionSize - value.state.sizeX
	end
	return var9, dropDownRightOptionSize
end

function dropDownButton.render(p3) --[[ line: 86 ]]
	-- upvalues: withLayoutValues (ref), withStyle (ref), enabled (ref), colors (ref), fFlagAllowDisplayingFoundationIconsForDropdownModule (ref), iconName (ref), roactModule (ref), foundationModule (ref), iconVariant (ref), iconSize (ref), imageSetLabel (ref), iconButtonModule (ref), images (ref)
	return withLayoutValues(function(p4) --[[ line: 87 ]]
		-- upvalues: withStyle (copy), enabled (copy), p3 (ref), colors (copy), fFlagAllowDisplayingFoundationIconsForDropdownModule (copy), iconName (copy), roactModule (copy), foundationModule (copy), iconVariant (copy), iconSize (copy), imageSetLabel (copy), iconButtonModule (copy), images (copy)
		return withStyle(function(p5) --[[ line: 88 ]]
			-- upvalues: enabled (copy), p4 (ref), p3 (copy), colors (copy), fFlagAllowDisplayingFoundationIconsForDropdownModule (copy), iconName (copy), roactModule (copy), foundationModule (copy), iconVariant (copy), iconSize (copy), imageSetLabel (copy), iconButtonModule (copy), images (copy)
			local t = {
				Color = if enabled() then p5.Theme.BackgroundUIContrast.Color else p5.Theme.BackgroundContrast.Color,
				Transparency = p4.OverrideBackgroundTransparency * p5.Settings.PreferredTransparency
			}
			local t_1 = { Transparency = 1, Color = Color3.new(1, 1, 1) }
			
			if p3.state.isPressed then
				t_1 = p5.Theme.BackgroundOnPress
			elseif p3.state.isHovered then
				t_1 = p5.Theme.BackgroundOnHover
			end
			local var13 = if p3.props.lastButton then "rbxasset://textures/ui/BottomRoundedRect8px.png" else ""
			local var14 = if p3.props.onActivated == nil then p3.props.animatingAccept else true
			local var15 = if p3.props.onDecline == nil then p3.props.animatingDecline else true
			local var16 = if p3.props.onDecline == nil then if p3.props.animatingPercentage == nil then p3.props.forceShowOptions else true else true
			local var17, var18 = p3:getColorBackgroundAnimation(p4)
			local green = colors.Green
			
			if p3.props.animatingDecline then
				green = colors.Red
			elseif p3.props.forceShowOptions then
				green = colors.White
			end
			local var19 = p4.DropDownPadding * 2 + p4.DropDownIconSize
			local var20 = p4.DropDownRightOptionSize * 2
			
			if var16 then
				var19 += var20
			end
			local function onMouseButton1Down() --[[ line: 132 ]]
				-- upvalues: var16 (ref), p3 (copy)
				if not var16 then
					p3:setState({ isPressed = true })
				end
			end
			
			local function onMouseButton1Up() --[[ line: 140 ]]
				-- upvalues: p3 (copy)
				p3:setState({ isPressed = false })
			end
			
			local _ = nil
			local icon = p3.props.icon
			
			return roactModule.createElement("ImageButton", {
				LayoutOrder = p3.props.layoutOrder,
				Image = var13,
				ScaleType = Enum.ScaleType.Slice,
				SliceCenter = Rect.new(8, 8, 24, 16),
				SliceScale = 0.5,
				ImageTransparency = if p3.props.lastButton then t.Transparency else 1,
				ImageColor3 = t.Color,
				Size = UDim2.new(1, 0, 0, p4.DropDownButtonSizeY),
				BackgroundTransparency = if p3.props.lastButton then 1 else t.Transparency,
				BackgroundColor3 = t.Color,
				AutoButtonColor = false,
				BorderSizePixel = 0,
				[roactModule.Event.Activated] = if not var16 then p3.props.onActivated else nil,
				[roactModule.Event.MouseEnter] = function() --[[ line: 193 ]]
					-- upvalues: var16 (ref), p3 (copy)
					if not var16 then
						p3:setState({ isHovered = true })
					end
				end,
				[roactModule.Event.MouseLeave] = function() --[[ line: 201 ]]
					-- upvalues: p3 (copy)
					p3:setState({ isHovered = false, isPressed = false })
				end,
				[roactModule.Change.AbsoluteSize] = function(p6) --[[ line: 208 ]]
					-- upvalues: p3 (copy)
					p3:setState({ sizeX = p6.AbsoluteSize.X })
				end,
				[roactModule.Change.AbsolutePosition] = function(p7) --[[ line: 214 ]]
					-- upvalues: p3 (copy)
					p3:setState({
						absolutePosX = p7.AbsolutePosition.X,
						absolutePosY = p7.AbsolutePosition.Y
					})
				end,
				[roactModule.Event.MouseButton1Down] = onMouseButton1Down,
				[roactModule.Event.MouseButton1Up] = onMouseButton1Up
			}, {
				ColorBackground = roactModule.createElement("ImageLabel", {
					ZIndex = 1,
					SliceScale = 0.5,
					BorderSizePixel = 0,
					Visible = p3.props.animatingPercentage ~= nil,
					Size = UDim2.new(0, var18, 1, 0),
					Position = UDim2.new(0, var17, 0, 0),
					Image = var13,
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
					Size = UDim2.new(1, 0, 1, 0),
					Image = var13,
					ScaleType = Enum.ScaleType.Slice,
					SliceCenter = Rect.new(8, 8, 24, 16),
					ImageTransparency = if p3.props.lastButton then t_1.Transparency else 1,
					ImageColor3 = t_1.Color,
					BackgroundTransparency = if p3.props.lastButton then 1 else t_1.Transparency,
					BackgroundColor3 = t_1.Color
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
						Size = UDim2.new(1, -var19, 1, 0),
						Text = p3.props.text,
						Font = p5.Font.Header2.Font,
						TextSize = p5.Font.BaseSize * p5.Font.Header2.RelativeSize,
						TextColor3 = p5.Theme.TextEmphasis.Color,
						TextTransparency = p5.Theme.TextEmphasis.Transparency,
						TextXAlignment = Enum.TextXAlignment.Left,
						TextTruncate = Enum.TextTruncate.AtEnd
					}),
					ButtonContainer = roactModule.createElement("Frame", {
						LayoutOrder = 3,
						BackgroundTransparency = 1,
						Visible = var16,
						Size = UDim2.new(0, var20, 1, 0)
					}, {
						ConfirmButton = var14 and roactModule.createElement(iconButtonModule, {
							size = UDim2.new(0.5, 0, 1, 0),
							position = UDim2.new(0.5, 0, 0, 0),
							backgroundColor = if p3.props.onDecline then colors.Green else colors.White,
							icon = images["icons/actions/accept"],
							showBackground = p3.props.animatingPercentage == nil,
							onActivated = p3.props.onActivated
						}) or nil,
						DeclineButton = var15 and (roactModule.createElement(iconButtonModule, {
							size = UDim2.new(0.5, 0, 1, 0),
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
					Size = UDim2.new(0, p3.props.screenSizeX, 0, p3.props.screenSizeY),
					Position = UDim2.new(0, -p3.state.absolutePosX, 0, -p3.state.absolutePosY),
					Visible = p3.props.onDismiss ~= nil,
					[roactModule.Event.Activated] = p3.props.onDismiss
				}),
				Divider = not p3.props.lastButton and roactModule.createElement("Frame", {
					ZIndex = 3,
					BorderSizePixel = 0,
					Size = UDim2.new(1, 0, 0, 1),
					Position = UDim2.new(0, 0, 1, 0),
					AnchorPoint = Vector2.new(0, 1),
					BackgroundTransparency = p5.Theme.Divider.Transparency,
					BackgroundColor3 = p5.Theme.Divider.Color
				})
			})
		end)
	end)
end

return roactRoduxModule.UNSTABLE_connect2(function(p8) --[[ line: 334 | named "mapStateToProps" ]]
	return {
		screenSizeX = p8.screenSize.X,
		screenSizeY = p8.screenSize.Y
	}
end, nil)(dropDownButton)