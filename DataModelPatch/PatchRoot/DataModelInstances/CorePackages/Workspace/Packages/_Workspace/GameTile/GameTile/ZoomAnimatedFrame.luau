local Parent = script:FindFirstAncestor("GameTile").Parent
local ReactModule = require(Parent.React)
local OtterModule = require(Parent.Otter)

function ZoomAnimatedFrame(p1)
	-- upvalues: ReactModule (copy), OtterModule (copy)
	local IsZoomEnabled = p1.isZoomEnabled
	local UseRefResult = ReactModule.useRef(nil)
	
	if UseRefResult.current == nil then
		UseRefResult.current = OtterModule.createSingleMotor(0)
	end
	assert(UseRefResult.current, "zoomMotorRef should always exist; assert only needed for the linter")
	local UseBindingResult, UseBindingResult2 = ReactModule.useBinding(0)
	ReactModule.useEffect(function()
		-- upvalues: UseRefResult (copy), UseBindingResult2 (copy)
		UseRefResult.current:onStep(UseBindingResult2)
	end, {})
	ReactModule.useEffect(function()
		-- upvalues: UseRefResult (copy), OtterModule (upval), IsZoomEnabled (copy), p1 (copy)
		UseRefResult.current:setGoal(OtterModule.spring(if IsZoomEnabled then 1 else 0, { frequency = if p1.reducedMotion then 200 else 6.5 }))
	end, { IsZoomEnabled })
	
	return ReactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		Position = UseBindingResult:map(function(p2: number): UDim2
			-- upvalues: p1 (copy)
			local v1 = if p2 > 0.9 then 1 else p2
			
			return UDim2.fromOffset(-p1.expansionOffsetX * v1 / 2, -p1.expansionOffsetTop * v1)
		end),
		Size = UseBindingResult:map(function(p2: number): UDim2
			-- upvalues: p1 (copy)
			local v1 = if p2 > 0.9 then 1 else p2
			
			return UDim2.new(1, p1.expansionOffsetX * v1, 1, p1.expansionOffsetTop * v1 + p1.expansionOffsetBottom * v1)
		end)
	}, p1.children)
end

return ZoomAnimatedFrame