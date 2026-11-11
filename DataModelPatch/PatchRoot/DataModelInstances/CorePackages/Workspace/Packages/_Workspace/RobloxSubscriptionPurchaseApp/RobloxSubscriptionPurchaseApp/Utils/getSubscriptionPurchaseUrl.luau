local ContentProvider = game:GetService("ContentProvider")

return function(p1, p2): string
	-- upvalues: ContentProvider (copy)
	local BaseUrl = ContentProvider.BaseUrl
	
	return if p2 then string.format("%supgrades/paymentmethods?ctx=subscription&type=Blackbird&id=%s&paymentSessionId=%s", BaseUrl, p1, p2) else string.format("%supgrades/paymentmethods?ctx=subscription&type=Blackbird&id=%s", BaseUrl, p1)
end