local HttpService = game:GetService("HttpService")
local Parent = script:FindFirstAncestor("UserSearch").Parent
local ReactModule = require(Parent.React)
local CryoModule = require(Parent.Cryo)
local AnalyticsModule = require(script.Parent.Analytics)

return function(p1)
	-- upvalues: HttpService (copy), ReactModule (copy), AnalyticsModule (copy), CryoModule (copy)
	local UserSearchSessionId = p1 and p1.userSearchSessionId or HttpService:GenerateGUID(false)
	
	return (ReactModule.useMemo(function()
		-- upvalues: AnalyticsModule (upval), CryoModule (upval), p1 (copy), UserSearchSessionId (copy)
		return AnalyticsModule({
			infoForAllEvents = CryoModule.Dictionary.join(p1 or {}, { userSearchSessionId = UserSearchSessionId })
		})
	end, { p1, UserSearchSessionId }))
end