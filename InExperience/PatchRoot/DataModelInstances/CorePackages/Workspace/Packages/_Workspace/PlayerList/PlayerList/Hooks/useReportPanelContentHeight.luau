local parent = script.Parent.Parent
local reactModule = require(parent.Parent.React)
local panelContentHeightStoreModule = require(parent.Common.PanelContentHeightStore)

return function(p0)
	-- upvalues: reactModule (ref), panelContentHeightStoreModule (ref)
	local var2 = reactModule.useRef(nil)
	
	return reactModule.useCallback(function(p1)
		-- upvalues: var2 (ref), panelContentHeightStoreModule (copy), p0 (ref)
		if var2.current then
			var2.current:Disconnect()
			var2.current = nil
		end
		if p1 == nil then return end
		local function report()
			-- upvalues: p1 (ref), panelContentHeightStoreModule (copy), p0 (copy)
			local UIListLayout = p1:FindFirstChildOfClass("UIListLayout")
			
			if UIListLayout then
				local y = UIListLayout.AbsoluteContentSize.Y
				p1.CanvasSize = UDim2.new(0, 0, 0, y)
				panelContentHeightStoreModule.setBodyContentHeight(p0 + y)
			end
		end
		
		local UIListLayout = p1:FindFirstChildOfClass("UIListLayout")
		
		if UIListLayout then
			var2.current = UIListLayout:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(report)
		end
		local UIListLayout_1 = p1:FindFirstChildOfClass("UIListLayout")
		
		if UIListLayout_1 then
			local y = UIListLayout_1.AbsoluteContentSize.Y
			p1.CanvasSize = UDim2.new(0, 0, 0, y)
			panelContentHeightStoreModule.setBodyContentHeight(p0 + y)
		end
	end, { p0 })
end