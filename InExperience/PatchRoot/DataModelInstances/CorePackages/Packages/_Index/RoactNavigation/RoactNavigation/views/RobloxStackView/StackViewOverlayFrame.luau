local Parent = script.Parent.Parent.Parent
local ReactModule = require(Parent.Parent.React)
local LerpModule = require(Parent.utils.lerp)
local StackViewOverlayFrame = ReactModule.Component:extend("StackViewOverlayFrame")

function StackViewOverlayFrame.init(p1) --[[ Line: 10 ]]
	-- upvalues: ReactModule (copy)
	p1._signalDisconnect = nil
	p1._ref = ReactModule.createRef()
end

function StackViewOverlayFrame.render(p1) --[[ Line: 16 ]]
	-- upvalues: LerpModule (copy), ReactModule (copy)
	local NavigationOptions = p1.props.navigationOptions
	
	return ReactModule.createElement("Frame", {
		BorderSizePixel = 0,
		Size = UDim2.new(1, 0, 1, 0),
		BackgroundColor3 = NavigationOptions.overlayColor3,
		BackgroundTransparency = LerpModule(1, NavigationOptions.overlayTransparency, p1.props.initialTransitionValue),
		ref = p1._ref
	})
end

function StackViewOverlayFrame.didUpdate(p1, p2) --[[ Line: 31 ]]
	local TransitionChangedSignalFunction = p1.props.transitionChangedSignal
	
	if TransitionChangedSignalFunction ~= p2.transitionChangedSignal then
		if p1._signalDisconnect then
			p1._signalDisconnect()
		end
		p1._signalDisconnect = TransitionChangedSignalFunction(function(...) --[[ Line: 39 ]]
			-- upvalues: p1 (copy)
			p1:_transitionChanged(...)
		end)
	end
end

function StackViewOverlayFrame.didMount(p1) --[[ Line: 45 ]]
	p1._isMounted = true
	p1._signalDisconnect = p1.props.transitionChangedSignal(function(...) --[[ Line: 47 ]]
		-- upvalues: p1 (copy)
		p1:_transitionChanged(...)
	end)
end

function StackViewOverlayFrame.willUnmount(p1) --[[ Line: 52 ]]
	p1._isMounted = false
	
	if p1._signalDisconnect then
		p1._signalDisconnect()
		p1._signalDisconnect = nil
	end
end

function StackViewOverlayFrame._transitionChanged(p1, p2) --[[ Line: 60 ]]
	-- upvalues: LerpModule (copy)
	if not p1._isMounted then return end
	if p1._ref.current then
		p1._ref.current.BackgroundTransparency = LerpModule(1, p1.props.navigationOptions.overlayTransparency, p2)
	end
end

return StackViewOverlayFrame