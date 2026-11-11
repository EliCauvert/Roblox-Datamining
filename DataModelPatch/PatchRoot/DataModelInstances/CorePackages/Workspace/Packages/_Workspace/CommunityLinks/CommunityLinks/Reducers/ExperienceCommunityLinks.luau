local Parent = script:FindFirstAncestor("CommunityLinks").Parent
local CryoModule = require(Parent.Cryo)
local _ = require(script.Parent.Parent.Models.CommunityInfo)

return require(Parent.Rodux).createReducer({}, {
	[require(script.Parent.Parent.Actions.SetExperienceCommunityLink).name] = function(p1, p2)
		-- upvalues: CryoModule (copy)
		return CryoModule.Dictionary.join(p1, { [p2.universeId] = p2.communityLink })
	end
})