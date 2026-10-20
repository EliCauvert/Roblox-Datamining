local ReactModule = require(script:FindFirstAncestor("SplitPane").Parent.React)
local IsSplitPaneEducationalTourGuiObjectVisibleModule = require(script.Parent.isSplitPaneEducationalTourGuiObjectVisible)

return function(Frame: Frame)
	-- upvalues: ReactModule (copy), IsSplitPaneEducationalTourGuiObjectVisibleModule (copy)
	local UseStateResult, UseStateResult2 = ReactModule.useState(nil)
	ReactModule.useLayoutEffect(function()
		-- upvalues: Frame (copy), UseStateResult2 (copy), IsSplitPaneEducationalTourGuiObjectVisibleModule (upval)
		if Frame == nil then
			UseStateResult2(nil)
			
			return
		end
		local function updateRect()
			-- upvalues: IsSplitPaneEducationalTourGuiObjectVisibleModule (upval), Frame (upval), UseStateResult2 (upval)
			if IsSplitPaneEducationalTourGuiObjectVisibleModule(Frame) then
				local AbsolutePosition = Frame.AbsolutePosition
				local AbsoluteSize = Frame.AbsoluteSize
				UseStateResult2(Rect.new(AbsolutePosition.X, AbsolutePosition.Y, AbsolutePosition.X + AbsoluteSize.X, AbsolutePosition.Y + AbsoluteSize.Y))
				
				return
			else
				UseStateResult2(nil)
			end
		end
		
		updateRect()
		local Connections = {
			Frame:GetPropertyChangedSignal("AbsolutePosition"):Connect(updateRect),
			Frame:GetPropertyChangedSignal("AbsoluteSize"):Connect(updateRect)
		}
		local Gui = Frame
		while Gui ~= nil do
			if Gui:IsA("GuiObject") then
				Connections[#Connections + 1] = Gui:GetPropertyChangedSignal("Visible"):Connect(updateRect)
			end
			Gui = Gui.Parent
		end
		return function()
			-- upvalues: Connections (copy)
			for _, connection in Connections do
				connection:Disconnect()
			end
		end
	end, { Frame })
	
	return UseStateResult
end