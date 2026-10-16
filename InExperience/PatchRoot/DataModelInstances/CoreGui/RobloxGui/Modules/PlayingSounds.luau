local GetFFlagSoundTelemetryOsClockModule = require(game:GetService("CoreGui").RobloxGui.Modules.Flags.GetFFlagSoundTelemetryOsClock)
local PlayingSoundsModule = {}
PlayingSoundsModule.__index = PlayingSoundsModule

function PlayingSoundsModule.new(AggregatedData) --[[ Line: 9 ]]
	-- upvalues: PlayingSoundsModule (copy)
	local t = {}
	setmetatable(t, PlayingSoundsModule)
	t.aggregatedData = AggregatedData
	t.sounds = {}
	
	return t
end

function PlayingSoundsModule:addSound(p1, p2) --[[ Line: 17 ]]
	-- upvalues: GetFFlagSoundTelemetryOsClockModule (copy)
	local Sound = self.sounds[p1]
	
	if Sound == nil then
		if GetFFlagSoundTelemetryOsClockModule() then
			self.sounds[p1] = {
				count = 0,
				maxLoopCount = 1,
				starttime = os.clock(),
				instances = {}
			}
		else
			self.sounds[p1] = {
				count = 0,
				maxLoopCount = 1,
				starttime = os.time(),
				instances = {}
			}
		end
		Sound = self.sounds[p1]
	end
	if Sound.instances[p2] == nil then
		Sound.instances[p2] = 1
		Sound.count += 1
	end
end

function PlayingSoundsModule:removeSound(p1, p2) --[[ Line: 37 ]]
	-- upvalues: GetFFlagSoundTelemetryOsClockModule (copy)
	local Sound = self.sounds[p1]
	
	if Sound == nil then return end
	if Sound.instances[p2] then
		Sound.instances[p2] = nil
		Sound.count -= 1
	end
	if Sound.count == 0 then
		if GetFFlagSoundTelemetryOsClockModule() then
			self.aggregatedData:addPlay(p1, math.round(os.clock() - Sound.starttime), Sound.maxLoopCount)
		else
			self.aggregatedData:addPlay(p1, os.time() - Sound.starttime, Sound.maxLoopCount)
		end
		self.sounds[p1] = nil
	end
end

function PlayingSoundsModule:loopSound(p1, Key) --[[ Line: 66 ]]
	local Sound = self.sounds[p1]
	
	if Sound ~= nil and Sound.instances[Key] ~= nil then
		local Instances = Sound.instances
		Instances[Key] += 1
		Sound.maxLoopCount = math.max(Sound.maxLoopCount, Sound.instances[Key])
		
		return
	end
end

return PlayingSoundsModule