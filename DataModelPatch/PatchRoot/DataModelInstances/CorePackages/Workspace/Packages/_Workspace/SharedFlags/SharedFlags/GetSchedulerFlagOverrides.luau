local LuaAppSchedulerYieldInterval = game:DefineFastInt("LuaAppSchedulerYieldInterval", -1)
local LuaAppSchedulerDeferredWork = game:DefineFastInt("LuaAppSchedulerDeferredWork", -1)
local LuaAppSchedulerHeartbeatFrameMarker = game:DefineFastInt("LuaAppSchedulerHeartbeatFrameMarker", -1)
local LuaAppSchedulerTargetMsByHeartbeatDelta = game:DefineFastInt("LuaAppSchedulerTargetMsByHeartbeatDelta", -1)
local LuaAppSchedulerNumberOfLookbackFrames = game:DefineFastInt("LuaAppSchedulerNumberOfLookbackFrames", -1)
local LuaAppSchedulerLookbackUseRingBuffer = game:DefineFastInt("LuaAppSchedulerLookbackUseRingBuffer", -1)
local LuaAppSchedulerDesiredFrameRate = game:DefineFastInt("LuaAppSchedulerDesiredFrameRate", -1)
local LuaAppSchedulerMinimumFrameRate = game:DefineFastInt("LuaAppSchedulerMinimumFrameRate", -1)
local LuaInExpSchedulerYieldInterval = game:DefineFastInt("LuaInExpSchedulerYieldInterval", -1)
local LuaInExpSchedulerDeferredWork = game:DefineFastInt("LuaInExpSchedulerDeferredWork", -1)
local LuaInExpSchedulerHeartbeatFrameMarker = game:DefineFastInt("LuaInExpSchedulerHeartbeatFrameMarker", -1)
local LuaInExpSchedulerTargetMsByHeartbeatDelta = game:DefineFastInt("LuaInExpSchedulerTargetMsByHeartbeatDelta", -1)
local LuaInExpSchedulerNumberOfLookbackFrames = game:DefineFastInt("LuaInExpSchedulerNumberOfLookbackFrames", -1)
local LuaInExpSchedulerLookbackUseRingBuffer = game:DefineFastInt("LuaInExpSchedulerLookbackUseRingBuffer", -1)
local LuaInExpSchedulerDesiredFrameRate = game:DefineFastInt("LuaInExpSchedulerDesiredFrameRate", -1)
local LuaInExpSchedulerMinimumFrameRate = game:DefineFastInt("LuaInExpSchedulerMinimumFrameRate", -1)

local function buildFlags(YieldInterval, LuaAppSchedulerDeferredWork, LuaAppSchedulerHeartbeatFrameMarker, LuaAppSchedulerTargetMsByHeartbeatDelta, NumberOfLookbackFrames, LuaAppSchedulerLookbackUseRingBuffer, DesiredFrameRate, MinimumFrameRate)
	local t = {}
	local Flag = false
	
	if YieldInterval ~= -1 then
		t.yieldInterval = YieldInterval
		Flag = true
	end
	if LuaAppSchedulerDeferredWork ~= -1 then
		t.deferredWork = LuaAppSchedulerDeferredWork == 1
		Flag = true
	end
	if LuaAppSchedulerHeartbeatFrameMarker ~= -1 then
		t.heartbeatFrameMarker = LuaAppSchedulerHeartbeatFrameMarker == 1
		Flag = true
	end
	if LuaAppSchedulerTargetMsByHeartbeatDelta ~= -1 then
		t.targetMsByHeartbeatDelta = LuaAppSchedulerTargetMsByHeartbeatDelta == 1
		Flag = true
	end
	if NumberOfLookbackFrames ~= -1 then
		t.numberOfLookbackFrames = NumberOfLookbackFrames
		Flag = true
	end
	if LuaAppSchedulerLookbackUseRingBuffer ~= -1 then
		t.lookbackUseRingBuffer = LuaAppSchedulerLookbackUseRingBuffer == 1
		Flag = true
	end
	if DesiredFrameRate ~= -1 then
		t.desiredFrameRate = DesiredFrameRate
		Flag = true
	end
	if MinimumFrameRate ~= -1 then
		t.minimumFrameRate = MinimumFrameRate
		Flag = true
	end
	return if Flag then t else nil
end

return {
	getApp = function()
		-- upvalues: buildFlags (copy), LuaAppSchedulerYieldInterval (copy), LuaAppSchedulerDeferredWork (copy), LuaAppSchedulerHeartbeatFrameMarker (copy), LuaAppSchedulerTargetMsByHeartbeatDelta (copy), LuaAppSchedulerNumberOfLookbackFrames (copy), LuaAppSchedulerLookbackUseRingBuffer (copy), LuaAppSchedulerDesiredFrameRate (copy), LuaAppSchedulerMinimumFrameRate (copy)
		return (buildFlags(LuaAppSchedulerYieldInterval, LuaAppSchedulerDeferredWork, LuaAppSchedulerHeartbeatFrameMarker, LuaAppSchedulerTargetMsByHeartbeatDelta, LuaAppSchedulerNumberOfLookbackFrames, LuaAppSchedulerLookbackUseRingBuffer, LuaAppSchedulerDesiredFrameRate, LuaAppSchedulerMinimumFrameRate))
	end,
	getInExp = function()
		-- upvalues: buildFlags (copy), LuaInExpSchedulerYieldInterval (copy), LuaInExpSchedulerDeferredWork (copy), LuaInExpSchedulerHeartbeatFrameMarker (copy), LuaInExpSchedulerTargetMsByHeartbeatDelta (copy), LuaInExpSchedulerNumberOfLookbackFrames (copy), LuaInExpSchedulerLookbackUseRingBuffer (copy), LuaInExpSchedulerDesiredFrameRate (copy), LuaInExpSchedulerMinimumFrameRate (copy)
		return (buildFlags(LuaInExpSchedulerYieldInterval, LuaInExpSchedulerDeferredWork, LuaInExpSchedulerHeartbeatFrameMarker, LuaInExpSchedulerTargetMsByHeartbeatDelta, LuaInExpSchedulerNumberOfLookbackFrames, LuaInExpSchedulerLookbackUseRingBuffer, LuaInExpSchedulerDesiredFrameRate, LuaInExpSchedulerMinimumFrameRate))
	end
}