local Parent = script:FindFirstAncestor("Moments").Parent
local _ = require(Parent.MomentsCommon)
local ReactModule = require(Parent.React)
local MomentContextModule = require(script.Parent.Parent.Parent.Parent.MomentContext)
local UseReactionCommitModule = require(script.Parent.Parent.Parent.Parent.Reactions.useReactionCommit)
local PickerItemModule = require(script.Parent.PickerItem)
local UsePickerReactionsModule = require(script.Parent.usePickerReactions)
local View = require(Parent.Foundation).View

return ReactModule.memo(function()
	-- upvalues: MomentContextModule (copy), UseReactionCommitModule (copy), UsePickerReactionsModule (copy), ReactModule (copy), PickerItemModule (copy), View (copy)
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
	
	for Index, Reaction in UsePickerReactionsModule() do
		Elements[`reaction_{Reaction}`] = ReactModule.createElement(PickerItemModule, { reaction = Reaction, index = Index, onSelect = UseResult })
	end
	return ReactModule.createElement(View, {
		tag = "row align-x-center align-y-center gap-medium size-0-1400 auto-x padding-x-large"
	}, Elements)
end)