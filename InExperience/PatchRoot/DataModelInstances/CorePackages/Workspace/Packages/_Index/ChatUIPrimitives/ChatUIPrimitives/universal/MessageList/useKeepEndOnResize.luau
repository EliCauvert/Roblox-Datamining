local Parent = script:FindFirstAncestor("ChatUIPrimitives").Parent
local ReactModule = require(Parent.React)
local _ = require(Parent.ViewRecycler)

local function _(ScrollFrame)
	return ScrollFrame.AbsoluteCanvasSize.Y - ScrollFrame.AbsoluteWindowSize.Y - ScrollFrame.CanvasPosition.Y
end

return function(ScrollFrame, p1)
	-- upvalues: ReactModule (copy)
	ReactModule.useEffect(function()
		-- upvalues: ScrollFrame (copy), p1 (copy)
		if ScrollFrame == nil then
			return nil
		else
			local Y = ScrollFrame.AbsoluteWindowSize.Y
			local IsYBelow = ScrollFrame.AbsoluteCanvasSize.Y - ScrollFrame.AbsoluteWindowSize.Y - ScrollFrame.CanvasPosition.Y <= 1
			local DeferredThread = nil
			local Connection = ScrollFrame:GetPropertyChangedSignal("CanvasPosition"):Connect(function()
				-- upvalues: ScrollFrame (copy), Y (ref), DeferredThread (ref), IsYBelow (ref)
				if ScrollFrame.AbsoluteWindowSize.Y == Y and DeferredThread == nil then
					IsYBelow = ScrollFrame.AbsoluteCanvasSize.Y - ScrollFrame.AbsoluteWindowSize.Y - ScrollFrame.CanvasPosition.Y <= 1
					
					return
				end
			end)
			local Connection1 = ScrollFrame:GetPropertyChangedSignal("AbsoluteWindowSize"):Connect(function()
				-- upvalues: ScrollFrame (copy), Y (ref), IsYBelow (ref), DeferredThread (ref), p1 (upval)
				local Y1 = ScrollFrame.AbsoluteWindowSize.Y
				
				if Y1 == Y then return end
				Y = Y1
				
				if IsYBelow and DeferredThread == nil then
					DeferredThread = task.defer(function()
						-- upvalues: DeferredThread (upval), p1 (upval)
						DeferredThread = nil
						local Current = p1.current
						
						if Current ~= nil then
							Current.scrollToEnd()
						end
					end)
					
					return
				end
			end)
			
			return function()
				-- upvalues: Connection (copy), Connection1 (copy), DeferredThread (ref)
				Connection:Disconnect()
				Connection1:Disconnect()
				
				if DeferredThread ~= nil then
					task.cancel(DeferredThread)
				end
			end
		end
	end, { ScrollFrame, p1 })
end