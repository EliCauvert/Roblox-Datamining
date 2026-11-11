local Patterns = { "%s(www%.[^%s]+)", "%shttps?://([^%s]+)" }

return require(game:GetService("CoreGui").RobloxGui.Modules.Common.Action)(script.Name, function(p1)
	-- upvalues: Patterns (copy)
	assert(type(p1) == "table", string.format("UpdateSiteMessageBannerText action expects data to be a table, was %s", (type(p1))))
	local LinkUrl = p1.LinkUrl
	
	if LinkUrl and #LinkUrl == 0 then
		LinkUrl = nil
	end
	if p1.Text and not LinkUrl then
		for _, pattern in ipairs(Patterns) do
			local StartIndex, _, FoundAt3 = string.find(p1.Text, pattern)
			
			if StartIndex then
				LinkUrl = "https://" .. FoundAt3
			end
		end
	end
	return {
		text = p1.Text,
		visible = p1.IsVisible or false,
		link = LinkUrl,
		timestamp = p1.timestamp or nil
	}
end)