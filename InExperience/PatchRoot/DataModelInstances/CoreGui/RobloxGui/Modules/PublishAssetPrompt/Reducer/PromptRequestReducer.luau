local parent = script.Parent.Parent
local corePackagesService = game:GetService("CorePackages")
local cryoModule = require(corePackagesService.Packages.Cryo)

return require(corePackagesService.Packages.Rodux).createReducer({ promptInfo = {}, queue = {} }, {
	[require(parent.Actions.OpenPublishAssetPrompt).name] = function(p1, p2)
		-- upvalues: cryoModule (ref)
		return if p1.promptInfo.promptType == nil then cryoModule.Dictionary.join(p1, { promptInfo = p2.promptInfo }) else cryoModule.Dictionary.join(p1, {
			queue = cryoModule.List.join(p1.queue, { p2.promptInfo })
		})
	end,
	[require(parent.Actions.OpenPublishAvatarPrompt).name] = function(p1, p2)
		-- upvalues: cryoModule (ref)
		return if p1.promptInfo.promptType == nil then cryoModule.Dictionary.join(p1, { promptInfo = p2.promptInfo }) else cryoModule.Dictionary.join(p1, {
			queue = cryoModule.List.join(p1.queue, { p2.promptInfo })
		})
	end,
	[require(parent.Actions.OpenPublishAvatarAssetPrompt).name] = function(p1, p2)
		-- upvalues: cryoModule (ref)
		return if p1.promptInfo.promptType == nil then cryoModule.Dictionary.join(p1, { promptInfo = p2.promptInfo }) else cryoModule.Dictionary.join(p1, {
			queue = cryoModule.List.join(p1.queue, { p2.promptInfo })
		})
	end,
	[require(parent.Actions.OpenPublishMakeupLookPrompt).name] = function(p1, p2)
		-- upvalues: cryoModule (ref)
		return if p1.promptInfo.promptType == nil then cryoModule.Dictionary.join(p1, { promptInfo = p2.promptInfo }) else cryoModule.Dictionary.join(p1, {
			queue = cryoModule.List.join(p1.queue, { p2.promptInfo })
		})
	end,
	[require(parent.Actions.SetHumanoidModel).name] = function(p1, p2)
		-- upvalues: cryoModule (ref)
		return cryoModule.Dictionary.join(p1, {
			promptInfo = cryoModule.Dictionary.join(p1.promptInfo, { humanoidModel = p2.humanoidModel })
		})
	end,
	[require(parent.Actions.SetAccessoryInstance).name] = function(p1, p2)
		-- upvalues: cryoModule (ref)
		return cryoModule.Dictionary.join(p1, {
			promptInfo = cryoModule.Dictionary.join(p1.promptInfo, { accessoryInstance = p2.accessoryInstance })
		})
	end,
	[require(parent.Actions.SetPriceInRobux).name] = function(p1, p2)
		-- upvalues: cryoModule (ref)
		return cryoModule.Dictionary.join(p1, {
			promptInfo = cryoModule.Dictionary.join(p1.promptInfo, { priceInRobux = p2.priceInRobux })
		})
	end,
	[require(parent.Actions.CloseOpenPrompt).name] = function(p1, _)
		-- upvalues: cryoModule (ref)
		return if cryoModule.isEmpty(p1.queue) then { promptInfo = {}, queue = p1.queue } else cryoModule.Dictionary.join(p1, {
			promptInfo = p1.queue[1],
			queue = cryoModule.List.removeIndex(p1.queue, 1)
		})
	end,
	[require(parent.Actions.OpenResultModal).name] = function(p1, p2)
		-- upvalues: cryoModule (ref)
		return cryoModule.Dictionary.join(p1, { resultModalType = p2.resultType })
	end,
	[require(parent.Actions.CloseResultModal).name] = function(p1, _)
		-- upvalues: cryoModule (ref)
		return cryoModule.Dictionary.join(p1, { resultModalType = cryoModule.None })
	end,
	[require(parent.Actions.OpenValidationErrorModal).name] = function(p1, p2)
		-- upvalues: cryoModule (ref)
		return cryoModule.Dictionary.join(p1, {
			promptInfo = cryoModule.Dictionary.join(p1.promptInfo, { errorMessage = p2.errorMessage })
		})
	end,
	[require(parent.Actions.SetPromptVisibility).name] = function(p1, p2)
		-- upvalues: cryoModule (ref)
		return cryoModule.Dictionary.join(p1, {
			promptInfo = cryoModule.Dictionary.join(p1.promptInfo, { promptVisible = p2.promptVisible })
		})
	end
})