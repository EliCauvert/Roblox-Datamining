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

function name.init(p0) --[[ line: 26 ]]
	-- upvalues: roact (ref), otter (ref), fFlagEnableUnifiedProductPurchaseFlow (ref), t_1 (ref)
	local var3, var4 = roact.createBinding(1)
	p0.motor = otter.createSingleMotor(1)
	p0.motor:start()
	p0.motor:onStep(var4)
	p0.animationProgress = var3
	p0.setProgress = var4
	
	function p0.onComplete() --[[ line: 36 ]]
		-- upvalues: p0 (ref)
		if p0.props.shouldShow then
			if p0.props.onShown then
				p0.props.onShown()
				
				return
			end
		elseif p0.props.onHidden then
			p0.props.onHidden()
		end
	end
	
	p0.motor:onComplete(p0.onComplete)
	local var5 = if p0.props.shouldShow then 0 else 1
	
	if fFlagEnableUnifiedProductPurchaseFlow and p0.props.skipAnimation then
		p0.motor:stop()
		var4(var5)
		task.defer(function() --[[ line: 54 ]]
			-- upvalues: p0 (ref)
			p0.onComplete()
		end)
		
		return
	end
	p0.motor:setGoal(otter.spring(var5, t_1))
end

function name.didUpdate(p1, p2, _) --[[ line: 62 ]]
	-- upvalues: fFlagEnableUnifiedProductPurchaseFlow (ref), otter (ref), t_1 (ref)
	if p2.shouldShow ~= p1.props.shouldShow or fFlagEnableUnifiedProductPurchaseFlow and p2.skipAnimation ~= p1.props.skipAnimation then
		local var6 = if p1.props.shouldShow then 0 else 1
		
		if fFlagEnableUnifiedProductPurchaseFlow and p1.props.skipAnimation then
			p1.motor:stop()
			p1.setProgress(var6)
			task.defer(function() --[[ line: 72 ]]
				-- upvalues: p1 (ref)
				p1.onComplete()
			end)
			
			return
		end
		p1.motor:setGoal(otter.spring(var6, t_1))
	end
end

function name.render(p3) --[[ line: 81 ]]
	-- upvalues: roact (ref)
	return roact.createElement("Frame", {
		BorderSizePixel = 0,
		BackgroundTransparency = 1,
		Size = UDim2.new(1, 0, 1, 0),
		Position = p3.animationProgress:map(function(p4) --[[ line: 86 ]]
			return UDim2.new(0, 0, -1 * p4, 0)
		end)
	}, p3.props[roact.Children])
end

return name