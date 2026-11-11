local CoreScriptsPlayerFeedback = script:FindFirstAncestor("CoreScriptsPlayerFeedback")
local Parent = CoreScriptsPlayerFeedback.Parent
local ReactModule = require(Parent.React)
local CryoModule = require(Parent.Cryo)
local FocusNavigationUtilsModule = require(Parent.FocusNavigationUtils)
local FocusRoot = FocusNavigationUtilsModule.FocusRoot
local FocusNavigableSurfaceIdentifierEnum = FocusNavigationUtilsModule.FocusNavigableSurfaceIdentifierEnum
local PromptConnectionsModule = require(script.Parent.PromptConnections)
local PlayerFeedbackPromptModule = require(CoreScriptsPlayerFeedback.Components.PlayerFeedbackPrompt)
local PlayerSupportPromptModule = require(CoreScriptsPlayerFeedback.Components.PlayerSupportPrompt)
local UnavailablePromptModule = require(CoreScriptsPlayerFeedback.Components.UnavailablePrompt)
local PlayerSupportUnavailablePromptModule = require(CoreScriptsPlayerFeedback.Components.PlayerSupportUnavailablePrompt)
local PlayerSupportToastModule = require(CoreScriptsPlayerFeedback.Components.PlayerSupportToast)
local UseLocalizationFunction = require(Parent.Localization).Hooks.useLocalization
local v1 = require(CoreScriptsPlayerFeedback.Flags.GetFFlagEnablePlayerSupportPrompt)()
local config = {
	TICKET_CREATION_SUBMITTED = "ToastSubmitted",
	TICKET_CREATION_FAILED = "ToastFailed"
}
local MemoResult = ReactModule.memo(function(p1)
	-- upvalues: ReactModule (copy), CryoModule (copy), UnavailablePromptModule (copy), PlayerFeedbackPromptModule (copy), PromptConnectionsModule (copy), FocusRoot (copy), FocusNavigableSurfaceIdentifierEnum (copy)
	local UseStateResult, UseStateResult2 = ReactModule.useState({ promptType = nil, promptData = nil, promptQueue = {} })
	local PromptData = UseStateResult.promptData
	local PromptType = UseStateResult.promptType
	local UseResult = ReactModule.useCallback(function()
		-- upvalues: UseStateResult2 (copy), CryoModule (upval)
		UseStateResult2(function(p2)
			-- upvalues: CryoModule (upval)
			local PromptQueue = p2.promptQueue or {}
			
			if CryoModule.isEmpty(PromptQueue) then
				return { promptType = nil, promptData = {}, promptQueue = {} }
			else
				local PromptQueueEntry = PromptQueue[1]
				
				return {
					promptType = PromptQueueEntry.promptType,
					promptData = PromptQueueEntry.promptData,
					promptQueue = CryoModule.List.removeIndex(PromptQueue, 1)
				}
			end
		end)
	end, {})
	local UseResult1 = ReactModule.useCallback(function()
		-- upvalues: UseStateResult2 (copy), CryoModule (upval)
		UseStateResult2(function(p2)
			-- upvalues: CryoModule (upval)
			return if p2.promptType == nil then {
				promptType = "PromptFeedback",
				promptData = {},
				promptQueue = {}
			} else {
				promptType = p2.promptType,
				promptData = p2.promptData,
				promptQueue = CryoModule.List.join(p2.promptQueue or {}, { { promptType = "PromptFeedback", promptData = {} } })
			}
		end)
	end, {})
	local UseResult2 = ReactModule.useCallback(function(Reason)
		-- upvalues: UseStateResult2 (copy), CryoModule (upval)
		UseStateResult2(function(p2)
			-- upvalues: CryoModule (upval), Reason (copy)
			return if p2.promptType == nil then {
				promptType = "PromptUnavailable",
				promptData = { reason = Reason },
				promptQueue = {}
			} else {
				promptType = p2.promptType,
				promptData = p2.promptData,
				promptQueue = CryoModule.List.join(p2.promptQueue or {}, {
					{
						promptType = "PromptUnavailable",
						promptData = { reason = Reason }
					}
				})
			}
		end)
	end, {})
	local Element = nil
	
	if PromptType then
		if PromptType == "PromptUnavailable" then
			Element = ReactModule.createElement(UnavailablePromptModule, {
				enableInputDelayed = p1.enableInputDelayed,
				reason = if PromptData then PromptData.reason else nil,
				closePrompt = UseResult
			})
		elseif PromptType == "PromptFeedback" then
			Element = ReactModule.createElement(PlayerFeedbackPromptModule, {
				enableInputDelayed = p1.enableInputDelayed,
				promptData = PromptData,
				closePrompt = UseResult
			})
		else
			error(string.format("Unexpected prompt type: %s!", (tostring(PromptType))))
		end
	end
	return ReactModule.createElement(ReactModule.Fragment, {}, {
		PromptConnections = ReactModule.createElement(PromptConnectionsModule, {
			openPlayerSupportPrompt = nil,
			openPlayerSupportUnavailablePrompt = nil,
			openFeedbackPrompt = UseResult1,
			openUnavailablePrompt = UseResult2,
			closePrompt = UseResult
		}),
		FocusNavigationCoreScriptsWrapper = if Element then ReactModule.createElement(FocusRoot, {
			isIsolated = true,
			isAutoFocusRoot = true,
			surfaceIdentifier = FocusNavigableSurfaceIdentifierEnum.CentralOverlay
		}, { Prompt = Element }) else Element
	})
end)
local MemoResult1 = ReactModule.memo(function(p1)
	-- upvalues: UseLocalizationFunction (copy), ReactModule (copy), CryoModule (copy), config (copy), UnavailablePromptModule (copy), PlayerSupportUnavailablePromptModule (copy), PlayerSupportPromptModule (copy), PlayerFeedbackPromptModule (copy), PromptConnectionsModule (copy), FocusRoot (copy), FocusNavigableSurfaceIdentifierEnum (copy), PlayerSupportToastModule (copy)
	local UseLocalizationResult = UseLocalizationFunction({
		ToastSubmitted = "CoreScripts.FeedbackPrompt.PlayerSupportPrompt.Toast.Submitted",
		ToastFailed = "CoreScripts.FeedbackPrompt.PlayerSupportPrompt.Toast.Failed"
	})
	local UseStateResult, UseStateResult2 = ReactModule.useState({ promptType = nil, promptData = nil, promptQueue = {} })
	local UseStateResult1, UseStateResult2_1 = ReactModule.useState(nil)
	local UseStateResult3, UseStateResult2_2 = ReactModule.useState("")
	local UseStateResult4, UseStateResult2_3 = ReactModule.useState("")
	local UseStateResult5, UseStateResult2_4 = ReactModule.useState(false)
	local PromptData = UseStateResult.promptData
	local PromptType = UseStateResult.promptType
	local UseResult = ReactModule.useCallback(function()
		-- upvalues: UseStateResult2_2 (copy), UseStateResult2_3 (copy), UseStateResult2_4 (copy)
		UseStateResult2_2("")
		UseStateResult2_3("")
		UseStateResult2_4(false)
	end, {})
	local UseResult1 = ReactModule.useCallback(function()
		-- upvalues: UseStateResult2_1 (copy)
		UseStateResult2_1(nil)
	end, {})
	local UseResult2 = ReactModule.useCallback(function()
		-- upvalues: UseStateResult2 (copy), CryoModule (upval)
		UseStateResult2(function(p2)
			-- upvalues: CryoModule (upval)
			local PromptQueue = p2.promptQueue or {}
			
			if CryoModule.isEmpty(PromptQueue) then
				return { promptType = nil, promptData = {}, promptQueue = {} }
			else
				local PromptQueueEntry = PromptQueue[1]
				
				return {
					promptType = PromptQueueEntry.promptType,
					promptData = PromptQueueEntry.promptData,
					promptQueue = CryoModule.List.removeIndex(PromptQueue, 1)
				}
			end
		end)
	end, {})
	local UseResult3 = ReactModule.useCallback(function()
		-- upvalues: UseStateResult2 (copy), CryoModule (upval)
		UseStateResult2(function(p2)
			-- upvalues: CryoModule (upval)
			return if p2.promptType == nil then {
				promptType = "PromptFeedback",
				promptData = {},
				promptQueue = {}
			} else {
				promptType = p2.promptType,
				promptData = p2.promptData,
				promptQueue = CryoModule.List.join(p2.promptQueue or {}, { { promptType = "PromptFeedback", promptData = {} } })
			}
		end)
	end, {})
	local UseResult4 = ReactModule.useCallback(function()
		-- upvalues: UseStateResult2 (copy), CryoModule (upval)
		UseStateResult2(function(p2)
			-- upvalues: CryoModule (upval)
			return if p2.promptType == nil then {
				promptType = "PromptPlayerSupport",
				promptData = {},
				promptQueue = {}
			} else {
				promptType = p2.promptType,
				promptData = p2.promptData,
				promptQueue = CryoModule.List.join(p2.promptQueue or {}, { { promptType = "PromptPlayerSupport", promptData = {} } })
			}
		end)
	end, {})
	local UseResult5 = ReactModule.useCallback(function(Reason)
		-- upvalues: UseStateResult2 (copy), CryoModule (upval)
		UseStateResult2(function(p2)
			-- upvalues: CryoModule (upval), Reason (copy)
			return if p2.promptType == nil then {
				promptType = "PromptUnavailable",
				promptData = { reason = Reason },
				promptQueue = {}
			} else {
				promptType = p2.promptType,
				promptData = p2.promptData,
				promptQueue = CryoModule.List.join(p2.promptQueue or {}, {
					{
						promptType = "PromptUnavailable",
						promptData = { reason = Reason }
					}
				})
			}
		end)
	end, {})
	local UseResult6 = ReactModule.useCallback(function(Reason)
		-- upvalues: config (upval), UseResult (copy), UseStateResult2_1 (copy), UseLocalizationResult (copy), UseStateResult2 (copy), CryoModule (upval)
		local Entry = config[Reason]
		
		if Entry then
			UseResult()
			UseStateResult2_1(UseLocalizationResult[Entry])
			
			return
		else
			UseStateResult2(function(p2)
				-- upvalues: CryoModule (upval), Reason (copy)
				return if p2.promptType == nil then {
					promptType = "PromptPlayerSupportUnavailable",
					promptData = { reason = Reason },
					promptQueue = {}
				} else {
					promptType = p2.promptType,
					promptData = p2.promptData,
					promptQueue = CryoModule.List.join(p2.promptQueue or {}, {
						{
							promptType = "PromptPlayerSupportUnavailable",
							promptData = { reason = Reason }
						}
					})
				}
			end)
		end
	end, { UseLocalizationResult, UseResult })
	local Element = nil
	
	if PromptType then
		if PromptType == "PromptUnavailable" then
			Element = ReactModule.createElement(UnavailablePromptModule, {
				enableInputDelayed = p1.enableInputDelayed,
				reason = if PromptData then PromptData.reason else nil,
				closePrompt = UseResult2
			})
		elseif PromptType == "PromptPlayerSupportUnavailable" then
			local Reason = if PromptData then PromptData.reason else nil
			Element = ReactModule.createElement(PlayerSupportUnavailablePromptModule, {
				enableInputDelayed = p1.enableInputDelayed,
				reason = Reason,
				closePrompt = UseResult2,
				openPlayerSupportPrompt = if Reason == "TICKET_CREATION_TEXT_FILTER_ERROR" then UseResult4 else nil
			})
		elseif PromptType == "PromptPlayerSupport" then
			Element = ReactModule.createElement(PlayerSupportPromptModule, {
				enableInputDelayed = p1.enableInputDelayed,
				promptData = PromptData,
				closePrompt = UseResult2,
				description = UseStateResult3,
				setDescription = UseStateResult2_2,
				category = UseStateResult4,
				setCategory = UseStateResult2_3,
				shareUserId = UseStateResult5,
				setShareUserId = UseStateResult2_4,
				onFormAbandoned = UseResult
			})
		elseif PromptType == "PromptFeedback" then
			Element = ReactModule.createElement(PlayerFeedbackPromptModule, {
				enableInputDelayed = p1.enableInputDelayed,
				promptData = PromptData,
				closePrompt = UseResult2
			})
		else
			error(string.format("Unexpected prompt type: %s!", (tostring(PromptType))))
		end
	end
	return ReactModule.createElement(ReactModule.Fragment, {}, {
		PromptConnections = ReactModule.createElement(PromptConnectionsModule, {
			openFeedbackPrompt = UseResult3,
			openPlayerSupportPrompt = UseResult4,
			openUnavailablePrompt = UseResult5,
			openPlayerSupportUnavailablePrompt = UseResult6,
			closePrompt = UseResult2
		}),
		FocusNavigationCoreScriptsWrapper = if Element then ReactModule.createElement(FocusRoot, {
			isIsolated = true,
			isAutoFocusRoot = true,
			surfaceIdentifier = FocusNavigableSurfaceIdentifierEnum.CentralOverlay
		}, { Prompt = Element }) else Element,
		Toast = if UseStateResult1 then ReactModule.createElement(PlayerSupportToastModule, { text = UseStateResult1, onDismiss = UseResult1 }) else nil
	})
end)

return (ReactModule.memo(function(p1)
	-- upvalues: v1 (copy), ReactModule (copy), MemoResult1 (copy), MemoResult (copy)
	return if v1 then ReactModule.createElement(MemoResult1, p1) else ReactModule.createElement(MemoResult, p1)
end))