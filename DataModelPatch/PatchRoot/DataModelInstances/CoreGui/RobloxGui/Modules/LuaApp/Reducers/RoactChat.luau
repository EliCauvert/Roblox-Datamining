local CorePackages = game:GetService("CorePackages")
local CryoModule = require(CorePackages.Packages.Cryo)

return require(CorePackages.Packages.Rodux).createReducer({ isActiveChatUser = false }, {
	[require(CorePackages.Workspace.Packages.AppChat.FetchChatSettings).Succeeded.name] = function(p1, p2)
		-- upvalues: CryoModule (copy)
		return CryoModule.Dictionary.join(p1, { chatEnabled = p2.responseBody.chatEnabled })
	end
})