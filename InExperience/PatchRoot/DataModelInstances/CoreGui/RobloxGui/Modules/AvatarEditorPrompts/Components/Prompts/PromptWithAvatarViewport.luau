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

function promptWithAvatarViewport.init(p1)
	-- upvalues: roactModule (ref)
	p1.mounted = false
	p1.middleContentRef = roactModule.createRef()
	local var1, var2 = roactModule.createBinding(UDim2.new(1, 0, 0, 200))
	p1.contentSize = var1
	p1.updateContentSize = var2
	p1:setState({
		conformedHumanoidDescription = nil,
		getConformedDescriptionFailed = false
	})
	
	function p0.onAlertSizeChanged(p2)
		-- upvalues: p1 (ref)
		local absoluteSize = p2.AbsoluteSize
		
		if not p1.middleContentRef:getValue() then return end
		local y = p1.middleContentRef:getValue().AbsoluteSize.Y
		local var3 = p1.props.screenSize.Y - 60 - (absoluteSize.Y - y)
		local var4 = p1.middleContentRef:getValue().AbsoluteSize.X - 20
		
		if var4 < var3 then
			var3 = var4
		end
		if y ~= var3 then
			p1.updateContentSize(UDim2.new(1, 0, 0, var3))
		end
	end
	
	function p0.retryLoadDescription()
		-- upvalues: p1 (ref)
		p1:setState({ getConformedDescriptionFailed = false })
		p1:getConformedHumanoidDescription()
	end
end

function promptWithAvatarViewport.renderAlertMiddleContent(p1)
	-- upvalues: roactModule (ref), humanoidViewportModule (ref)
	return roactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		Size = p1.contentSize,
		[roactModule.Ref] = p1.middleContentRef
	}, {
		HumanoidViewport = roactModule.createElement(humanoidViewportModule, {
			humanoidDescription = p1.state.conformedHumanoidDescription,
			loadingFailed = p1.state.getConformedDescriptionFailed,
			retryLoadDescription = p1.retryLoadDescription,
			rigType = p1.props.rigType
		})
	})
end

function promptWithAvatarViewport.render(p1)
	-- upvalues: roactModule (ref), interactiveAlert (ref)
	return roactModule.createElement(interactiveAlert, {
		isMiddleContentFocusable = false,
		title = p1.props.title,
		bodyText = p1.props.bodyText,
		buttonStackInfo = p1.props.buttonStackInfo,
		position = UDim2.fromScale(0.5, 0.5),
		screenSize = p1.props.screenSize,
		middleContent = function()
			-- upvalues: p1 (ref)
			return p1:renderAlertMiddleContent()
		end,
		onAbsoluteSizeChanged = p1.onAlertSizeChanged
	})
end

function promptWithAvatarViewport.getConformedHumanoidDescription(p1, p2)
	-- upvalues: getConformedHumanoidDescriptionModule (ref)
	getConformedHumanoidDescriptionModule(p2, true):andThen(function(p3)
		-- upvalues: p1 (ref)
		if p1.mounted then
			p1:setState({ conformedHumanoidDescription = p3 })
			
			return
		end
	end, function(_)
		-- upvalues: p1 (ref)
		if p1.mounted then
			p1:setState({ getConformedDescriptionFailed = true })
			
			return
		end
	end)
end

function promptWithAvatarViewport.didMount(p1)
	p1.mounted = true
	p1:getConformedHumanoidDescription(p1.props.humanoidDescription)
end

function promptWithAvatarViewport.didUpdate(p1, p2, _)
	-- upvalues: roactModule (ref)
	if p2.humanoidDescription ~= p1.props.humanoidDescription then
		p1:setState({
			getConformedDescriptionFailed = false,
			conformedHumanoidDescription = roactModule.None
		})
		p1:getConformedHumanoidDescription(p1.props.humanoidDescription)
	end
end

function promptWithAvatarViewport.willUnmount(p1)
	p1.mounted = false
end

return roactRoduxModule.connect(function(p1)
	return { screenSize = p1.screenSize }
end, nil)(promptWithAvatarViewport)