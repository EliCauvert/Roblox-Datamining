local TextChatService = game:GetService("TextChatService")

return require(script:FindFirstAncestor("ChatUIPrimitives").createExpressionCatalogStore)(function() --[[ Line: 18 ]]
	-- upvalues: TextChatService (copy)
	local Success, Result = pcall(function() --[[ Line: 19 ]]
		-- upvalues: TextChatService (upval)
		return TextChatService:GetPresetsAsync()
	end)
	
	return if Success then Result else nil
end)