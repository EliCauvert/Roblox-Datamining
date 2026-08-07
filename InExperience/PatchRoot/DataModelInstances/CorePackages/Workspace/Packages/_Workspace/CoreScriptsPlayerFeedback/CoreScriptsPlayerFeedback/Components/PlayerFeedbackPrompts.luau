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
local var10 = require(coreScriptsPlayerFeedback.Flags.GetFFlagEnablePlayerSupportPrompt)()
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
local var12 = reactModule.memo(function(p0) --[[ line: 59 ]]
	-- upvalues: reactModule (ref), cryoModule (ref), unavailablePromptModule (ref), playerFeedbackPromptModule (ref), promptConnectionsModule (ref), focusRoot (ref), focusNavigableSurfaceIdentifierEnum (ref)
	local var14, var15 = reactModule.useState({ promptType = nil, promptData = nil, promptQueue = {} })
	local promptData = var14.promptData
	local promptType = var14.promptType
	local var16 = reactModule.useCallback(function() --[[ line: 69 ]]
		-- upvalues: var15 (ref), cryoModule (copy)
		var15(function(p1) --[[ line: 70 ]]
			-- upvalues: cryoModule (copy)
			local promptQueue = p1.promptQueue or {}
			
			if cryoModule.isEmpty(promptQueue) then
				return { promptType = nil, promptData = {}, promptQueue = {} }
			end
			local var21 = promptQueue[1]
			
			return {
				promptType = var21.promptType,
				promptData = var21.promptData,
				promptQueue = cryoModule.List.removeIndex(promptQueue, 1)
			}
		end)
	end, {})
	local var17 = reactModule.useCallback(function() --[[ line: 88 ]]
		-- upvalues: var15 (ref), cryoModule (copy)
		var15(function(p2) --[[ line: 89 ]]
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
	local var18 = reactModule.useCallback(function(p3) --[[ line: 111 ]]
		-- upvalues: var15 (ref), cryoModule (copy)
		var15(function(p4) --[[ line: 112 ]]
			-- upvalues: cryoModule (copy), p3 (ref)
			return if p4.promptType == nil then {
				promptType = "PromptUnavailable",
				promptData = { reason = p3 },
				promptQueue = {}
			} else {
				promptType = p4.promptType,
				promptData = p4.promptData,
				promptQueue = cryoModule.List.join(p4.promptQueue or {}, {
					{
						promptType = "PromptUnavailable",
						promptData = { reason = p3 }
					}
				})
			}
		end)
	end, {})
	local var19 = nil
	
	if promptType then
		if promptType == "PromptUnavailable" then
			var19 = reactModule.createElement(unavailablePromptModule, {
				enableInputDelayed = p0.enableInputDelayed,
				reason = if promptData then promptData.reason else nil,
				closePrompt = var16
			})
		elseif promptType == "PromptFeedback" then
			var19 = reactModule.createElement(playerFeedbackPromptModule, {
				enableInputDelayed = p0.enableInputDelayed,
				promptData = promptData,
				closePrompt = var16
			})
		else
			error(string.format("Unexpected prompt type: %s!", tostring(promptType)))
		end
	end
	return reactModule.createElement(reactModule.Fragment, {}, {
		PromptConnections = reactModule.createElement(promptConnectionsModule, {
			openPlayerSupportPrompt = nil,
			openPlayerSupportUnavailablePrompt = nil,
			openFeedbackPrompt = var17,
			openUnavailablePrompt = var18,
			closePrompt = var16
		}),
		FocusNavigationCoreScriptsWrapper = var19 and reactModule.createElement(focusRoot, {
			isIsolated = true,
			isAutoFocusRoot = true,
			surfaceIdentifier = focusNavigableSurfaceIdentifierEnum.CentralOverlay
		}, { Prompt = var19 })
	})
end)
local var13 = reactModule.memo(function(p5) --[[ line: 174 ]]
	-- upvalues: useLocalization (ref), reactModule (ref), cryoModule (ref), t (ref), unavailablePromptModule (ref), playerSupportUnavailablePromptModule (ref), playerSupportPromptModule (ref), playerFeedbackPromptModule (ref), promptConnectionsModule (ref), focusRoot (ref), focusNavigableSurfaceIdentifierEnum (ref), playerSupportToastModule (ref)
	local var22 = useLocalization({
		ToastSubmitted = "CoreScripts.FeedbackPrompt.PlayerSupportPrompt.Toast.Submitted",
		ToastFailed = "CoreScripts.FeedbackPrompt.PlayerSupportPrompt.Toast.Failed"
	})
	local var23, var24 = reactModule.useState({ promptType = nil, promptData = nil, promptQueue = {} })
	local var25, var26 = reactModule.useState(nil)
	local var27, var28 = reactModule.useState("")
	local var29, var30 = reactModule.useState("")
	local var31, var32 = reactModule.useState(false)
	local promptData = var23.promptData
	local promptType = var23.promptType
	local var33 = reactModule.useCallback(function() --[[ line: 193 ]]
		-- upvalues: var28 (ref), var30 (ref), var32 (ref)
		var28("")
		var30("")
		var32(false)
	end, {})
	local var34 = reactModule.useCallback(function() --[[ line: 199 ]]
		-- upvalues: var26 (ref)
		var26(nil)
	end, {})
	local var35 = reactModule.useCallback(function() --[[ line: 203 ]]
		-- upvalues: var24 (ref), cryoModule (copy)
		var24(function(p6) --[[ line: 204 ]]
			-- upvalues: cryoModule (copy)
			local promptQueue = p6.promptQueue or {}
			
			if cryoModule.isEmpty(promptQueue) then
				return { promptType = nil, promptData = {}, promptQueue = {} }
			end
			local var43 = promptQueue[1]
			
			return {
				promptType = var43.promptType,
				promptData = var43.promptData,
				promptQueue = cryoModule.List.removeIndex(promptQueue, 1)
			}
		end)
	end, {})
	local var36 = reactModule.useCallback(function() --[[ line: 222 ]]
		-- upvalues: var24 (ref), cryoModule (copy)
		var24(function(p7) --[[ line: 223 ]]
			-- upvalues: cryoModule (copy)
			return if p7.promptType == nil then {
				promptType = "PromptFeedback",
				promptData = {},
				promptQueue = {}
			} else {
				promptType = p7.promptType,
				promptData = p7.promptData,
				promptQueue = cryoModule.List.join(p7.promptQueue or {}, { { promptType = "PromptFeedback", promptData = {} } })
			}
		end)
	end, {})
	local var37 = reactModule.useCallback(function() --[[ line: 245 ]]
		-- upvalues: var24 (ref), cryoModule (copy)
		var24(function(p8) --[[ line: 246 ]]
			-- upvalues: cryoModule (copy)
			return if p8.promptType == nil then {
				promptType = "PromptPlayerSupport",
				promptData = {},
				promptQueue = {}
			} else {
				promptType = p8.promptType,
				promptData = p8.promptData,
				promptQueue = cryoModule.List.join(p8.promptQueue or {}, { { promptType = "PromptPlayerSupport", promptData = {} } })
			}
		end)
	end, {})
	local var38 = reactModule.useCallback(function(p9) --[[ line: 268 ]]
		-- upvalues: var24 (ref), cryoModule (copy)
		var24(function(p10) --[[ line: 269 ]]
			-- upvalues: cryoModule (copy), p9 (ref)
			return if p10.promptType == nil then {
				promptType = "PromptUnavailable",
				promptData = { reason = p9 },
				promptQueue = {}
			} else {
				promptType = p10.promptType,
				promptData = p10.promptData,
				promptQueue = cryoModule.List.join(p10.promptQueue or {}, {
					{
						promptType = "PromptUnavailable",
						promptData = { reason = p9 }
					}
				})
			}
		end)
	end, {})
	local var39 = reactModule.useCallback(function(p11) --[[ line: 291 ]]
		-- upvalues: t (copy), var33 (ref), var26 (ref), var22 (ref), var24 (ref), cryoModule (copy)
		local var44 = t[p11]
		
		if var44 then
			var33()
			var26(var22[var44])
			
			return
		end
		var24(function(p12) --[[ line: 298 ]]
			-- upvalues: cryoModule (copy), p11 (ref)
			return if p12.promptType == nil then {
				promptType = "PromptPlayerSupportUnavailable",
				promptData = { reason = p11 },
				promptQueue = {}
			} else {
				promptType = p12.promptType,
				promptData = p12.promptData,
				promptQueue = cryoModule.List.join(p12.promptQueue or {}, {
					{
						promptType = "PromptPlayerSupportUnavailable",
						promptData = { reason = p11 }
					}
				})
			}
		end)
	end, { var22, var33 })
	local var40 = nil
	
	if promptType then
		if promptType == "PromptUnavailable" then
			var40 = reactModule.createElement(unavailablePromptModule, {
				enableInputDelayed = p5.enableInputDelayed,
				reason = if promptData then promptData.reason else nil,
				closePrompt = var35
			})
		elseif promptType == "PromptPlayerSupportUnavailable" then
			local var41 = if promptData then promptData.reason else nil
			var40 = reactModule.createElement(playerSupportUnavailablePromptModule, {
				enableInputDelayed = p5.enableInputDelayed,
				reason = var41,
				closePrompt = var35,
				openPlayerSupportPrompt = if var41 == "TICKET_CREATION_TEXT_FILTER_ERROR" then var37 else nil
			})
		elseif promptType == "PromptPlayerSupport" then
			var40 = reactModule.createElement(playerSupportPromptModule, {
				enableInputDelayed = p5.enableInputDelayed,
				promptData = promptData,
				closePrompt = var35,
				description = var27,
				setDescription = var28,
				category = var29,
				setCategory = var30,
				shareUserId = var31,
				setShareUserId = var32,
				onFormAbandoned = var33
			})
		elseif promptType == "PromptFeedback" then
			var40 = reactModule.createElement(playerFeedbackPromptModule, {
				enableInputDelayed = p5.enableInputDelayed,
				promptData = promptData,
				closePrompt = var35
			})
		else
			error(string.format("Unexpected prompt type: %s!", tostring(promptType)))
		end
	end
	return reactModule.createElement(reactModule.Fragment, {}, {
		PromptConnections = reactModule.createElement(promptConnectionsModule, {
			openFeedbackPrompt = var36,
			openPlayerSupportPrompt = var37,
			openUnavailablePrompt = var38,
			openPlayerSupportUnavailablePrompt = var39,
			closePrompt = var35
		}),
		FocusNavigationCoreScriptsWrapper = var40 and reactModule.createElement(focusRoot, {
			isIsolated = true,
			isAutoFocusRoot = true,
			surfaceIdentifier = focusNavigableSurfaceIdentifierEnum.CentralOverlay
		}, { Prompt = var40 }),
		Toast = if var25 then reactModule.createElement(playerSupportToastModule, { text = var25, onDismiss = var34 }) else nil
	})
end)

return reactModule.memo(function(p13) --[[ line: 392 ]]
	-- upvalues: var10 (ref), reactModule (ref), var13 (ref), var12 (ref)
	return if var10 then reactModule.createElement(var13, p13) else reactModule.createElement(var12, p13)
end)