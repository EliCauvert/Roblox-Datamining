local Players = game:GetService("Players")
local Parent = script.Parent.Parent
local ReactModule = require(Parent.React)
local UseEventConnectionFunction = require(Parent.ReactUtils).useEventConnection
local config = {
	GeoBlocked = "geoBlocked",
	SettingsDisabled = "settingsOff",
	SettingsDisabledVpc = "parentalConsent",
	AgeCheckVpc = "parentalConsent",
	AgeVerificationRequired = "ageVerification",
	IdVerificationRequired = "ageVerification",
	AgeCheckGateExperiment = "ageVerification",
	Ineligible = "viewOnly",
	NoOne = "viewOnly"
}
local config1 = {
	geoBlocked = {
		key = "CoreScripts.TextChat.ChatWindow.ChatDisabled.RegionUnavailable",
		fallback = "You can only view system messages here. Chat is not available in your region."
	},
	settingsOff = {
		key = "CoreScripts.TextChat.ChatWindow.ChatDisabled.SettingOff",
		fallback = "You can only view system messages here. Update your Communication settings to turn on chat."
	},
	parentalConsent = {
		key = "CoreScripts.TextChat.ChatWindow.ChatDisabled.AskForPermission",
		fallback = "You can only view system messages here. Ask your parent for permission to chat in Communication settings."
	},
	ageVerification = {
		key = "CoreScripts.TextChat.ChatWindow.ChatDisabled.GetAnAgeCheck",
		fallback = "You can only view system messages here. Get an age check to chat."
	},
	viewOnly = {
		key = "CoreScripts.TextChat.ChatWindow.ChatDisabled.OnlyViewSystemMessages",
		fallback = "You can only view system messages here."
	}
}
local Context = ReactModule.createContext({
	canChat = true,
	reason = nil,
	messageKey = nil,
	messageFallback = nil
})

return {
	Context = Context,
	Provider = function(p1)
		-- upvalues: Players (copy), ReactModule (copy), UseEventConnectionFunction (copy), config (copy), config1 (copy), Context (copy)
		local SubjectPlayer = p1.subjectPlayer or Players.LocalPlayer
		local UseStateResult, UseStateResult2 = ReactModule.useState(function()
			-- upvalues: p1 (copy), SubjectPlayer (copy)
			return if p1.value == nil then if SubjectPlayer then SubjectPlayer.ChatAvailabilityStatus else "Enabled" else p1.value
		end)
		UseEventConnectionFunction(if p1.value == nil and SubjectPlayer then SubjectPlayer:GetPropertyChangedSignal("ChatAvailabilityStatus") else nil, function()
			-- upvalues: SubjectPlayer (copy), UseStateResult2 (copy)
			if SubjectPlayer then
				UseStateResult2(SubjectPlayer.ChatAvailabilityStatus)
			end
		end, {})
		ReactModule.useEffect(function()
			-- upvalues: p1 (copy), UseStateResult2 (copy)
			if p1.value ~= nil then
				UseStateResult2(p1.value)
			end
		end, { p1.value })
		
		return ReactModule.createElement(Context.Provider, {
			value = ReactModule.useMemo(function()
				-- upvalues: UseStateResult (copy), config (upval), config1 (upval)
				local Entry = config[UseStateResult]
				local Entry1 = if Entry then config1[Entry] else nil
				
				return {
					canChat = Entry == nil,
					reason = Entry,
					messageKey = if Entry1 then Entry1.key else nil,
					messageFallback = if Entry1 then Entry1.fallback else nil
				}
			end, { UseStateResult })
		}, p1.children)
	end,
	resolve = function(p1)
		-- upvalues: config (copy), config1 (copy)
		local Entry = config[p1]
		local Entry1 = if Entry then config1[Entry] else nil
		
		return {
			canChat = Entry == nil,
			reason = Entry,
			messageKey = if Entry1 then Entry1.key else nil,
			messageFallback = if Entry1 then Entry1.fallback else nil
		}
	end,
	useLocalUserChatAvailability = function()
		-- upvalues: ReactModule (copy), Context (copy)
		return ReactModule.useContext(Context)
	end
}