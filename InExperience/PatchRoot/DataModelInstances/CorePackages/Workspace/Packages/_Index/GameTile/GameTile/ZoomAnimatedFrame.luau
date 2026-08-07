local parent = script:FindFirstAncestor("GameTile").Parent
local reactModule = require(parent.React)
local otterModule = require(parent.Otter)

function ZoomAnimatedFrame(p0) --[[ line: 16 ]]
	-- upvalues: reactModule (ref), otterModule (ref)
	local isZoomEnabled = p0.isZoomEnabled
	local var2 = reactModule.useRef(nil)
	
	if var2.current == nil then
		var2.current = otterModule.createSingleMotor(0)
	end
	assert(var2.current, "zoomMotorRef should always exist; assert only needed for the linter")
	local var3, var4 = reactModule.useBinding(0)
	reactModule.useEffect(function() --[[ line: 28 ]]
		-- upvalues: var2 (ref), var4 (ref)
		var2.current:onStep(var4)
	end, {})
	reactModule.useEffect(function() --[[ line: 33 ]]
		-- upvalues: var2 (ref), otterModule (copy), isZoomEnabled (ref), p0 (ref)
		var2.current:setGoal(otterModule.spring(if isZoomEnabled then 1 else 0, { frequency = if p0.reducedMotion then 200 else 6.5 }))
	end, { isZoomEnabled })
	
	return reactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		Position = var3:map(function(p1) --[[ line: 41 ]]
			-- upvalues: p0 (ref)
			local var5 = if p1 > 0.9 then 1 else p1
			
			return UDim2.fromOffset(-p0.expansionOffsetX * var5 / 2, -p0.expansionOffsetTop * var5)
		end),
		Size = var3:map(function(p2) --[[ line: 48 ]]
			-- upvalues: p0 (ref)
			local var6 = if p2 > 0.9 then 1 else p2
			
			return UDim2.new(1, p0.expansionOffsetX * var6, 1, p0.expansionOffsetTop * var6 + p0.expansionOffsetBottom * var6)
		end)
	}, p0.children)
end

return ZoomAnimatedFrame