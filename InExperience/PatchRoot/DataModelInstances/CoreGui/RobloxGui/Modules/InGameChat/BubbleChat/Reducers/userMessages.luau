local corePackagesService = game:GetService("CorePackages")
local cryoModule = require(corePackagesService.Packages.Cryo)

return require(corePackagesService.Packages.Rodux).createReducer({}, {
	[require(script.Parent.Parent.Actions.AddMessage).name] = function(p1, p2)
		-- upvalues: cryoModule (ref)
		return cryoModule.Dictionary.join(p1, {
			[p2.message.userId] = cryoModule.List.join(p1[p2.message.userId] or {}, { p2.message.id })
		})
	end,
	[require(script.Parent.Parent.Actions.RemoveMessage).name] = function(p1, p2)
		-- upvalues: cryoModule (ref)
		local userId = p1[p2.message.userId]
		
		return if userId then if #userId == 1 and userId[1] == p2.message.id then cryoModule.Dictionary.join(p1, { [p2.message.userId] = cryoModule.None }) else cryoModule.Dictionary.join(p1, {
			[p2.message.userId] = cryoModule.List.filter(userId, function(p3)
				-- upvalues: p2 (ref)
				return p3 ~= p2.message.id
			end)
		}) else p1
	end,
	[require(game:GetService("CoreGui"):WaitForChild("RobloxGui").Modules.VoiceChat.Actions.PlayerRemoved).name] = function(p1, p2)
		-- upvalues: cryoModule (ref)
		return if p1[p2.userId] then cryoModule.Dictionary.join(p1, { [p2.userId] = cryoModule.None }) else p1
	end
})