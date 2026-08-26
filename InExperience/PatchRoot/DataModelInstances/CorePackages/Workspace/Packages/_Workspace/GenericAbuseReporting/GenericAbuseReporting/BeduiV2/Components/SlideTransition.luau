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

local function SlidePane(p1)
	-- upvalues: reactModule (ref), view (ref)
	return reactModule.createElement(view, {
		tag = "size-full",
		Position = p1.position,
		testId = if p1.withInputSink then "SlideTransitionOutgoing" else "SlideTransitionIncoming"
	}, {
		Content = reactModule.createElement(view, { tag = "col size-full" }, { Page = p1.content }),
		InputSink = if p1.withInputSink then reactModule.createElement("TextButton", {
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

return reactModule.memo(function(p1)
	-- upvalues: t_1 (ref), reactModule (ref), reactOtterModule (ref), t (ref), SlidePane (ref), slideTransitionContextModule (ref), view (ref)
	local nodeType = t_1[p1.nodeType] or false
	local var1, var2 = reactModule.useState(false)
	local var3, var4 = reactModule.useBinding(false)
	local var5 = reactModule.useRef({
		prevNodeId = nil,
		prevContent = nil,
		outgoing = nil,
		direction = "forward",
		needsAnimationStart = false,
		needsAnimationCancel = false,
		transitionId = 0,
		springId = 0
	})
	local var6, var7 = reactOtterModule.useAnimatedBinding(1, reactModule.useCallback(function()
		-- upvalues: var5 (ref), var2 (ref), var4 (ref)
		local current = var5.current
		
		if current.springId == current.transitionId then
			current.outgoing = nil
			var2(false)
			var4(false)
			
			return
		end
	end, {}))
	local current = var5.current
	
	if current.prevNodeId ~= nil and current.prevNodeId ~= p1.nodeId then
		local var8 = p1.direction ~= nil
		
		if not nodeType and current.prevContent and var8 then
			current.outgoing = {
				nodeId = current.prevNodeId,
				content = current.prevContent
			}
			current.direction = p1.direction or "forward"
			current.needsAnimationStart = true
			current.needsAnimationCancel = false
			current.transitionId += 1
			current.springId = -1
		elseif not var8 then
			current.outgoing = nil
			current.needsAnimationStart = false
			current.transitionId += 1
			current.springId = -1
			
			if var1 then
				current.needsAnimationCancel = true
			end
		end
	end
	if not nodeType then
		current.prevNodeId = p1.nodeId
		current.prevContent = p1.nodeContent
	end
	reactModule.useLayoutEffect(function()
		-- upvalues: var5 (ref), var2 (ref), var4 (ref), t (copy), var7 (ref), reactOtterModule (copy)
		local current = var5.current
		
		if current.needsAnimationCancel then
			current.needsAnimationCancel = false
			var2(false)
			var4(false)
		end
		if current.needsAnimationStart then
			current.needsAnimationStart = false
			current.springId = current.transitionId
			var2(true)
			var4(true)
			local cloned = table.clone(t)
			cloned.startingValue = 0
			var7(reactOtterModule.spring(1, cloned))
		end
	end, { p1.nodeId })
	local t_2 = {}
	local var9 = current.outgoing ~= nil
	local needsAnimationStart = var9 and (current.needsAnimationStart or not var1)
	
	if current.outgoing then
		t_2[current.outgoing.nodeId] = reactModule.createElement(SlidePane, {
			withInputSink = true,
			content = current.outgoing.content,
			position = if needsAnimationStart then UDim2.new(0, 0, 0, 0) else var6:map(function(p2)
				-- upvalues: var5 (ref)
				return UDim2.new(p2 * (if var5.current.direction == "forward" then -1 else 1), 0, 0, 0)
			end)
		})
	end
	t_2[p1.nodeId] = reactModule.createElement(SlidePane, {
		withInputSink = false,
		content = p1.nodeContent,
		position = if needsAnimationStart then UDim2.new(if current.direction == "forward" then 1 else -1, 0, 0, 0) elseif var9 then var6:map(function(p2)
			-- upvalues: var5 (ref)
			return UDim2.new((1 - p2) * (if var5.current.direction == "forward" then 1 else -1), 0, 0, 0)
		end) else nil
	})
	
	return reactModule.createElement(slideTransitionContextModule.Provider, { value = var3 }, reactModule.createElement(view, { tag = "fill size-full-0", ClipsDescendants = true }, t_2))
end)