local parent = script.Parent.Parent.Parent.Parent.Parent
local roactModule = require(parent.Roact)
local tModule = require(parent.t)
local otterModule = require(parent.Otter)
local t = { dampingRatio = 1, frequency = 3.5 }
local introScroll = roactModule.PureComponent:extend("IntroScroll")
introScroll.validateProps = tModule.strictInterface({
	childWidgetIndex = tModule.number,
	scrollingFrameRef = tModule.table,
	updateCanvasPosition = tModule.callback
})

function introScroll.init(p1)
	-- upvalues: otterModule (ref)
	p1.motor = otterModule.createSingleMotor(0)
	p1.motor:onStep(function(p2)
		-- upvalues: p1 (ref)
		p1.props.updateCanvasPosition(Vector2.new(p2, 0))
	end)
end

function introScroll.didUpdate(p1, p2, _)
	-- upvalues: otterModule (ref)
	if p1.props.childWidgetIndex and p1.props.childWidgetIndex ~= p2.childWidgetIndex then
		local current = p1.props.scrollingFrameRef.current
		p1.motor:setGoal(otterModule.instant(math.clamp(current.AbsoluteCanvasSize.X - current.AbsoluteSize.X, 0, current.AbsoluteSize.X * 0.25)))
		p1.motor:step(0)
		p1.motor:setGoal(p1:getGoal())
	end
end

function introScroll.getGoal(_, _)
	-- upvalues: otterModule (ref), t (ref)
	return otterModule.spring(0, t)
end

function introScroll.render(_)
	return nil
end

function introScroll.willUnmount(p1)
	if p1.motor then
		p1.motor:destroy()
		p1.motor = nil
	end
end

return introScroll