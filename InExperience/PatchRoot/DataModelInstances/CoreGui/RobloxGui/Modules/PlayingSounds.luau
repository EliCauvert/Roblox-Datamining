local getFFlagSoundTelemetryOsClockModule = require(game:GetService("CoreGui").RobloxGui.Modules.Flags.GetFFlagSoundTelemetryOsClock)
local t = {}
t.__index = t

function t.new(p1)
	-- upvalues: t (ref)
	local t_1 = {}
	setmetatable(t_1, t)
	t_1.aggregatedData = p1
	t_1.sounds = {}
	
	return t_1
end

function t:addSound(p1, p2)
	-- upvalues: getFFlagSoundTelemetryOsClockModule (ref)
	local var1 = self.sounds[p1]
	
	if var1 == nil then
		if getFFlagSoundTelemetryOsClockModule() then
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
		var1 = self.sounds[p1]
	end
	if var1.instances[p2] == nil then
		var1.instances[p2] = 1
		var1.count += 1
	end
end

function t:removeSound(p1, p2)
	-- upvalues: getFFlagSoundTelemetryOsClockModule (ref)
	local var1 = self.sounds[p1]
	
	if var1 == nil then return end
	if var1.instances[p2] then
		var1.instances[p2] = nil
		var1.count -= 1
	end
	if var1.count == 0 then
		if getFFlagSoundTelemetryOsClockModule() then
			self.aggregatedData:addPlay(p1, math.round(os.clock() - var1.starttime), var1.maxLoopCount)
		else
			self.aggregatedData:addPlay(p1, os.time() - var1.starttime, var1.maxLoopCount)
		end
		self.sounds[p1] = nil
	end
end

function t:loopSound(p1, p2)
	local var1 = self.sounds[p1]
	
	if var1 == nil or var1.instances[p2] == nil then
		return
	end
	var1.instances[p2] += 1
	var1.maxLoopCount = math.max(var1.maxLoopCount, var1.instances[p2])
end

return t