local luaAppSchedulerYieldInterval = game:DefineFastInt("LuaAppSchedulerYieldInterval", -1)
local luaAppSchedulerDeferredWork = game:DefineFastInt("LuaAppSchedulerDeferredWork", -1)
local luaAppSchedulerHeartbeatFrameMarker = game:DefineFastInt("LuaAppSchedulerHeartbeatFrameMarker", -1)
local luaAppSchedulerTargetMsByHeartbeatDelta = game:DefineFastInt("LuaAppSchedulerTargetMsByHeartbeatDelta", -1)
local luaAppSchedulerNumberOfLookbackFrames = game:DefineFastInt("LuaAppSchedulerNumberOfLookbackFrames", -1)
local luaAppSchedulerLookbackUseRingBuffer = game:DefineFastInt("LuaAppSchedulerLookbackUseRingBuffer", -1)
local luaAppSchedulerDesiredFrameRate = game:DefineFastInt("LuaAppSchedulerDesiredFrameRate", -1)
local luaAppSchedulerMinimumFrameRate = game:DefineFastInt("LuaAppSchedulerMinimumFrameRate", -1)
local luaInExpSchedulerYieldInterval = game:DefineFastInt("LuaInExpSchedulerYieldInterval", -1)
local luaInExpSchedulerDeferredWork = game:DefineFastInt("LuaInExpSchedulerDeferredWork", -1)
local luaInExpSchedulerHeartbeatFrameMarker = game:DefineFastInt("LuaInExpSchedulerHeartbeatFrameMarker", -1)
local luaInExpSchedulerTargetMsByHeartbeatDelta = game:DefineFastInt("LuaInExpSchedulerTargetMsByHeartbeatDelta", -1)
local luaInExpSchedulerNumberOfLookbackFrames = game:DefineFastInt("LuaInExpSchedulerNumberOfLookbackFrames", -1)
local luaInExpSchedulerLookbackUseRingBuffer = game:DefineFastInt("LuaInExpSchedulerLookbackUseRingBuffer", -1)
local luaInExpSchedulerDesiredFrameRate = game:DefineFastInt("LuaInExpSchedulerDesiredFrameRate", -1)
local luaInExpSchedulerMinimumFrameRate = game:DefineFastInt("LuaInExpSchedulerMinimumFrameRate", -1)

local function buildFlags(p0, p1, p2, p3, p4, p5, p6, p7) --[[ line: 36 ]]
	local t = {}
	local var18 = false
	
	if p0 ~= -1 then
		t.yieldInterval = p0
		var18 = true
	end
	if p1 ~= -1 then
		t.deferredWork = p1 == 1
		var18 = true
	end
	if p2 ~= -1 then
		t.heartbeatFrameMarker = p2 == 1
		var18 = true
	end
	if p3 ~= -1 then
		t.targetMsByHeartbeatDelta = p3 == 1
		var18 = true
	end
	if p4 ~= -1 then
		t.numberOfLookbackFrames = p4
		var18 = true
	end
	if p5 ~= -1 then
		t.lookbackUseRingBuffer = p5 == 1
		var18 = true
	end
	if p6 ~= -1 then
		t.desiredFrameRate = p6
		var18 = true
	end
	if p7 ~= -1 then
		t.minimumFrameRate = p7
		var18 = true
	end
	return if var18 then t else nil
end

return {
	getApp = function() --[[ line: 88 ]]
		-- upvalues: buildFlags (ref), luaAppSchedulerYieldInterval (ref), luaAppSchedulerDeferredWork (ref), luaAppSchedulerHeartbeatFrameMarker (ref), luaAppSchedulerTargetMsByHeartbeatDelta (ref), luaAppSchedulerNumberOfLookbackFrames (ref), luaAppSchedulerLookbackUseRingBuffer (ref), luaAppSchedulerDesiredFrameRate (ref), luaAppSchedulerMinimumFrameRate (ref)
		return buildFlags(luaAppSchedulerYieldInterval, luaAppSchedulerDeferredWork, luaAppSchedulerHeartbeatFrameMarker, luaAppSchedulerTargetMsByHeartbeatDelta, luaAppSchedulerNumberOfLookbackFrames, luaAppSchedulerLookbackUseRingBuffer, luaAppSchedulerDesiredFrameRate, luaAppSchedulerMinimumFrameRate)
	end,
	getInExp = function() --[[ line: 103 ]]
		-- upvalues: buildFlags (ref), luaInExpSchedulerYieldInterval (ref), luaInExpSchedulerDeferredWork (ref), luaInExpSchedulerHeartbeatFrameMarker (ref), luaInExpSchedulerTargetMsByHeartbeatDelta (ref), luaInExpSchedulerNumberOfLookbackFrames (ref), luaInExpSchedulerLookbackUseRingBuffer (ref), luaInExpSchedulerDesiredFrameRate (ref), luaInExpSchedulerMinimumFrameRate (ref)
		return buildFlags(luaInExpSchedulerYieldInterval, luaInExpSchedulerDeferredWork, luaInExpSchedulerHeartbeatFrameMarker, luaInExpSchedulerTargetMsByHeartbeatDelta, luaInExpSchedulerNumberOfLookbackFrames, luaInExpSchedulerLookbackUseRingBuffer, luaInExpSchedulerDesiredFrameRate, luaInExpSchedulerMinimumFrameRate)
	end
}