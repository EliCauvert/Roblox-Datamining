local parent = script.Parent.Parent
local corePackagesService = game:GetService("CorePackages")
local cryoModule = require(corePackagesService.Packages.Cryo)

return require(corePackagesService.Packages.Rodux).createReducer({ promptInfo = {}, queue = {} }, {
	[require(parent.Actions.OpenPublishAssetPrompt).name] = function(p0, p1)
		-- upvalues: cryoModule (ref)
		return if p0.promptInfo.promptType == nil then cryoModule.Dictionary.join(p0, { promptInfo = p1.promptInfo }) else cryoModule.Dictionary.join(p0, {
			queue = cryoModule.List.join(p0.queue, { p1.promptInfo })
		})
	end,
	[require(parent.Actions.OpenPublishAvatarPrompt).name] = function(p2, p3)
		-- upvalues: cryoModule (ref)
		return if p2.promptInfo.promptType == nil then cryoModule.Dictionary.join(p2, { promptInfo = p3.promptInfo }) else cryoModule.Dictionary.join(p2, {
			queue = cryoModule.List.join(p2.queue, { p3.promptInfo })
		})
	end,
	[require(parent.Actions.OpenPublishAvatarAssetPrompt).name] = function(p4, p5)
		-- upvalues: cryoModule (ref)
		return if p4.promptInfo.promptType == nil then cryoModule.Dictionary.join(p4, { promptInfo = p5.promptInfo }) else cryoModule.Dictionary.join(p4, {
			queue = cryoModule.List.join(p4.queue, { p5.promptInfo })
		})
	end,
	[require(parent.Actions.OpenPublishMakeupLookPrompt).name] = function(p6, p7)
		-- upvalues: cryoModule (ref)
		return if p6.promptInfo.promptType == nil then cryoModule.Dictionary.join(p6, { promptInfo = p7.promptInfo }) else cryoModule.Dictionary.join(p6, {
			queue = cryoModule.List.join(p6.queue, { p7.promptInfo })
		})
	end,
	[require(parent.Actions.SetHumanoidModel).name] = function(p8, p9)
		-- upvalues: cryoModule (ref)
		return cryoModule.Dictionary.join(p8, {
			promptInfo = cryoModule.Dictionary.join(p8.promptInfo, { humanoidModel = p9.humanoidModel })
		})
	end,
	[require(parent.Actions.SetAccessoryInstance).name] = function(p10, p11)
		-- upvalues: cryoModule (ref)
		return cryoModule.Dictionary.join(p10, {
			promptInfo = cryoModule.Dictionary.join(p10.promptInfo, { accessoryInstance = p11.accessoryInstance })
		})
	end,
	[require(parent.Actions.SetPriceInRobux).name] = function(p12, p13)
		-- upvalues: cryoModule (ref)
		return cryoModule.Dictionary.join(p12, {
			promptInfo = cryoModule.Dictionary.join(p12.promptInfo, { priceInRobux = p13.priceInRobux })
		})
	end,
	[require(parent.Actions.CloseOpenPrompt).name] = function(p14, _)
		-- upvalues: cryoModule (ref)
		return if cryoModule.isEmpty(p14.queue) then { promptInfo = {}, queue = p14.queue } else cryoModule.Dictionary.join(p14, {
			promptInfo = p14.queue[1],
			queue = cryoModule.List.removeIndex(p14.queue, 1)
		})
	end,
	[require(parent.Actions.OpenResultModal).name] = function(p15, p16)
		-- upvalues: cryoModule (ref)
		return cryoModule.Dictionary.join(p15, { resultModalType = p16.resultType })
	end,
	[require(parent.Actions.CloseResultModal).name] = function(p17, _)
		-- upvalues: cryoModule (ref)
		return cryoModule.Dictionary.join(p17, { resultModalType = cryoModule.None })
	end,
	[require(parent.Actions.OpenValidationErrorModal).name] = function(p18, p19)
		-- upvalues: cryoModule (ref)
		return cryoModule.Dictionary.join(p18, {
			promptInfo = cryoModule.Dictionary.join(p18.promptInfo, { errorMessage = p19.errorMessage })
		})
	end,
	[require(parent.Actions.SetPromptVisibility).name] = function(p20, p21)
		-- upvalues: cryoModule (ref)
		return cryoModule.Dictionary.join(p20, {
			promptInfo = cryoModule.Dictionary.join(p20.promptInfo, { promptVisible = p21.promptVisible })
		})
	end
})