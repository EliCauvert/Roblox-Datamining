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
	[require(parent.Actions.CloseOpenPrompt).name] = function(p0, _) --[[ line: 32 ]]
		-- upvalues: cryoModule (ref)
		return if cryoModule.isEmpty(p0.queue) then { queue = p0.queue, infoQueue = p0.infoQueue } else cryoModule.Dictionary.join(p0.infoQueue[1], {
			promptType = p0.queue[1],
			queue = cryoModule.List.removeIndex(p0.queue, 1),
			infoQueue = cryoModule.List.removeIndex(p0.infoQueue, 1)
		})
	end,
	[require(parent.Actions.OpenPrompt).name] = function(p1, p2) --[[ line: 47 ]]
		-- upvalues: cryoModule (ref)
		return if p1.promptType == nil then cryoModule.Dictionary.join(p1, { promptType = p2.promptType }, p2.promptInfo) else cryoModule.Dictionary.join(p1, {
			queue = cryoModule.List.join(p1.queue, { p2.promptType }),
			infoQueue = cryoModule.List.join(p1.infoQueue, { p2.promptInfo })
		})
	end,
	[require(parent.Actions.CreateOutfitConfirmed).name] = function(p3, _) --[[ line: 60 ]]
		-- upvalues: cryoModule (ref), promptTypeModule (ref)
		return cryoModule.Dictionary.join(p3, { promptType = promptTypeModule.EnterOutfitName })
	end
})