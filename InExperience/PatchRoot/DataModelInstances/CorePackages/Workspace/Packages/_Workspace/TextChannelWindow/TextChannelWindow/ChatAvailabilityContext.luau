local playersService = game:GetService("Players")
local parent = script.Parent.Parent
local reactModule = require(parent.React)
local useEventConnection = require(parent.ReactUtils).useEventConnection
local t = {
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
local t_1 = {
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
local var4 = reactModule.createContext({
	canChat = true,
	reason = nil,
	messageKey = nil,
	messageFallback = nil
})

return {
	Context = var4,
	Provider = function(p0) --[[ line: 84 ]]
		-- upvalues: playersService (ref), reactModule (ref), useEventConnection (ref), t (ref), t_1 (ref), var4 (ref)
		local subjectPlayer = p0.subjectPlayer or playersService.LocalPlayer
		local var6, var7 = reactModule.useState(function() --[[ line: 87 ]]
			-- upvalues: p0 (ref), subjectPlayer (ref)
			return if p0.value == nil then if subjectPlayer then subjectPlayer.ChatAvailabilityStatus else "Enabled" else p0.value
		end)
		useEventConnection(if p0.value == nil and subjectPlayer then subjectPlayer:GetPropertyChangedSignal("ChatAvailabilityStatus") else nil, function() --[[ line: 97 ]]
			-- upvalues: subjectPlayer (ref), var7 (ref)
			if subjectPlayer then
				var7(subjectPlayer.ChatAvailabilityStatus)
			end
		end, {})
		reactModule.useEffect(function() --[[ line: 107 ]]
			-- upvalues: p0 (ref), var7 (ref)
			if p0.value ~= nil then
				var7(p0.value)
			end
		end, { p0.value })
		
		return reactModule.createElement(var4.Provider, {
			value = reactModule.useMemo(function() --[[ line: 114 ]]
				-- upvalues: var6 (ref), t (copy), t_1 (copy)
				local var8 = t[var6]
				local var9 = if var8 then t_1[var8] else nil
				
				return {
					canChat = var8 == nil,
					reason = var8,
					messageKey = if var9 then var9.key else nil,
					messageFallback = if var9 then var9.fallback else nil
				}
			end, { var6 })
		}, p0.children)
	end,
	resolve = function(p1) --[[ line: 54 ]]
		-- upvalues: t (ref), t_1 (ref)
		local var10 = t[p1]
		local var11 = if var10 then t_1[var10] else nil
		
		return {
			canChat = var10 == nil,
			reason = var10,
			messageKey = if var11 then var11.key else nil,
			messageFallback = if var11 then var11.fallback else nil
		}
	end,
	useLocalUserChatAvailability = function() --[[ line: 123 ]]
		-- upvalues: reactModule (ref), var4 (ref)
		return reactModule.useContext(var4)
	end
}