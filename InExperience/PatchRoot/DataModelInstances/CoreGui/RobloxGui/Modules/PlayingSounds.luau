local getFFlagSoundTelemetryOsClockModule = require(game:GetService("CoreGui").RobloxGui.Modules.Flags.GetFFlagSoundTelemetryOsClock)
local t = {}
t.__index = t

function t.new(p0)
	-- upvalues: t (ref)
	local t_1 = {}
	setmetatable(t_1, t)
	t_1.aggregatedData = p0
	t_1.sounds = {}
	
	return t_1
end

function t:addSound(p1, p2)
	-- upvalues: getFFlagSoundTelemetryOsClockModule (ref)
	local var3 = self.sounds[p1]
	
	if var3 == nil then
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
		var3 = self.sounds[p1]
	end
	if var3.instances[p2] == nil then
		var3.instances[p2] = 1
		var3.count += 1
	end
end

function t:removeSound(p3, p4)
	-- upvalues: getFFlagSoundTelemetryOsClockModule (ref)
	local var4 = self.sounds[p3]
	
	if var4 == nil then return end
	if var4.instances[p4] then
		var4.instances[p4] = nil
		var4.count -= 1
	end
	if var4.count == 0 then
		if getFFlagSoundTelemetryOsClockModule() then
			self.aggregatedData:addPlay(p3, math.round(os.clock() - var4.starttime), var4.maxLoopCount)
		else
			self.aggregatedData:addPlay(p3, os.time() - var4.starttime, var4.maxLoopCount)
		end
		self.sounds[p3] = nil
	end
end

function t:loopSound(p5, p6)
	local var5 = self.sounds[p5]
	
	if var5 == nil or var5.instances[p6] == nil then
		return
	end
	var5.instances[p6] += 1
	var5.maxLoopCount = math.max(var5.maxLoopCount, var5.instances[p6])
end

return t