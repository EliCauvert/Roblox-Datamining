local Parent = script:FindFirstAncestor("InteractionFeedback").Parent
local SoundManagerModule = require(Parent.SoundManager)
local SoundManager = SoundManagerModule.SoundManager
local Sounds = SoundManagerModule.Sounds
local SoundGroups = SoundManagerModule.SoundGroups
local _ = require(script.Parent.InteractionFeedbackContext)
local TriggerHapticModule = require(script.Parent.triggerHaptic)
SoundManager.init()
local FFlagLuaAppHapticTriggeredTelemetry = require(Parent.SharedFlags).FFlagLuaAppHapticTriggeredTelemetry

return function(Text, p1, p2, p3, p4, p5, p6)
	-- upvalues: Sounds (copy), SoundManager (copy), SoundGroups (copy), TriggerHapticModule (copy), FFlagLuaAppHapticTriggeredTelemetry (copy)
	if not p2 then
		error("No config table was provided to InteractionFeedbackManager. Something is wrong.")
	end
	local v1 = p2[Text]
	
	if not v1 then return end
	local v2 = v1[p1]
	
	if not v2 then return end
	local Sound = v2.Sound
	
	if Sound then
		local Sound1 = Sounds[Sound]
		
		if not Sound1 then
			error("Sound " .. Sound .. " not found in SoundManager given contextKey: " .. Text .. " and interactionType: " .. tostring(p1) .. ". Please check the Sounds.lua file.")
		end
		SoundManager:PlaySound(Sound1.Name, {}, SoundGroups.AppBackground)
	end
	local Haptic = v2.Haptic
	
	if Haptic then
		TriggerHapticModule(Haptic, p3, p4, if FFlagLuaAppHapticTriggeredTelemetry then Text else nil, if FFlagLuaAppHapticTriggeredTelemetry then p1 else nil, if FFlagLuaAppHapticTriggeredTelemetry then p5 else nil, if FFlagLuaAppHapticTriggeredTelemetry then p6 else nil)
	end
end