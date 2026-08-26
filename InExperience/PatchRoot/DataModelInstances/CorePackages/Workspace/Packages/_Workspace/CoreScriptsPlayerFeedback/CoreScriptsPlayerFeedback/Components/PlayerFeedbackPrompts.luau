local coreScriptsPlayerFeedback = script:FindFirstAncestor("CoreScriptsPlayerFeedback")
local parent = coreScriptsPlayerFeedback.Parent
local reactModule = require(parent.React)
local cryoModule = require(parent.Cryo)
local focusNavigationUtilsModule = require(parent.FocusNavigationUtils)
local focusRoot = focusNavigationUtilsModule.FocusRoot
local focusNavigableSurfaceIdentifierEnum = focusNavigationUtilsModule.FocusNavigableSurfaceIdentifierEnum
local promptConnectionsModule = require(script.Parent.PromptConnections)
local playerFeedbackPromptModule = require(coreScriptsPlayerFeedback.Components.PlayerFeedbackPrompt)
local playerSupportPromptModule = require(coreScriptsPlayerFeedback.Components.PlayerSupportPrompt)
local unavailablePromptModule = require(coreScriptsPlayerFeedback.Components.UnavailablePrompt)
local playerSupportUnavailablePromptModule = require(coreScriptsPlayerFeedback.Components.PlayerSupportUnavailablePrompt)
local playerSupportToastModule = require(coreScriptsPlayerFeedback.Components.PlayerSupportToast)
local useLocalization = require(parent.Localization).Hooks.useLocalization
local var1 = require(coreScriptsPlayerFeedback.Flags.GetFFlagEnablePlayerSupportPrompt)()
local t = {
	TICKET_CREATION_SUBMITTED = "ToastSubmitted",
	TICKET_CREATION_FAILED = "ToastFailed"
}
local _ = {
	PromptFeedback = "PromptFeedback",
	PromptPlayerSupport = "PromptPlayerSupport",
	PromptUnavailable = "PromptUnavailable",
	PromptPlayerSupportUnavailable = "PromptPlayerSupportUnavailable"
}
local var2 = reactModule.memo(function(p1)
	-- upvalues: reactModule (ref), cryoModule (ref), unavailablePromptModule (ref), playerFeedbackPromptModule (ref), promptConnectionsModule (ref), focusRoot (ref), focusNavigableSurfaceIdentifierEnum (ref)
	local var3, var4 = reactModule.useState({ promptType = nil, promptData = nil, promptQueue = {} })
	local promptData = var3.promptData
	local promptType = var3.promptType
	local var5 = reactModule.useCallback(function()
		-- upvalues: var4 (ref), cryoModule (copy)
		var4(function(p2)
			-- upvalues: cryoModule (copy)
			local promptQueue = p2.promptQueue or {}
			
			if cryoModule.isEmpty(promptQueue) then
				return { promptType = nil, promptData = {}, promptQueue = {} }
			end
			local var6 = promptQueue[1]
			
			return {
				promptType = var6.promptType,
				promptData = var6.promptData,
				promptQueue = cryoModule.List.removeIndex(promptQueue, 1)
			}
		end)
	end, {})
	local var6 = reactModule.useCallback(function()
		-- upvalues: var4 (ref), cryoModule (copy)
		var4(function(p2)
			-- upvalues: cryoModule (copy)
			return if p2.promptType == nil then {
				promptType = "PromptFeedback",
				promptData = {},
				promptQueue = {}
			} else {
				promptType = p2.promptType,
				promptData = p2.promptData,
				promptQueue = cryoModule.List.join(p2.promptQueue or {}, { { promptType = "PromptFeedback", promptData = {} } })
			}
		end)
	end, {})
	local var7 = reactModule.useCallback(function(p2)
		-- upvalues: var4 (ref), cryoModule (copy)
		var4(function(p3)
			-- upvalues: cryoModule (copy), p2 (ref)
			return if p3.promptType == nil then {
				promptType = "PromptUnavailable",
				promptData = { reason = p2 },
				promptQueue = {}
			} else {
				promptType = p3.promptType,
				promptData = p3.promptData,
				promptQueue = cryoModule.List.join(p3.promptQueue or {}, {
					{
						promptType = "PromptUnavailable",
						promptData = { reason = p2 }
					}
				})
			}
		end)
	end, {})
	local var8 = nil
	
	if promptType then
		if promptType == "PromptUnavailable" then
			var8 = reactModule.createElement(unavailablePromptModule, {
				enableInputDelayed = p1.enableInputDelayed,
				reason = if promptData then promptData.reason else nil,
				closePrompt = var5
			})
		elseif promptType == "PromptFeedback" then
			var8 = reactModule.createElement(playerFeedbackPromptModule, {
				enableInputDelayed = p1.enableInputDelayed,
				promptData = promptData,
				closePrompt = var5
			})
		else
			error(string.format("Unexpected prompt type: %s!", tostring(promptType)))
		end
	end
	return reactModule.createElement(reactModule.Fragment, {}, {
		PromptConnections = reactModule.createElement(promptConnectionsModule, {
			openPlayerSupportPrompt = nil,
			openPlayerSupportUnavailablePrompt = nil,
			openFeedbackPrompt = var6,
			openUnavailablePrompt = var7,
			closePrompt = var5
		}),
		FocusNavigationCoreScriptsWrapper = var8 and reactModule.createElement(focusRoot, {
			isIsolated = true,
			isAutoFocusRoot = true,
			surfaceIdentifier = focusNavigableSurfaceIdentifierEnum.CentralOverlay
		}, { Prompt = var8 })
	})
end)
local var3 = reactModule.memo(function(p1)
	-- upvalues: useLocalization (ref), reactModule (ref), cryoModule (ref), t (ref), unavailablePromptModule (ref), playerSupportUnavailablePromptModule (ref), playerSupportPromptModule (ref), playerFeedbackPromptModule (ref), promptConnectionsModule (ref), focusRoot (ref), focusNavigableSurfaceIdentifierEnum (ref), playerSupportToastModule (ref)
	local var4 = useLocalization({
		ToastSubmitted = "CoreScripts.FeedbackPrompt.PlayerSupportPrompt.Toast.Submitted",
		ToastFailed = "CoreScripts.FeedbackPrompt.PlayerSupportPrompt.Toast.Failed"
	})
	local var5, var6 = reactModule.useState({ promptType = nil, promptData = nil, promptQueue = {} })
	local var7, var8 = reactModule.useState(nil)
	local var9, var10 = reactModule.useState("")
	local var11, var12 = reactModule.useState("")
	local var13, var14 = reactModule.useState(false)
	local promptData = var5.promptData
	local promptType = var5.promptType
	local var15 = reactModule.useCallback(function()
		-- upvalues: var10 (ref), var12 (ref), var14 (ref)
		var10("")
		var12("")
		var14(false)
	end, {})
	local var16 = reactModule.useCallback(function()
		-- upvalues: var8 (ref)
		var8(nil)
	end, {})
	local var17 = reactModule.useCallback(function()
		-- upvalues: var6 (ref), cryoModule (copy)
		var6(function(p2)
			-- upvalues: cryoModule (copy)
			local promptQueue = p2.promptQueue or {}
			
			if cryoModule.isEmpty(promptQueue) then
				return { promptType = nil, promptData = {}, promptQueue = {} }
			end
			local var18 = promptQueue[1]
			
			return {
				promptType = var18.promptType,
				promptData = var18.promptData,
				promptQueue = cryoModule.List.removeIndex(promptQueue, 1)
			}
		end)
	end, {})
	local var18 = reactModule.useCallback(function()
		-- upvalues: var6 (ref), cryoModule (copy)
		var6(function(p2)
			-- upvalues: cryoModule (copy)
			return if p2.promptType == nil then {
				promptType = "PromptFeedback",
				promptData = {},
				promptQueue = {}
			} else {
				promptType = p2.promptType,
				promptData = p2.promptData,
				promptQueue = cryoModule.List.join(p2.promptQueue or {}, { { promptType = "PromptFeedback", promptData = {} } })
			}
		end)
	end, {})
	local var19 = reactModule.useCallback(function()
		-- upvalues: var6 (ref), cryoModule (copy)
		var6(function(p2)
			-- upvalues: cryoModule (copy)
			return if p2.promptType == nil then {
				promptType = "PromptPlayerSupport",
				promptData = {},
				promptQueue = {}
			} else {
				promptType = p2.promptType,
				promptData = p2.promptData,
				promptQueue = cryoModule.List.join(p2.promptQueue or {}, { { promptType = "PromptPlayerSupport", promptData = {} } })
			}
		end)
	end, {})
	local var20 = reactModule.useCallback(function(p2)
		-- upvalues: var6 (ref), cryoModule (copy)
		var6(function(p3)
			-- upvalues: cryoModule (copy), p2 (ref)
			return if p3.promptType == nil then {
				promptType = "PromptUnavailable",
				promptData = { reason = p2 },
				promptQueue = {}
			} else {
				promptType = p3.promptType,
				promptData = p3.promptData,
				promptQueue = cryoModule.List.join(p3.promptQueue or {}, {
					{
						promptType = "PromptUnavailable",
						promptData = { reason = p2 }
					}
				})
			}
		end)
	end, {})
	local var21 = reactModule.useCallback(function(p2)
		-- upvalues: t (copy), var15 (ref), var8 (ref), var4 (ref), var6 (ref), cryoModule (copy)
		local var22 = t[p2]
		
		if var22 then
			var15()
			var8(var4[var22])
			
			return
		end
		var6(function(p3)
			-- upvalues: cryoModule (copy), p2 (ref)
			return if p3.promptType == nil then {
				promptType = "PromptPlayerSupportUnavailable",
				promptData = { reason = p2 },
				promptQueue = {}
			} else {
				promptType = p3.promptType,
				promptData = p3.promptData,
				promptQueue = cryoModule.List.join(p3.promptQueue or {}, {
					{
						promptType = "PromptPlayerSupportUnavailable",
						promptData = { reason = p2 }
					}
				})
			}
		end)
	end, { var4, var15 })
	local var22 = nil
	
	if promptType then
		if promptType == "PromptUnavailable" then
			var22 = reactModule.createElement(unavailablePromptModule, {
				enableInputDelayed = p1.enableInputDelayed,
				reason = if promptData then promptData.reason else nil,
				closePrompt = var17
			})
		elseif promptType == "PromptPlayerSupportUnavailable" then
			local var23 = if promptData then promptData.reason else nil
			var22 = reactModule.createElement(playerSupportUnavailablePromptModule, {
				enableInputDelayed = p1.enableInputDelayed,
				reason = var23,
				closePrompt = var17,
				openPlayerSupportPrompt = if var23 == "TICKET_CREATION_TEXT_FILTER_ERROR" then var19 else nil
			})
		elseif promptType == "PromptPlayerSupport" then
			var22 = reactModule.createElement(playerSupportPromptModule, {
				enableInputDelayed = p1.enableInputDelayed,
				promptData = promptData,
				closePrompt = var17,
				description = var9,
				setDescription = var10,
				category = var11,
				setCategory = var12,
				shareUserId = var13,
				setShareUserId = var14,
				onFormAbandoned = var15
			})
		elseif promptType == "PromptFeedback" then
			var22 = reactModule.createElement(playerFeedbackPromptModule, {
				enableInputDelayed = p1.enableInputDelayed,
				promptData = promptData,
				closePrompt = var17
			})
		else
			error(string.format("Unexpected prompt type: %s!", tostring(promptType)))
		end
	end
	return reactModule.createElement(reactModule.Fragment, {}, {
		PromptConnections = reactModule.createElement(promptConnectionsModule, {
			openFeedbackPrompt = var18,
			openPlayerSupportPrompt = var19,
			openUnavailablePrompt = var20,
			openPlayerSupportUnavailablePrompt = var21,
			closePrompt = var17
		}),
		FocusNavigationCoreScriptsWrapper = var22 and reactModule.createElement(focusRoot, {
			isIsolated = true,
			isAutoFocusRoot = true,
			surfaceIdentifier = focusNavigableSurfaceIdentifierEnum.CentralOverlay
		}, { Prompt = var22 }),
		Toast = if var7 then reactModule.createElement(playerSupportToastModule, { text = var7, onDismiss = var16 }) else nil
	})
end)

return reactModule.memo(function(p1)
	-- upvalues: var1 (ref), reactModule (ref), var3 (ref), var2 (ref)
	return if var1 then reactModule.createElement(var3, p1) else reactModule.createElement(var2, p1)
end)