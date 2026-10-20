local LocalizationService = game:GetService("LocalizationService")

return function(p1, p2, Act, Kwd, p3, CurrentPage)
	-- upvalues: LocalizationService (copy)
	assert(type(p2) == "string", "Expected eventContext to be a string")
	assert(type(Act) == "string", "Expected act to be a string")
	
	if Kwd then
		assert(type(Kwd) == "string", "Expected keyword to be a string")
	end
	p1:setRBXEventStream(p2, "search", {
		act = Act,
		kwd = Kwd,
		locale = LocalizationService.RobloxLocaleId,
		isAutoSearchType = p3 or false,
		currentPage = CurrentPage
	})
end