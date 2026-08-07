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

local function SlidePane(p0) --[[ line: 54 ]]
	-- upvalues: reactModule (ref), view (ref)
	return reactModule.createElement(view, {
		tag = "size-full",
		Position = p0.position,
		testId = if p0.withInputSink then "SlideTransitionOutgoing" else "SlideTransitionIncoming"
	}, {
		Content = reactModule.createElement(view, { tag = "col size-full" }, { Page = p0.content }),
		InputSink = if p0.withInputSink then reactModule.createElement("TextButton", {
			Size = UDim2.fromScale(1, 1),
			Position = UDim2.fromScale(0, 0),
			BackgroundTransparency = 1,
			Text = "",
			AutoButtonColor = false,
			Selectable = false,
			Active = true,
			ZIndex = 100,
			[reactModule.Tag] = "data-testid=SlideTransitionInputSink"
		}) else nil
	})
end

return reactModule.memo(function(p1) --[[ line: 98 | named "SlideTransition" ]]
	-- upvalues: t_1 (ref), reactModule (ref), reactOtterModule (ref), t (ref), SlidePane (ref), slideTransitionContextModule (ref), view (ref)
	local nodeType = t_1[p1.nodeType] or false
	local var9, var10 = reactModule.useState(false)
	local var11, var12 = reactModule.useBinding(false)
	local var13 = reactModule.useRef({
		prevNodeId = nil,
		prevContent = nil,
		outgoing = nil,
		direction = "forward",
		needsAnimationStart = false,
		needsAnimationCancel = false,
		transitionId = 0,
		springId = 0
	})
	local var14, var15 = reactOtterModule.useAnimatedBinding(1, reactModule.useCallback(function() --[[ line: 120 ]]
		-- upvalues: var13 (ref), var10 (ref), var12 (ref)
		local current = var13.current
		
		if current.springId == current.transitionId then
			current.outgoing = nil
			var10(false)
			var12(false)
			
			return
		end
	end, {}))
	local current = var13.current
	
	if current.prevNodeId ~= nil and current.prevNodeId ~= p1.nodeId then
		local var16 = p1.direction ~= nil
		
		if (not nodeType or not true) and current.prevContent and var16 then
			current.outgoing = {
				nodeId = current.prevNodeId,
				content = current.prevContent
			}
			current.direction = p1.direction or "forward"
			current.needsAnimationStart = true
			current.needsAnimationCancel = false
			current.transitionId += 1
			current.springId = -1
		elseif not var16 then
			current.outgoing = nil
			current.needsAnimationStart = false
			current.transitionId += 1
			current.springId = -1
			
			if var9 then
				current.needsAnimationCancel = true
			end
		end
	end
	if not nodeType then
		current.prevNodeId = p1.nodeId
		current.prevContent = p1.nodeContent
	end
	reactModule.useLayoutEffect(function() --[[ line: 166 ]]
		-- upvalues: var13 (ref), var10 (ref), var12 (ref), t (copy), var15 (ref), reactOtterModule (copy)
		local current = var13.current
		
		if current.needsAnimationCancel then
			current.needsAnimationCancel = false
			var10(false)
			var12(false)
		end
		if current.needsAnimationStart then
			current.needsAnimationStart = false
			current.springId = current.transitionId
			var10(true)
			var12(true)
			local cloned = table.clone(t)
			cloned.startingValue = 0
			var15(reactOtterModule.spring(1, cloned))
		end
	end, { p1.nodeId })
	local t_2 = {}
	local var18 = current.outgoing ~= nil
	local needsAnimationStart = var18 and (current.needsAnimationStart or not var9)
	
	if current.outgoing then
		t_2[current.outgoing.nodeId] = reactModule.createElement(SlidePane, {
			withInputSink = true,
			content = current.outgoing.content,
			position = if needsAnimationStart then UDim2.new(0, 0, 0, 0) else var14:map(function(p2) --[[ line: 197 ]]
				-- upvalues: var13 (ref)
				return UDim2.new(p2 * (if var13.current.direction == "forward" then -1 else 1), 0, 0, 0)
			end)
		})
	end
	t_2[p1.nodeId] = reactModule.createElement(SlidePane, {
		withInputSink = false,
		content = p1.nodeContent,
		position = if needsAnimationStart then UDim2.new(if current.direction == "forward" then 1 else -1, 0, 0, 0) elseif var18 then var14:map(function(p3) --[[ line: 214 ]]
			-- upvalues: var13 (ref)
			return UDim2.new((1 - p3) * (if var13.current.direction == "forward" then 1 else -1), 0, 0, 0)
		end) else nil
	})
	
	return reactModule.createElement(slideTransitionContextModule.Provider, { value = var11 }, reactModule.createElement(view, { tag = "fill size-full-0", ClipsDescendants = true }, t_2))
end)