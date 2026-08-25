local contentProviderService = game:GetService("ContentProvider")

return function(p0, p1)
	-- upvalues: contentProviderService (ref)
	local baseUrl = contentProviderService.BaseUrl
	
	return if p1 then string.format("%supgrades/paymentmethods?ctx=subscription&type=Blackbird&id=%s&paymentSessionId=%s", baseUrl, p0, p1) else string.format("%supgrades/paymentmethods?ctx=subscription&type=Blackbird&id=%s", baseUrl, p0)
end