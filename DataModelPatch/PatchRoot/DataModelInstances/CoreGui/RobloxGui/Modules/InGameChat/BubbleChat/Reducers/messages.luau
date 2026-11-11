local CorePackages = game:GetService("CorePackages")
local CryoModule = require(CorePackages.Packages.Cryo)

return (require(CorePackages.Packages.Rodux).createReducer({}, {
	[require(script.Parent.Parent.Actions.AddMessage).name] = function(p1, p2)
		-- upvalues: CryoModule (copy)
		return CryoModule.Dictionary.join(p1, { [p2.message.id] = p2.message })
	end,
	[require(script.Parent.Parent.Actions.RemoveMessage).name] = function(p1, p2)
		-- upvalues: CryoModule (copy)
		return CryoModule.Dictionary.join(p1, { [p2.message.id] = CryoModule.None })
	end,
	[require(script.Parent.Parent.Actions.SetMessageText).name] = function(p1, p2)
		-- upvalues: CryoModule (copy)
		local v1 = p1[p2.messageId]
		
		return if v1 then CryoModule.Dictionary.join(p1, {
			[p2.messageId] = CryoModule.Dictionary.join(v1, { text = p2.newText })
		}) else p1
	end
}))