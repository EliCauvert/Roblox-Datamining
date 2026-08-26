local parent = script:FindFirstAncestor("InteractionFeedback").Parent
local soundManagerModule = require(parent.SoundManager)
local soundManager = soundManagerModule.SoundManager
local sounds = soundManagerModule.Sounds
local soundGroups = soundManagerModule.SoundGroups
local _ = require(script.Parent.InteractionFeedbackContext)
local triggerHapticModule = require(script.Parent.triggerHaptic)
soundManager.init()
local fFlagLuaAppHapticTriggeredTelemetry = require(parent.SharedFlags).FFlagLuaAppHapticTriggeredTelemetry

return function(p1, p2, p3, p4, p5, p6, p7)
	-- upvalues: sounds (ref), soundManager (ref), soundGroups (ref), triggerHapticModule (ref), fFlagLuaAppHapticTriggeredTelemetry (ref)
	if not p3 then
		error("No config table was provided to InteractionFeedbackManager. Something is wrong.")
	end
	local var1 = p3[p1]
	
	if not var1 then return end
	local var2 = var1[p2]
	
	if not var2 then return end
	local sound = var2.Sound
	
	if sound then
		local var3 = sounds[sound]
		
		if not var3 then
			error("Sound " .. sound .. " not found in SoundManager given contextKey: " .. p0 .. " and interactionType: " .. tostring(p2) .. ". Please check the Sounds.lua file.")
		end
		soundManager:PlaySound(var3.Name, {}, soundGroups.AppBackground)
	end
	local haptic = var2.Haptic
	
	if haptic then
		triggerHapticModule(haptic, p4, p5, if fFlagLuaAppHapticTriggeredTelemetry then p1 else nil, if fFlagLuaAppHapticTriggeredTelemetry then p2 else nil, if fFlagLuaAppHapticTriggeredTelemetry then p6 else nil, if fFlagLuaAppHapticTriggeredTelemetry then p7 else nil)
	end
end