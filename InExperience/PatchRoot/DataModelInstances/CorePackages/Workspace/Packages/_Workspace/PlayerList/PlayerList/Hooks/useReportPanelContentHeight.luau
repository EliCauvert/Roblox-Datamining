local Parent = script.Parent.Parent
local ReactModule = require(Parent.Parent.React)
local PanelContentHeightStoreModule = require(Parent.Common.PanelContentHeightStore)

return function(p1) --[[ Line: 25 | Named "useReportPanelContentHeight" ]]
	-- upvalues: ReactModule (copy), PanelContentHeightStoreModule (copy)
	local UseRefResult = ReactModule.useRef(nil)
	
	return ReactModule.useCallback(function(ScrollFrame) --[[ Line: 28 ]]
		-- upvalues: UseRefResult (copy), PanelContentHeightStoreModule (upval), p1 (copy)
		if UseRefResult.current then
			UseRefResult.current:Disconnect()
			UseRefResult.current = nil
		end
		if ScrollFrame == nil then return end
		local function report() --[[ Line: 37 ]]
			-- upvalues: ScrollFrame (copy), PanelContentHeightStoreModule (upval), p1 (upval)
			local UIListLayout = ScrollFrame:FindFirstChildOfClass("UIListLayout")
			
			if UIListLayout then
				local Y = UIListLayout.AbsoluteContentSize.Y
				ScrollFrame.CanvasSize = UDim2.new(0, 0, 0, Y)
				PanelContentHeightStoreModule.setBodyContentHeight(p1 + Y)
			end
		end
		
		local UIListLayout = ScrollFrame:FindFirstChildOfClass("UIListLayout")
		
		if UIListLayout then
			UseRefResult.current = UIListLayout:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(report)
		end
		local UIListLayout1 = ScrollFrame:FindFirstChildOfClass("UIListLayout")
		
		if UIListLayout1 then
			local Y = UIListLayout1.AbsoluteContentSize.Y
			ScrollFrame.CanvasSize = UDim2.new(0, 0, 0, Y)
			PanelContentHeightStoreModule.setBodyContentHeight(p1 + Y)
		end
	end, { p1 })
end