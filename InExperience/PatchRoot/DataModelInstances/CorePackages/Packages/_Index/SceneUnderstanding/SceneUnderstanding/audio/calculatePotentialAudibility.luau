local sceneUnderstanding = script:FindFirstAncestor("SceneUnderstanding")
local userGameSettingsService = UserSettings():GetService("UserGameSettings")
local safelyAccessPropertyModule = require(sceneUnderstanding.safelyAccessProperty)
local getOutputWiresModule = require(sceneUnderstanding.wiring.getOutputWires)
local _ = require(sceneUnderstanding.wiring.types)
local toWirableInstanceModule = require(sceneUnderstanding.wiring.toWirableInstance)

local function _(p0)
	-- upvalues: safelyAccessPropertyModule (ref)
	if not p0.IsPlaying then
		return 0
	end
	local var7 = safelyAccessPropertyModule(p0, "RollOffGain", 0)
	local var8 = if p0.SoundGroup then p0.SoundGroup.Volume else 1
	
	if var7 < 1 then
		var7 /= 10
	end
	return var8 * p0.Volume * var7
end

local function getOutputsOf(p1)
	-- upvalues: getOutputWiresModule (ref), toWirableInstanceModule (ref)
	if typeof(p1) == "Instance" and p1:IsA("AudioEmitter") then
		return p1:GetInteractingListeners()
	end
	local t = {}
	
	for i, v in getOutputWiresModule(p1) do
		local var10 = toWirableInstanceModule(v.TargetInstance)
		
		if var10 then
			table.insert(t, var10)
		end
	end
	return t
end

local _ = function(p2)
	local var11 = 0
	
	for i, v in p2:GetInteractingListeners() do
		var11 += v:GetAudibilityFor(p2)
	end
	return var11
end

local function getAudibilityOf(p3, p4)
	-- upvalues: getOutputsOf (ref), getAudibilityOf (ref)
	local var12 = p4 or {}
	
	if var12[p3] then
		return 0
	end
	var12[p3] = true
	local var13 = 1
	
	if typeof(p3) == "Instance" then
		if p3:IsA("AudioPlayer") or p3:IsA("AudioFader") then
			var13 = p3.Volume
		elseif p3:IsA("AudioEmitter") then
			local var14 = 0
			
			for i, v in p3:GetInteractingListeners() do
				var14 += v:GetAudibilityFor(p3)
			end
			var13 = var14
		elseif p3:IsA("AudioDeviceOutput") then
			return 1
		end
	end
	local var15 = 0
	
	for i, v in getOutputsOf(p3) do
		var15 += var13 * getAudibilityOf(v, var12)
	end
	return var15
end

return function(p5)
	-- upvalues: safelyAccessPropertyModule (ref), userGameSettingsService (ref), getAudibilityOf (ref)
	local var17
	local var16 = safelyAccessPropertyModule(userGameSettingsService, "MasterVolume", 0)
	local _ = 0
	
	if not p5:IsA("Sound") then
		var17 = getAudibilityOf(p5)
	elseif p5.IsPlaying then
		local var18 = safelyAccessPropertyModule(p5, "RollOffGain", 0)
		local var19 = if p5.SoundGroup then p5.SoundGroup.Volume else 1
		
		if var18 < 1 then
			var18 /= 10
		end
		var17 = var19 * p5.Volume * var18
	else
		var17 = 0
	end
	return var16 * var17
end