function cleanUsernameForSuggestions(Text: string)
	local W = Text:gsub("[^%w_]", "")
	
	if string.sub(W, 1, 1) == "_" then
		W = W:sub(2)
	end
	if string.sub(W, -1) == "_" then
		W = W:sub(1, -2)
	end
	local FoundAt: number? = string.find(W, "_")
	
	if FoundAt and FoundAt < #W then
		W = W:sub(1, FoundAt) .. string.gsub(W:sub(FoundAt + 1), "_", "")
	end
	if #W >= 20 then
		W = W:sub(1, 18)
	end
	return W
end

return cleanUsernameForSuggestions