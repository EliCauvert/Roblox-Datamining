local moments = script:FindFirstAncestor("Moments")
local parent = moments.Parent
local reactModule = require(parent.React)
local signalsReactModule = require(parent.SignalsReact)
local getUsersStoreModule = require(moments.Stores.GetUsersStore)
local playersService = game:GetService("Players")
local useSignalState = signalsReactModule.useSignalState

return function(p0)
	-- upvalues: getUsersStoreModule (ref), useSignalState (ref), reactModule (ref), playersService (ref)
	local var5 = getUsersStoreModule(false)
	local username = useSignalState(var5.getUserProfile(tostring(p0))).username
	reactModule.useEffect(function()
		-- upvalues: username (ref), playersService (copy), p0 (ref), var5 (ref)
		if username == nil then
			local var6 = false
			task.spawn(function()
				-- upvalues: playersService (copy), p0 (copy), var6 (write), var5 (copy)
				local ok, status = pcall(function()
					-- upvalues: playersService (copy), p0 (copy)
					return playersService:GetNameFromUserIdAsync(p0)
				end)
				
				if ok and not var6 then
					var5.updateUsername(p0, status)
				end
			end)
			
			return function()
				-- upvalues: var6 (write)
				var6 = true
			end
		end
	end, { p0, username, var5.updateUsername })
	
	return username
end