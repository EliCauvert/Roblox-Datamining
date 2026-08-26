local moments = script:FindFirstAncestor("Moments")
local parent = moments.Parent
local reactModule = require(parent.React)
local signalsReactModule = require(parent.SignalsReact)
local getUsersStoreModule = require(moments.Stores.GetUsersStore)
local playersService = game:GetService("Players")
local useSignalState = signalsReactModule.useSignalState

return function(p1)
	-- upvalues: getUsersStoreModule (ref), useSignalState (ref), reactModule (ref), playersService (ref)
	local var1 = getUsersStoreModule(false)
	local username = useSignalState(var1.getUserProfile(tostring(p1))).username
	reactModule.useEffect(function()
		-- upvalues: username (ref), playersService (copy), p1 (ref), var1 (ref)
		if username == nil then
			local var2 = false
			task.spawn(function()
				-- upvalues: playersService (copy), p1 (copy), var2 (write), var1 (copy)
				local ok, status = pcall(function()
					-- upvalues: playersService (copy), p1 (copy)
					return playersService:GetNameFromUserIdAsync(p1)
				end)
				
				if ok and not var2 then
					var1.updateUsername(p1, status)
				end
			end)
			
			return function()
				-- upvalues: var2 (write)
				var2 = true
			end
		end
	end, { p1, username, var1.updateUsername })
	
	return username
end