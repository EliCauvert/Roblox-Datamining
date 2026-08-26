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
	local var1 = useCurrentSquadIdModule() or ""
	local var2 = useCurrentSquadMemberModule(userId)
	local var3 = useDispatch()
	local var4 = reactModule.useContext(squadExternalContractContextModule)
	local var5 = useStore()
	local var6 = reactModule.useRef(nil)
	local var7 = useIsCurrentSquadPartyVoiceEligibleModule()
	local var8 = useIsBackgroundDMActive()
	local _ = nil
	local _ = nil
	local var9, var10 = useIsLocalPlayerPartyVoiceEligibleModule()
	local var11 = var10
	local var12 = useIsVoiceRetriableError()
	local var13 = nil
	local var14 = nil
	
	if enablePartyVoiceRestrictionStatus then
		local useState = reactModule.useState
		local var15 = if thirdPartyUserService and thirdPartyUserService:IsChatRestrictionSupported() then thirdPartyUserService:GetVoiceChatRestrictionStatus() else Enum.ChatRestrictionStatus.NotRestricted
		useState, var32 = useState(var15)
		var13 = useState
		var14 = var15
	end
	local var16, var17 = reactModule.useState(false)
	local var18 = var1
	
	if var18 then
		var18 = false
		
		if var1 ~= "" then
			var18 = var2
			
			if var18 then
				var18 = not var8
				
				if var18 then
					var18 = var7
					
					if var18 then
						var18 = var9
						
						if var18 then
							local var19
							var18 = not var12
							
							if var18 then
								if enablePartyVoiceRestrictionStatus then
									var18 = var13 == Enum.ChatRestrictionStatus.NotRestricted
									var18 = nil
								else
									var18 = true
								end
							end
						end
					end
				end
			end
		end
	end
	if not enableDisconnectPartyVoiceIfNeeded then
		var19 = false
	elseif var1 and var1 ~= "" and (var2 and var7 ~= false) and not var11 then
		var19 = var9 and (var12 and var8)
	end
	if enablePartyVoiceRestrictionStatus then
		reactModule.useEffect(function()
			-- upvalues: var13 (write), thirdPartyUserService (copy), var14 (write), partyVoiceRestrictionStatusMaxAttempts (copy), setInterval (copy), clearInterval (copy)
			if var13 ~= Enum.ChatRestrictionStatus.Unknown then return end
			if not thirdPartyUserService or not thirdPartyUserService:IsChatRestrictionSupported() then
				var14(Enum.ChatRestrictionStatus.NotRestricted)
				
				return
			end
			local var20 = 0
			local var21 = setInterval(function()
				-- upvalues: var20 (write), thirdPartyUserService (copy), var14 (copy), partyVoiceRestrictionStatusMaxAttempts (copy)
				var20 += 1
				local voiceChatRestrictionStatus = thirdPartyUserService:GetVoiceChatRestrictionStatus()
				
				if voiceChatRestrictionStatus == Enum.ChatRestrictionStatus.NotRestricted or voiceChatRestrictionStatus == Enum.ChatRestrictionStatus.Restricted then
					var14(voiceChatRestrictionStatus)
					
					return
				elseif partyVoiceRestrictionStatusMaxAttempts <= var20 then
					var14(Enum.ChatRestrictionStatus.Restricted)
				end
			end, 4000)
			var20 += 1
			local voiceChatRestrictionStatus = thirdPartyUserService:GetVoiceChatRestrictionStatus()
			
			if voiceChatRestrictionStatus == Enum.ChatRestrictionStatus.NotRestricted or voiceChatRestrictionStatus == Enum.ChatRestrictionStatus.Restricted then
				var14(voiceChatRestrictionStatus)
			elseif partyVoiceRestrictionStatusMaxAttempts <= var20 then
				var14(Enum.ChatRestrictionStatus.Restricted)
			end
			return function()
				-- upvalues: clearInterval (copy), var21 (ref)
				clearInterval(var21)
			end
		end, { var13 })
	end
	reactModule.useEffect(function()
		-- upvalues: fFlagEnableVoiceEuConsentPrompt (copy), var18 (ref), getTableAppStorageKey (copy), SQUAD_VOICE_EU_MODAL_CONSENT_GIVEN_KEY (copy), userId (ref), var17 (ref)
		if fFlagEnableVoiceEuConsentPrompt and var18 and getTableAppStorageKey(SQUAD_VOICE_EU_MODAL_CONSENT_GIVEN_KEY)[tostring(userId)] then
			var17(true)
		end
	end, { userId, var18 })
	reactModule.useEffect(function()
		-- upvalues: fFlagEnableVoiceEuConsentPrompt (copy), var18 (ref), userId (ref), getTableAppStorageKey (copy), SQUAD_VOICE_EU_MODAL_SEEN_KEY (copy), SQUAD_VOICE_EU_MODAL_CONSENT_GIVEN_KEY (copy), var3 (ref), displayEuConsentPromptModule (copy), var4 (ref)
		if fFlagEnableVoiceEuConsentPrompt and var18 then
			local var20 = tostring(userId)
			local var21 = getTableAppStorageKey(SQUAD_VOICE_EU_MODAL_SEEN_KEY)
			
			if not var21[var20] then
				var3(displayEuConsentPromptModule(var4.setSquadPrompt, var20, var21, getTableAppStorageKey(SQUAD_VOICE_EU_MODAL_CONSENT_GIVEN_KEY)))
			end
		end
	end, {
		userId,
		displayEuConsentPromptModule,
		var18,
		var4.setSquadPrompt
	})
	reactModule.useEffect(function()
		-- upvalues: fFlagEnableVoiceEuConsentPrompt (copy), default (copy), var17 (ref)
		if fFlagEnableVoiceEuConsentPrompt then
			local eventConnection = default.VoiceEuModalConsented.Event:Connect(function()
				-- upvalues: var17 (copy)
				var17(true)
			end)
			
			return function()
				-- upvalues: eventConnection (ref)
				eventConnection:Disconnect()
			end
		end
		return function() end
	end, {})
	reactModule.useEffect(function()
		-- upvalues: var8 (ref), default (copy)
		if var8 then
			default:setAsConnected()
			
			return
		end
		default:setAsDisconnected()
	end, { var8 })
	local var20 = reactModule.useCallback(function(p1, p2, p3)
		-- upvalues: default (copy)
		default:join({ partyId = p1, force = p2, shouldIgnoreMemoryWarning = p3 })
	end, {})
	reactModule.useEffect(function()
		-- upvalues: var18 (ref), fFlagEnableVoiceEuConsentPrompt (copy), var16 (ref), default (copy), var20 (ref), var1 (ref), var4 (ref), var5 (ref), squadPromptTypeModule (copy)
		if not var18 or fFlagEnableVoiceEuConsentPrompt and not var16 then return end
		if default:performJoinFeasibilityCheck() then
			var20(var1)
			
			return
		end
		var4.setSquadPrompt(var5, {
			hideCancelButton = false,
			promptType = squadPromptTypeModule.JoinWithLowMemory,
			onConfirm = function() end,
			onCancel = function()
				-- upvalues: var20 (copy), var1 (copy)
				var20(var1, true, true)
			end
		})
	end, {
		var18,
		if fFlagEnableVoiceEuConsentPrompt then var16 else nil
	})
	local var21 = reactModule.useCallback(function()
		-- upvalues: default (copy)
		default:leave()
	end, {})
	reactModule.useEffect(function()
		-- upvalues: enableDisconnectPartyVoiceIfNeeded (copy), var19 (ref), var21 (ref)
		if enableDisconnectPartyVoiceIfNeeded and var19 then
			var21()
		end
	end, { var19, var21 })
	reactModule.useEffect(function()
		-- upvalues: getFFlagEnableCrossExpVoiceMemoryCheck (copy), var6 (ref), default (copy), var4 (ref), var5 (ref), squadPromptTypeModule (copy), var21 (ref)
		if getFFlagEnableCrossExpVoiceMemoryCheck() then
			local _ = function()
				-- upvalues: var6 (copy)
				if var6.current then
					var6.current:Disconnect()
					var6.current = nil
				end
			end
			
			var6.current = default.MemoryLow.Event:Connect(function()
				-- upvalues: var6 (copy), var4 (copy), var5 (copy), squadPromptTypeModule (copy), var21 (copy)
				if var6.current then
					var6.current:Disconnect()
					var6.current = nil
				end
				var4.setSquadPrompt(var5, {
					hideCancelButton = false,
					promptType = squadPromptTypeModule.DisconnectVoiceDueToLowMemory,
					onConfirm = function()
						-- upvalues: var21 (copy)
						var21()
					end
				})
			end)
			
			return function()
				-- upvalues: var6 (copy)
				if var6.current then
					var6.current:Disconnect()
					var6.current = nil
				end
			end
		end
		return function() end
	end)
	
	return var21
end

return useCrossExperienceVoiceConnector