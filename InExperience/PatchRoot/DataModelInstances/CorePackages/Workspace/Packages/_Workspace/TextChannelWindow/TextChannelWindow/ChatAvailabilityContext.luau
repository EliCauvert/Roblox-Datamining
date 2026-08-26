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
local var1 = reactModule.createContext({
	canChat = true,
	reason = nil,
	messageKey = nil,
	messageFallback = nil
})

return {
	Context = var1,
	Provider = function(p1)
		-- upvalues: playersService (ref), reactModule (ref), useEventConnection (ref), t (ref), t_1 (ref), var1 (ref)
		local subjectPlayer = p1.subjectPlayer or playersService.LocalPlayer
		local var2, var3 = reactModule.useState(function()
			-- upvalues: p1 (ref), subjectPlayer (ref)
			return if p1.value == nil then if subjectPlayer then subjectPlayer.ChatAvailabilityStatus else "Enabled" else p1.value
		end)
		useEventConnection(if p1.value == nil and subjectPlayer then subjectPlayer:GetPropertyChangedSignal("ChatAvailabilityStatus") else nil, function()
			-- upvalues: subjectPlayer (ref), var3 (ref)
			if subjectPlayer then
				var3(subjectPlayer.ChatAvailabilityStatus)
			end
		end, {})
		reactModule.useEffect(function()
			-- upvalues: p1 (ref), var3 (ref)
			if p1.value ~= nil then
				var3(p1.value)
			end
		end, { p1.value })
		
		return reactModule.createElement(var1.Provider, {
			value = reactModule.useMemo(function()
				-- upvalues: var2 (ref), t (copy), t_1 (copy)
				local var4 = t[var2]
				local var5 = if var4 then t_1[var4] else nil
				
				return {
					canChat = var4 == nil,
					reason = var4,
					messageKey = if var5 then var5.key else nil,
					messageFallback = if var5 then var5.fallback else nil
				}
			end, { var2 })
		}, p1.children)
	end,
	resolve = function(p1)
		-- upvalues: t (ref), t_1 (ref)
		local var2 = t[p1]
		local var3 = if var2 then t_1[var2] else nil
		
		return {
			canChat = var2 == nil,
			reason = var2,
			messageKey = if var3 then var3.key else nil,
			messageFallback = if var3 then var3.fallback else nil
		}
	end,
	useLocalUserChatAvailability = function()
		-- upvalues: reactModule (ref), var1 (ref)
		return reactModule.useContext(var1)
	end
}