local GetDeepValue2Module = require(script.Parent.getDeepValue2)

return if require(script:FindFirstAncestor("AppChat").Flags.FFlagAppChatGetDeepValuePreserveFalse) then GetDeepValue2Module else function(p1, Text: string)
	local v1 = p1
	
	for _, value in ipairs(Text:split(".")) do
		if not v1[value] then
			return nil
		end
		v1 = v1[value]
	end
	return v1
end