local parent = script:FindFirstAncestor("GameTile").Parent
local reactModule = require(parent.React)
local otterModule = require(parent.Otter)

function ZoomAnimatedFrame(p1)
	-- upvalues: reactModule (ref), otterModule (ref)
	local isZoomEnabled = p1.isZoomEnabled
	local var1 = reactModule.useRef(nil)
	
	if var1.current == nil then
		var1.current = otterModule.createSingleMotor(0)
	end
	assert(var1.current, "zoomMotorRef should always exist; assert only needed for the linter")
	local var2, var3 = reactModule.useBinding(0)
	reactModule.useEffect(function()
		-- upvalues: var1 (ref), var3 (ref)
		var1.current:onStep(var3)
	end, {})
	reactModule.useEffect(function()
		-- upvalues: var1 (ref), otterModule (copy), isZoomEnabled (ref), p1 (ref)
		var1.current:setGoal(otterModule.spring(if isZoomEnabled then 1 else 0, { frequency = if p1.reducedMotion then 200 else 6.5 }))
	end, { isZoomEnabled })
	
	return reactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		Position = var2:map(function(p2)
			-- upvalues: p1 (ref)
			local var4 = if p2 > 0.9 then 1 else p2
			
			return UDim2.fromOffset(-p1.expansionOffsetX * var4 / 2, -p1.expansionOffsetTop * var4)
		end),
		Size = var2:map(function(p2)
			-- upvalues: p1 (ref)
			local var4 = if p2 > 0.9 then 1 else p2
			
			return UDim2.new(1, p1.expansionOffsetX * var4, 1, p1.expansionOffsetTop * var4 + p1.expansionOffsetBottom * var4)
		end)
	}, p1.children)
end

return ZoomAnimatedFrame