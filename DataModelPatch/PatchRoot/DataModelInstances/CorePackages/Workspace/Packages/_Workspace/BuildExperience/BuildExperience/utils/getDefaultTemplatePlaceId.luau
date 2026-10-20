local ContentProvider = game:GetService("ContentProvider")

return function(): number
	-- upvalues: ContentProvider (copy)
	local Success, Result = pcall(function()
		-- upvalues: ContentProvider (upval)
		return ContentProvider.BaseUrl
	end)
	local Text = if Success and typeof(Result) == "string" then Result else ""
	
	return if string.find(Text, "sitetest3", 1, true) then 70389767 elseif string.find(Text, "sitetest1", 1, true) then 75308808508742 else 95206881
end