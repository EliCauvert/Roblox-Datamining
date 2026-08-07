local corePackagesService = game:GetService("CorePackages")
local roactModule = require(corePackagesService.Packages.Roact)
local roactRoduxModule = require(corePackagesService.Packages.RoactRodux)
local tModule = require(corePackagesService.Packages.t)
local interactiveAlert = require(corePackagesService.Packages.UIBlox).App.Dialog.Alert.InteractiveAlert
local parent = script.Parent.Parent
local humanoidViewportModule = require(parent.HumanoidViewport)
local getConformedHumanoidDescriptionModule = require(parent.Parent.GetConformedHumanoidDescription)
local promptWithAvatarViewport = roactModule.PureComponent:extend("PromptWithAvatarViewport")
promptWithAvatarViewport.validateProps = tModule.strictInterface({
	humanoidDescription = tModule.instanceOf("HumanoidDescription"),
	rigType = tModule.enum(Enum.HumanoidRigType),
	title = tModule.string,
	bodyText = tModule.optional(tModule.string),
	buttonStackInfo = tModule.table,
	screenSize = tModule.Vector2
})

function promptWithAvatarViewport.init(p0) --[[ line: 41 ]]
	-- upvalues: roactModule (ref)
	p0.mounted = false
	p0.middleContentRef = roactModule.createRef()
	local var7, var8 = roactModule.createBinding(UDim2.new(1, 0, 0, 200))
	p0.contentSize = var7
	p0.updateContentSize = var8
	p0:setState({
		conformedHumanoidDescription = nil,
		getConformedDescriptionFailed = false
	})
	
	function p0.onAlertSizeChanged(p1) --[[ line: 52 ]]
		-- upvalues: p0 (ref)
		local absoluteSize = p1.AbsoluteSize
		
		if not p0.middleContentRef:getValue() then return end
		local y = p0.middleContentRef:getValue().AbsoluteSize.Y
		local var9 = p0.props.screenSize.Y - 60 - (absoluteSize.Y - y)
		local var10 = p0.middleContentRef:getValue().AbsoluteSize.X - 20
		
		if var10 < var9 then
			var9 = var10
		end
		if y ~= var9 then
			p0.updateContentSize(UDim2.new(1, 0, 0, var9))
		end
	end
	
	function p0.retryLoadDescription() --[[ line: 74 ]]
		-- upvalues: p0 (ref)
		p0:setState({ getConformedDescriptionFailed = false })
		p0:getConformedHumanoidDescription()
	end
end

function promptWithAvatarViewport.renderAlertMiddleContent(p2) --[[ line: 83 ]]
	-- upvalues: roactModule (ref), humanoidViewportModule (ref)
	return roactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		Size = p2.contentSize,
		[roactModule.Ref] = p2.middleContentRef
	}, {
		HumanoidViewport = roactModule.createElement(humanoidViewportModule, {
			humanoidDescription = p2.state.conformedHumanoidDescription,
			loadingFailed = p2.state.getConformedDescriptionFailed,
			retryLoadDescription = p2.retryLoadDescription,
			rigType = p2.props.rigType
		})
	})
end

function promptWithAvatarViewport.render(p3) --[[ line: 102 ]]
	-- upvalues: roactModule (ref), interactiveAlert (ref)
	return roactModule.createElement(interactiveAlert, {
		isMiddleContentFocusable = false,
		title = p3.props.title,
		bodyText = p3.props.bodyText,
		buttonStackInfo = p3.props.buttonStackInfo,
		position = UDim2.fromScale(0.5, 0.5),
		screenSize = p3.props.screenSize,
		middleContent = function() --[[ line: 109 ]]
			-- upvalues: p3 (ref)
			return p3:renderAlertMiddleContent()
		end,
		onAbsoluteSizeChanged = p3.onAlertSizeChanged
	})
end

function promptWithAvatarViewport.getConformedHumanoidDescription(p4, p5) --[[ line: 117 ]]
	-- upvalues: getConformedHumanoidDescriptionModule (ref)
	getConformedHumanoidDescriptionModule(p5, true):andThen(function(p6) --[[ line: 119 ]]
		-- upvalues: p4 (ref)
		if p4.mounted then
			p4:setState({ conformedHumanoidDescription = p6 })
			
			return
		end
	end, function(_) --[[ line: 127 ]]
		-- upvalues: p4 (ref)
		if p4.mounted then
			p4:setState({ getConformedDescriptionFailed = true })
			
			return
		end
	end)
end

function promptWithAvatarViewport.didMount(p7) --[[ line: 138 ]]
	p7.mounted = true
	p7:getConformedHumanoidDescription(p7.props.humanoidDescription)
end

function promptWithAvatarViewport.didUpdate(p8, p9, _) --[[ line: 144 ]]
	-- upvalues: roactModule (ref)
	if p9.humanoidDescription ~= p8.props.humanoidDescription then
		p8:setState({
			getConformedDescriptionFailed = false,
			conformedHumanoidDescription = roactModule.None
		})
		p8:getConformedHumanoidDescription(p8.props.humanoidDescription)
	end
end

function promptWithAvatarViewport.willUnmount(p10) --[[ line: 155 ]]
	p10.mounted = false
end

return roactRoduxModule.connect(function(p11) --[[ line: 159 | named "mapStateToProps" ]]
	return { screenSize = p11.screenSize }
end, nil)(promptWithAvatarViewport)