local corePackagesService = game:GetService("CorePackages")
local cryoModule = require(corePackagesService.Packages.Cryo)

return require(corePackagesService.Packages.Rodux).createReducer({ lastRemovedFriendId = "" }, {
	[require(script.Parent.Parent.Actions.UpdateLastFriend).name] = function(p0, p1) --[[ line: 10 ]]
		-- upvalues: cryoModule (ref)
		return cryoModule.Dictionary.join(p0, {
			lastRemovedFriendId = tostring(p1.lastRemovedFriendId) .. tostring(DateTime.now())
		})
	end
})