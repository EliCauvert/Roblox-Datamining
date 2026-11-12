local AmpV2Wizard = script:FindFirstAncestor("AmpV2Wizard")
local Parent = AmpV2Wizard.Parent
local ReactModule = require(Parent.React)
local Players = game:GetService("Players")
local AuthAnalyticsModule = require(Parent.AuthAnalytics)
local AuthButtonClickFunction = AuthAnalyticsModule.Events.authButtonClick
local AuthFormInteractionFunction = AuthAnalyticsModule.Events.authFormInteraction
local AuthModalShownFunction = AuthAnalyticsModule.Events.authModalShown
local AuthMsgShownFunction = AuthAnalyticsModule.Events.authMsgShown
local AuthPageloadFunction = AuthAnalyticsModule.Events.authPageload
local _ = require(AmpV2Wizard.Types)
local OdpAnalyticsConstantsModule = require(AmpV2Wizard.OdpAnalyticsConstants)

local function joinTokens(List): string
	local List1 = {}
	
	for _, value in List do
		if value ~= nil and value ~= "" then
			table.insert(List1, (tostring(value)))
		end
	end
	return table.concat(List1, " ")
end

local function buildState(p1, p2, p3)
	-- upvalues: joinTokens (copy), Players (copy)
	return joinTokens({
		p1,
		p2,
		tostring(Players.LocalPlayer and Players.LocalPlayer.UserId or 0),
		p3
	})
end

local function _(p1)
	local RequestDetails = if p1 == nil then nil else p1.requestDetails
	
	return if type(RequestDetails) == "table" then RequestDetails else nil
end

local function settingNameFromRequestDetails(List)
	if List == nil then
		return nil
	end
	local v1 = nil
	
	for i in List do
		if type(i) ~= "string" or i == "" or v1 ~= nil then
			return nil
		end
		v1 = i
	end
	return v1
end

local function buildParentalState(GameJoin, p1, p2, p3, p4, p5)
	-- upvalues: OdpAnalyticsConstantsModule (copy), buildState (copy), joinTokens (copy), settingNameFromRequestDetails (copy), Players (copy)
	if p1 == nil or p1 == "" then
		return nil
	end
	local RequestDetails = if p3 == nil then nil else p3.requestDetails
	local RequestDetails1 = if type(RequestDetails) == "table" then RequestDetails else nil
	
	if GameJoin == OdpAnalyticsConstantsModule.Contexts.GameJoin then
		local UniverseId = if p3 == nil then nil else p3.universeId
		
		if UniverseId == nil or tostring(UniverseId) == "" then
			UniverseId = if RequestDetails1 == nil then nil else RequestDetails1.universeId
		end
		return if UniverseId == nil or tostring(UniverseId) == "" then nil else buildState(p1, p2, joinTokens({ UniverseId, "odp", p4 }))
	elseif GameJoin == OdpAnalyticsConstantsModule.Contexts.Settings then
		local SettingNameFromRequestDetailsResult = settingNameFromRequestDetails(RequestDetails1)
		
		return if SettingNameFromRequestDetailsResult == nil then nil else `unlockSetting {SettingNameFromRequestDetailsResult} odp {joinTokens({
			p1,
			p2,
			tostring(Players.LocalPlayer and Players.LocalPlayer.UserId or 0),
			(joinTokens({ p5, p4 }))
		})}`
	else
		return nil
	end
end

