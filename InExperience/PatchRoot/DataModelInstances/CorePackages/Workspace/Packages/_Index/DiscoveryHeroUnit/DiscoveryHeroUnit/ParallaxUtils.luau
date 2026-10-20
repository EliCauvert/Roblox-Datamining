local ReactModule = require(script:FindFirstAncestor("DiscoveryHeroUnit").Parent.React)

local function _(p1: number, p2, p3, p4, p5)
	return (1 - p1) ^ 3 * p2 + 3 * (1 - p1) ^ 2 * p1 * p3 + 3 * (1 - p1) * p1 ^ 2 * p4 + p1 ^ 3 * p5
end

return {
	useNormalizedVerticalProgress = function(p1, p2)
		-- upvalues: ReactModule (copy)
		local UseBindingResult, UseBindingResult2 = ReactModule.useBinding(-1)
		ReactModule.useEffect(function()
			-- upvalues: p1 (copy), p2 (copy), UseBindingResult2 (copy)
			local Connections = {}
			
			if p1 and p1.current and p2.current then
				local Current = p2.current
				local Current1 = p1.current
				local Y = Current1.AbsolutePosition.Y
				local Y1 = Current1.AbsoluteWindowSize.Y
				
				local function _()
					-- upvalues: Current (copy), Current1 (copy), Y (ref)
					return Current.AbsolutePosition.Y + Current1.CanvasPosition.Y - Y
				end
				
				local YDelta = Current.AbsolutePosition.Y + Current1.CanvasPosition.Y - Y
				
				local function updateBinding()
					-- upvalues: Y1 (ref), YDelta (ref), Current1 (copy), UseBindingResult2 (upval)
					if Y1 ~= 0 then
						UseBindingResult2((YDelta - Current1.CanvasPosition.Y) / Y1)
						
						return
					end
				end
				
				local function updateWindowParams()
					-- upvalues: Y (ref), Current1 (copy), Y1 (ref), YDelta (ref), Current (copy), UseBindingResult2 (upval)
					Y = Current1.AbsolutePosition.Y
					Y1 = Current1.AbsoluteWindowSize.Y
					YDelta = Current.AbsolutePosition.Y + Current1.CanvasPosition.Y - Y
					
					if Y1 ~= 0 then
						UseBindingResult2((YDelta - Current1.CanvasPosition.Y) / Y1)
						
						return
					end
				end
				
				Y = Current1.AbsolutePosition.Y
				Y1 = Current1.AbsoluteWindowSize.Y
				YDelta = Current.AbsolutePosition.Y + Current1.CanvasPosition.Y - Y
				
				if Y1 ~= 0 then
					UseBindingResult2((YDelta - Current1.CanvasPosition.Y) / Y1)
				end
				Connections = {
					Current1:GetPropertyChangedSignal("AbsolutePosition"):Connect(updateWindowParams),
					Current1:GetPropertyChangedSignal("AbsoluteWindowSize"):Connect(updateWindowParams),
					Current1:GetPropertyChangedSignal("AbsoluteCanvasSize"):Connect(updateWindowParams),
					Current1:GetPropertyChangedSignal("CanvasPosition"):Connect(updateBinding)
				}
			end
			return function()
				-- upvalues: Connections (ref)
				for _, connection in Connections do
					connection:Disconnect()
				end
			end
		end, { p2, p1 })
		
		return UseBindingResult
	end,
	getYPositionOffsetForMotion = function(Value: number, p3, p4, p5)
		local ClampedValue = math.clamp(Value, -1, 1)
		
		if ClampedValue >= 0 then
			local NewClampedValue = (1 - ClampedValue) ^ 3 * 0 + 3 * (1 - ClampedValue) ^ 2 * ClampedValue * 0.3 + 3 * (1 - ClampedValue) * ClampedValue ^ 2 * 0.6 + ClampedValue ^ 3 * 1
			
			return p4 * NewClampedValue + p5 * (1 - NewClampedValue)
		else
			local Negated = -ClampedValue
			local NewNegated = (1 - Negated) ^ 3 * 0 + 3 * (1 - Negated) ^ 2 * Negated * 0.3 + 3 * (1 - Negated) * Negated ^ 2 * 0.6 + Negated ^ 3 * 1
			
			return p3 * NewNegated + p5 * (1 - NewNegated)
		end
	end,
	getNormalizedTopPosition = function(ScrollFrame, Frame)
		if Frame and ScrollFrame then
			local Y = ScrollFrame.AbsoluteWindowSize.Y
			local YDelta = Frame.AbsolutePosition.Y + ScrollFrame.CanvasPosition.Y - ScrollFrame.AbsolutePosition.Y - ScrollFrame.CanvasPosition.Y
			
			return if Y == 0 then nil else YDelta / Y
		else
			return nil
		end
	end
}