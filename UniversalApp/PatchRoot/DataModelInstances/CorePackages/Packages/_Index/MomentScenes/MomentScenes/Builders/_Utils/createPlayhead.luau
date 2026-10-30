local RunService = game:GetService("RunService")
local _ = require(script.Parent.Parent.Parent.Types)

local function _(List)
	local Length = 0
	
	for _, value in List do
		if Length < value.Length then
			Length = value.Length
		end
	end
	return Length
end

local _ = function(p1, p2)
	return if p2 == nil then p1 else function()
		-- upvalues: p2 (copy), p1 (copy)
		p2(p1)
	end
end

local _ = function(p1, p2)
	return if p2 == nil then p1 else function(p3)
		-- upvalues: p2 (copy), p1 (copy)
		p2(p1, p3)
	end
end

local _ = function(p1, p2)
	return if p2 == nil then p1 else function()
		-- upvalues: p2 (copy), p1 (copy)
		return p2(p1)
	end
end

local _ = function(p1, p2)
	return if p2 == nil then p1 else function()
		-- upvalues: p2 (copy), p1 (copy)
		return p2(p1)
	end
end

return function(p1)
	-- upvalues: RunService (copy)
	local Root = p1.root
	local Tracks = p1.tracks or {}
	local GetClipLength = p1.getClipLength or function()
		-- upvalues: Tracks (copy)
		local Length = 0
		
		for _, track in Tracks do
			if Length < track.Length then
				Length = track.Length
			end
		end
		return Length
	end
	local GetDuration = p1.getDuration or GetClipLength
	local SyncVisualsFunction = p1.syncVisuals
	local Animator = p1.animator
	local CanPlay = p1.canPlay or function(): boolean
		-- upvalues: GetDuration (copy)
		return GetDuration() > 0
	end
	local ClampedValue = 0
	local Flag = false
	local Flag1 = false
	local HeartbeatConnection = nil
	
	local function _()
		-- upvalues: HeartbeatConnection (ref)
		if HeartbeatConnection ~= nil then
			HeartbeatConnection:Disconnect()
			HeartbeatConnection = nil
		end
	end
	
	local _ = function()
		-- upvalues: Animator (copy), RunService (upval)
		if Animator ~= nil and not RunService:IsRunning() then
			Animator:StepAnimations(0)
		end
	end
	
	local function applyPlayhead(Value: number)
		-- upvalues: GetDuration (copy), GetClipLength (copy), ClampedValue (ref), Animator (copy), RunService (upval), SyncVisualsFunction (copy), Tracks (copy)
		local Duration: number = GetDuration()
		local ClipLength: number = GetClipLength()
		
		if Duration <= 0 then
			ClampedValue = 0
			
			if Animator ~= nil and not RunService:IsRunning() then
				Animator:StepAnimations(0)
			end
			if SyncVisualsFunction ~= nil then
				SyncVisualsFunction(ClampedValue)
			end
			return
		else
			ClampedValue = math.clamp(Value, 0, Duration)
			
			if ClipLength > 0 then
				for _, track in Tracks do
					track.TimePosition = ClampedValue % ClipLength
				end
			end
			if Animator ~= nil and not RunService:IsRunning() then
				Animator:StepAnimations(0)
			end
			if SyncVisualsFunction ~= nil then
				SyncVisualsFunction(ClampedValue)
			end
		end
	end
	
	local _ = function()
		-- upvalues: HeartbeatConnection (ref), Flag1 (ref), RunService (upval), Flag (ref), GetDuration (copy), applyPlayhead (copy), ClampedValue (ref)
		if HeartbeatConnection == nil and not Flag1 then
			HeartbeatConnection = RunService.Heartbeat:Connect(function(DeltaTime)
				-- upvalues: Flag1 (upval), Flag (upval), GetDuration (upval), applyPlayhead (upval), ClampedValue (upval)
				if Flag1 or not Flag then return end
				local v1: number = GetDuration()
				
				if v1 > 0 then
					applyPlayhead((ClampedValue + DeltaTime) % v1)
					
					return
				end
			end)
			
			return
		end
	end
	
	local function v22()
		-- upvalues: Flag1 (ref), CanPlay (copy), Flag (ref), SyncVisualsFunction (copy), ClampedValue (ref), Tracks (copy), applyPlayhead (copy), HeartbeatConnection (ref), RunService (upval), GetDuration (copy)
		if Flag1 then return end
		if not CanPlay() then
			Flag = false
			
			return
		end
		if SyncVisualsFunction ~= nil then
			SyncVisualsFunction(ClampedValue)
		end
		for _, track in Tracks do
			track:AdjustSpeed(1)
			
			if not track.IsPlaying then
				track:Play(0)
			end
		end
		applyPlayhead(ClampedValue)
		Flag = true
		
		if HeartbeatConnection == nil then
			if Flag1 then return end
			HeartbeatConnection = RunService.Heartbeat:Connect(function(DeltaTime)
				-- upvalues: Flag1 (upval), Flag (upval), GetDuration (upval), applyPlayhead (upval), ClampedValue (upval)
				if Flag1 or not Flag then return end
				local v1: number = GetDuration()
				
				if v1 > 0 then
					applyPlayhead((ClampedValue + DeltaTime) % v1)
					
					return
				end
			end)
		end
	end
	
	local function v23()
		-- upvalues: Flag1 (ref), HeartbeatConnection (ref), Tracks (copy), Flag (ref)
		if Flag1 then return end
		if HeartbeatConnection ~= nil then
			HeartbeatConnection:Disconnect()
			HeartbeatConnection = nil
		end
		for _, track in Tracks do
			track:AdjustSpeed(0)
		end
		Flag = false
	end
	
	local function v24(p2)
		-- upvalues: Flag1 (ref), applyPlayhead (copy)
		if not Flag1 then
			applyPlayhead(p2)
			
			return
		end
	end
	
	local function v25()
		-- upvalues: Flag1 (ref), Flag (ref), HeartbeatConnection (ref), Tracks (copy), Root (copy)
		if Flag1 then return end
		Flag1 = true
		Flag = false
		
		if HeartbeatConnection ~= nil then
			HeartbeatConnection:Disconnect()
			HeartbeatConnection = nil
		end
		for _, track in Tracks do
			track:AdjustSpeed(0)
			track:Stop(0)
		end
		table.clear(Tracks)
		Root:Destroy()
	end
	
	applyPlayhead(0)
	local Play = p1.play
	local Play1 = if Play == nil then v22 else function()
		-- upvalues: Play (copy), v22 (copy)
		Play(v22)
	end
	local Pause = p1.pause
	local Pause1 = if Pause == nil then v23 else function()
		-- upvalues: Pause (copy), v23 (copy)
		Pause(v23)
	end
	local SeekFunction = p1.seek
	local Seek = if SeekFunction == nil then v24 else function(p2)
		-- upvalues: SeekFunction (copy), v24 (copy)
		SeekFunction(v24, p2)
	end
	local DisposeFunction = p1.dispose
	local Dispose = if DisposeFunction == nil then v25 else function()
		-- upvalues: DisposeFunction (copy), v25 (copy)
		DisposeFunction(v25)
	end
	
	local function v32()
		-- upvalues: Flag (ref)
		return Flag
	end
	
	local GetIsPlayingFunction = p1.getIsPlaying
	local GetIsPlaying = if GetIsPlayingFunction == nil then v32 else function()
		-- upvalues: GetIsPlayingFunction (copy), v32 (copy)
		return GetIsPlayingFunction(v32)
	end
	
	local function v34()
		-- upvalues: ClampedValue (ref)
		return ClampedValue
	end
	
	local GetPositionFunction = p1.getPosition
	
	return {
		play = Play1,
		pause = Pause1,
		seek = Seek,
		dispose = Dispose,
		getIsPlaying = GetIsPlaying,
		getPosition = if GetPositionFunction == nil then v34 else function()
			-- upvalues: GetPositionFunction (copy), v34 (copy)
			return GetPositionFunction(v34)
		end,
		getDuration = GetDuration
	}
end