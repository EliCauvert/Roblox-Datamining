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

function introScroll.init(p0) --[[ line: 25 ]]
	-- upvalues: otterModule (ref)
	p0.motor = otterModule.createSingleMotor(0)
	p0.motor:onStep(function(p1) --[[ line: 27 ]]
		-- upvalues: p0 (ref)
		p0.props.updateCanvasPosition(Vector2.new(p1, 0))
	end)
end

function introScroll.didUpdate(p2, p3, _) --[[ line: 32 ]]
	-- upvalues: otterModule (ref)
	if p2.props.childWidgetIndex and p2.props.childWidgetIndex ~= p3.childWidgetIndex then
		local current = p2.props.scrollingFrameRef.current
		p2.motor:setGoal(otterModule.instant(math.clamp(current.AbsoluteCanvasSize.X - current.AbsoluteSize.X, 0, current.AbsoluteSize.X * 0.25)))
		p2.motor:step(0)
		p2.motor:setGoal(p2:getGoal())
	end
end

function introScroll.getGoal(_, _) --[[ line: 48 ]]
	-- upvalues: otterModule (ref), t (ref)
	return otterModule.spring(0, t)
end

function introScroll.render(_) --[[ line: 52 ]]
	return nil
end

function introScroll.willUnmount(p4) --[[ line: 56 ]]
	if p4.motor then
		p4.motor:destroy()
		p4.motor = nil
	end
end

return introScroll