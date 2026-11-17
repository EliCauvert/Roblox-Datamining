local Parent = script.Parent.Parent
local ReactModule = require(Parent.Parent.React)
local GeometryModule = require(Parent.Geometry)
local _ = require(Parent.Types)
local _UDim2 = UDim2.fromScale(0.5, 0.5)

return function(p1)
	-- upvalues: ReactModule (copy), GeometryModule (copy), _UDim2 (copy)
	local UseRefResult = ReactModule.useRef(nil)
	local UseRefResult1 = ReactModule.useRef(nil)
	local UseRefResult2 = ReactModule.useRef(nil)
	local UseRefResult3 = ReactModule.useRef(Vector2.zero)
	local UseRefResult4 = ReactModule.useRef(Vector2.zero)
	local UseRefResult5 = ReactModule.useRef(false)
	local UseStateResult, UseStateResult2 = ReactModule.useState(false)
	local UseBindingResult, UseBindingResult2 = ReactModule.useBinding(Vector2.zero)
	local UseResult = ReactModule.useCallback(function(Current)
		-- upvalues: UseRefResult (copy), UseRefResult1 (copy), UseRefResult2 (copy), UseBindingResult2 (copy), GeometryModule (upval)
		UseRefResult2.current = Current
		UseBindingResult2(GeometryModule.clampCenter(Current, UseRefResult.current.AbsoluteSize, UseRefResult1.current.AbsoluteSize))
	end, { UseBindingResult2 })
	local UseResult1 = ReactModule.useCallback(function(_, p2)
		-- upvalues: UseRefResult3 (copy), p1 (copy), UseRefResult5 (copy), UseResult (copy), UseRefResult4 (copy)
		local Offset = p2 - UseRefResult3.current
		
		if (p1.dragThreshold or 25) < Offset.Magnitude then
			UseRefResult5.current = true
		end
		UseResult(UseRefResult4.current + Offset)
	end, { UseResult, p1.dragThreshold })
	
	return {
		boundsRef = UseRefResult,
		initialized = UseStateResult,
		onDragContinue = UseResult1,
		onDragEnd = ReactModule.useCallback(function(p2, p3)
			-- upvalues: UseResult1 (copy), UseRefResult5 (copy), p1 (copy)
			UseResult1(p2, p3)
			
			if not UseRefResult5.current and p1.onActivated ~= nil then
				p1.onActivated()
			end
		end, { UseResult1, p1.onActivated }),
		onDragStart = ReactModule.useCallback(function(_, Current)
			-- upvalues: UseRefResult5 (copy), UseRefResult3 (copy), UseRefResult4 (copy), UseBindingResult (copy)
			UseRefResult5.current = false
			UseRefResult3.current = Current
			UseRefResult4.current = UseBindingResult:getValue()
		end, { UseBindingResult }),
		position = UseBindingResult:map(function(Vector): UDim2
			return UDim2.fromOffset(Vector.X, Vector.Y)
		end),
		refit = ReactModule.useCallback(function()
			-- upvalues: UseRefResult (copy), UseRefResult1 (copy), GeometryModule (upval), UseResult (copy), UseRefResult2 (copy), p1 (copy), _UDim2 (upval), UseStateResult2 (copy)
			local AbsoluteSize = UseRefResult.current.AbsoluteSize
			local AbsoluteSize1 = UseRefResult1.current.AbsoluteSize
			
			if GeometryModule.hasPositiveSize(AbsoluteSize) and GeometryModule.hasPositiveSize(AbsoluteSize1) then
				UseResult(UseRefResult2.current or GeometryModule.resolveCenter(p1.initialCenter or _UDim2, AbsoluteSize))
				UseStateResult2(true)
				
				return
			end
		end, { UseResult, p1.initialCenter }),
		windowRef = UseRefResult1
	}
end