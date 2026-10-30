local Parent = script:FindFirstAncestor("AppChat").Parent
local ReactModule = require(Parent.React)
local _ = require(Parent.ViewRecycler)

local function _(p1, p2: number)
	if p1 == nil or p2 == nil then return end
	local DistanceFromEnd: number = p1.getScrollState().distanceFromEnd
	
	if math.abs(DistanceFromEnd - p2) <= 1 then return end
	if p2 <= 1 then
		p1.scrollToEnd()
		
		return
	else
		p1.scrollBy(DistanceFromEnd - p2)
	end
end

return function(p1, Object)
	-- upvalues: ReactModule (copy)
	local UseRefResult = ReactModule.useRef(nil)
	local UseRefResult1 = ReactModule.useRef(nil)
	local UseRefResult2 = ReactModule.useRef(nil)
	local UseRefResult3 = ReactModule.useRef(false)
	ReactModule.useEffect(function()
		-- upvalues: Object (copy), UseRefResult3 (copy), UseRefResult1 (copy)
		if Object == nil then
			return nil
		else
			local Connection = Object:GetPropertyChangedSignal("AbsoluteWindowSize"):Connect(function()
				-- upvalues: UseRefResult3 (upval), UseRefResult1 (upval), Object (copy)
				UseRefResult3.current = UseRefResult1.current ~= nil and Object.AbsoluteWindowSize.Y ~= UseRefResult1.current
			end)
			
			return function()
				-- upvalues: Connection (copy)
				Connection:Disconnect()
			end
		end
	end, { Object })
	
	return ReactModule.useMemo(function()
		-- upvalues: UseRefResult (copy), UseRefResult1 (copy), UseRefResult2 (copy), p1 (copy), UseRefResult3 (copy)
		return {
			onScrolled = function(Current)
				-- upvalues: UseRefResult (upval), UseRefResult1 (upval), UseRefResult2 (upval)
				local Current1 = UseRefResult.current
				
				if Current1 ~= nil and Current1.AbsoluteWindowSize.Y == UseRefResult1.current then
					UseRefResult2.current = Current
				end
			end,
			onContentLengthChanged = function()
				-- upvalues: p1 (upval), UseRefResult1 (upval), UseRefResult3 (upval), UseRefResult2 (upval)
				local Current = p1.current
				
				if Current == nil then return end
				local ScrollState = Current.getScrollState()
				
				if ScrollState.viewportLength == UseRefResult1.current and not UseRefResult3.current then
					UseRefResult2.current = ScrollState.distanceFromEnd
				end
			end,
			onViewportChanged = function(Current)
				-- upvalues: UseRefResult1 (upval), UseRefResult3 (upval), p1 (upval), UseRefResult2 (upval)
				local Current1 = UseRefResult1.current
				UseRefResult1.current = Current
				UseRefResult3.current = false
				local Current2 = p1.current
				
				if Current1 ~= nil and Current1 ~= Current then
					local Current3: number = UseRefResult2.current
					
					if Current2 ~= nil and Current3 ~= nil then
						local DistanceFromEnd: number = Current2.getScrollState().distanceFromEnd
						
						if math.abs(DistanceFromEnd - Current3) > 1 then
							if Current3 <= 1 then
								Current2.scrollToEnd()
							else
								Current2.scrollBy(DistanceFromEnd - Current3)
							end
						end
					end
				end
				if Current2 ~= nil then
					UseRefResult2.current = Current2.getScrollState().distanceFromEnd
				end
			end,
			onScrollingFrameChanged = function(Current)
				-- upvalues: UseRefResult (upval), UseRefResult1 (upval), UseRefResult2 (upval), UseRefResult3 (upval)
				if UseRefResult.current ~= nil and Current ~= UseRefResult.current then
					UseRefResult1.current = nil
					UseRefResult2.current = nil
					UseRefResult3.current = false
				end
				UseRefResult.current = Current
			end
		}
	end, {})
end