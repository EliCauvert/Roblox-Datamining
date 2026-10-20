local Parent = script:FindFirstAncestor("PageSessionRodux").Parent
local AppPage = require(Parent.RobloxAppEnums).AppPage
local MutedErrorFunction = require(Parent.Loggers).mutedError

return require(Parent.Rodux).makeActionCreator(script.Name, function(Page)
	-- upvalues: AppPage (copy), MutedErrorFunction (copy)
	if AppPage[Page] == nil then
		MutedErrorFunction("SetPageSessionTimestamp action expects page to be a valid page type, %s is not in AppPage", Page)
	end
	return { page = Page, timestamp = tick() }
end)