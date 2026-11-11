local Players = game:GetService("Players")
local SetUserMembershipTypeModule = require(game:GetService("CoreGui").RobloxGui.Modules.LuaApp.Actions.SetUserMembershipType)

return function(MobileProductId, p1)
	-- upvalues: SetUserMembershipTypeModule (copy), Players (copy)
	return function(p2)
		-- upvalues: p1 (copy), MobileProductId (copy), SetUserMembershipTypeModule (upval), Players (upval)
		local State = p2:getState()
		
		if p1 then
			for _, subscription in pairs(State.IAPProducts.Subscriptions) do
				if subscription.mobileProductId == MobileProductId then
					p2:dispatch(SetUserMembershipTypeModule(tostring(Players.LocalPlayer.UserId), Enum.MembershipType.Premium))
					break
				end
			end
		end
	end
end