local Parent = script:FindFirstAncestor("Moments").Parent
local ReactModule = require(Parent.React)
local MomentContextModule = require(script.Parent.Parent.Parent.Parent.MomentContext)
local UseReactionCommitModule = require(script.Parent.Parent.Parent.Parent.Reactions.useReactionCommit)
local PickerItemModule = require(script.Parent.PickerItem)
local View = require(Parent.Foundation).View
local ReactionType = require(Parent.MomentsCommon).Enums.ReactionType
local Reactions = {
	ReactionType.ThumbsUp, ReactionType.Heart, ReactionType.LaughJoy,
	ReactionType.Wow, ReactionType.Cry, ReactionType.Fire, ReactionType.Skull
}

return ReactModule.memo(function()
	-- upvalues: MomentContextModule (copy), UseReactionCommitModule (copy), ReactModule (copy), Reactions (copy), PickerItemModule (copy), View (copy)
	local Store = MomentContextModule.useMoment().store
	local UseReactionCommitModuleResult = UseReactionCommitModule()
	local UseResult = ReactModule.useCallback(function(p1, p2)
		-- upvalues: UseReactionCommitModuleResult (copy), Store (copy)
		UseReactionCommitModuleResult("pickerSelect", p2, p1)
		Store.setReactionPickerOpen(false)
	end, {
		Store.setReactionPickerOpen,
		UseReactionCommitModuleResult
	})
	local Elements = {}
	
	for Index, reaction in Reactions do
		Elements[`reaction_{reaction}`] = ReactModule.createElement(PickerItemModule, { reaction = reaction, index = Index, onSelect = UseResult })
	end
	return ReactModule.createElement(View, {
		tag = "row align-x-center align-y-center gap-medium size-0-1400 auto-x padding-x-large"
	}, Elements)
end)