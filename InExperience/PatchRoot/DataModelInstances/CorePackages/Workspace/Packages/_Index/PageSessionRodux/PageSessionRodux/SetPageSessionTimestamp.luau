local parent = script:FindFirstAncestor("PageSessionRodux").Parent
local appPage = require(parent.RobloxAppEnums).AppPage
local mutedError = require(parent.Loggers).mutedError

return require(parent.Rodux).makeActionCreator(script.Name, function(p0) --[[ line: 8 ]]
	-- upvalues: appPage (ref), mutedError (ref)
	if appPage[p0] == nil then
		mutedError("SetPageSessionTimestamp action expects page to be a valid page type, %s is not in AppPage", p0)
	end
	return { page = p0, timestamp = tick() }
end)