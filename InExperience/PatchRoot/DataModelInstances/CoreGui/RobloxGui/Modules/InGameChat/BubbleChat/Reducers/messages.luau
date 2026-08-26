local corePackagesService = game:GetService("CorePackages")
local cryoModule = require(corePackagesService.Packages.Cryo)

return require(corePackagesService.Packages.Rodux).createReducer({}, {
	[require(script.Parent.Parent.Actions.AddMessage).name] = function(p1, p2)
		-- upvalues: cryoModule (ref)
		return cryoModule.Dictionary.join(p1, { [p2.message.id] = p2.message })
	end,
	[require(script.Parent.Parent.Actions.RemoveMessage).name] = function(p1, p2)
		-- upvalues: cryoModule (ref)
		return cryoModule.Dictionary.join(p1, { [p2.message.id] = cryoModule.None })
	end,
	[require(script.Parent.Parent.Actions.SetMessageText).name] = function(p1, p2)
		-- upvalues: cryoModule (ref)
		local messageId = p1[p2.messageId]
		
		return if messageId then cryoModule.Dictionary.join(p1, {
			[p2.messageId] = cryoModule.Dictionary.join(messageId, { text = p2.newText })
		}) else p1
	end
})