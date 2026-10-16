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

local function SlidePane(p1) --[[ Line: 49 ]]
	-- upvalues: ReactModule (copy), View (copy)
	return ReactModule.createElement(View, {
		tag = "size-full",
		Position = p1.position,
		testId = if p1.withInputSink then "SlideTransitionOutgoing" else "SlideTransitionIncoming"
	}, {
		Content = ReactModule.createElement(View, { tag = "col size-full" }, { Page = p1.content }),
		InputSink = if p1.withInputSink then ReactModule.createElement("TextButton", {
			Size = UDim2.fromScale(1, 1),
			Position = UDim2.fromScale(0, 0),
			BackgroundTransparency = 1,
			Text = "",
			AutoButtonColor = false,
			Selectable = false,
			Active = true,
			ZIndex = 100,
			[ReactModule.Tag] = "data-testid=SlideTransitionInputSink"
		}) else nil
	})
end

return ReactModule.memo(function(p1) --[[ Line: 88 | Named "SlideTransition" ]]
	-- upvalues: config1 (copy), ReactModule (copy), ReactOtterModule (copy), config (copy), SlidePane (copy), SlideTransitionContextModule (copy), View (copy)
	local Entry = config1[p1.nodeType] or false
	local UseStateResult, UseStateResult2 = ReactModule.useState(false)
	local UseBindingResult, UseBindingResult2 = ReactModule.useBinding(false)
	local UseRefResult = ReactModule.useRef({
		prevNodeId = nil,
		prevContent = nil,
		outgoing = nil,
		direction = "forward",
		needsAnimationStart = false,
		needsAnimationCancel = false,
		transitionId = 0,
		springId = 0
	})
	local UseAnimatedBindingResult, UseAnimatedBindingResult2 = ReactOtterModule.useAnimatedBinding(1, (ReactModule.useCallback(function() --[[ Line: 110 ]]
		-- upvalues: UseRefResult (copy), UseStateResult2 (copy), UseBindingResult2 (copy)
		local Current = UseRefResult.current
		
		if Current.springId == Current.transitionId then
			Current.outgoing = nil
			UseStateResult2(false)
			UseBindingResult2(false)
			
			return
		end
	end, {})))
	local Current = UseRefResult.current
	
	if Current.prevNodeId ~= nil and Current.prevNodeId ~= p1.nodeId then
		local HasDirection = p1.direction ~= nil
		
		if Entry or not Current.prevContent or not HasDirection then
			if not HasDirection then
				Current.outgoing = nil
				Current.needsAnimationStart = false
				Current.transitionId += 1
				Current.springId = -1
				
				if UseStateResult then
					Current.needsAnimationCancel = true
				end
			end
		else
			Current.outgoing = {
				nodeId = Current.prevNodeId,
				content = Current.prevContent
			}
			Current.direction = p1.direction or "forward"
			Current.needsAnimationStart = true
			Current.needsAnimationCancel = false
			Current.transitionId += 1
			Current.springId = -1
		end
	end
	if not Entry then
		Current.prevNodeId = p1.nodeId
		Current.prevContent = p1.nodeContent
	end
	ReactModule.useLayoutEffect(function() --[[ Line: 156 ]]
		-- upvalues: UseRefResult (copy), UseStateResult2 (copy), UseBindingResult2 (copy), config (upval), UseAnimatedBindingResult2 (copy), ReactOtterModule (upval)
		local Current = UseRefResult.current
		
		if Current.needsAnimationCancel then
			Current.needsAnimationCancel = false
			UseStateResult2(false)
			UseBindingResult2(false)
		end
		if Current.needsAnimationStart then
			Current.needsAnimationStart = false
			Current.springId = Current.transitionId
			UseStateResult2(true)
			UseBindingResult2(true)
			local Copy = table.clone(config)
			Copy.startingValue = 0
			UseAnimatedBindingResult2(ReactOtterModule.spring(1, Copy))
		end
	end, { p1.nodeId })
	local Elements = {}
	local HasOutgoing = Current.outgoing ~= nil
	local NeedsAnimationStart = HasOutgoing and (Current.needsAnimationStart or not UseStateResult)
	
	if Current.outgoing then
		Elements[Current.outgoing.nodeId] = ReactModule.createElement(SlidePane, {
			withInputSink = true,
			content = Current.outgoing.content,
			position = if NeedsAnimationStart then UDim2.new(0, 0, 0, 0) else UseAnimatedBindingResult:map(function(p2): UDim2 --[[ Line: 187 ]]
				-- upvalues: UseRefResult (copy)
				return UDim2.new(p2 * (if UseRefResult.current.direction == "forward" then -1 else 1), 0, 0, 0)
			end)
		})
	end
	Elements[p1.nodeId] = ReactModule.createElement(SlidePane, {
		withInputSink = false,
		content = p1.nodeContent,
		position = if NeedsAnimationStart then UDim2.new(if Current.direction == "forward" then 1 else -1, 0, 0, 0) elseif HasOutgoing then UseAnimatedBindingResult:map(function(p2: number): UDim2 --[[ Line: 204 ]]
			-- upvalues: UseRefResult (copy)
			return UDim2.new((1 - p2) * (if UseRefResult.current.direction == "forward" then 1 else -1), 0, 0, 0)
		end) else nil
	})
	
	return ReactModule.createElement(SlideTransitionContextModule.Provider, { value = UseBindingResult }, ReactModule.createElement(View, { tag = "fill size-full-0", ClipsDescendants = true }, Elements))
end)