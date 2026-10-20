local Players = game:GetService("Players")
local ThirdPartyUserService = game:GetService("ThirdPartyUserService")
local SquadsCore = script:FindFirstAncestor("SquadsCore")
local Parent = SquadsCore.Parent
local UseCurrentSquadMemberModule = require(script.Parent.useCurrentSquadMember)
local UseIsLocalPlayerPartyVoiceEligibleModule = require(script.Parent.useIsLocalPlayerPartyVoiceEligible)
local UseIsCurrentSquadPartyVoiceEligibleModule = require(script.Parent.useIsCurrentSquadPartyVoiceEligible)
local SquadExternalContractContextModule = require(SquadsCore.Components.SquadExternalContractProvider.SquadExternalContractContext)
local SquadPromptTypeModule = require(SquadsCore.Enums.SquadPromptType)
local DisplayEuConsentPromptModule = require(SquadsCore.Utils.displayEuConsentPrompt)
local GetTableAppStorageKeyFunction = require(SquadsCore.Utils.appStorageAccess).getTableAppStorageKey
local UseCurrentSquadIdModule = require(SquadsCore.Hooks.useCurrentSquadId)
local CrossExperienceVoiceModule = require(Parent.CrossExperienceVoice)
local LuauPolyfillModule = require(Parent.LuauPolyfill)
local ReactModule = require(Parent.React)
local UseDispatchFunction = require(Parent.RoactUtils).Hooks.RoactRodux.useDispatch
local UseStoreFunction = require(Parent.RoactUtils).Hooks.RoactRodux.useStore
local SharedFlagsModule = require(Parent.SharedFlags)
local GetFFlagEnableCrossExpVoiceMemoryCheckFunction = SharedFlagsModule.getFFlagEnableCrossExpVoiceMemoryCheck
local FFlagEnableVoiceEuConsentPrompt = SharedFlagsModule.FFlagEnableVoiceEuConsentPrompt
local ClearIntervalFunction = LuauPolyfillModule.clearInterval
local SetIntervalFunction = LuauPolyfillModule.setInterval
local Default = CrossExperienceVoiceModule.CrossExperienceVoiceManager.default
local UseIsBackgroundDMActiveFunction = CrossExperienceVoiceModule.Hooks.useIsBackgroundDMActive
local UseIsVoiceRetriableErrorFunction = CrossExperienceVoiceModule.Hooks.useIsVoiceRetriableError
local SQUADVOICEEUMODALCONSENTGIVENKEY = require(SquadsCore.Common.Constants).SQUAD_VOICE_EU_MODAL_CONSENT_GIVEN_KEY
local SQUADVOICEEUMODALSEENKEY = require(SquadsCore.Common.Constants).SQUAD_VOICE_EU_MODAL_SEEN_KEY
local EnableDisconnectPartyVoiceIfNeeded = game:DefineFastFlag("EnableDisconnectPartyVoiceIfNeeded", false)
local EnablePartyVoiceRestrictionStatus = game:DefineFastFlag("EnablePartyVoiceRestrictionStatus", false)
local PartyVoiceRestrictionStatusMaxAttempts = game:DefineFastInt("PartyVoiceRestrictionStatusMaxAttempts", 10)

