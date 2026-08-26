local contentProviderService = game:GetService("ContentProvider")

return function(p1, p2)
	-- upvalues: contentProviderService (ref)
	local baseUrl = contentProviderService.BaseUrl
	
	return if p2 then string.format("%supgrades/paymentmethods?ctx=subscription&type=Blackbird&id=%s&paymentSessionId=%s", baseUrl, p1, p2) else string.format("%supgrades/paymentmethods?ctx=subscription&type=Blackbird&id=%s", baseUrl, p1)
end