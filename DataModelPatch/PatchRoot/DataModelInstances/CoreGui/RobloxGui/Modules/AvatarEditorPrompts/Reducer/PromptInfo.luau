local CorePackages = game:GetService("CorePackages")
local CryoModule = require(CorePackages.Packages.Cryo)
local Parent = script.Parent.Parent
local PromptTypeModule = require(Parent.PromptType)

return (require(CorePackages.Packages.Rodux).createReducer({
	promptType = nil,
	humanoidDescription = nil,
	rigType = nil,
	itemId = nil,
	itemType = nil,
	itemName = nil,
	isFavorited = nil,
	queue = {},
	infoQueue = {}
}, {
	[require(Parent.Actions.CloseOpenPrompt).name] = function(p1, _)
		-- upvalues: CryoModule (copy)
		return if CryoModule.isEmpty(p1.queue) then { queue = p1.queue, infoQueue = p1.infoQueue } else CryoModule.Dictionary.join(p1.infoQueue[1], {
			promptType = p1.queue[1],
			queue = CryoModule.List.removeIndex(p1.queue, 1),
			infoQueue = CryoModule.List.removeIndex(p1.infoQueue, 1)
		})
	end,
	[require(Parent.Actions.OpenPrompt).name] = function(p1, p2)
		-- upvalues: CryoModule (copy)
		return if p1.promptType == nil then CryoModule.Dictionary.join(p1, { promptType = p2.promptType }, p2.promptInfo) else CryoModule.Dictionary.join(p1, {
			queue = CryoModule.List.join(p1.queue, { p2.promptType }),
			infoQueue = CryoModule.List.join(p1.infoQueue, { p2.promptInfo })
		})
	end,
	[require(Parent.Actions.CreateOutfitConfirmed).name] = function(p1, _)
		-- upvalues: CryoModule (copy), PromptTypeModule (copy)
		return CryoModule.Dictionary.join(p1, { promptType = PromptTypeModule.EnterOutfitName })
	end
}))