local CorePackages = game:GetService("CorePackages")
local RoactRoduxModule = require(CorePackages.Packages.RoactRodux)
local RoactModule = require(CorePackages.Packages.Roact)
local WithStyleFunction = require(CorePackages.Packages.UIBlox).Style.withStyle
local TModule = require(CorePackages.Packages.t)
local NoticeListCell = RoactModule.PureComponent:extend("NoticeListCell")
NoticeListCell.validateProps = TModule.strictInterface({
	screenWidth = TModule.number,
	Size = TModule.UDim2,
	Position = TModule.UDim2,
	LayoutOrder = TModule.number,
	onActivated = TModule.callback,
	item = TModule.table,
	dateText = TModule.string,
	noticeReadStatus = TModule.table
})
NoticeListCell.defaultProps = {
	LayoutOrder = 1,
	Size = UDim2.new(1, 0, 1, 0),
	Position = UDim2.new(0, 0, 0, 0)
}

function NoticeListCell.eventDisconnect(p1)
	if p1.onAbsolutePositionChanged then
		p1.onAbsolutePositionChanged:disconnect()
		p1.onAbsolutePositionChanged = nil
	end
end

function NoticeListCell.onButtonUp(p1)
	if p1.state.buttonPressed then
		p1:setState({ buttonPressed = false })
	end
	p1:eventDisconnect()
end

function NoticeListCell.onButtonDown(p1)
	if p1.state.buttonPressed then return end
	p1:eventDisconnect()
	local Current = p1.buttonRef.current
	
	if Current then
		p1.onAbsolutePositionChanged = Current:GetPropertyChangedSignal("AbsolutePosition"):connect(function()
			-- upvalues: p1 (copy)
			p1:onButtonUp()
		end)
	end
	p1:setState({ buttonPressed = true })
end

function NoticeListCell.init(p1)
	-- upvalues: RoactModule (copy)
	p1.state = { buttonPressed = false }
	p1.buttonRef = RoactModule.createRef()
	
	function p1:onButtonInputBegan(Input)
		-- upvalues: p1 (copy)
		local IsUserInputTypeMatch = Input.UserInputType == Enum.UserInputType.Touch
		local IsUserInputTypeMatch1 = Input.UserInputType == Enum.UserInputType.MouseButton1
		
		if Input.UserInputState == Enum.UserInputState.Begin and (IsUserInputTypeMatch or IsUserInputTypeMatch1) then
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

local function _(Text: string): string
	return if Text == nil or Text == "" then "" else Text:sub(1, (string.find(Text, "\n")))
end

function NoticeListCell.render(p1)
	-- upvalues: WithStyleFunction (copy), RoactModule (copy)
	local ButtonPressed = p1.state.buttonPressed
	local Size = p1.props.Size
	local Position = p1.props.Position
	local LayoutOrder = p1.props.LayoutOrder
	local Item = p1.props.item
	local Title = Item.title
	local NoticeReadStatus = p1.props.noticeReadStatus
	local HasRead = Item.hasRead or NoticeReadStatus[Item.noticeId]
	local ScreenWidthDelta = p1.props.screenWidth - 24 - 12
	local Content: string = p1.props.item.content
	local Segment = if Content == nil or Content == "" then "" else Content:sub(1, (string.find(Content, "\n")))
	
	return WithStyleFunction(function(p2)
		-- upvalues: ButtonPressed (copy), HasRead (copy), RoactModule (upval), Size (copy), Position (copy), LayoutOrder (copy), p1 (copy), Title (copy), ScreenWidthDelta (copy), Segment (copy)
		local BackgroundOnPress = ButtonPressed and p2.Theme.BackgroundOnPress or p2.Theme.BackgroundDefault
		local TextDefault = HasRead and p2.Theme.TextDefault or p2.Theme.TextEmphasis
		
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
			TitleText = RoactModule.createElement("TextLabel", {
				BackgroundTransparency = 1,
				BorderSizePixel = 0,
				Size = UDim2.new(0.5, 0, 0, 22),
				Position = UDim2.fromOffset(24, 14),
				Text = Title,
				Font = p2.Font.Header2.Font,
				TextSize = p2.Font.BaseSize * p2.Font.Header2.RelativeSize,
				TextColor3 = TextDefault.Color,
				TextTruncate = Enum.TextTruncate.AtEnd,
				TextTransparency = TextDefault.Transparency,
				TextXAlignment = Enum.TextXAlignment.Left,
				TextYAlignment = Enum.TextYAlignment.Top
			}),
			DescriptionText = RoactModule.createElement("TextLabel", {
				BackgroundTransparency = 1,
				BorderSizePixel = 0,
				TextWrapped = false,
				Size = UDim2.fromOffset(ScreenWidthDelta, 22),
				Position = UDim2.fromOffset(24, 36),
				Text = Segment,
				Font = p2.Font.CaptionBody.Font,
				TextSize = p2.Font.BaseSize * p2.Font.CaptionBody.RelativeSize,
				TextTruncate = Enum.TextTruncate.AtEnd,
				TextColor3 = TextDefault.Color,
				TextTransparency = TextDefault.Transparency,
				TextXAlignment = Enum.TextXAlignment.Left,
				TextYAlignment = Enum.TextYAlignment.Top
			}),
			DateLabel = RoactModule.createElement("TextLabel", {
				BackgroundTransparency = 1,
				BorderSizePixel = 0,
				AnchorPoint = Vector2.new(1, 0),
				Size = UDim2.new(0, 100, 0, 22),
				Position = UDim2.new(1, -12, 0, 14),
				Text = p1.props.dateText,
				Font = p2.Font.CaptionBody.Font,
				TextSize = p2.Font.BaseSize * p2.Font.CaptionBody.RelativeSize,
				TextColor3 = TextDefault.Color,
				TextTransparency = TextDefault.Transparency,
				TextXAlignment = Enum.TextXAlignment.Right,
				TextYAlignment = Enum.TextYAlignment.Center
			})
		})
	end)
end

function NoticeListCell.willUnmount(p1)
	p1:eventDisconnect()
end

return (RoactRoduxModule.connect(function(p1)
	return {
		screenWidth = p1.ScreenSize.X,
		noticeReadStatus = p1.Luobu.TencentNoticeReadStatus
	}
end)(NoticeListCell))