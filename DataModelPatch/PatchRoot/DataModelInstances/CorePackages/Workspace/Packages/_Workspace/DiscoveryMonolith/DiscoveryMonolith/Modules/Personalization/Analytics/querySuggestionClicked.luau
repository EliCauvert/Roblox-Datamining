local Parent = script:FindFirstAncestor("DiscoveryMonolith").Parent
local TModule = require(Parent.t)
local MutedErrorFunction = require(Parent.Loggers).mutedError
local config = {
	[require(Parent.RobloxAppEnums).AppPage.SearchLandingPage] = TModule.strictInterface({
		sortPos = TModule.number,
		sortId = TModule.string,
		pos = TModule.number,
		queryText = TModule.string,
		componentType = TModule.string
	})
}

return function(p1, p2, p3)
	-- upvalues: config (copy), MutedErrorFunction (copy)
	local Entry = config[p2]
	
	if Entry then
		local EntryResult, EntryResult2 = Entry(p3)
		
		if not EntryResult then
			MutedErrorFunction(EntryResult2)
		end
	else
		MutedErrorFunction(string.format("Missing interface for eventContext %s to type check querySuggestionClicked event parameters", p2))
	end
	p1:sendEventDeferred(p2, "querySuggestionClicked", p3)
end