function useCrossExperienceVoiceConnector()
	-- upvalues: Players (copy), UseCurrentSquadIdModule (copy), UseCurrentSquadMemberModule (copy), UseDispatchFunction (copy), ReactModule (copy), SquadExternalContractContextModule (copy), UseStoreFunction (copy), UseIsCurrentSquadPartyVoiceEligibleModule (copy), UseIsBackgroundDMActiveFunction (copy), UseIsLocalPlayerPartyVoiceEligibleModule (copy), UseIsVoiceRetriableErrorFunction (copy), EnablePartyVoiceRestrictionStatus (copy), ThirdPartyUserService (copy), EnableDisconnectPartyVoiceIfNeeded (copy), PartyVoiceRestrictionStatusMaxAttempts (copy), SetIntervalFunction (copy), ClearIntervalFunction (copy), FFlagEnableVoiceEuConsentPrompt (copy), GetTableAppStorageKeyFunction (copy), SQUADVOICEEUMODALCONSENTGIVENKEY (copy), SQUADVOICEEUMODALSEENKEY (copy), DisplayEuConsentPromptModule (copy), Default (copy), SquadPromptTypeModule (copy), GetFFlagEnableCrossExpVoiceMemoryCheckFunction (copy)
	local UserId = Players and Players.LocalPlayer and Players.LocalPlayer.UserId or 0
	local UseCurrentSquadIdModuleResult = UseCurrentSquadIdModule() or ""
	local UseCurrentSquadMemberModuleResult = UseCurrentSquadMemberModule(UserId)
	local UseDispatchResult = UseDispatchFunction()
	local UseContextResult = ReactModule.useContext(SquadExternalContractContextModule)
	local UseStoreResult = UseStoreFunction()
	local UseRefResult = ReactModule.useRef(nil)
	local UseIsCurrentSquadPartyVoiceEligibleModuleResult = UseIsCurrentSquadPartyVoiceEligibleModule()
	local UseIsBackgroundDMActiveResult = UseIsBackgroundDMActiveFunction()
	local UseIsLocalPlayerPartyVoiceEligibleModuleResult, UseIsLocalPlayerPartyVoiceEligibleModuleResult2 = UseIsLocalPlayerPartyVoiceEligibleModule()
	local UseIsVoiceRetriableErrorResult = UseIsVoiceRetriableErrorFunction()
	local ChatRestrictionStatus = nil
	local Callback = nil
	
	if EnablePartyVoiceRestrictionStatus then
		ChatRestrictionStatus, Callback = ReactModule.useState(if ThirdPartyUserService and ThirdPartyUserService:IsChatRestrictionSupported() then ThirdPartyUserService:GetVoiceChatRestrictionStatus() else Enum.ChatRestrictionStatus.NotRestricted)
	end
	local UseStateResult, UseStateResult2 = ReactModule.useState(false)
	local NoEnablePartyVoiceRestrictionStatus: boolean = UseCurrentSquadIdModuleResult and (UseCurrentSquadIdModuleResult ~= "" and (UseCurrentSquadMemberModuleResult and (not UseIsBackgroundDMActiveResult and (UseIsCurrentSquadPartyVoiceEligibleModuleResult and (UseIsLocalPlayerPartyVoiceEligibleModuleResult and (not UseIsVoiceRetriableErrorResult and (not EnablePartyVoiceRestrictionStatus or ChatRestrictionStatus == Enum.ChatRestrictionStatus.NotRestricted)))))))
	local UseIsBackgroundDMActiveResult1 = if EnableDisconnectPartyVoiceIfNeeded then if UseCurrentSquadIdModuleResult and UseCurrentSquadIdModuleResult ~= "" and UseCurrentSquadMemberModuleResult and UseIsCurrentSquadPartyVoiceEligibleModuleResult ~= false and (UseIsLocalPlayerPartyVoiceEligibleModuleResult2 or UseIsLocalPlayerPartyVoiceEligibleModuleResult) then UseIsVoiceRetriableErrorResult and UseIsBackgroundDMActiveResult else UseIsBackgroundDMActiveResult else false
	
	if EnablePartyVoiceRestrictionStatus then
		ReactModule.useEffect(function()
			-- upvalues: ChatRestrictionStatus (ref), ThirdPartyUserService (upval), Callback (ref), PartyVoiceRestrictionStatusMaxAttempts (upval), SetIntervalFunction (upval), ClearIntervalFunction (upval)
			if ChatRestrictionStatus ~= Enum.ChatRestrictionStatus.Unknown then return end
			if not ThirdPartyUserService or not ThirdPartyUserService:IsChatRestrictionSupported() then
				Callback(Enum.ChatRestrictionStatus.NotRestricted)
				
				return
			end
			local Count = 0
			local SetIntervalResult = SetIntervalFunction(function()
				-- upvalues: Count (ref), ThirdPartyUserService (upval), Callback (upval), PartyVoiceRestrictionStatusMaxAttempts (upval)
				Count += 1
				local VoiceChatRestrictionStatus = ThirdPartyUserService:GetVoiceChatRestrictionStatus()
				
				if VoiceChatRestrictionStatus == Enum.ChatRestrictionStatus.NotRestricted or VoiceChatRestrictionStatus == Enum.ChatRestrictionStatus.Restricted then
					Callback(VoiceChatRestrictionStatus)
					
					return
				end
				if PartyVoiceRestrictionStatusMaxAttempts <= Count then
					Callback(Enum.ChatRestrictionStatus.Restricted)
				end
			end, 4000)
			Count += 1
			local VoiceChatRestrictionStatus = ThirdPartyUserService:GetVoiceChatRestrictionStatus()
			
			if VoiceChatRestrictionStatus == Enum.ChatRestrictionStatus.NotRestricted or VoiceChatRestrictionStatus == Enum.ChatRestrictionStatus.Restricted then
				Callback(VoiceChatRestrictionStatus)
			elseif PartyVoiceRestrictionStatusMaxAttempts <= Count then
				Callback(Enum.ChatRestrictionStatus.Restricted)
			end
			return function()
				-- upvalues: ClearIntervalFunction (upval), SetIntervalResult (copy)
				ClearIntervalFunction(SetIntervalResult)
			end
		end, { ChatRestrictionStatus })
	end
	ReactModule.useEffect(function()
		-- upvalues: FFlagEnableVoiceEuConsentPrompt (upval), NoEnablePartyVoiceRestrictionStatus (copy), GetTableAppStorageKeyFunction (upval), SQUADVOICEEUMODALCONSENTGIVENKEY (upval), UserId (copy), UseStateResult2 (copy)
		if FFlagEnableVoiceEuConsentPrompt and NoEnablePartyVoiceRestrictionStatus and GetTableAppStorageKeyFunction(SQUADVOICEEUMODALCONSENTGIVENKEY)[tostring(UserId)] then
			UseStateResult2(true)
		end
	end, { UserId, NoEnablePartyVoiceRestrictionStatus })
	ReactModule.useEffect(function()
		-- upvalues: FFlagEnableVoiceEuConsentPrompt (upval), NoEnablePartyVoiceRestrictionStatus (copy), UserId (copy), GetTableAppStorageKeyFunction (upval), SQUADVOICEEUMODALSEENKEY (upval), SQUADVOICEEUMODALCONSENTGIVENKEY (upval), UseDispatchResult (copy), DisplayEuConsentPromptModule (upval), UseContextResult (copy)
		if FFlagEnableVoiceEuConsentPrompt and NoEnablePartyVoiceRestrictionStatus then
			local Text = tostring(UserId)
			local TableAppStorageKey = GetTableAppStorageKeyFunction(SQUADVOICEEUMODALSEENKEY)
			
			if not TableAppStorageKey[Text] then
				UseDispatchResult(DisplayEuConsentPromptModule(UseContextResult.setSquadPrompt, Text, TableAppStorageKey, (GetTableAppStorageKeyFunction(SQUADVOICEEUMODALCONSENTGIVENKEY))))
			end
		end
	end, {
		UserId,
		DisplayEuConsentPromptModule,
		NoEnablePartyVoiceRestrictionStatus,
		UseContextResult.setSquadPrompt
	})
	ReactModule.useEffect(function()
		-- upvalues: FFlagEnableVoiceEuConsentPrompt (upval), Default (upval), UseStateResult2 (copy)
		if FFlagEnableVoiceEuConsentPrompt then
			local EventConnection = Default.VoiceEuModalConsented.Event:Connect(function()
				-- upvalues: UseStateResult2 (upval)
				UseStateResult2(true)
			end)
			
			return function()
				-- upvalues: EventConnection (copy)
				EventConnection:Disconnect()
			end
		else
			return function() end
		end
	end, {})
	ReactModule.useEffect(function()
		-- upvalues: UseIsBackgroundDMActiveResult (copy), Default (upval)
		if UseIsBackgroundDMActiveResult then
			Default:setAsConnected()
			
			return
		else
			Default:setAsDisconnected()
		end
	end, { UseIsBackgroundDMActiveResult })
	local UseResult = ReactModule.useCallback(function(PartyId, Force, ShouldIgnoreMemoryWarning)
		-- upvalues: Default (upval)
		Default:join({
			partyId = PartyId,
			force = Force,
			shouldIgnoreMemoryWarning = ShouldIgnoreMemoryWarning
		})
	end, {})
	ReactModule.useEffect(function()
		-- upvalues: NoEnablePartyVoiceRestrictionStatus (copy), FFlagEnableVoiceEuConsentPrompt (upval), UseStateResult (copy), Default (upval), UseResult (copy), UseCurrentSquadIdModuleResult (copy), UseContextResult (copy), UseStoreResult (copy), SquadPromptTypeModule (upval)
		if not NoEnablePartyVoiceRestrictionStatus or FFlagEnableVoiceEuConsentPrompt and not UseStateResult then return end
		if Default:performJoinFeasibilityCheck() then
			UseResult(UseCurrentSquadIdModuleResult)
			
			return
		else
			UseContextResult.setSquadPrompt(UseStoreResult, {
				hideCancelButton = false,
				promptType = SquadPromptTypeModule.JoinWithLowMemory,
				onConfirm = function() end,
				onCancel = function()
					-- upvalues: UseResult (upval), UseCurrentSquadIdModuleResult (upval)
					UseResult(UseCurrentSquadIdModuleResult, true, true)
				end
			})
		end
	end, {
		NoEnablePartyVoiceRestrictionStatus,
		if FFlagEnableVoiceEuConsentPrompt then UseStateResult else nil
	})
	local UseResult1 = ReactModule.useCallback(function()
		-- upvalues: Default (upval)
		Default:leave()
	end, {})
	ReactModule.useEffect(function()
		-- upvalues: EnableDisconnectPartyVoiceIfNeeded (upval), UseIsBackgroundDMActiveResult1 (copy), UseResult1 (copy)
		if EnableDisconnectPartyVoiceIfNeeded and UseIsBackgroundDMActiveResult1 then
			UseResult1()
		end
	end, { UseIsBackgroundDMActiveResult1, UseResult1 })
	ReactModule.useEffect(function()
		-- upvalues: GetFFlagEnableCrossExpVoiceMemoryCheckFunction (upval), UseRefResult (copy), Default (upval), UseContextResult (copy), UseStoreResult (copy), SquadPromptTypeModule (upval), UseResult1 (copy)
		if GetFFlagEnableCrossExpVoiceMemoryCheckFunction() then
			local function _()
				-- upvalues: UseRefResult (upval)
				if UseRefResult.current then
					UseRefResult.current:Disconnect()
					UseRefResult.current = nil
				end
			end
			
			UseRefResult.current = Default.MemoryLow.Event:Connect(function()
				-- upvalues: UseRefResult (upval), UseContextResult (upval), UseStoreResult (upval), SquadPromptTypeModule (upval), UseResult1 (upval)
				if UseRefResult.current then
					UseRefResult.current:Disconnect()
					UseRefResult.current = nil
				end
				UseContextResult.setSquadPrompt(UseStoreResult, {
					hideCancelButton = false,
					promptType = SquadPromptTypeModule.DisconnectVoiceDueToLowMemory,
					onConfirm = function()
						-- upvalues: UseResult1 (upval)
						UseResult1()
					end
				})
			end)
			
			return function()
				-- upvalues: UseRefResult (upval)
				if UseRefResult.current then
					UseRefResult.current:Disconnect()
					UseRefResult.current = nil
				end
			end
		else
			return function() end
		end
	end)
	
	return UseResult1
end

return useCrossExperienceVoiceConnector