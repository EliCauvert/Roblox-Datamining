local list = { require(script.Parent.MessageEffect).ChatWindowEnlarge }

return function(List) --[[ Line: 14 | Named "getChatWindowMessageEffects" ]]
	-- upvalues: list (copy)
	local List1 = {}
	
	if List then
		for _, value in list do
			if table.find(List, value) then
				table.insert(List1, value)
			end
		end
	end
	return List1
end