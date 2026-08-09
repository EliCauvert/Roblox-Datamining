local genericAbuseReporting = script:FindFirstAncestor("GenericAbuseReporting")
local parent = genericAbuseReporting.Parent
local foundationModule = require(parent.Foundation)
local reactModule = require(parent.React)
local reactOtterModule = require(parent.ReactOtter)
local slideTransitionContextModule = require(genericAbuseReporting.BeduiV2.Components.SlideTransitionContext)
local view = foundationModule.View
local t = {
	stiffness = 400,
	damping = 40,
	mass = 1,
	restingPositionLimit = 0.5,
	restingVelocityLimit = 0.1
}
local t_1 = { inExpChatSelection = true, inExpSceneSelection = true }

return reactModule.memo(function(p0) --[[ line: 60 | named "SlideTransition" ]]
	-- upvalues: t_1 (ref), reactModule (ref), reactOtterModule (ref), t (ref), view (ref), slideTransitionContextModule (ref)
	local nodeType = t_1[p0.nodeType] or false
	local var8, var9 = reactModule.useState(false)
	local var10, var11 = reactModule.useBinding(false)
	local var12 = reactModule.useRef({
		prevNodeId = nil,
		prevContent = nil,
		outgoing = nil,
		direction = "forward",
		needsAnimationStart = false
	})
	local var13, var14 = reactOtterModule.useAnimatedBinding(1, reactModule.useCallback(function() --[[ line: 77 ]]
		-- upvalues: var12 (ref), var9 (ref), var11 (ref)
		var12.current.outgoing = nil
		var9(false)
		var11(false)
	end, {}))
	local current = var12.current
	
	if current.prevNodeId ~= nil and current.prevNodeId ~= p0.nodeId then
		if (not nodeType or not true) and current.prevContent and p0.direction ~= nil then
			current.outgoing = {
				nodeId = current.prevNodeId,
				content = current.prevContent
			}
			current.direction = p0.direction or "forward"
			current.needsAnimationStart = true
		end
	end
	if not nodeType then
		current.prevNodeId = p0.nodeId
		current.prevContent = p0.nodeContent
	end
	reactModule.useLayoutEffect(function() --[[ line: 105 ]]
		-- upvalues: var12 (ref), var9 (ref), var11 (ref), t (copy), var14 (ref), reactOtterModule (copy)
		if var12.current.needsAnimationStart then
			var12.current.needsAnimationStart = false
			var9(true)
			var11(true)
			local cloned = table.clone(t)
			cloned.startingValue = 0
			var14(reactOtterModule.spring(1, cloned))
		end
	end, { p0.nodeId })
	local t_2 = {}
	
	if current.outgoing then
		t_2[current.outgoing.nodeId] = reactModule.createElement(view, {
			tag = "col size-full",
			Position = if var8 then var13:map(function(p1) --[[ line: 122 ]]
				-- upvalues: var12 (ref)
				return UDim2.new(p1 * (if var12.current.direction == "forward" then -1 else 1), 0, 0, 0)
			end) else nil
		}, { Content = current.outgoing.content })
	end
	t_2[p0.nodeId] = reactModule.createElement(view, {
		tag = "col size-full",
		Position = if var8 then var13:map(function(p2) --[[ line: 133 ]]
			-- upvalues: var12 (ref)
			return UDim2.new((1 - p2) * (if var12.current.direction == "forward" then 1 else -1), 0, 0, 0)
		end) else nil
	}, { Content = p0.nodeContent })
	
	return reactModule.createElement(slideTransitionContextModule.Provider, { value = var10 }, reactModule.createElement(view, { tag = "fill size-full-0", ClipsDescendants = true }, t_2))
end)