return function(Frame: Frame): string
	local List = {}
	
	if Frame:IsA("GuiObject") then
		table.insert(List, "Pos=" .. tostring(Frame.AbsolutePosition))
		table.insert(List, "Size=" .. tostring(Frame.AbsoluteSize))
		table.insert(List, "Vis=" .. tostring(Frame.Visible))
		table.insert(List, "ZIndex=" .. tostring(Frame.ZIndex))
		table.insert(List, "LayoutOrder=" .. tostring(Frame.LayoutOrder))
	end
	if Frame:IsA("TextLabel") or Frame:IsA("TextButton") or Frame:IsA("TextBox") then
		table.insert(List, "Text=\"" .. tostring(Frame.Text):sub(1, 80) .. "\"")
	end
	if Frame:IsA("ImageLabel") or Frame:IsA("ImageButton") then
		local Text = tostring(Frame.Image)
		
		if Text ~= "" then
			table.insert(List, "Image=\"" .. Text:sub(1, 80) .. "\"")
		end
	end
	return table.concat(List, " ")
end