local function createOdpAnalytics(AnalyticsStrings, AnalyticsSessionId)
	-- upvalues: OdpAnalyticsConstantsModule (copy), buildState (copy), AuthPageloadFunction (copy), AuthButtonClickFunction (copy), joinTokens (copy), Players (copy), AuthFormInteractionFunction (copy), AuthModalShownFunction (copy), buildParentalState (copy), AuthMsgShownFunction (copy)
	local AnalyticsString = if AnalyticsStrings == nil then nil else AnalyticsStrings[OdpAnalyticsConstantsModule.AGE_GROUP_KEY]
	local AnalyticsString1 = if AnalyticsStrings == nil then nil else AnalyticsStrings[OdpAnalyticsConstantsModule.ASK_COPY_VARIANT_KEY]
	local AnalyticsString2 = if AnalyticsStrings == nil then nil else AnalyticsStrings[OdpAnalyticsConstantsModule.PARENT_SUPERVISION_STATE_KEY]
	local AnalyticsString3 = if AnalyticsStrings == nil then nil else AnalyticsStrings[OdpAnalyticsConstantsModule.INTRO_COPY_VARIANT_KEY]
	
	local function _(p1)
		-- upvalues: buildState (upval), AnalyticsSessionId (copy), AnalyticsString (copy), AnalyticsString3 (copy), OdpAnalyticsConstantsModule (upval)
		return buildState(AnalyticsSessionId, AnalyticsString, p1 or (AnalyticsString3 or OdpAnalyticsConstantsModule.DEFAULT_INTRO_COPY_VARIANT))
	end
	
	local AnalyticsString4 = if AnalyticsStrings == nil then nil else AnalyticsStrings[OdpAnalyticsConstantsModule.PIN_PURPOSE_KEY]
	local AnalyticsString5 = if AnalyticsStrings == nil then nil else AnalyticsStrings[OdpAnalyticsConstantsModule.REVERIFY_REASON_KEY]
	local ReverifyVariant = if AnalyticsString5 == nil then nil else OdpAnalyticsConstantsModule.ReverifyVariants[AnalyticsString5]
	
	local _ = function(p1)
		-- upvalues: AnalyticsString4 (copy), buildState (upval), AnalyticsSessionId (copy), AnalyticsString (copy)
		return buildState(AnalyticsSessionId, AnalyticsString, if AnalyticsString4 == nil or AnalyticsString4 == "" then p1 elseif p1 == nil then AnalyticsString4 else `{AnalyticsString4} {p1}`)
	end
	
	return {
		handoffShown = function()
			-- upvalues: AuthPageloadFunction (upval), OdpAnalyticsConstantsModule (upval), buildState (upval), AnalyticsSessionId (copy), AnalyticsString (copy)
			AuthPageloadFunction(OdpAnalyticsConstantsModule.Contexts.Handoff, buildState(AnalyticsSessionId, AnalyticsString))
		end,
		handoffContinue = function()
			-- upvalues: AuthButtonClickFunction (upval), OdpAnalyticsConstantsModule (upval), buildState (upval), AnalyticsSessionId (copy), AnalyticsString (copy)
			AuthButtonClickFunction(OdpAnalyticsConstantsModule.Contexts.Handoff, OdpAnalyticsConstantsModule.Buttons.ContinueAsParent, buildState(AnalyticsSessionId, AnalyticsString))
		end,
		handoffBack = function()
			-- upvalues: AuthButtonClickFunction (upval), OdpAnalyticsConstantsModule (upval), buildState (upval), AnalyticsSessionId (copy), AnalyticsString (copy)
			AuthButtonClickFunction(OdpAnalyticsConstantsModule.Contexts.Handoff, OdpAnalyticsConstantsModule.Buttons.Back, buildState(AnalyticsSessionId, AnalyticsString))
		end,
		agreementShown = function(p1)
			-- upvalues: AuthPageloadFunction (upval), OdpAnalyticsConstantsModule (upval), AnalyticsSessionId (copy), AnalyticsString (copy), AnalyticsString3 (copy), joinTokens (upval), Players (upval)
			AuthPageloadFunction(OdpAnalyticsConstantsModule.Contexts.Intro, joinTokens({
				AnalyticsSessionId,
				AnalyticsString,
				tostring(Players.LocalPlayer and Players.LocalPlayer.UserId or 0),
				p1 or (AnalyticsString3 or OdpAnalyticsConstantsModule.DEFAULT_INTRO_COPY_VARIANT)
			}), nil, nil, nil, OdpAnalyticsConstantsModule.AssociatedText.AgreementScreen)
		end,
		agreementContinue = function(p1)
			-- upvalues: AuthButtonClickFunction (upval), OdpAnalyticsConstantsModule (upval), AnalyticsSessionId (copy), AnalyticsString (copy), AnalyticsString3 (copy), joinTokens (upval), Players (upval)
			AuthButtonClickFunction(OdpAnalyticsConstantsModule.Contexts.Intro, OdpAnalyticsConstantsModule.Buttons.Continue, joinTokens({
				AnalyticsSessionId,
				AnalyticsString,
				tostring(Players.LocalPlayer and Players.LocalPlayer.UserId or 0),
				p1 or (AnalyticsString3 or OdpAnalyticsConstantsModule.DEFAULT_INTRO_COPY_VARIANT)
			}), nil, nil, nil, nil, OdpAnalyticsConstantsModule.AssociatedText.AgreementContinue)
		end,
		agreementBack = function(p1)
			-- upvalues: AuthButtonClickFunction (upval), OdpAnalyticsConstantsModule (upval), AnalyticsSessionId (copy), AnalyticsString (copy), AnalyticsString3 (copy), joinTokens (upval), Players (upval)
			AuthButtonClickFunction(OdpAnalyticsConstantsModule.Contexts.Intro, OdpAnalyticsConstantsModule.Buttons.Back, joinTokens({
				AnalyticsSessionId,
				AnalyticsString,
				tostring(Players.LocalPlayer and Players.LocalPlayer.UserId or 0),
				p1 or (AnalyticsString3 or OdpAnalyticsConstantsModule.DEFAULT_INTRO_COPY_VARIANT)
			}), nil, nil, nil, nil, OdpAnalyticsConstantsModule.AssociatedText.AgreementBack)
		end,
		agreementTerms = function(p1)
			-- upvalues: AuthButtonClickFunction (upval), OdpAnalyticsConstantsModule (upval), AnalyticsSessionId (copy), AnalyticsString (copy), AnalyticsString3 (copy), joinTokens (upval), Players (upval)
			AuthButtonClickFunction(OdpAnalyticsConstantsModule.Contexts.Intro, OdpAnalyticsConstantsModule.Buttons.Terms, joinTokens({
				AnalyticsSessionId,
				AnalyticsString,
				tostring(Players.LocalPlayer and Players.LocalPlayer.UserId or 0),
				p1 or (AnalyticsString3 or OdpAnalyticsConstantsModule.DEFAULT_INTRO_COPY_VARIANT)
			}), nil, nil, nil, nil, OdpAnalyticsConstantsModule.AssociatedText.AgreementTerms)
		end,
		agreementPrivacy = function(p1)
			-- upvalues: AuthButtonClickFunction (upval), OdpAnalyticsConstantsModule (upval), AnalyticsSessionId (copy), AnalyticsString (copy), AnalyticsString3 (copy), joinTokens (upval), Players (upval)
			AuthButtonClickFunction(OdpAnalyticsConstantsModule.Contexts.Intro, OdpAnalyticsConstantsModule.Buttons.Privacy, joinTokens({
				AnalyticsSessionId,
				AnalyticsString,
				tostring(Players.LocalPlayer and Players.LocalPlayer.UserId or 0),
				p1 or (AnalyticsString3 or OdpAnalyticsConstantsModule.DEFAULT_INTRO_COPY_VARIANT)
			}), nil, nil, nil, nil, OdpAnalyticsConstantsModule.AssociatedText.AgreementPrivacy)
		end,
		verificationMethodSelectorShown = function(p1)
			-- upvalues: AuthPageloadFunction (upval), OdpAnalyticsConstantsModule (upval), AnalyticsSessionId (copy), AnalyticsString (copy), joinTokens (upval), Players (upval)
			AuthPageloadFunction(OdpAnalyticsConstantsModule.Contexts.VerifyMethod, joinTokens({
				AnalyticsSessionId,
				AnalyticsString,
				tostring(Players.LocalPlayer and Players.LocalPlayer.UserId or 0),
				nil
			}), nil, nil, p1, OdpAnalyticsConstantsModule.AssociatedText.VerificationMethodSelector)
		end,
		verificationMethodSelected = function(p1)
			-- upvalues: AuthFormInteractionFunction (upval), OdpAnalyticsConstantsModule (upval), AnalyticsSessionId (copy), AnalyticsString (copy), joinTokens (upval), Players (upval)
			AuthFormInteractionFunction(OdpAnalyticsConstantsModule.Contexts.VerifyMethod, OdpAnalyticsConstantsModule.Fields.VerifyMethod, joinTokens({
				AnalyticsSessionId,
				AnalyticsString,
				tostring(Players.LocalPlayer and Players.LocalPlayer.UserId or 0),
				p1
			}), nil, nil, OdpAnalyticsConstantsModule.AssociatedText.VerificationMethodOptions)
		end,
		verificationMethodContinue = function(p1)
			-- upvalues: AuthButtonClickFunction (upval), OdpAnalyticsConstantsModule (upval), AnalyticsSessionId (copy), AnalyticsString (copy), joinTokens (upval), Players (upval)
			AuthButtonClickFunction(OdpAnalyticsConstantsModule.Contexts.VerifyMethod, OdpAnalyticsConstantsModule.Buttons.Continue, joinTokens({
				AnalyticsSessionId,
				AnalyticsString,
				tostring(Players.LocalPlayer and Players.LocalPlayer.UserId or 0),
				p1
			}), nil, nil, nil, nil, OdpAnalyticsConstantsModule.AssociatedText.VerificationMethodContinue)
		end,
		verificationMethodBack = function()
			-- upvalues: AuthButtonClickFunction (upval), OdpAnalyticsConstantsModule (upval), AnalyticsSessionId (copy), AnalyticsString (copy), joinTokens (upval), Players (upval)
			AuthButtonClickFunction(OdpAnalyticsConstantsModule.Contexts.VerifyMethod, OdpAnalyticsConstantsModule.Buttons.Back, joinTokens({
				AnalyticsSessionId,
				AnalyticsString,
				tostring(Players.LocalPlayer and Players.LocalPlayer.UserId or 0),
				nil
			}), nil, nil, nil, nil, OdpAnalyticsConstantsModule.AssociatedText.VerificationMethodBack)
		end,
		verificationFailed = function(p1, p2)
			-- upvalues: AuthModalShownFunction (upval), OdpAnalyticsConstantsModule (upval), AnalyticsSessionId (copy), AnalyticsString (copy), joinTokens (upval), Players (upval)
			AuthModalShownFunction(OdpAnalyticsConstantsModule.Contexts.VerifyMethod, joinTokens({
				AnalyticsSessionId,
				AnalyticsString,
				tostring(Players.LocalPlayer and Players.LocalPlayer.UserId or 0),
				p1
			}), OdpAnalyticsConstantsModule.Fields.VerificationFailed, nil, OdpAnalyticsConstantsModule.AssociatedText.VerificationFailed, p2)
		end,
		prologueShown = function(GameJoin, p1, p2)
			-- upvalues: OdpAnalyticsConstantsModule (upval), buildParentalState (upval), AnalyticsString (copy), AnalyticsString1 (copy), AuthModalShownFunction (upval)
			if GameJoin ~= OdpAnalyticsConstantsModule.Contexts.GameJoin then return end
			local ParentalState = buildParentalState(GameJoin, p1, AnalyticsString, p2, AnalyticsString1, nil)
			
			if ParentalState ~= nil then
				AuthModalShownFunction(GameJoin, ParentalState, OdpAnalyticsConstantsModule.Fields.AskParent, nil, OdpAnalyticsConstantsModule.AssociatedText.AskParent)
			end
		end,
		prologueButtonClick = function(Settings, p1, p2, p3)
			-- upvalues: OdpAnalyticsConstantsModule (upval), buildParentalState (upval), AnalyticsString (copy), AnalyticsString1 (copy), AnalyticsString2 (copy), AuthButtonClickFunction (upval)
			local IsSettingsMatch = Settings == OdpAnalyticsConstantsModule.Contexts.Settings
			local AskInPerson = if p3 == "ODP" then OdpAnalyticsConstantsModule.Buttons.AskInPerson elseif p3 == "Remote" then if IsSettingsMatch then OdpAnalyticsConstantsModule.Buttons.EmailParent else OdpAnalyticsConstantsModule.Buttons.AskParent elseif p3 == "Cancel" then if IsSettingsMatch then OdpAnalyticsConstantsModule.Buttons.Cancel else OdpAnalyticsConstantsModule.Buttons.CancelAskParent else nil
			
			if AskInPerson == nil then return end
			local AskInPerson1 = if p3 == "ODP" then OdpAnalyticsConstantsModule.AssociatedText.AskInPerson elseif p3 == "Remote" then OdpAnalyticsConstantsModule.AssociatedText.EmailParent else OdpAnalyticsConstantsModule.AssociatedText.Cancel
			local ParentalState = buildParentalState(Settings, p1, AnalyticsString, p2, if IsSettingsMatch or p3 == "Cancel" then nil else AnalyticsString1, if IsSettingsMatch and p3 == "ODP" then AnalyticsString2 else nil)
			
			if ParentalState ~= nil then
				AuthButtonClickFunction(Settings, AskInPerson, ParentalState, nil, nil, nil, nil, AskInPerson1)
			end
		end,
		remoteRequestSent = function(p1, p2, p3)
			-- upvalues: buildParentalState (upval), AnalyticsString (copy), AuthMsgShownFunction (upval), OdpAnalyticsConstantsModule (upval)
			if p1 == nil then return end
			local ParentalState = buildParentalState(p1, p2, AnalyticsString, p3, nil, nil)
			
			if ParentalState ~= nil then
				AuthMsgShownFunction(p1, ParentalState, OdpAnalyticsConstantsModule.Fields.RequestSentToast, nil, OdpAnalyticsConstantsModule.AssociatedText.RequestSent)
			end
		end,
		pinEntryShown = function()
			-- upvalues: AuthPageloadFunction (upval), OdpAnalyticsConstantsModule (upval), AnalyticsString4 (copy), AnalyticsSessionId (copy), AnalyticsString (copy), joinTokens (upval), Players (upval)
			AuthPageloadFunction(OdpAnalyticsConstantsModule.Contexts.PinEntry, joinTokens({
				AnalyticsSessionId,
				AnalyticsString,
				tostring(Players.LocalPlayer and Players.LocalPlayer.UserId or 0),
				if AnalyticsString4 == nil or AnalyticsString4 == "" then nil else AnalyticsString4
			}), nil, nil, nil, if AnalyticsString4 == nil or AnalyticsString4 == "" then nil else OdpAnalyticsConstantsModule.AssociatedText.PinEntryShown)
		end,
		pinEntryDigitsChanged = function(p1)
			-- upvalues: AuthFormInteractionFunction (upval), OdpAnalyticsConstantsModule (upval), AnalyticsString4 (copy), AnalyticsSessionId (copy), AnalyticsString (copy), joinTokens (upval), Players (upval)
			local Text = tostring(p1)
			AuthFormInteractionFunction(OdpAnalyticsConstantsModule.Contexts.PinEntry, OdpAnalyticsConstantsModule.Fields.PinEntry, joinTokens({
				AnalyticsSessionId,
				AnalyticsString,
				tostring(Players.LocalPlayer and Players.LocalPlayer.UserId or 0),
				if AnalyticsString4 == nil or AnalyticsString4 == "" then Text elseif Text == nil then AnalyticsString4 else `{AnalyticsString4} {Text}`
			}), nil, nil, OdpAnalyticsConstantsModule.AssociatedText.PinEntry)
		end,
		pinEntryRevealToggled = function(p1)
			-- upvalues: AuthFormInteractionFunction (upval), OdpAnalyticsConstantsModule (upval), AnalyticsString4 (copy), AnalyticsSessionId (copy), AnalyticsString (copy), joinTokens (upval), Players (upval)
			local Shown = if p1 then OdpAnalyticsConstantsModule.PinRevealStates.Shown else OdpAnalyticsConstantsModule.PinRevealStates.Hidden
			AuthFormInteractionFunction(OdpAnalyticsConstantsModule.Contexts.PinEntry, OdpAnalyticsConstantsModule.Fields.PinShowToggle, joinTokens({
				AnalyticsSessionId,
				AnalyticsString,
				tostring(Players.LocalPlayer and Players.LocalPlayer.UserId or 0),
				if AnalyticsString4 == nil or AnalyticsString4 == "" then Shown elseif Shown == nil then AnalyticsString4 else `{AnalyticsString4} {Shown}`
			}), nil, nil, if p1 then OdpAnalyticsConstantsModule.AssociatedText.PinShowToggle else OdpAnalyticsConstantsModule.AssociatedText.PinHideToggle)
		end,
		pinEntryForgotPin = function()
			-- upvalues: AuthButtonClickFunction (upval), OdpAnalyticsConstantsModule (upval), AnalyticsString4 (copy), AnalyticsSessionId (copy), AnalyticsString (copy), joinTokens (upval), Players (upval)
			AuthButtonClickFunction(OdpAnalyticsConstantsModule.Contexts.PinEntry, OdpAnalyticsConstantsModule.Buttons.ForgotPin, joinTokens({
				AnalyticsSessionId,
				AnalyticsString,
				tostring(Players.LocalPlayer and Players.LocalPlayer.UserId or 0),
				if AnalyticsString4 == nil or AnalyticsString4 == "" then nil else AnalyticsString4
			}), nil, nil, nil, nil, OdpAnalyticsConstantsModule.AssociatedText.ForgotPin)
		end,
		pinEntryIncorrect = function()
			-- upvalues: AuthMsgShownFunction (upval), OdpAnalyticsConstantsModule (upval), AnalyticsString4 (copy), AnalyticsSessionId (copy), AnalyticsString (copy), joinTokens (upval), Players (upval)
			AuthMsgShownFunction(OdpAnalyticsConstantsModule.Contexts.PinEntry, joinTokens({
				AnalyticsSessionId,
				AnalyticsString,
				tostring(Players.LocalPlayer and Players.LocalPlayer.UserId or 0),
				if AnalyticsString4 == nil or AnalyticsString4 == "" then nil else AnalyticsString4
			}), OdpAnalyticsConstantsModule.Fields.PinIncorrect)
		end,
		reverifyShown = function()
			-- upvalues: ReverifyVariant (copy), AuthModalShownFunction (upval), OdpAnalyticsConstantsModule (upval), AnalyticsSessionId (copy), AnalyticsString (copy), joinTokens (upval), Players (upval)
			if ReverifyVariant ~= nil then
				AuthModalShownFunction(OdpAnalyticsConstantsModule.Contexts.PinRecovery, joinTokens({
					AnalyticsSessionId,
					AnalyticsString,
					tostring(Players.LocalPlayer and Players.LocalPlayer.UserId or 0),
					nil
				}), ReverifyVariant.field, nil, ReverifyVariant.associatedText)
				
				return
			end
		end,
		reverifyButtonClick = function(p1)
			-- upvalues: ReverifyVariant (copy), AuthButtonClickFunction (upval), OdpAnalyticsConstantsModule (upval), AnalyticsSessionId (copy), AnalyticsString (copy), joinTokens (upval), Players (upval)
			local Button = if ReverifyVariant == nil then nil else ReverifyVariant.buttons[p1]
			
			if Button ~= nil then
				AuthButtonClickFunction(OdpAnalyticsConstantsModule.Contexts.PinRecovery, Button.btn, joinTokens({
					AnalyticsSessionId,
					AnalyticsString,
					tostring(Players.LocalPlayer and Players.LocalPlayer.UserId or 0),
					nil
				}), nil, nil, nil, nil, Button.associatedText)
				
				return
			end
		end,
		reverifyClose = function()
			-- upvalues: ReverifyVariant (copy), AuthButtonClickFunction (upval), OdpAnalyticsConstantsModule (upval), AnalyticsSessionId (copy), AnalyticsString (copy), joinTokens (upval), Players (upval)
			if ReverifyVariant ~= nil then
				AuthButtonClickFunction(OdpAnalyticsConstantsModule.Contexts.PinRecovery, OdpAnalyticsConstantsModule.Buttons.Close, joinTokens({
					AnalyticsSessionId,
					AnalyticsString,
					tostring(Players.LocalPlayer and Players.LocalPlayer.UserId or 0),
					nil
				}), nil, nil, nil, nil, OdpAnalyticsConstantsModule.AssociatedText.PinRecoveryClose)
				
				return
			end
		end
	}
end

return {
	childUserId = function(): string
		-- upvalues: Players (copy)
		return (tostring(Players.LocalPlayer and Players.LocalPlayer.UserId or 0))
	end,
	joinTokens = joinTokens,
	createOdpAnalytics = createOdpAnalytics,
	useOdpAnalytics = function(p1)
		-- upvalues: ReactModule (copy), createOdpAnalytics (copy)
		return ReactModule.useMemo(function()
			-- upvalues: createOdpAnalytics (upval), p1 (copy)
			return (createOdpAnalytics(p1.analyticsStrings, p1.analyticsSessionId))
		end, { p1.analyticsStrings, p1.analyticsSessionId })
	end
}