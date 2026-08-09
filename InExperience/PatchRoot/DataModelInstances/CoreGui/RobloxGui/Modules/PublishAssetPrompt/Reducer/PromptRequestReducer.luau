local parent = script.Parent.Parent
local corePackagesService = game:GetService("CorePackages")
local cryoModule = require(corePackagesService.Packages.Cryo)

return require(corePackagesService.Packages.Rodux).createReducer({ promptInfo = {}, queue = {} }, {
	[require(parent.Actions.OpenPublishAssetPrompt).name] = function(p0, p1) --[[ line: 34 ]]
		-- upvalues: cryoModule (ref)
		return if p0.promptInfo.promptType == nil then cryoModule.Dictionary.join(p0, { promptInfo = p1.promptInfo }) else cryoModule.Dictionary.join(p0, {
			queue = cryoModule.List.join(p0.queue, { p1.promptInfo })
		})
	end,
	[require(parent.Actions.OpenPublishAvatarPrompt).name] = function(p2, p3) --[[ line: 46 ]]
		-- upvalues: cryoModule (ref)
		return if p2.promptInfo.promptType == nil then cryoModule.Dictionary.join(p2, { promptInfo = p3.promptInfo }) else cryoModule.Dictionary.join(p2, {
			queue = cryoModule.List.join(p2.queue, { p3.promptInfo })
		})
	end,
	[require(parent.Actions.OpenPublishAvatarAssetPrompt).name] = function(p4, p5) --[[ line: 58 ]]
		-- upvalues: cryoModule (ref)
		return if p4.promptInfo.promptType == nil then cryoModule.Dictionary.join(p4, { promptInfo = p5.promptInfo }) else cryoModule.Dictionary.join(p4, {
			queue = cryoModule.List.join(p4.queue, { p5.promptInfo })
		})
	end,
	[require(parent.Actions.SetHumanoidModel).name] = function(p6, p7) --[[ line: 70 ]]
		-- upvalues: cryoModule (ref)
		return cryoModule.Dictionary.join(p6, {
			promptInfo = cryoModule.Dictionary.join(p6.promptInfo, { humanoidModel = p7.humanoidModel })
		})
	end,
	[require(parent.Actions.SetAccessoryInstance).name] = function(p8, p9) --[[ line: 78 ]]
		-- upvalues: cryoModule (ref)
		return cryoModule.Dictionary.join(p8, {
			promptInfo = cryoModule.Dictionary.join(p8.promptInfo, { accessoryInstance = p9.accessoryInstance })
		})
	end,
	[require(parent.Actions.SetPriceInRobux).name] = function(p10, p11) --[[ line: 86 ]]
		-- upvalues: cryoModule (ref)
		return cryoModule.Dictionary.join(p10, {
			promptInfo = cryoModule.Dictionary.join(p10.promptInfo, { priceInRobux = p11.priceInRobux })
		})
	end,
	[require(parent.Actions.CloseOpenPrompt).name] = function(p12, _) --[[ line: 94 ]]
		-- upvalues: cryoModule (ref)
		return if cryoModule.isEmpty(p12.queue) then { promptInfo = {}, queue = p12.queue } else cryoModule.Dictionary.join(p12, {
			promptInfo = p12.queue[1],
			queue = cryoModule.List.removeIndex(p12.queue, 1)
		})
	end,
	[require(parent.Actions.OpenResultModal).name] = function(p13, p14) --[[ line: 107 ]]
		-- upvalues: cryoModule (ref)
		return cryoModule.Dictionary.join(p13, { resultModalType = p14.resultType })
	end,
	[require(parent.Actions.CloseResultModal).name] = function(p15, _) --[[ line: 114 ]]
		-- upvalues: cryoModule (ref)
		return cryoModule.Dictionary.join(p15, { resultModalType = cryoModule.None })
	end,
	[require(parent.Actions.OpenValidationErrorModal).name] = function(p16, p17) --[[ line: 120 ]]
		-- upvalues: cryoModule (ref)
		return cryoModule.Dictionary.join(p16, {
			promptInfo = cryoModule.Dictionary.join(p16.promptInfo, { errorMessage = p17.errorMessage })
		})
	end,
	[require(parent.Actions.SetPromptVisibility).name] = function(p18, p19) --[[ line: 129 ]]
		-- upvalues: cryoModule (ref)
		return cryoModule.Dictionary.join(p18, {
			promptInfo = cryoModule.Dictionary.join(p18.promptInfo, { promptVisible = p19.promptVisible })
		})
	end
})