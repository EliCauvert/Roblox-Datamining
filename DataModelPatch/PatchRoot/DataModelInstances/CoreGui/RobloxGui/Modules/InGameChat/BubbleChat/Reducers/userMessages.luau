local CorePackages = game:GetService("CorePackages")
local CryoModule = require(CorePackages.Packages.Cryo)

return (require(CorePackages.Packages.Rodux).createReducer({}, {
	[require(script.Parent.Parent.Actions.AddMessage).name] = function(p1, p2)
		-- upvalues: CryoModule (copy)
		return CryoModule.Dictionary.join(p1, {
			[p2.message.userId] = CryoModule.List.join(p1[p2.message.userId] or {}, { p2.message.id })
		})
	end,
	[require(script.Parent.Parent.Actions.RemoveMessage).name] = function(p1, p2)
		-- upvalues: CryoModule (copy)
		local v1 = p1[p2.message.userId]
		
		return if v1 then if #v1 == 1 and v1[1] == p2.message.id then CryoModule.Dictionary.join(p1, { [p2.message.userId] = CryoModule.None }) else CryoModule.Dictionary.join(p1, {
			[p2.message.userId] = CryoModule.List.filter(v1, function(Id): boolean
				-- upvalues: p2 (copy)
				return Id ~= p2.message.id
			end)
		}) else p1
	end,
	[require(game:GetService("CoreGui"):WaitForChild("RobloxGui").Modules.VoiceChat.Actions.PlayerRemoved).name] = function(p1, p2)
		-- upvalues: CryoModule (copy)
		return if p1[p2.userId] then CryoModule.Dictionary.join(p1, { [p2.userId] = CryoModule.None }) else p1
	end
}))