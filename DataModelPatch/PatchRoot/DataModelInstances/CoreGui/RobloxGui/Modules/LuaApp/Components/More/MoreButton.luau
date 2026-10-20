local CorePackages = game:GetService("CorePackages")
local Modules = game:GetService("CoreGui").RobloxGui.Modules
local CryoModule = require(CorePackages.Packages.Cryo)
local RoactModule = require(CorePackages.Packages.Roact)
local WithStyleFunction = require(CorePackages.Packages.UIBlox).Style.withStyle
local ConstantsModule = require(Modules.LuaApp.Constants)
local WithLocalizationModule = require(Modules.LuaApp.withLocalization)
local DEPRECATEDImageSetLabelModule = require(Modules.LuaApp.Components.DEPRECATED_ImageSetLabel)
local MoreButton = RoactModule.PureComponent:extend("MoreButton")
MoreButton.defaultProps = {
	LayoutOrder = 1,
	buttonRef = nil,
	Size = UDim2.new(1, 0, 1, 0),
	Position = UDim2.new(0, 0, 0, 0),
	TextXAlignment = Enum.TextXAlignment.Left
}

function MoreButton.eventDisconnect(p1)
	if p1.onAbsolutePositionChanged then
		p1.onAbsolutePositionChanged:disconnect()
		p1.onAbsolutePositionChanged = nil
	end
end

function MoreButton.onButtonUp(p1)
	if p1.state.buttonPressed then
		p1:setState({ buttonPressed = false })
	end
	p1:eventDisconnect()
end

function MoreButton.onButtonDown(p1)
	if not p1.state.buttonPressed then
		p1:eventDisconnect()
		p1.onAbsolutePositionChanged = p1.buttonRef.current and p1.buttonRef.current:GetPropertyChangedSignal("AbsolutePosition"):connect(function()
			-- upvalues: p1 (copy)
			p1:onButtonUp()
		end)
		p1:setState({ buttonPressed = true })
	end
end

function MoreButton.init(p1)
	-- upvalues: RoactModule (copy)
	p1.state = { buttonPressed = false }
	p1.buttonRef = p1.props.buttonRef or RoactModule.createRef()
	
	function p1:onButtonInputBegan(Input)
		-- upvalues: p1 (copy)
		if Input.UserInputState == Enum.UserInputState.Begin and (Input.UserInputType == Enum.UserInputType.Touch or Input.UserInputType == Enum.UserInputType.MouseButton1) then
			p1:onButtonDown()
		end
	end
	
	function p1.onButtonInputEnded()
		-- upvalues: p1 (copy)
		p1:onButtonUp()
	end
	
	function p1.onButtonActivated()
		-- upvalues: p1 (copy)
		p1:onButtonUp()
		local OnActivatedFunction: () -> () = p1.props.onActivated
		
		if OnActivatedFunction then
			OnActivatedFunction()
		end
	end
end

