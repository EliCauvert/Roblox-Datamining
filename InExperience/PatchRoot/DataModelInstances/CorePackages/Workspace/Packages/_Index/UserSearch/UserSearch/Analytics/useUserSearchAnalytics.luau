local httpService = game:GetService("HttpService")
local parent = script:FindFirstAncestor("UserSearch").Parent
local reactModule = require(parent.React)
local cryoModule = require(parent.Cryo)
local analyticsModule = require(script.Parent.Analytics)

return function(p1)
	-- upvalues: httpService (ref), reactModule (ref), analyticsModule (ref), cryoModule (ref)
	local var1 = if p1 then p1.userSearchSessionId else httpService:GenerateGUID(false)
	
	return reactModule.useMemo(function()
		-- upvalues: analyticsModule (copy), cryoModule (copy), p1 (ref), var1 (ref)
		return analyticsModule({
			infoForAllEvents = cryoModule.Dictionary.join(p1 or {}, { userSearchSessionId = var1 })
		})
	end, { p1, var1 })
end