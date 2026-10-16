local CorePackages = game:GetService("CorePackages")
local UserProfileStore = require(CorePackages.Workspace.Packages.UserProfiles).Stores.UserProfileStore
local SignalsReactModule = require(CorePackages.Packages.SignalsReact)

return function(p1, p2) --[[ Line: 6 | Named "usePlayerCombinedName" ]]
	-- upvalues: UserProfileStore (copy), SignalsReactModule (copy)
	return SignalsReactModule.useSignalBinding(UserProfileStore.get().fetchNamesByUserIds({ p1 })(false).data[1].names.getInExperienceCombinedName):map(function(Text: string) --[[ Line: 9 ]]
		-- upvalues: p2 (copy)
		return if string.len(Text) == 0 then p2 else Text
	end)
end