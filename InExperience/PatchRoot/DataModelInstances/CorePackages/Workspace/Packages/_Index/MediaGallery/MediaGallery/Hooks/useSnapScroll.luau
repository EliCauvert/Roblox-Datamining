local MediaGallery = script:FindFirstAncestor("MediaGallery")
local Parent = MediaGallery.Parent
local OtterModule = require(Parent.Otter)
local ReactModule = require(Parent.React)
local _ = require(Parent.ReactOtter)
local Signal = require(Parent.AppCommonLib).Signal
local _ = require(MediaGallery.MediaGalleryTypes)

return function(p1)
	-- upvalues: ReactModule (copy), Signal (copy), OtterModule (copy)
	local UseStateResult, UseStateResult2 = ReactModule.useState(p1.targetIndex or 1)
	local UseRefResult = ReactModule.useRef(UseStateResult)
	UseRefResult.current = UseStateResult
	local UseBindingResult, UseBindingResult2 = ReactModule.useBinding(Vector2.new(0, 0))
	local UseRefResult1 = ReactModule.useRef(nil)
	local UseRefResult2 = ReactModule.useRef(false)
	local UseRefResult3 = ReactModule.useRef(nil)
	local UseResult = ReactModule.useCallback(function(p2): Vector2
		-- upvalues: UseBindingResult (copy), p1 (copy)
		return if p2 == 1 then Vector2.new(0, 0) else Vector2.new(UseBindingResult:getValue().X + p1.itemPadding, 0)
	end, { p1.itemPadding })
	local UseBindingResult1, UseBindingResult2_1 = ReactModule.useBinding(UseResult(UseStateResult))
	ReactModule.useEffect(function()
		-- upvalues: UseBindingResult (copy), UseBindingResult2_1 (copy), UseResult (copy), UseStateResult (copy)
		if UseBindingResult:getValue().X > 0 then
			UseBindingResult2_1(UseResult(UseStateResult))
		end
	end, { UseResult, UseStateResult })
	local UseRefResult4 = ReactModule.useRef(Signal.new())
	local UseResult1 = ReactModule.useCallback(function(p2, p3)
		-- upvalues: UseRefResult2 (copy), UseBindingResult1 (copy), UseBindingResult (copy), p1 (copy), UseRefResult (copy), UseRefResult4 (copy), UseRefResult3 (copy), OtterModule (upval), UseBindingResult2_1 (copy), UseStateResult2 (copy)
		if UseRefResult2.current then return end
		local Value = UseBindingResult1:getValue()
		local NewX = UseBindingResult:getValue().X + p1.itemPadding
		local Current: number = UseRefResult.current
		local NewCurrent = nil
		local NewValue = nil
		
		if p2 == "Right" then
			NewCurrent = Current + 1
			NewValue = Value + Vector2.new(NewX, 0)
		else
			NewCurrent = Current - 1
			NewValue = Value - Vector2.new(NewX, 0)
		end
		if NewCurrent < 1 or p1.itemCount < NewCurrent then return end
		UseRefResult2.current = true
		UseRefResult4.current:fire(NewCurrent)
		
		if UseRefResult3.current then
			UseRefResult3.current:destroy()
		end
		local SingleMotor = OtterModule.createSingleMotor(0)
		UseRefResult3.current = SingleMotor
		SingleMotor:onStep(function(Alpha)
			-- upvalues: UseBindingResult2_1 (upval), Value (copy), NewValue (ref)
			UseBindingResult2_1(Value:Lerp(NewValue, Alpha))
		end)
		SingleMotor:onComplete(function()
			-- upvalues: UseRefResult2 (upval), UseRefResult3 (upval), UseRefResult (upval), NewCurrent (ref), UseStateResult2 (upval), p1 (upval), p3 (copy)
			UseRefResult2.current = false
			UseRefResult3.current = nil
			UseRefResult.current = NewCurrent
			UseStateResult2(NewCurrent)
			
			if p1.onScrollComplete then
				p1.onScrollComplete(NewCurrent, p3)
			end
		end)
		
		if p1.springConfig then
			SingleMotor:setGoal(OtterModule.spring(1, p1.springConfig))
		else
			SingleMotor:setGoal(OtterModule.instant(1))
		end
	end, {
		p1.itemCount,
		p1.itemPadding,
		p1.springConfig,
		p1.onScrollComplete,
		UseBindingResult1
	})
	local UseResult2 = ReactModule.useCallback(function(Frame)
		-- upvalues: UseBindingResult2 (copy), UseRefResult2 (copy), UseBindingResult2_1 (copy), UseResult (copy), UseRefResult (copy)
		UseBindingResult2(Frame.AbsoluteSize)
		
		if not UseRefResult2.current then
			UseBindingResult2_1(UseResult(UseRefResult.current))
		end
	end, { UseResult })
	ReactModule.useEffect(function()
		-- upvalues: UseStateResult2 (copy), p1 (copy)
		UseStateResult2(p1.targetIndex or 1)
	end, { p1.targetIndex })
	ReactModule.useEffect(function()
		-- upvalues: UseRefResult3 (copy)
		return function()
			-- upvalues: UseRefResult3 (upval)
			if UseRefResult3.current then
				UseRefResult3.current:destroy()
				UseRefResult3.current = nil
			end
		end
	end, {})
	
	return {
		currentIndex = UseStateResult,
		canvasPosition = UseBindingResult1,
		scrolledSignal = UseRefResult4.current,
		scrollingFrameRef = UseRefResult1,
		absoluteSizeBinding = UseBindingResult,
		scrollInDirection = UseResult1,
		onAbsoluteSizeChanged = UseResult2
	}
end