local Parent = script.Parent.Parent
local Parent1 = Parent.Parent
local UserInputService = game:GetService("UserInputService")
local ReactModule = require(Parent1.React)
local ReactOtterModule = require(Parent1.ReactOtter)
local FeedContextModule = require(Parent.App.FeedContext)
local UseAnimatedBindingFunction = ReactOtterModule.useAnimatedBinding
local UseCallbackFunction = ReactModule.useCallback
local UseEffectFunction = ReactModule.useEffect
local UseEventConnectionFunction = require(Parent1.ReactUtils).useEventConnection
local UseGuiInsetFunction = require(Parent1.CapturesCommon).Hooks.useGuiInset
local UseRefFunction = ReactModule.useRef
local UseScreenSizeFunction = require(Parent1.RobloxAppHooks).useScreenSize
local UseStateFunction = ReactModule.useState

return function(p1, YOffset, p2, p3)
	-- upvalues: ReactModule (copy), FeedContextModule (copy), UseGuiInsetFunction (copy), UseScreenSizeFunction (copy), UseRefFunction (copy), UseStateFunction (copy), UseAnimatedBindingFunction (copy), UseEffectFunction (copy), ReactOtterModule (copy), UseCallbackFunction (copy), UseEventConnectionFunction (copy), UserInputService (copy)
	local UseContextResult = ReactModule.useContext(FeedContextModule)
	local UseGuiInsetResult = UseGuiInsetFunction()
	local UseScreenSizeResult = UseScreenSizeFunction()
	local IsZooming = UseContextResult.isZooming
	local SetIsZoomingFunction = UseContextResult.setIsZooming
	local UseRefResult = UseRefFunction(nil)
	local UseRefResult1 = UseRefFunction(nil)
	local UseRefResult2 = UseRefFunction(1)
	local UseRefResult3 = UseRefFunction(false)
	local UseRefResult4 = UseRefFunction(Vector2.new(0, 0))
	local UseStateResult, UseStateResult2 = UseStateFunction(false)
	local UseAnimatedBindingResult, UseAnimatedBindingResult2 = UseAnimatedBindingFunction(0)
	local UseAnimatedBindingResult1, UseAnimatedBindingResult2_1 = UseAnimatedBindingFunction(0)
	UseEffectFunction(function()
		-- upvalues: UseStateResult (copy), UseRefResult (copy)
		if not UseStateResult then
			UseRefResult.current = nil
		end
	end, { UseStateResult })
	UseEffectFunction(function()
		-- upvalues: p1 (copy), p3 (copy), IsZooming (copy), UseAnimatedBindingResult2 (copy), ReactOtterModule (upval)
		if not p1 or p3 then return end
		if IsZooming then
			UseAnimatedBindingResult2(ReactOtterModule.spring(1, { frequency = 4, dampingRatio = 1 }))
			
			return
		else
			UseAnimatedBindingResult2(ReactOtterModule.spring(0, { frequency = 4, dampingRatio = 1 }))
		end
	end, { p1, IsZooming, UseAnimatedBindingResult2 })
	local UseCallbackResult = UseCallbackFunction(function()
		-- upvalues: p1 (copy), UseStateResult2 (copy), UseAnimatedBindingResult2_1 (copy), ReactOtterModule (upval)
		if p1 then
			UseStateResult2(true)
			UseAnimatedBindingResult2_1(ReactOtterModule.instant(0))
			task.delay(0.1, function()
				-- upvalues: ReactOtterModule (upval), UseAnimatedBindingResult2_1 (upval)
				UseAnimatedBindingResult2_1((ReactOtterModule.spring(1, { dampingRatio = 1, frequency = 4 })))
			end)
			task.delay(0.2, function()
				-- upvalues: UseStateResult2 (upval)
				UseStateResult2(false)
			end)
			
			return
		end
	end, { p1 })
	UseEffectFunction(function()
		-- upvalues: p1 (copy), UseRefResult1 (copy), YOffset (copy)
		if not p1 and UseRefResult1.current then
			UseRefResult1.current.Size = UDim2.new(1, 0, 0, YOffset)
			UseRefResult1.current.Position = UDim2.fromScale(0.5, 0.5)
		end
	end, { p1 })
	UseEventConnectionFunction(UserInputService.TouchPinch, function(Entry, p4: number, _, UserInputState, _)
		-- upvalues: UseRefResult3 (copy), UseRefResult (copy), UseCallbackResult (copy), SetIsZoomingFunction (copy), p1 (copy), p3 (copy), UseStateResult (copy), UseRefResult1 (copy), UseGuiInsetResult (copy), p2 (copy), YOffset (copy), UseRefResult2 (copy), UseRefResult4 (copy), UseScreenSizeResult (copy)
		if UserInputState ~= Enum.UserInputState.End then
			if not p1 or p3 or UseStateResult then return end
			if not UseRefResult1.current then return end
			if UserInputState == Enum.UserInputState.Begin then
				UseRefResult3.current = false
				local XRatio = (Entry[1].X + Entry[2].X) / 2
				local NewTop = UseGuiInsetResult.top + (Entry[1].Y + Entry[2].Y) / 2
				local ContentFeedItem = UseRefResult1.current:FindFirstChild("ContentFeedItem")
				
				if not ContentFeedItem then return end
				local AbsolutePosition = ContentFeedItem.AbsolutePosition
				
				if XRatio < AbsolutePosition.X or AbsolutePosition.X + p2 < XRatio then return end
				if NewTop < UseGuiInsetResult.top + AbsolutePosition.Y or UseGuiInsetResult.top + AbsolutePosition.Y + YOffset < NewTop then return end
				UseRefResult.current = Vector2.new(XRatio, NewTop)
				SetIsZoomingFunction(true)
			end
			if not UseRefResult.current then return end
			if UseRefResult3.current then return end
			if #Entry < 2 then
				UseRefResult3.current = true
				UseCallbackResult()
				SetIsZoomingFunction(false)
				
				return
			else
				local Largest = math.max(1, p4)
				UseRefResult2.current = Largest
				local XRatio = ((Entry[1].X + Entry[2].X) / 2 - UseRefResult.current.X) / Largest
				local YRatio = ((Entry[1].Y + Entry[2].Y) / 2 - UseRefResult.current.Y) / Largest
				UseRefResult4.current = Vector2.new(XRatio, YRatio)
				UseRefResult1.current.Size = UDim2.new(Largest, 0, 0, Largest * YOffset)
				UseRefResult1.current.Position = UDim2.new(0.5, (0.5 - (UseRefResult.current.X - XRatio) / UseScreenSizeResult.X) * UseScreenSizeResult.X * (Largest - 1), 0.5, (0.5 - (UseRefResult.current.Y - YRatio) / UseScreenSizeResult.Y) * UseScreenSizeResult.Y * (Largest - 1))
				
				return
			end
		elseif not UseRefResult3.current and UseRefResult.current then
			UseCallbackResult()
			SetIsZoomingFunction(false)
			
			return
		else
		end
	end)
	
	return {
		initialZoomFocusPosition = UseRefResult,
		itemContainerRef = UseRefResult1,
		itemFinalScale = UseRefResult2,
		nonItemTransparency = UseAnimatedBindingResult,
		zoomAverageDelta = UseRefResult4,
		zoomEndTransition = UseAnimatedBindingResult1,
		zoomEndTransitionActive = UseStateResult
	}
end