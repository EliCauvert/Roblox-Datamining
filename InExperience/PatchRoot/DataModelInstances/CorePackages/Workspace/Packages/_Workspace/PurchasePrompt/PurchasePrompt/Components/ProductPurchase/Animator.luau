local PurchasePromptDepsModule = require(script:FindFirstAncestor("PurchasePrompt").Parent.PurchasePromptDeps)
local Roact = PurchasePromptDepsModule.Roact
local Otter = PurchasePromptDepsModule.Otter
local T = PurchasePromptDepsModule.t
local ExtendResult = Roact.Component:extend(script.Name)
local config = { dampingRatio = 1, frequency = 1.6 }
ExtendResult.validateProps = T.interface({
	shouldShow = T.boolean,
	skipAnimation = T.optional(T.boolean),
	onShown = T.optional(T.callback),
	onHidden = T.optional(T.callback)
})

function ExtendResult.init(p1)
	-- upvalues: Roact (copy), Otter (copy), config (copy)
	local Binding, Binding2 = Roact.createBinding(1)
	p1.motor = Otter.createSingleMotor(1)
	p1.motor:start()
	p1.motor:onStep(Binding2)
	p1.animationProgress = Binding
	p1.setProgress = Binding2
	
	function p1.onComplete()
		-- upvalues: p1 (copy)
		if p1.props.shouldShow then
			if p1.props.onShown then
				p1.props.onShown()
				
				return
			end
		elseif p1.props.onHidden then
			p1.props.onHidden()
		end
	end
	
	p1.motor:onComplete(p1.onComplete)
	local v1: number = if p1.props.shouldShow then 0 else 1
	
	if p1.props.skipAnimation then
		p1.motor:stop()
		Binding2(v1)
		task.defer(function()
			-- upvalues: p1 (copy)
			p1.onComplete()
		end)
		
		return
	else
		p1.motor:setGoal(Otter.spring(v1, config))
	end
end

function ExtendResult.didUpdate(p1, p2, _)
	-- upvalues: Otter (copy), config (copy)
	if p2.shouldShow ~= p1.props.shouldShow or p2.skipAnimation ~= p1.props.skipAnimation then
		local v1: number = if p1.props.shouldShow then 0 else 1
		
		if p1.props.skipAnimation then
			p1.motor:stop()
			p1.setProgress(v1)
			task.defer(function()
				-- upvalues: p1 (copy)
				p1.onComplete()
			end)
			
			return
		else
			p1.motor:setGoal(Otter.spring(v1, config))
		end
	end
end

function ExtendResult.render(p1)
	-- upvalues: Roact (copy)
	return Roact.createElement("Frame", {
		BorderSizePixel = 0,
		BackgroundTransparency = 1,
		Size = UDim2.new(1, 0, 1, 0),
		Position = p1.animationProgress:map(function(p2: number): UDim2
			return UDim2.new(0, 0, -1 * p2, 0)
		end)
	}, p1.props[Roact.Children])
end

return ExtendResult