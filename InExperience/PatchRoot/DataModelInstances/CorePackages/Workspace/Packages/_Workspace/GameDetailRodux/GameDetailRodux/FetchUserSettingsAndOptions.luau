local gameDetailRodux = script:FindFirstAncestor("GameDetailRodux")
local getUserSettingsAndOptionsModule = require(gameDetailRodux.GameDetails.GetUserSettingsAndOptions)
local promiseModule = require(gameDetailRodux.Parent.Promise)

return function(p0)
	-- upvalues: getUserSettingsAndOptionsModule (ref), promiseModule (ref)
	return getUserSettingsAndOptionsModule(p0):andThen(function(p1)
		-- upvalues: promiseModule (copy)
		local responseBody = p1.responseBody
		
		if not responseBody then
			promiseModule.reject("Unexpected response when fetching user settings and options")
		end
		return promiseModule.resolve(responseBody)
	end, function(p2)
		-- upvalues: promiseModule (copy)
		return promiseModule.reject(p2)
	end)
end