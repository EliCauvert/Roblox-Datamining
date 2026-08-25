local playersService = game:GetService("Players")
local thirdPartyUserService = game:GetService("ThirdPartyUserService")
local squadsCore = script:FindFirstAncestor("SquadsCore")
local parent = squadsCore.Parent
local useCurrentSquadMemberModule = require(script.Parent.useCurrentSquadMember)
local useIsLocalPlayerPartyVoiceEligibleModule = require(script.Parent.useIsLocalPlayerPartyVoiceEligible)
local useIsCurrentSquadPartyVoiceEligibleModule = require(script.Parent.useIsCurrentSquadPartyVoiceEligible)
local squadExternalContractContextModule = require(squadsCore.Components.SquadExternalContractProvider.SquadExternalContractContext)
local squadPromptTypeModule = require(squadsCore.Enums.SquadPromptType)
local displayEuConsentPromptModule = require(squadsCore.Utils.displayEuConsentPrompt)
local getTableAppStorageKey = require(squadsCore.Utils.appStorageAccess).getTableAppStorageKey
local useCurrentSquadIdModule = require(squadsCore.Hooks.useCurrentSquadId)
local crossExperienceVoiceModule = require(parent.CrossExperienceVoice)
local luauPolyfillModule = require(parent.LuauPolyfill)
local reactModule = require(parent.React)
local useDispatch = require(parent.RoactUtils).Hooks.RoactRodux.useDispatch
local useStore = require(parent.RoactUtils).Hooks.RoactRodux.useStore
local sharedFlagsModule = require(parent.SharedFlags)
local getFFlagEnableCrossExpVoiceMemoryCheck = sharedFlagsModule.getFFlagEnableCrossExpVoiceMemoryCheck
local fFlagEnableVoiceEuConsentPrompt = sharedFlagsModule.FFlagEnableVoiceEuConsentPrompt
local clearInterval = luauPolyfillModule.clearInterval
local setInterval = luauPolyfillModule.setInterval
local default = crossExperienceVoiceModule.CrossExperienceVoiceManager.default
local useIsBackgroundDMActive = crossExperienceVoiceModule.Hooks.useIsBackgroundDMActive
local useIsVoiceRetriableError = crossExperienceVoiceModule.Hooks.useIsVoiceRetriableError
local SQUAD_VOICE_EU_MODAL_CONSENT_GIVEN_KEY = require(squadsCore.Common.Constants).SQUAD_VOICE_EU_MODAL_CONSENT_GIVEN_KEY
local SQUAD_VOICE_EU_MODAL_SEEN_KEY = require(squadsCore.Common.Constants).SQUAD_VOICE_EU_MODAL_SEEN_KEY
local enableDisconnectPartyVoiceIfNeeded = game:DefineFastFlag("EnableDisconnectPartyVoiceIfNeeded", false)
local enablePartyVoiceRestrictionStatus = game:DefineFastFlag("EnablePartyVoiceRestrictionStatus", false)
local partyVoiceRestrictionStatusMaxAttempts = game:DefineFastInt("PartyVoiceRestrictionStatusMaxAttempts", 10)

