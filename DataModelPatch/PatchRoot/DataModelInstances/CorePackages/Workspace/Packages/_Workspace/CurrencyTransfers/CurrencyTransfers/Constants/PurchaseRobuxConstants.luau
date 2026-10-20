local ContentProvider = game:GetService("ContentProvider")

return {
	PURCHASE_ROBUX_WEBVIEW_TITLE = "Buy Robux",
	getPurchaseRobuxUrl = function(): string
		-- upvalues: ContentProvider (copy)
		return string.gsub(string.gsub(ContentProvider.BaseUrl:lower(), "/m.", "/www."), "http:", "https:") .. "upgrades/robux?ctx=navpopover"
	end
}