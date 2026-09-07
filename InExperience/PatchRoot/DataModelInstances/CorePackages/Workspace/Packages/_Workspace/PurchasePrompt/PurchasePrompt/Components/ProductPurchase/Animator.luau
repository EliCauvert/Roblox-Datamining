local parent = script:FindFirstAncestor("PurchasePrompt").Parent
local purchasePromptDepsModule = require(parent.PurchasePromptDeps)
local roact = purchasePromptDepsModule.Roact
local otter = purchasePromptDepsModule.Otter
local t = purchasePromptDepsModule.t
local fFlagEnableUnifiedProductPurchaseFlow = require(parent.SharedFlags).FFlagEnableUnifiedProductPurchaseFlow
local name = roact.Component:extend(script.Name)
local t_1 = { dampingRatio = 1, frequency = 1.6 }
name.validateProps = t.interface({
	shouldShow = t.boolean,
	skipAnimation = t.optional(t.boolean),
	onShown = t.optional(t.callback),
	onHidden = t.optional(t.callback)
})

function name.init(p1)
	-- upvalues: roact (ref), otter (ref), fFlagEnableUnifiedProductPurchaseFlow (ref), t_1 (ref)
	local var1, var2 = roact.createBinding(1)
	p1.motor = otter.createSingleMotor(1)
	p1.motor:start()
	p1.motor:onStep(var2)
	p1.animationProgress = var1
	p1.setProgress = var2
	
	function p0.onComplete()
		-- upvalues: p1 (ref)
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
	local var3 = if p1.props.shouldShow then 0 else 1
	
	if fFlagEnableUnifiedProductPurchaseFlow and p1.props.skipAnimation then
		p1.motor:stop()
		var2(var3)
		task.defer(function()
			-- upvalues: p1 (ref)
			p1.onComplete()
		end)
		
		return
	end
	p1.motor:setGoal(otter.spring(var3, t_1))
end

function name.didUpdate(p1, p2, _)
	-- upvalues: fFlagEnableUnifiedProductPurchaseFlow (ref), otter (ref), t_1 (ref)
	if p2.shouldShow ~= p1.props.shouldShow or fFlagEnableUnifiedProductPurchaseFlow and p2.skipAnimation ~= p1.props.skipAnimation then
		local var1 = if p1.props.shouldShow then 0 else 1
		
		if fFlagEnableUnifiedProductPurchaseFlow and p1.props.skipAnimation then
			p1.motor:stop()
			p1.setProgress(var1)
			task.defer(function()
				-- upvalues: p1 (ref)
				p1.onComplete()
			end)
			
			return
		end
		p1.motor:setGoal(otter.spring(var1, t_1))
	end
end

function name.render(p1)
	-- upvalues: roact (ref)
	return roact.createElement("Frame", {
		BorderSizePixel = 0,
		BackgroundTransparency = 1,
		Size = UDim2.new(1, 0, 1, 0),
		Position = p1.animationProgress:map(function(p2)
			return UDim2.new(0, 0, -1 * p2, 0)
		end)
	}, p1.props[roact.Children])
end

return name