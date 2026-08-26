local parent = script.Parent.Parent
local reactModule = require(parent.Parent.React)
local panelContentHeightStoreModule = require(parent.Common.PanelContentHeightStore)

return function(p1)
	-- upvalues: reactModule (ref), panelContentHeightStoreModule (ref)
	local var1 = reactModule.useRef(nil)
	
	return reactModule.useCallback(function(p2)
		-- upvalues: var1 (ref), panelContentHeightStoreModule (copy), p1 (ref)
		if var1.current then
			var1.current:Disconnect()
			var1.current = nil
		end
		if p2 == nil then return end
		local function report()
			-- upvalues: p2 (ref), panelContentHeightStoreModule (copy), p1 (copy)
			local UIListLayout = p2:FindFirstChildOfClass("UIListLayout")
			
			if UIListLayout then
				local y = UIListLayout.AbsoluteContentSize.Y
				p2.CanvasSize = UDim2.new(0, 0, 0, y)
				panelContentHeightStoreModule.setBodyContentHeight(p1 + y)
			end
		end
		
		local UIListLayout = p2:FindFirstChildOfClass("UIListLayout")
		
		if UIListLayout then
			var1.current = UIListLayout:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(report)
		end
		local UIListLayout_1 = p2:FindFirstChildOfClass("UIListLayout")
		
		if UIListLayout_1 then
			local y = UIListLayout_1.AbsoluteContentSize.Y
			p2.CanvasSize = UDim2.new(0, 0, 0, y)
			panelContentHeightStoreModule.setBodyContentHeight(p1 + y)
		end
	end, { p1 })
end