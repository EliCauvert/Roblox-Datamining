local parent = script.Parent.Parent.Parent
local reactModule = require(parent.Parent.React)
local lerpModule = require(parent.utils.lerp)
local stackViewOverlayFrame = reactModule.Component:extend("StackViewOverlayFrame")

function stackViewOverlayFrame.init(p1)
	-- upvalues: reactModule (ref)
	p1._signalDisconnect = nil
	p1._ref = reactModule.createRef()
end

function stackViewOverlayFrame.render(p1)
	-- upvalues: lerpModule (ref), reactModule (ref)
	local navigationOptions = p1.props.navigationOptions
	
	return reactModule.createElement("Frame", {
		BorderSizePixel = 0,
		Size = UDim2.new(1, 0, 1, 0),
		BackgroundColor3 = navigationOptions.overlayColor3,
		BackgroundTransparency = lerpModule(1, navigationOptions.overlayTransparency, p1.props.initialTransitionValue),
		ref = p1._ref
	})
end

function stackViewOverlayFrame.didUpdate(p1, p2)
	local transitionChangedSignal = p1.props.transitionChangedSignal
	
	if transitionChangedSignal ~= p2.transitionChangedSignal then
		if p1._signalDisconnect then
			p1._signalDisconnect()
		end
		p1._signalDisconnect = transitionChangedSignal(function(...)
			-- upvalues: p1 (ref)
			p1:_transitionChanged(...)
		end)
	end
end

function stackViewOverlayFrame.didMount(p1)
	p1._isMounted = true
	p1._signalDisconnect = p1.props.transitionChangedSignal(function(...)
		-- upvalues: p1 (ref)
		p1:_transitionChanged(...)
	end)
end

function stackViewOverlayFrame.willUnmount(p1)
	p1._isMounted = false
	
	if p1._signalDisconnect then
		p1._signalDisconnect()
		p1._signalDisconnect = nil
	end
end

function stackViewOverlayFrame._transitionChanged(p1, p2)
	-- upvalues: lerpModule (ref)
	if not p1._isMounted then return end
	if p1._ref.current then
		p1._ref.current.BackgroundTransparency = lerpModule(1, p1.props.navigationOptions.overlayTransparency, p2)
	end
end

return stackViewOverlayFrame