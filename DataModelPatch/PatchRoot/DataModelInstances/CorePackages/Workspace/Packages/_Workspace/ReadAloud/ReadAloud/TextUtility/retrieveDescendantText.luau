local function getSortedDescendantUIReadoutInfo(Object)
	local Descendants = Object:GetDescendants()
	table.insert(Descendants, Object)
	local List = {}
	
	for _, descendant in ipairs(Descendants) do
		if descendant:IsA("TextLabel") or descendant:IsA("TextButton") then
			if #descendant.Text > 0 then
				table.insert(List, {
					UIType = "Text",
					text = descendant.Text,
					absPosition = descendant.AbsolutePosition
				})
			end
		elseif not descendant:IsA("ImageLabel") and not descendant:IsA("ImageButton") then
			if descendant:IsA("TextBox") then
				table.insert(List, {
					UIType = "Text box",
					text = if descendant.Text == "" then descendant.PlaceholderText else descendant.Text,
					absPosition = descendant.AbsolutePosition
				})
			else
				local _ = descendant:IsA("VideoFrame")
			end
		end
	end
	table.sort(List, function(A, B): boolean
		return if A.absPosition.Y == B.absPosition.Y then A.absPosition.X < B.absPosition.X else A.absPosition.Y < B.absPosition.Y
	end)
	
	return List
end

return function(p1): string
	-- upvalues: getSortedDescendantUIReadoutInfo (copy)
	local List = {}
	
	for _, value in ipairs((getSortedDescendantUIReadoutInfo(p1))) do
		table.insert(List, value.text)
	end
	return (table.concat(List, "\n"))
end