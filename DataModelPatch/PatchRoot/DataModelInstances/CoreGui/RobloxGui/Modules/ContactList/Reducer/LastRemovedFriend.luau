local CorePackages = game:GetService("CorePackages")
local CryoModule = require(CorePackages.Packages.Cryo)

return require(CorePackages.Packages.Rodux).createReducer({ lastRemovedFriendId = "" }, {
	[require(script.Parent.Parent.Actions.UpdateLastFriend).name] = function(p1, p2)
		-- upvalues: CryoModule (copy)
		return CryoModule.Dictionary.join(p1, {
			lastRemovedFriendId = tostring(p2.lastRemovedFriendId) .. tostring(DateTime.now())
		})
	end
})