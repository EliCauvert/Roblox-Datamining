local GenericAbuseReporting = script:FindFirstAncestor("GenericAbuseReporting")
local Parent = GenericAbuseReporting.Parent
local ReactModule = require(Parent.React)
local ReactOtterModule = require(Parent.ReactOtter)
local SlideTransitionContextModule = require(GenericAbuseReporting.BeduiV2.Components.SlideTransitionContext)
local View = require(Parent.Foundation).View
local config = {
	stiffness = 400,
	damping = 40,
	mass = 1,
	restingPositionLimit = 0.5,
	restingVelocityLimit = 0.1
}
local config1 = { inExpChatSelection = true, inExpSceneSelection = true }

return ReactModule.memo(function(p1)
	-- upvalues: config1 (copy), ReactModule (copy), ReactOtterModule (copy), config (copy), View (copy), SlideTransitionContextModule (copy)
	local Entry = config1[p1.nodeType] or false
	local UseStateResult, UseStateResult2 = ReactModule.useState(false)
	local UseBindingResult, UseBindingResult2 = ReactModule.useBinding(false)
	local UseRefResult = ReactModule.useRef({
		prevNodeId = nil,
		prevContent = nil,
		outgoing = nil,
		direction = "forward",
		needsAnimationStart = false
	})
	local UseAnimatedBindingResult, UseAnimatedBindingResult2 = ReactOtterModule.useAnimatedBinding(1, (ReactModule.useCallback(function()
		-- upvalues: UseRefResult (copy), UseStateResult2 (copy), UseBindingResult2 (copy)
		UseRefResult.current.outgoing = nil
		UseStateResult2(false)
		UseBindingResult2(false)
	end, {})))
	local Current = UseRefResult.current
	
	if Current.prevNodeId ~= nil and Current.prevNodeId ~= p1.nodeId then
		local HasDirection = p1.direction ~= nil
		
		if (not Entry or false) and Current.prevContent and HasDirection then
			Current.outgoing = {
				nodeId = Current.prevNodeId,
				content = Current.prevContent
			}
			Current.direction = p1.direction or "forward"
			Current.needsAnimationStart = true
		end
	end
	if not Entry then
		Current.prevNodeId = p1.nodeId
		Current.prevContent = p1.nodeContent
	end
	ReactModule.useLayoutEffect(function()
		-- upvalues: UseRefResult (copy), UseStateResult2 (copy), UseBindingResult2 (copy), config (upval), UseAnimatedBindingResult2 (copy), ReactOtterModule (upval)
		if UseRefResult.current.needsAnimationStart then
			UseRefResult.current.needsAnimationStart = false
			UseStateResult2(true)
			UseBindingResult2(true)
			local Copy = table.clone(config)
			Copy.startingValue = 0
			UseAnimatedBindingResult2(ReactOtterModule.spring(1, Copy))
		end
	end, { p1.nodeId })
	local Elements = {}
	
	if Current.outgoing then
		Elements[Current.outgoing.nodeId] = ReactModule.createElement(View, {
			tag = "col size-full",
			Position = if UseStateResult then UseAnimatedBindingResult:map(function(p2): UDim2
				-- upvalues: UseRefResult (copy)
				return UDim2.new(p2 * (if UseRefResult.current.direction == "forward" then -1 else 1), 0, 0, 0)
			end) else nil
		}, { Content = Current.outgoing.content })
	end
	Elements[p1.nodeId] = ReactModule.createElement(View, {
		tag = "col size-full",
		Position = if UseStateResult then UseAnimatedBindingResult:map(function(p2: number): UDim2
			-- upvalues: UseRefResult (copy)
			return UDim2.new((1 - p2) * (if UseRefResult.current.direction == "forward" then 1 else -1), 0, 0, 0)
		end) else nil
	}, { Content = p1.nodeContent })
	
	return ReactModule.createElement(SlideTransitionContextModule.Provider, { value = UseBindingResult }, ReactModule.createElement(View, { tag = "fill size-full-0", ClipsDescendants = true }, Elements))
end)