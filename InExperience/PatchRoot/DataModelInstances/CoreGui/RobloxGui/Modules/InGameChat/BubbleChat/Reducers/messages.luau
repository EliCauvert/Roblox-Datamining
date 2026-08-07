local corePackagesService = game:GetService("CorePackages")
local cryoModule = require(corePackagesService.Packages.Cryo)

return require(corePackagesService.Packages.Rodux).createReducer({}, {
	[require(script.Parent.Parent.Actions.AddMessage).name] = function(p0, p1) --[[ line: 13 ]]
		-- upvalues: cryoModule (ref)
		return cryoModule.Dictionary.join(p0, { [p1.message.id] = p1.message })
	end,
	[require(script.Parent.Parent.Actions.RemoveMessage).name] = function(p2, p3) --[[ line: 19 ]]
		-- upvalues: cryoModule (ref)
		return cryoModule.Dictionary.join(p2, { [p3.message.id] = cryoModule.None })
	end,
	[require(script.Parent.Parent.Actions.SetMessageText).name] = function(p4, p5) --[[ line: 25 ]]
		-- upvalues: cryoModule (ref)
		local messageId = p4[p5.messageId]
		
		return if messageId then cryoModule.Dictionary.join(p4, {
			[p5.messageId] = cryoModule.Dictionary.join(messageId, { text = p5.newText })
		}) else p4
	end
})