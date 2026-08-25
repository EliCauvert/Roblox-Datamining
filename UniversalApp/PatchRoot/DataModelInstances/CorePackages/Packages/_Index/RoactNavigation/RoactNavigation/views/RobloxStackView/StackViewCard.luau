local parent = script.Parent.Parent.Parent
local reactModule = require(parent.Parent.React)
local invariantModule = require(parent.utils.invariant)
local stackViewCard = reactModule.Component:extend("StackViewCard")

function stackViewCard.init(p0)
	-- upvalues: reactModule (ref)
	local index = p0.props.navigation.state.index
	p0._isMounted = false
	p0._positionLastValue = index
	p0._ref = reactModule.createRef()
end

function stackViewCard.render(p1)
	-- upvalues: invariantModule (ref), reactModule (ref)
	local forceHidden = p1.props.forceHidden
	local cardColor3 = p1.props.cardColor3
	local initialPosition = p1.props.initialPosition
	local renderScene = p1.props.renderScene
	local scene = p1.props.scene
	invariantModule(type(renderScene) == "function", "renderScene must be a function")
	
	return reactModule.createElement("Frame", {
		BorderSizePixel = 0,
		ClipsDescendants = false,
		Position = initialPosition,
		Size = UDim2.new(1, 0, 1, 0),
		BackgroundColor3 = cardColor3,
		BackgroundTransparency = if cardColor3 == nil then 1 else nil,
		Visible = not forceHidden,
		ref = p1._ref
	}, { Content = renderScene(scene) })
end

function stackViewCard.didMount(p2)
	p2._isMounted = true
	p2._positionDisconnector = p2.props.position:onStep(function(...)
		-- upvalues: p2 (ref)
		p2:_onPositionStep(...)
	end)
end

function stackViewCard.willUnmount(p3)
	p3._isMounted = false
	
	if p3._positionDisconnector then
		p3._positionDisconnector()
		p3._positionDisconnector = nil
	end
end

function stackViewCard.didUpdate(p4, p5)
	local position = p4.props.position
	local positionStep = p4.props.positionStep
	
	if position ~= p5.position then
		p4._positionDisconnector()
		p4._positionDisconnector = position:onStep(function(...)
			-- upvalues: p4 (ref)
			p4:_onPositionStep(...)
		end)
	end
	if positionStep ~= p5.positionStep then
		p4:_onPositionStep(p4._positionLastValue)
	end
end

function stackViewCard._onPositionStep(p6, p7)
	if not p6._isMounted then return end
	local positionStep = p6.props.positionStep
	
	if positionStep then
		positionStep(p6._ref, p7)
	end
	p6._positionLastValue = p7
end

return stackViewCard