local GameDetailRodux = script:FindFirstAncestor("GameDetailRodux")
local GetUserSettingsAndOptionsModule = require(GameDetailRodux.GameDetails.GetUserSettingsAndOptions)
local PromiseModule = require(GameDetailRodux.Parent.Promise)

return function(p1)
	-- upvalues: GetUserSettingsAndOptionsModule (copy), PromiseModule (copy)
	return GetUserSettingsAndOptionsModule(p1):andThen(function(Result)
		-- upvalues: PromiseModule (upval)
		local ResponseBody = Result.responseBody
		
		if not ResponseBody then
			PromiseModule.reject("Unexpected response when fetching user settings and options")
		end
		return PromiseModule.resolve(ResponseBody)
	end, function(p2)
		-- upvalues: PromiseModule (upval)
		return PromiseModule.reject(p2)
	end)
end