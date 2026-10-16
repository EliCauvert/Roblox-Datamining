local Parent = script.Parent.Parent
local CorePackages = game:GetService("CorePackages")
local CryoModule = require(CorePackages.Packages.Cryo)

return (require(CorePackages.Packages.Rodux).createReducer({ promptInfo = {}, queue = {} }, {
	[require(Parent.Actions.OpenPublishAssetPrompt).name] = function(p1, p2) --[[ Line: 35 ]]
		-- upvalues: CryoModule (copy)
		return if p1.promptInfo.promptType == nil then CryoModule.Dictionary.join(p1, { promptInfo = p2.promptInfo }) else CryoModule.Dictionary.join(p1, {
			queue = CryoModule.List.join(p1.queue, { p2.promptInfo })
		})
	end,
	[require(Parent.Actions.OpenPublishAvatarPrompt).name] = function(p1, p2) --[[ Line: 47 ]]
		-- upvalues: CryoModule (copy)
		return if p1.promptInfo.promptType == nil then CryoModule.Dictionary.join(p1, { promptInfo = p2.promptInfo }) else CryoModule.Dictionary.join(p1, {
			queue = CryoModule.List.join(p1.queue, { p2.promptInfo })
		})
	end,
	[require(Parent.Actions.OpenPublishAvatarAssetPrompt).name] = function(p1, p2) --[[ Line: 59 ]]
		-- upvalues: CryoModule (copy)
		return if p1.promptInfo.promptType == nil then CryoModule.Dictionary.join(p1, { promptInfo = p2.promptInfo }) else CryoModule.Dictionary.join(p1, {
			queue = CryoModule.List.join(p1.queue, { p2.promptInfo })
		})
	end,
	[require(Parent.Actions.OpenPublishMakeupLookPrompt).name] = function(p1, p2) --[[ Line: 71 ]]
		-- upvalues: CryoModule (copy)
		return if p1.promptInfo.promptType == nil then CryoModule.Dictionary.join(p1, { promptInfo = p2.promptInfo }) else CryoModule.Dictionary.join(p1, {
			queue = CryoModule.List.join(p1.queue, { p2.promptInfo })
		})
	end,
	[require(Parent.Actions.SetHumanoidModel).name] = function(p1, p2) --[[ Line: 81 ]]
		-- upvalues: CryoModule (copy)
		return CryoModule.Dictionary.join(p1, {
			promptInfo = CryoModule.Dictionary.join(p1.promptInfo, { humanoidModel = p2.humanoidModel })
		})
	end,
	[require(Parent.Actions.SetAccessoryInstance).name] = function(p1, p2) --[[ Line: 89 ]]
		-- upvalues: CryoModule (copy)
		return CryoModule.Dictionary.join(p1, {
			promptInfo = CryoModule.Dictionary.join(p1.promptInfo, { accessoryInstance = p2.accessoryInstance })
		})
	end,
	[require(Parent.Actions.SetPriceInRobux).name] = function(p1, p2) --[[ Line: 97 ]]
		-- upvalues: CryoModule (copy)
		return CryoModule.Dictionary.join(p1, {
			promptInfo = CryoModule.Dictionary.join(p1.promptInfo, { priceInRobux = p2.priceInRobux })
		})
	end,
	[require(Parent.Actions.CloseOpenPrompt).name] = function(p1, _) --[[ Line: 105 ]]
		-- upvalues: CryoModule (copy)
		return if CryoModule.isEmpty(p1.queue) then { promptInfo = {}, queue = p1.queue } else CryoModule.Dictionary.join(p1, {
			promptInfo = p1.queue[1],
			queue = CryoModule.List.removeIndex(p1.queue, 1)
		})
	end,
	[require(Parent.Actions.OpenResultModal).name] = function(p1, p2) --[[ Line: 118 ]]
		-- upvalues: CryoModule (copy)
		return CryoModule.Dictionary.join(p1, { resultModalType = p2.resultType })
	end,
	[require(Parent.Actions.CloseResultModal).name] = function(p1, _) --[[ Line: 125 ]]
		-- upvalues: CryoModule (copy)
		return CryoModule.Dictionary.join(p1, { resultModalType = CryoModule.None })
	end,
	[require(Parent.Actions.OpenValidationErrorModal).name] = function(p1, p2) --[[ Line: 131 ]]
		-- upvalues: CryoModule (copy)
		return CryoModule.Dictionary.join(p1, {
			promptInfo = CryoModule.Dictionary.join(p1.promptInfo, { errorMessage = p2.errorMessage })
		})
	end,
	[require(Parent.Actions.SetPromptVisibility).name] = function(p1, p2) --[[ Line: 140 ]]
		-- upvalues: CryoModule (copy)
		return CryoModule.Dictionary.join(p1, {
			promptInfo = CryoModule.Dictionary.join(p1.promptInfo, { promptVisible = p2.promptVisible })
		})
	end
}))