local Moments = script:FindFirstAncestor("Moments")
local Parent = Moments.Parent
local ReactModule = require(Parent.React)
local GetUsersStoreModule = require(Moments.Stores.GetUsersStore)
local Players = game:GetService("Players")
local UseSignalStateFunction = require(Parent.SignalsReact).useSignalState

return function(UserId) --[[ Line: 18 ]]
	-- upvalues: GetUsersStoreModule (copy), UseSignalStateFunction (copy), ReactModule (copy), Players (copy)
	local UsersStoreModule = GetUsersStoreModule(false)
	local Username = UseSignalStateFunction(UsersStoreModule.getUserProfile((tostring(UserId)))).username
	ReactModule.useEffect(function() --[[ Line: 23 ]]
		-- upvalues: Username (copy), Players (upval), UserId (copy), UsersStoreModule (copy)
		if Username ~= nil then return end
		local Flag = false
		task.spawn(function() --[[ Line: 30 ]]
			-- upvalues: Players (upval), UserId (upval), Flag (ref), UsersStoreModule (upval)
			local Success, Result = pcall(function() --[[ Line: 31 ]]
				-- upvalues: Players (upval), UserId (upval)
				return Players:GetNameFromUserIdAsync(UserId)
			end)
			
			if Success and not Flag then
				UsersStoreModule.updateUsername(UserId, Result)
			end
		end)
		
		return function() --[[ Line: 39 ]]
			-- upvalues: Flag (ref)
			Flag = true
		end
	end, { UserId, Username, UsersStoreModule.updateUsername })
	
	return Username
end