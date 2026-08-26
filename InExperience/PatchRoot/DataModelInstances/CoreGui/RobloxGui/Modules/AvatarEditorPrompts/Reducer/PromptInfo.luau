local corePackagesService = game:GetService("CorePackages")
local roduxModule = require(corePackagesService.Packages.Rodux)
local cryoModule = require(corePackagesService.Packages.Cryo)
local parent = script.Parent.Parent
local promptTypeModule = require(parent.PromptType)

return roduxModule.createReducer({
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
	[require(parent.Actions.CloseOpenPrompt).name] = function(p1, _)
		-- upvalues: cryoModule (ref)
		return if cryoModule.isEmpty(p1.queue) then { queue = p1.queue, infoQueue = p1.infoQueue } else cryoModule.Dictionary.join(p1.infoQueue[1], {
			promptType = p1.queue[1],
			queue = cryoModule.List.removeIndex(p1.queue, 1),
			infoQueue = cryoModule.List.removeIndex(p1.infoQueue, 1)
		})
	end,
	[require(parent.Actions.OpenPrompt).name] = function(p1, p2)
		-- upvalues: cryoModule (ref)
		return if p1.promptType == nil then cryoModule.Dictionary.join(p1, { promptType = p2.promptType }, p2.promptInfo) else cryoModule.Dictionary.join(p1, {
			queue = cryoModule.List.join(p1.queue, { p2.promptType }),
			infoQueue = cryoModule.List.join(p1.infoQueue, { p2.promptInfo })
		})
	end,
	[require(parent.Actions.CreateOutfitConfirmed).name] = function(p1, _)
		-- upvalues: cryoModule (ref), promptTypeModule (ref)
		return cryoModule.Dictionary.join(p1, { promptType = promptTypeModule.EnterOutfitName })
	end
})