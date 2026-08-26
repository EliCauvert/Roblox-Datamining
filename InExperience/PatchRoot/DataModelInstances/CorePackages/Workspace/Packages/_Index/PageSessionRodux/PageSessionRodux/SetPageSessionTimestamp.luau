local parent = script:FindFirstAncestor("PageSessionRodux").Parent
local appPage = require(parent.RobloxAppEnums).AppPage
local mutedError = require(parent.Loggers).mutedError

return require(parent.Rodux).makeActionCreator(script.Name, function(p1)
	-- upvalues: appPage (ref), mutedError (ref)
	if appPage[p1] == nil then
		mutedError("SetPageSessionTimestamp action expects page to be a valid page type, %s is not in AppPage", p1)
	end
	return { page = p1, timestamp = tick() }
end)