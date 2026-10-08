local reactModule = require(script:FindFirstAncestor("SplitPane").Parent.React)
local isSplitPaneEducationalTourGuiObjectVisibleModule = require(script.Parent.isSplitPaneEducationalTourGuiObjectVisible)

return function(p1)
	-- upvalues: reactModule (ref), isSplitPaneEducationalTourGuiObjectVisibleModule (ref)
	local var1, var2 = reactModule.useState(nil)
	reactModule.useLayoutEffect(function()
		-- upvalues: p1 (ref), var2 (ref), isSplitPaneEducationalTourGuiObjectVisibleModule (copy)
		if p1 == nil then
			var2(nil)
			
			return
		end
		local function updateRect()
			-- upvalues: isSplitPaneEducationalTourGuiObjectVisibleModule (copy), p1 (copy), var2 (copy)
			if isSplitPaneEducationalTourGuiObjectVisibleModule(p1) then
				local absolutePosition = p1.AbsolutePosition
				local absoluteSize = p1.AbsoluteSize
				var2(Rect.new(absolutePosition.X, absolutePosition.Y, absolutePosition.X + absoluteSize.X, absolutePosition.Y + absoluteSize.Y))
				
				return
			end
			var2(nil)
		end
		
		updateRect()
		local list = {
			p1:GetPropertyChangedSignal("AbsolutePosition"):Connect(updateRect),
			p1:GetPropertyChangedSignal("AbsoluteSize"):Connect(updateRect)
		}
		local var3 = p1
		while var3 ~= nil do
			if var3:IsA("GuiObject") then
				list[#list + 1] = var3:GetPropertyChangedSignal("Visible"):Connect(updateRect)
			end
			var3 = var3.Parent
		end
		return function()
			-- upvalues: list (ref)
			for i, v in list do
				v:Disconnect()
			end
		end
	end, { p1 })
	
	return var1
end