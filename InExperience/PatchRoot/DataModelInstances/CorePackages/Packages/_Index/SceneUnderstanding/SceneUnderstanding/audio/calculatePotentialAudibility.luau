local sceneUnderstanding = script:FindFirstAncestor("SceneUnderstanding")
local userGameSettingsService = UserSettings():GetService("UserGameSettings")
local safelyAccessPropertyModule = require(sceneUnderstanding.safelyAccessProperty)
local getOutputWiresModule = require(sceneUnderstanding.wiring.getOutputWires)
local _ = require(sceneUnderstanding.wiring.types)
local toWirableInstanceModule = require(sceneUnderstanding.wiring.toWirableInstance)

local function _(p1)
	-- upvalues: safelyAccessPropertyModule (ref)
	if not p1.IsPlaying then
		return 0
	end
	local var1 = safelyAccessPropertyModule(p1, "RollOffGain", 0)
	local var2 = if p1.SoundGroup then p1.SoundGroup.Volume else 1
	
	if var1 < 1 then
		var1 /= 10
	end
	return var2 * p1.Volume * var1
end

local function getOutputsOf(p1)
	-- upvalues: getOutputWiresModule (ref), toWirableInstanceModule (ref)
	if typeof(p1) == "Instance" and p1:IsA("AudioEmitter") then
		return p1:GetInteractingListeners()
	end
	local t = {}
	
	for i, v in getOutputWiresModule(p1) do
		local var1 = toWirableInstanceModule(v.TargetInstance)
		
		if var1 then
			table.insert(t, var1)
		end
	end
	return t
end

local _ = function(p2)
	local var2 = 0
	
	for i, v in p2:GetInteractingListeners() do
		var2 += v:GetAudibilityFor(p2)
	end
	return var2
end

local function getAudibilityOf(p3, p4)
	-- upvalues: getOutputsOf (ref), getAudibilityOf (ref)
	local var3 = p4 or {}
	
	if var3[p3] then
		return 0
	end
	var3[p3] = true
	local var4 = 1
	
	if typeof(p3) == "Instance" then
		if p3:IsA("AudioPlayer") or p3:IsA("AudioFader") then
			var4 = p3.Volume
		elseif p3:IsA("AudioEmitter") then
			local var5 = 0
			
			for i, v in p3:GetInteractingListeners() do
				var5 += v:GetAudibilityFor(p3)
			end
			var4 = var5
		elseif p3:IsA("AudioDeviceOutput") then
			return 1
		end
	end
	local var6 = 0
	
	for i, v in getOutputsOf(p3) do
		var6 += var4 * getAudibilityOf(v, var3)
	end
	return var6
end

return function(p5)
	-- upvalues: safelyAccessPropertyModule (ref), userGameSettingsService (ref), getAudibilityOf (ref)
	local var7
	local var8 = safelyAccessPropertyModule(userGameSettingsService, "MasterVolume", 0)
	local _ = 0
	
	if not p5:IsA("Sound") then
		var7 = getAudibilityOf(p5)
	elseif p5.IsPlaying then
		local var9 = safelyAccessPropertyModule(p5, "RollOffGain", 0)
		local var10 = if p5.SoundGroup then p5.SoundGroup.Volume else 1
		
		if var9 < 1 then
			var9 /= 10
		end
		var7 = var10 * p5.Volume * var9
	else
		var7 = 0
	end
	return var8 * var7
end