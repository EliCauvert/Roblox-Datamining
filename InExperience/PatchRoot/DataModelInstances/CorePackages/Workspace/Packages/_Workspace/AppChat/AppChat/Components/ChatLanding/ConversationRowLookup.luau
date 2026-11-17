local function isInVisibleWindow(Frame: Frame, Frame1: Frame): boolean
	local Frame2 = Frame
	while Frame2 ~= nil and Frame2 ~= Frame1 do
		if Frame2:IsA("GuiObject") and not Frame2.Visible then
			return false
		end
		Frame2 = Frame2.Parent
	end
	if Frame1.AbsoluteWindowSize.Y <= 0 then
		return true
	else
		local Y = Frame1.AbsolutePosition.Y
		local NewY = Y + Frame1.AbsoluteWindowSize.Y
		local Y1 = Frame.AbsolutePosition.Y
		
		return Y < Y1 + math.max(Frame.AbsoluteSize.Y, 1) and Y1 < NewY
	end
end

return table.freeze({
	findVisibleRow = function(Frame, p1)
		-- upvalues: isInVisibleWindow (copy)
		for _, Gui in Frame:GetDescendants() do
			if Gui:IsA("GuiObject") then
				local ConversationIdAttribute = Gui:GetAttribute("ConversationId")
				
				if (if type(ConversationIdAttribute) == "string" then ConversationIdAttribute else nil) == p1 and isInVisibleWindow(Gui, Frame) then
					return Gui
				end
			end
		end
		return nil
	end,
	getConversationId = function(Object)
		local ConversationIdAttribute = Object:GetAttribute("ConversationId")
		
		return if type(ConversationIdAttribute) == "string" then ConversationIdAttribute else nil
	end,
	mark = function(Object, Value)
		Object:SetAttribute("ConversationId", Value)
	end,
	onConversationChanged = function(p2, Callback)
		local Connection = p2:GetAttributeChangedSignal("ConversationId"):Connect(Callback)
		
		return function()
			-- upvalues: Connection (copy)
			Connection:Disconnect()
		end
	end
})