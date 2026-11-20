local Parent = script:FindFirstAncestor("RobloxAppHooks").Parent
local ReactModule = require(Parent.React)
local ReactOtterModule = require(Parent.ReactOtter)
local UserScrollInputModule = require(script.Parent.userScrollInput)
local FFlagFriendsDeepLinkScrollToCandidates = require(Parent.SharedFlags).FFlagFriendsDeepLinkScrollToCandidates
local config = { dampingRatio = 1, frequency = 3 }

local function _(Frame: Frame, Frame1: Frame, ScrollingDirection, p1, p2): number
	local NewX = if ScrollingDirection == Enum.ScrollingDirection.X then Frame.CanvasPosition.X + (Frame1.AbsolutePosition.X - Frame.AbsolutePosition.X) else Frame.CanvasPosition.Y + (Frame1.AbsolutePosition.Y - Frame.AbsolutePosition.Y)
	
	return if NewX < p2 then 0 else math.max(NewX - p1, 0)
end

return function(ScrollingDirection, p1, p2, p3)
	-- upvalues: config (copy), FFlagFriendsDeepLinkScrollToCandidates (copy), ReactModule (copy), ReactOtterModule (copy), UserScrollInputModule (copy)
	local P6 = p1 or 0
	local P7 = p2 or 0
	local Config = if p3 then p3 else config
	local UseRefResult = if FFlagFriendsDeepLinkScrollToCandidates then ReactModule.useRef(nil) else nil
	local UseResult = if FFlagFriendsDeepLinkScrollToCandidates then ReactModule.useCallback(function()
		-- upvalues: UseRefResult (copy)
		if UseRefResult.current then
			UseRefResult.current()
		end
	end, {}) else nil
	local UseAnimatedBindingResult, UseAnimatedBindingResult2 = ReactOtterModule.useAnimatedBinding(0, UseResult)
	
	if FFlagFriendsDeepLinkScrollToCandidates then
		ReactModule.useEffect(function()
			-- upvalues: UseResult (copy)
			return UseResult
		end, { UseResult })
	end
	return ReactModule.useMemo(function()
		-- upvalues: UseAnimatedBindingResult (copy), ScrollingDirection (copy)
		return UseAnimatedBindingResult:map(function(X): Vector2
			-- upvalues: ScrollingDirection (upval)
			return if ScrollingDirection == Enum.ScrollingDirection.X then Vector2.new(X, 0) else Vector2.new(0, X)
		end)
	end, { ScrollingDirection }), ReactModule.useCallback(function(Frame: Frame, p4, _, Frame1: Frame)
		-- upvalues: ScrollingDirection (copy), P6 (copy), P7 (copy), UseAnimatedBindingResult2 (copy), ReactOtterModule (upval), Config (copy)
		if p4 then return end
		if Frame1 and Frame1:IsDescendantOf(Frame) then
			local NewX = if ScrollingDirection == Enum.ScrollingDirection.X then Frame.CanvasPosition.X + (Frame1.AbsolutePosition.X - Frame.AbsolutePosition.X) else Frame.CanvasPosition.Y + (Frame1.AbsolutePosition.Y - Frame.AbsolutePosition.Y)
			UseAnimatedBindingResult2(ReactOtterModule.spring(if NewX < P7 then 0 else math.max(NewX - P6, 0), Config))
		end
	end, { P6, ScrollingDirection, P7, Config }), if FFlagFriendsDeepLinkScrollToCandidates then ReactModule.useCallback(function(ScrollFrame, Frame: Frame, p4)
		-- upvalues: ScrollingDirection (copy), P6 (copy), P7 (copy), UseResult (copy), UseAnimatedBindingResult (copy), UseAnimatedBindingResult2 (copy), ReactOtterModule (upval), Config (copy), UserScrollInputModule (upval), UseRefResult (copy)
		local function _(Vector)
			-- upvalues: ScrollingDirection (upval)
			return if ScrollingDirection == Enum.ScrollingDirection.X then Vector.X else Vector.Y
		end
		
		local NewX = if ScrollingDirection == Enum.ScrollingDirection.X then ScrollFrame.CanvasPosition.X + (Frame.AbsolutePosition.X - ScrollFrame.AbsolutePosition.X) else ScrollFrame.CanvasPosition.Y + (Frame.AbsolutePosition.Y - ScrollFrame.AbsolutePosition.Y)
		local Largest: number = if NewX < P7 then 0 else math.max(NewX - P6, 0)
		local AbsoluteCanvasSize = ScrollFrame.AbsoluteCanvasSize
		local AbsoluteWindowSize = ScrollFrame.AbsoluteWindowSize
		local ClampedValue = math.clamp(Largest, 0, (math.max((if ScrollingDirection == Enum.ScrollingDirection.X then AbsoluteCanvasSize.X else AbsoluteCanvasSize.Y) - (if ScrollingDirection == Enum.ScrollingDirection.X then AbsoluteWindowSize.X else AbsoluteWindowSize.Y), 0)))
		UseResult()
		local CanvasPosition = ScrollFrame.CanvasPosition
		
		if math.abs(UseAnimatedBindingResult:getValue() - (if ScrollingDirection == Enum.ScrollingDirection.X then CanvasPosition.X else CanvasPosition.Y)) > 1 then
			UseAnimatedBindingResult2(ReactOtterModule.instant(ClampedValue))
			
			return
		else
			UseAnimatedBindingResult2(ReactOtterModule.spring(ClampedValue, p4 or Config))
			
			local _ = function()
				-- upvalues: UseResult (upval), UseAnimatedBindingResult2 (upval), ReactOtterModule (upval), ScrollFrame (copy), ScrollingDirection (upval)
				UseResult()
				local CanvasPosition = ScrollFrame.CanvasPosition
				UseAnimatedBindingResult2(ReactOtterModule.instant(if ScrollingDirection == Enum.ScrollingDirection.X then CanvasPosition.X else CanvasPosition.Y))
			end
			
			local UserInputService = game:GetService("UserInputService")
			local Connections = {
				UserInputService.InputBegan:Connect(function(Input)
					-- upvalues: UserScrollInputModule (upval), UseResult (upval), UseAnimatedBindingResult2 (upval), ReactOtterModule (upval), ScrollFrame (copy), ScrollingDirection (upval)
					if UserScrollInputModule.isUserInput(Input) then
						UseResult()
						local CanvasPosition = ScrollFrame.CanvasPosition
						UseAnimatedBindingResult2(ReactOtterModule.instant(if ScrollingDirection == Enum.ScrollingDirection.X then CanvasPosition.X else CanvasPosition.Y))
					end
				end),
				UserInputService.InputChanged:Connect(function(Input)
					-- upvalues: UserScrollInputModule (upval), UseResult (upval), UseAnimatedBindingResult2 (upval), ReactOtterModule (upval), ScrollFrame (copy), ScrollingDirection (upval)
					if UserScrollInputModule.isUserScroll(Input) then
						UseResult()
						local CanvasPosition = ScrollFrame.CanvasPosition
						UseAnimatedBindingResult2(ReactOtterModule.instant(if ScrollingDirection == Enum.ScrollingDirection.X then CanvasPosition.X else CanvasPosition.Y))
					end
				end)
			}
			
			function UseRefResult.current()
				-- upvalues: UseRefResult (upval), Connections (copy)
				UseRefResult.current = nil
				
				for _, connection in Connections do
					connection:Disconnect()
				end
			end
		end
	end, {
		P6, ScrollingDirection, P7, Config, UseAnimatedBindingResult, UseResult
	}) else nil
end