function MoreButton.render(p1)
	-- upvalues: ConstantsModule (copy), RoactModule (copy), DEPRECATEDImageSetLabelModule (copy), WithLocalizationModule (copy), WithStyleFunction (copy), CryoModule (copy)
	local ButtonPressed = p1.state.buttonPressed
	local Size = p1.props.Size
	local Position = p1.props.Position
	local LayoutOrder = p1.props.LayoutOrder
	local TextXAlignment = p1.props.TextXAlignment
	local Icon = p1.props.icon
	local RightImage = p1.props.rightImage
	local BadgeComponent = p1.props.badgeComponent
	local BadgeCount: number = p1.props.badgeCount
	local MOREPAGETEXTPADDINGWITHICON = if TextXAlignment == Enum.TextXAlignment.Center then 0 else Icon and ConstantsModule.MORE_PAGE_TEXT_PADDING_WITH_ICON or ConstantsModule.MORE_PAGE_ROW_PADDING_LEFT
	local IsBadgeCountAbove: boolean = BadgeComponent and (BadgeCount and BadgeCount > 0)
	
	local function v19(p2, BackgroundOnPress, JoinResult, TextDefault, IconDefault)
		-- upvalues: RoactModule (upval), Size (copy), Position (copy), LayoutOrder (copy), p1 (copy), Icon (copy), DEPRECATEDImageSetLabelModule (upval), ConstantsModule (upval), RightImage (copy), MOREPAGETEXTPADDINGWITHICON (copy), TextXAlignment (copy), IsBadgeCountAbove (copy), BadgeComponent (copy), BadgeCount (copy)
		return RoactModule.createElement("ImageButton", {
			Size = Size,
			Position = Position,
			AutoButtonColor = false,
			LayoutOrder = LayoutOrder,
			BackgroundColor3 = BackgroundOnPress.Color,
			BackgroundTransparency = BackgroundOnPress.Transparency,
			BorderSizePixel = 0,
			[RoactModule.Event.InputBegan] = p1.onButtonInputBegan,
			[RoactModule.Event.InputEnded] = p1.onButtonInputEnded,
			[RoactModule.Event.Activated] = p1.onButtonActivated,
			[RoactModule.Ref] = p1.buttonRef
		}, {
			Icon = Icon and RoactModule.createElement(DEPRECATEDImageSetLabelModule, {
				BackgroundTransparency = 1,
				BorderSizePixel = 0,
				ClipsDescendants = false,
				AnchorPoint = Vector2.new(0, 0.5),
				Size = UDim2.new(0, 26, 0, 26),
				Position = UDim2.new(0, ConstantsModule.MORE_PAGE_ROW_PADDING_LEFT, 0.5, 0),
				Image = Icon,
				ImageColor3 = TextDefault.Color,
				ImageTransparency = TextDefault.Transparency
			}),
			Text = RoactModule.createElement("TextLabel", {
				BackgroundTransparency = 1,
				BorderSizePixel = 0,
				Size = UDim2.new(1, -ConstantsModule.MORE_PAGE_ROW_PADDING_RIGHT - ConstantsModule.MORE_PAGE_ROW_PADDING_LEFT - (if Icon then 26 else 0) - (if RightImage then 14 else 0), 1, 0),
				Position = UDim2.new(0, MOREPAGETEXTPADDINGWITHICON, 0, 0),
				Text = p2.moreButtonText,
				Font = JoinResult.Font,
				TextSize = JoinResult.Size,
				TextColor3 = JoinResult.Color,
				TextTransparency = JoinResult.Transparency,
				TextXAlignment = TextXAlignment,
				TextYAlignment = Enum.TextYAlignment.Center,
				TextTruncate = Enum.TextTruncate.SplitWord
			}),
			RightImage = RightImage and RoactModule.createElement(DEPRECATEDImageSetLabelModule, {
				BackgroundTransparency = 1,
				BorderSizePixel = 0,
				AnchorPoint = Vector2.new(1, 0.5),
				Size = UDim2.new(0, 14, 0, 14),
				Position = UDim2.new(1, -ConstantsModule.MORE_PAGE_ROW_PADDING_RIGHT, 0.5, 0),
				Image = RightImage,
				ImageColor3 = IconDefault.Color,
				ImageTransparency = IconDefault.Transparency
			}),
			NotificationBadge = IsBadgeCountAbove and RoactModule.createElement(BadgeComponent, {
				AnchorPoint = Vector2.new(1, 0.5),
				Position = UDim2.new(1, -ConstantsModule.MORE_PAGE_ROW_PADDING_RIGHT * 2 - 14, 0.5, 0),
				badgeCount = BadgeCount
			})
		})
	end
	
	return WithLocalizationModule({ moreButtonText = p1.props.textKey })(function(p2)
		-- upvalues: WithStyleFunction (upval), ButtonPressed (copy), CryoModule (upval), v19 (copy)
		return WithStyleFunction(function(p3)
			-- upvalues: ButtonPressed (upval), CryoModule (upval), v19 (upval), p2 (copy)
			return v19(p2, ButtonPressed and p3.Theme.BackgroundOnPress or p3.Theme.BackgroundDefault, CryoModule.Dictionary.join(p3.Theme.TextDefault, {
				Font = p3.Font.Header2.Font,
				Size = p3.Font.BaseSize * p3.Font.Header2.RelativeSize
			}), p3.Theme.TextDefault, p3.Theme.IconDefault)
		end)
	end)
end

function MoreButton.willUnmount(p1)
	p1:eventDisconnect()
end

return MoreButton