function useCrossExperienceVoiceConnector()
	-- upvalues: playersService (ref), useCurrentSquadIdModule (ref), useCurrentSquadMemberModule (ref), useDispatch (ref), reactModule (ref), squadExternalContractContextModule (ref), useStore (ref), useIsCurrentSquadPartyVoiceEligibleModule (ref), useIsBackgroundDMActive (ref), useIsLocalPlayerPartyVoiceEligibleModule (ref), useIsVoiceRetriableError (ref), enablePartyVoiceRestrictionStatus (ref), thirdPartyUserService (ref), enableDisconnectPartyVoiceIfNeeded (ref), partyVoiceRestrictionStatusMaxAttempts (ref), setInterval (ref), clearInterval (ref), fFlagEnableVoiceEuConsentPrompt (ref), getTableAppStorageKey (ref), SQUAD_VOICE_EU_MODAL_CONSENT_GIVEN_KEY (ref), SQUAD_VOICE_EU_MODAL_SEEN_KEY (ref), displayEuConsentPromptModule (ref), default (ref), squadPromptTypeModule (ref), getFFlagEnableCrossExpVoiceMemoryCheck (ref)
	local userId = playersService and (playersService.LocalPlayer and (playersService.LocalPlayer.UserId or 0))
	local var18 = useCurrentSquadIdModule() or ""
	local var19 = useCurrentSquadMemberModule(userId)
	local var20 = useDispatch()
	local var21 = reactModule.useContext(squadExternalContractContextModule)
	local var22 = useStore()
	local var23 = reactModule.useRef(nil)
	local var24 = useIsCurrentSquadPartyVoiceEligibleModule()
	local var25 = useIsBackgroundDMActive()
	local _ = nil
	local _ = nil
	local var26, var27 = useIsLocalPlayerPartyVoiceEligibleModule()
	local var28 = var27
	local var29 = useIsVoiceRetriableError()
	local var30 = nil
	local var31 = nil
	
	if enablePartyVoiceRestrictionStatus then
		local useState = reactModule.useState
		local var32 = if thirdPartyUserService and thirdPartyUserService:IsChatRestrictionSupported() then thirdPartyUserService:GetVoiceChatRestrictionStatus() else Enum.ChatRestrictionStatus.NotRestricted
		useState, var32 = useState(var32)
		var30 = useState
		var31 = var32
	end
	local var33, var34 = reactModule.useState(false)
	local var35 = var18
	
	if var35 then
		var35 = false
		
		if var18 ~= "" then
			var35 = var19
			
			if var35 then
				var35 = not var25
				
				if var35 then
					var35 = var24
					
					if var35 then
						var35 = var26
						
						if var35 then
							local var25_1
							var35 = not var29
							
							if var35 then
								if enablePartyVoiceRestrictionStatus then
									var35 = var30 == Enum.ChatRestrictionStatus.NotRestricted
									var35 = nil
								else
									var35 = true
								end
							end
						end
					end
				end
			end
		end
	end
	if not enableDisconnectPartyVoiceIfNeeded then
		var25_1 = false
	elseif var18 and var18 ~= "" and (var19 and var24 ~= false) and not var28 then
		var25_1 = var26 and (var29 and var25)
	end
	if enablePartyVoiceRestrictionStatus then
		reactModule.useEffect(function()
			-- upvalues: var30 (write), thirdPartyUserService (copy), var31 (write), partyVoiceRestrictionStatusMaxAttempts (copy), setInterval (copy), clearInterval (copy)
			if var30 ~= Enum.ChatRestrictionStatus.Unknown then return end
			if not thirdPartyUserService or not thirdPartyUserService:IsChatRestrictionSupported() then
				var31(Enum.ChatRestrictionStatus.NotRestricted)
				
				return
			end
			local var39 = 0
			local var40 = setInterval(function()
				-- upvalues: var39 (write), thirdPartyUserService (copy), var31 (copy), partyVoiceRestrictionStatusMaxAttempts (copy)
				var39 += 1
				local voiceChatRestrictionStatus = thirdPartyUserService:GetVoiceChatRestrictionStatus()
				
				if voiceChatRestrictionStatus == Enum.ChatRestrictionStatus.NotRestricted or voiceChatRestrictionStatus == Enum.ChatRestrictionStatus.Restricted then
					var31(voiceChatRestrictionStatus)
					
					return
				elseif partyVoiceRestrictionStatusMaxAttempts <= var39 then
					var31(Enum.ChatRestrictionStatus.Restricted)
				end
			end, 4000)
			var39 += 1
			local voiceChatRestrictionStatus = thirdPartyUserService:GetVoiceChatRestrictionStatus()
			
			if voiceChatRestrictionStatus == Enum.ChatRestrictionStatus.NotRestricted or voiceChatRestrictionStatus == Enum.ChatRestrictionStatus.Restricted then
				var31(voiceChatRestrictionStatus)
			elseif partyVoiceRestrictionStatusMaxAttempts <= var39 then
				var31(Enum.ChatRestrictionStatus.Restricted)
			end
			return function()
				-- upvalues: clearInterval (copy), var40 (ref)
				clearInterval(var40)
			end
		end, { var30 })
	end
	reactModule.useEffect(function()
		-- upvalues: fFlagEnableVoiceEuConsentPrompt (copy), var35 (ref), getTableAppStorageKey (copy), SQUAD_VOICE_EU_MODAL_CONSENT_GIVEN_KEY (copy), userId (ref), var34 (ref)
		if fFlagEnableVoiceEuConsentPrompt and var35 and getTableAppStorageKey(SQUAD_VOICE_EU_MODAL_CONSENT_GIVEN_KEY)[tostring(userId)] then
			var34(true)
		end
	end, { userId, var35 })
	reactModule.useEffect(function()
		-- upvalues: fFlagEnableVoiceEuConsentPrompt (copy), var35 (ref), userId (ref), getTableAppStorageKey (copy), SQUAD_VOICE_EU_MODAL_SEEN_KEY (copy), SQUAD_VOICE_EU_MODAL_CONSENT_GIVEN_KEY (copy), var20 (ref), displayEuConsentPromptModule (copy), var21 (ref)
		if fFlagEnableVoiceEuConsentPrompt and var35 then
			local var43 = tostring(userId)
			local var44 = getTableAppStorageKey(SQUAD_VOICE_EU_MODAL_SEEN_KEY)
			
			if not var44[var43] then
				var20(displayEuConsentPromptModule(var21.setSquadPrompt, var43, var44, getTableAppStorageKey(SQUAD_VOICE_EU_MODAL_CONSENT_GIVEN_KEY)))
			end
		end
	end, {
		userId,
		displayEuConsentPromptModule,
		var35,
		var21.setSquadPrompt
	})
	reactModule.useEffect(function()
		-- upvalues: fFlagEnableVoiceEuConsentPrompt (copy), default (copy), var34 (ref)
		if fFlagEnableVoiceEuConsentPrompt then
			local eventConnection = default.VoiceEuModalConsented.Event:Connect(function()
				-- upvalues: var34 (copy)
				var34(true)
			end)
			
			return function()
				-- upvalues: eventConnection (ref)
				eventConnection:Disconnect()
			end
		end
		return function() end
	end, {})
	reactModule.useEffect(function()
		-- upvalues: var25 (ref), default (copy)
		if var25 then
			default:setAsConnected()
			
			return
		end
		default:setAsDisconnected()
	end, { var25 })
	local var37 = reactModule.useCallback(function(p0, p1, p2)
		-- upvalues: default (copy)
		default:join({ partyId = p0, force = p1, shouldIgnoreMemoryWarning = p2 })
	end, {})
	reactModule.useEffect(function()
		-- upvalues: var35 (ref), fFlagEnableVoiceEuConsentPrompt (copy), var33 (ref), default (copy), var37 (ref), var18 (ref), var21 (ref), var22 (ref), squadPromptTypeModule (copy)
		if not var35 or fFlagEnableVoiceEuConsentPrompt and not var33 then return end
		if default:performJoinFeasibilityCheck() then
			var37(var18)
			
			return
		end
		var21.setSquadPrompt(var22, {
			hideCancelButton = false,
			promptType = squadPromptTypeModule.JoinWithLowMemory,
			onConfirm = function() end,
			onCancel = function()
				-- upvalues: var37 (copy), var18 (copy)
				var37(var18, true, true)
			end
		})
	end, {
		var35,
		if fFlagEnableVoiceEuConsentPrompt then var33 else nil
	})
	local var38 = reactModule.useCallback(function()
		-- upvalues: default (copy)
		default:leave()
	end, {})
	reactModule.useEffect(function()
		-- upvalues: enableDisconnectPartyVoiceIfNeeded (copy), var25_1 (ref), var38 (ref)
		if enableDisconnectPartyVoiceIfNeeded and var25_1 then
			var38()
		end
	end, { var25_1, var38 })
	reactModule.useEffect(function()
		-- upvalues: getFFlagEnableCrossExpVoiceMemoryCheck (copy), var23 (ref), default (copy), var21 (ref), var22 (ref), squadPromptTypeModule (copy), var38 (ref)
		if getFFlagEnableCrossExpVoiceMemoryCheck() then
			local _ = function()
				-- upvalues: var23 (copy)
				if var23.current then
					var23.current:Disconnect()
					var23.current = nil
				end
			end
			
			var23.current = default.MemoryLow.Event:Connect(function()
				-- upvalues: var23 (copy), var21 (copy), var22 (copy), squadPromptTypeModule (copy), var38 (copy)
				if var23.current then
					var23.current:Disconnect()
					var23.current = nil
				end
				var21.setSquadPrompt(var22, {
					hideCancelButton = false,
					promptType = squadPromptTypeModule.DisconnectVoiceDueToLowMemory,
					onConfirm = function()
						-- upvalues: var38 (copy)
						var38()
					end
				})
			end)
			
			return function()
				-- upvalues: var23 (copy)
				if var23.current then
					var23.current:Disconnect()
					var23.current = nil
				end
			end
		end
		return function() end
	end)
	
	return var38
end

return useCrossExperienceVoiceConnector