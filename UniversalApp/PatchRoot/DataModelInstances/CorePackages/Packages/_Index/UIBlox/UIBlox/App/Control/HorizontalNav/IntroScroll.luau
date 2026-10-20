local Parent = script.Parent.Parent.Parent.Parent.Parent
local TModule = require(Parent.t)
local OtterModule = require(Parent.Otter)
local config = { dampingRatio = 1, frequency = 3.5 }
local IntroScroll = require(Parent.Roact).PureComponent:extend("IntroScroll")
IntroScroll.validateProps = TModule.strictInterface({
	childWidgetIndex = TModule.number,
	scrollingFrameRef = TModule.table,
	updateCanvasPosition = TModule.callback
})

function IntroScroll.init(p1)
	-- upvalues: OtterModule (copy)
	p1.motor = OtterModule.createSingleMotor(0)
	p1.motor:onStep(function(X)
		-- upvalues: p1 (copy)
		p1.props.updateCanvasPosition(Vector2.new(X, 0))
	end)
end

function IntroScroll.didUpdate(p1, p2, _)
	-- upvalues: OtterModule (copy)
	if p1.props.childWidgetIndex and p1.props.childWidgetIndex ~= p2.childWidgetIndex then
		local Current = p1.props.scrollingFrameRef.current
		p1.motor:setGoal(OtterModule.instant((math.clamp(Current.AbsoluteCanvasSize.X - Current.AbsoluteSize.X, 0, Current.AbsoluteSize.X * 0.25))))
		p1.motor:step(0)
		p1.motor:setGoal(p1:getGoal())
	end
end

function IntroScroll:getGoal(_)
	-- upvalues: OtterModule (copy), config (copy)
	return OtterModule.spring(0, config)
end

function IntroScroll:render()
	return nil
end

function IntroScroll.willUnmount(p1)
	if p1.motor then
		p1.motor:destroy()
		p1.motor = nil
	end
end

return IntroScroll