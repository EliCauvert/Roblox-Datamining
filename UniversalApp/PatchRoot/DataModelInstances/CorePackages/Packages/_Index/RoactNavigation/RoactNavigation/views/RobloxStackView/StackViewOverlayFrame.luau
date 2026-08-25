local parent = script.Parent.Parent.Parent
local reactModule = require(parent.Parent.React)
local lerpModule = require(parent.utils.lerp)
local stackViewOverlayFrame = reactModule.Component:extend("StackViewOverlayFrame")

function stackViewOverlayFrame.init(p0)
	-- upvalues: reactModule (ref)
	p0._signalDisconnect = nil
	p0._ref = reactModule.createRef()
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

function stackViewOverlayFrame.didUpdate(p2, p3)
	local transitionChangedSignal = p2.props.transitionChangedSignal
	
	if transitionChangedSignal ~= p3.transitionChangedSignal then
		if p2._signalDisconnect then
			p2._signalDisconnect()
		end
		p2._signalDisconnect = transitionChangedSignal(function(...)
			-- upvalues: p2 (ref)
			p2:_transitionChanged(...)
		end)
	end
end

function stackViewOverlayFrame.didMount(p4)
	p4._isMounted = true
	p4._signalDisconnect = p4.props.transitionChangedSignal(function(...)
		-- upvalues: p4 (ref)
		p4:_transitionChanged(...)
	end)
end

function stackViewOverlayFrame.willUnmount(p5)
	p5._isMounted = false
	
	if p5._signalDisconnect then
		p5._signalDisconnect()
		p5._signalDisconnect = nil
	end
end

function stackViewOverlayFrame._transitionChanged(p6, p7)
	-- upvalues: lerpModule (ref)
	if not p6._isMounted then return end
	if p6._ref.current then
		p6._ref.current.BackgroundTransparency = lerpModule(1, p6.props.navigationOptions.overlayTransparency, p7)
	end
end

return stackViewOverlayFrame