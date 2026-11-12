local LinkingService = game:GetService("LinkingService")

return {
	open = function(Url)
		-- upvalues: LinkingService (copy)
		LinkingService:OpenUrl(Url)
	end
}