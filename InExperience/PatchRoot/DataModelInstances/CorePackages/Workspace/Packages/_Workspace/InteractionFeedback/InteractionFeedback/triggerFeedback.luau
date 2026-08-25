local parent = script:FindFirstAncestor("InteractionFeedback").Parent
local soundManagerModule = require(parent.SoundManager)
local soundManager = soundManagerModule.SoundManager
local sounds = soundManagerModule.Sounds
local soundGroups = soundManagerModule.SoundGroups
local _ = require(script.Parent.InteractionFeedbackContext)
local triggerHapticModule = require(script.Parent.triggerHaptic)
soundManager.init()
local fFlagLuaAppHapticTriggeredTelemetry = require(parent.SharedFlags).FFlagLuaAppHapticTriggeredTelemetry

return function(p0, p1, p2, p3, p4, p5, p6)
	-- upvalues: sounds (ref), soundManager (ref), soundGroups (ref), triggerHapticModule (ref), fFlagLuaAppHapticTriggeredTelemetry (ref)
	if not p2 then
		error("No config table was provided to InteractionFeedbackManager. Something is wrong.")
	end
	local var2 = p2[p0]
	
	if not var2 then return end
	local var3 = var2[p1]
	
	if not var3 then return end
	local sound = var3.Sound
	
	if sound then
		local var4 = sounds[sound]
		
		if not var4 then
			error("Sound " .. sound .. " not found in SoundManager given contextKey: " .. p0 .. " and interactionType: " .. tostring(p1) .. ". Please check the Sounds.lua file.")
		end
		soundManager:PlaySound(var4.Name, {}, soundGroups.AppBackground)
	end
	local haptic = var3.Haptic
	
	if haptic then
		triggerHapticModule(haptic, p3, p4, if fFlagLuaAppHapticTriggeredTelemetry then p0 else nil, if fFlagLuaAppHapticTriggeredTelemetry then p1 else nil, if fFlagLuaAppHapticTriggeredTelemetry then p5 else nil, if fFlagLuaAppHapticTriggeredTelemetry then p6 else nil)
	end
end