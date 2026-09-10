local textChatService = game:GetService("TextChatService")

return require(script:FindFirstAncestor("ChatUIPrimitives").createExpressionCatalogStore)(function()
	-- upvalues: textChatService (ref)
	local ok, status = pcall(function()
		-- upvalues: textChatService (copy)
		return textChatService:GetPresetsAsync()
	end)
	
	return if ok then status else nil
end)