local LocalizationService = game:GetService("LocalizationService")
local ArgCheckModule = require(game:GetService("CorePackages").Workspace.Packages.ArgCheck)

return function(p1, p2, PlaySource, Response)
	-- upvalues: ArgCheckModule (copy), LocalizationService (copy)
	ArgCheckModule.isType(PlaySource, "string", "playSource")
	ArgCheckModule.isType(Response, "string", "response")
	p1:setRBXEventStream(p2, "playButtonClicked", {
		locale = LocalizationService.RobloxLocaleId,
		playSource = PlaySource,
		response = Response
	})
end