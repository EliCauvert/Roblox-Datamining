local TextChatService = game:GetService("TextChatService")

return require(script:FindFirstAncestor("ChatUIPrimitives").createExpressionCatalogStore)(function()
	-- upvalues: TextChatService (copy)
	local Success, Result = pcall(function()
		-- upvalues: TextChatService (upval)
		return TextChatService:GetPresetsAsync()
	end)
	
	return if Success then Result else nil
end)