local CorePackages = game:GetService("CorePackages")
local RoactModule = require(CorePackages.Packages.Roact)
local RoactRoduxModule = require(CorePackages.Packages.RoactRodux)
local TModule = require(CorePackages.Packages.t)
local InteractiveAlert = require(CorePackages.Packages.UIBlox).App.Dialog.Alert.InteractiveAlert
local Parent = script.Parent.Parent
local HumanoidViewportModule = require(Parent.HumanoidViewport)
local GetConformedHumanoidDescriptionModule = require(Parent.Parent.GetConformedHumanoidDescription)
local PromptWithAvatarViewport = RoactModule.PureComponent:extend("PromptWithAvatarViewport")
PromptWithAvatarViewport.validateProps = TModule.strictInterface({
	humanoidDescription = TModule.instanceOf("HumanoidDescription"),
	rigType = TModule.enum(Enum.HumanoidRigType),
	title = TModule.string,
	bodyText = TModule.optional(TModule.string),
	buttonStackInfo = TModule.table,
	screenSize = TModule.Vector2
})

function PromptWithAvatarViewport.init(p1) --[[ Line: 41 ]]
	-- upvalues: RoactModule (copy)
	p1.mounted = false
	p1.middleContentRef = RoactModule.createRef()
	p1.contentSize, p1.updateContentSize = RoactModule.createBinding(UDim2.new(1, 0, 0, 200))
	p1:setState({
		conformedHumanoidDescription = nil,
		getConformedDescriptionFailed = false
	})
	
	function p1.onAlertSizeChanged(Frame) --[[ Line: 52 ]]
		-- upvalues: p1 (copy)
		local AbsoluteSize = Frame.AbsoluteSize
		
		if not p1.middleContentRef:getValue() then return end
		local Y = p1.middleContentRef:getValue().AbsoluteSize.Y
		local YDelta = p1.props.screenSize.Y - 60 - (AbsoluteSize.Y - Y)
		local XDelta = p1.middleContentRef:getValue().AbsoluteSize.X - 20
		
		if XDelta < YDelta then
			YDelta = XDelta
		end
		if Y ~= YDelta then
			p1.updateContentSize(UDim2.new(1, 0, 0, YDelta))
		end
	end
	
	function p1.retryLoadDescription() --[[ Line: 74 ]]
		-- upvalues: p1 (copy)
		p1:setState({ getConformedDescriptionFailed = false })
		p1:getConformedHumanoidDescription()
	end
end

function PromptWithAvatarViewport.renderAlertMiddleContent(p1) --[[ Line: 83 ]]
	-- upvalues: RoactModule (copy), HumanoidViewportModule (copy)
	return RoactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		Size = p1.contentSize,
		[RoactModule.Ref] = p1.middleContentRef
	}, {
		HumanoidViewport = RoactModule.createElement(HumanoidViewportModule, {
			humanoidDescription = p1.state.conformedHumanoidDescription,
			loadingFailed = p1.state.getConformedDescriptionFailed,
			retryLoadDescription = p1.retryLoadDescription,
			rigType = p1.props.rigType
		})
	})
end

function PromptWithAvatarViewport.render(p1) --[[ Line: 102 ]]
	-- upvalues: RoactModule (copy), InteractiveAlert (copy)
	return RoactModule.createElement(InteractiveAlert, {
		isMiddleContentFocusable = false,
		title = p1.props.title,
		bodyText = p1.props.bodyText,
		buttonStackInfo = p1.props.buttonStackInfo,
		position = UDim2.fromScale(0.5, 0.5),
		screenSize = p1.props.screenSize,
		middleContent = function() --[[ Line: 109 ]]
			-- upvalues: p1 (copy)
			return p1:renderAlertMiddleContent()
		end,
		onAbsoluteSizeChanged = p1.onAlertSizeChanged
	})
end

function PromptWithAvatarViewport.getConformedHumanoidDescription(p1, HumanoidDescription) --[[ Line: 117 ]]
	-- upvalues: GetConformedHumanoidDescriptionModule (copy)
	GetConformedHumanoidDescriptionModule(HumanoidDescription, true):andThen(function(Result) --[[ Line: 119 ]]
		-- upvalues: p1 (copy)
		if p1.mounted then
			p1:setState({ conformedHumanoidDescription = Result })
			
			return
		end
	end, function(_) --[[ Line: 127 ]]
		-- upvalues: p1 (copy)
		if p1.mounted then
			p1:setState({ getConformedDescriptionFailed = true })
			
			return
		end
	end)
end

function PromptWithAvatarViewport.didMount(p1) --[[ Line: 138 ]]
	p1.mounted = true
	p1:getConformedHumanoidDescription(p1.props.humanoidDescription)
end

function PromptWithAvatarViewport.didUpdate(p1, p2, _) --[[ Line: 144 ]]
	-- upvalues: RoactModule (copy)
	if p2.humanoidDescription ~= p1.props.humanoidDescription then
		p1:setState({
			getConformedDescriptionFailed = false,
			conformedHumanoidDescription = RoactModule.None
		})
		p1:getConformedHumanoidDescription(p1.props.humanoidDescription)
	end
end

function PromptWithAvatarViewport.willUnmount(p1) --[[ Line: 155 ]]
	p1.mounted = false
end

return (RoactRoduxModule.connect(function(p1) --[[ Line: 159 | Named "mapStateToProps" ]]
	return { screenSize = p1.screenSize }
end, nil)(PromptWithAvatarViewport))