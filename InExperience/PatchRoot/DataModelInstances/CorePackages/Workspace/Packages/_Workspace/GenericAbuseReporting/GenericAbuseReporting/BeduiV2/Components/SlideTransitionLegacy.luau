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

return reactModule.memo(function(p1)
	-- upvalues: t_1 (ref), reactModule (ref), reactOtterModule (ref), t (ref), view (ref), slideTransitionContextModule (ref)
	local nodeType = t_1[p1.nodeType] or false
	local var1, var2 = reactModule.useState(false)
	local var3, var4 = reactModule.useBinding(false)
	local var5 = reactModule.useRef({
		prevNodeId = nil,
		prevContent = nil,
		outgoing = nil,
		direction = "forward",
		needsAnimationStart = false
	})
	local var6, var7 = reactOtterModule.useAnimatedBinding(1, reactModule.useCallback(function()
		-- upvalues: var5 (ref), var2 (ref), var4 (ref)
		var5.current.outgoing = nil
		var2(false)
		var4(false)
	end, {}))
	local current = var5.current
	
	if current.prevNodeId ~= nil and current.prevNodeId ~= p1.nodeId then
		if (not nodeType or not true) and current.prevContent and p1.direction ~= nil then
			current.outgoing = {
				nodeId = current.prevNodeId,
				content = current.prevContent
			}
			current.direction = p1.direction or "forward"
			current.needsAnimationStart = true
		end
	end
	if not nodeType then
		current.prevNodeId = p1.nodeId
		current.prevContent = p1.nodeContent
	end
	reactModule.useLayoutEffect(function()
		-- upvalues: var5 (ref), var2 (ref), var4 (ref), t (copy), var7 (ref), reactOtterModule (copy)
		if var5.current.needsAnimationStart then
			var5.current.needsAnimationStart = false
			var2(true)
			var4(true)
			local cloned = table.clone(t)
			cloned.startingValue = 0
			var7(reactOtterModule.spring(1, cloned))
		end
	end, { p1.nodeId })
	local t_2 = {}
	
	if current.outgoing then
		t_2[current.outgoing.nodeId] = reactModule.createElement(view, {
			tag = "col size-full",
			Position = if var1 then var6:map(function(p2)
				-- upvalues: var5 (ref)
				return UDim2.new(p2 * (if var5.current.direction == "forward" then -1 else 1), 0, 0, 0)
			end) else nil
		}, { Content = current.outgoing.content })
	end
	t_2[p1.nodeId] = reactModule.createElement(view, {
		tag = "col size-full",
		Position = if var1 then var6:map(function(p2)
			-- upvalues: var5 (ref)
			return UDim2.new((1 - p2) * (if var5.current.direction == "forward" then 1 else -1), 0, 0, 0)
		end) else nil
	}, { Content = p1.nodeContent })
	
	return reactModule.createElement(slideTransitionContextModule.Provider, { value = var3 }, reactModule.createElement(view, { tag = "fill size-full-0", ClipsDescendants = true }, t_2))
end)