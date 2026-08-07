local corePackagesService = game:GetService("CorePackages")
local cryoModule = require(corePackagesService.Packages.Cryo)

return require(corePackagesService.Packages.Rodux).createReducer({}, {
	[require(script.Parent.Parent.Actions.AddMessage).name] = function(p0, p1) --[[ line: 18 ]]
		-- upvalues: cryoModule (ref)
		return cryoModule.Dictionary.join(p0, {
			[p1.message.userId] = cryoModule.List.join(p0[p1.message.userId] or {}, { p1.message.id })
		})
	end,
	[require(script.Parent.Parent.Actions.RemoveMessage).name] = function(p2, p3) --[[ line: 26 ]]
		-- upvalues: cryoModule (ref)
		local userId = p2[p3.message.userId]
		
		return if userId then if #userId == 1 and userId[1] == p3.message.id then cryoModule.Dictionary.join(p2, { [p3.message.userId] = cryoModule.None }) else cryoModule.Dictionary.join(p2, {
			[p3.message.userId] = cryoModule.List.filter(userId, function(p4) --[[ line: 36 ]]
				-- upvalues: p3 (ref)
				return p4 ~= p3.message.id
			end)
		}) else p2
	end,
	[require(game:GetService("CoreGui"):WaitForChild("RobloxGui").Modules.VoiceChat.Actions.PlayerRemoved).name] = function(p5, p6) --[[ line: 46 ]]
		-- upvalues: cryoModule (ref)
		return if p5[p6.userId] then cryoModule.Dictionary.join(p5, { [p6.userId] = cryoModule.None }) else p5
	end
})