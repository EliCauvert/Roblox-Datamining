local contentProviderService = game:GetService("ContentProvider")

return {
	PURCHASE_ROBUX_WEBVIEW_TITLE = "Buy Robux",
	getPurchaseRobuxUrl = function() --[[ line: 6 ]]
		-- upvalues: contentProviderService (ref)
		return string.gsub(string.gsub(contentProviderService.BaseUrl:lower(), "/m.", "/www."), "http:", "https:") .. "upgrades/robux?ctx=navpopover"
	end
}