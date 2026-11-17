game:DefineFastString("ExperienceStateReplaySourceClockFps", "")
game:DefineFastFlag("ExperienceStateReplayFixedStepSourceClock", false)
game:DefineFastInt("ExperienceStateReplaySourceClockOutputFps", 0)
local ExperienceStateReplaySourceClockFirstFrame = game:DefineFastInt("ExperienceStateReplaySourceClockFirstFrame", -1)
local ExperienceStateReplaySourceClockLastFrame = game:DefineFastInt("ExperienceStateReplaySourceClockLastFrame", -1)
local FFlagExperienceStateReplayUseRecordedCurrentCameraModule = require(script.Parent.Parent.Flags.FFlagExperienceStateReplayUseRecordedCurrentCamera)
local SourceClockPlaybackDriverModule = {
	fixedStepFrameOffset = function(Count, Number, ExperienceStateReplaySourceClockOutputFpsFastInt): number
		return (math.floor(Count * Number / ExperienceStateReplaySourceClockOutputFpsFastInt + 0.000000001))
	end,
	resolveRange = function(MinLoadedFrameNumber, MaxLoadedFrameNumber, ExperienceStateReplaySourceClockFirstFrameFastInt: number, ExperienceStateReplaySourceClockLastFrameFastInt: number)
		if MinLoadedFrameNumber == nil or MaxLoadedFrameNumber == nil or MaxLoadedFrameNumber < MinLoadedFrameNumber then
			return nil
		end
		local ExperienceStateReplaySourceClockFirstFrameFastInt1 = if ExperienceStateReplaySourceClockFirstFrameFastInt >= 0 then ExperienceStateReplaySourceClockFirstFrameFastInt else MinLoadedFrameNumber
		local ExperienceStateReplaySourceClockLastFrameFastInt1 = if ExperienceStateReplaySourceClockLastFrameFastInt >= 0 then ExperienceStateReplaySourceClockLastFrameFastInt else MaxLoadedFrameNumber
		
		if ExperienceStateReplaySourceClockFirstFrameFastInt1 < MinLoadedFrameNumber or MaxLoadedFrameNumber < ExperienceStateReplaySourceClockLastFrameFastInt1 or ExperienceStateReplaySourceClockLastFrameFastInt1 < ExperienceStateReplaySourceClockFirstFrameFastInt1 then
			return nil
		else
			return ExperienceStateReplaySourceClockFirstFrameFastInt1, ExperienceStateReplaySourceClockLastFrameFastInt1
		end
	end
}

function SourceClockPlaybackDriverModule.start(p1, Callback1, Callback: (any) -> (), p2)
	-- upvalues: ExperienceStateReplaySourceClockFirstFrame (copy), ExperienceStateReplaySourceClockLastFrame (copy), SourceClockPlaybackDriverModule (copy), FFlagExperienceStateReplayUseRecordedCurrentCameraModule (copy)
	local function _(Text)
		-- upvalues: Callback (copy)
		warn("[SOURCECLOCK] failed: " .. Text)
		
		if Callback then
			Callback(Text)
		end
	end
	
	local Number: number? = tonumber(game:GetFastString("ExperienceStateReplaySourceClockFps"))
	
	if Number == nil or Number <= 0 then
		warn("[SOURCECLOCK] failed: missing or invalid source fps")
		
		if Callback then
			Callback("missing or invalid source fps")
		end
		return
	else
		local ExperienceStateReplayFixedStepSourceClockFastFlag = game:GetFastFlag("ExperienceStateReplayFixedStepSourceClock")
		local ExperienceStateReplaySourceClockOutputFpsFastInt = if ExperienceStateReplayFixedStepSourceClockFastFlag then game:GetFastInt("ExperienceStateReplaySourceClockOutputFps") else 0
		local ExperienceStateReplaySourceClockFirstFrameFastInt = if ExperienceStateReplayFixedStepSourceClockFastFlag then game:GetFastInt("ExperienceStateReplaySourceClockFirstFrame") else ExperienceStateReplaySourceClockFirstFrame
		local ExperienceStateReplaySourceClockLastFrameFastInt = if ExperienceStateReplayFixedStepSourceClockFastFlag then game:GetFastInt("ExperienceStateReplaySourceClockLastFrame") else ExperienceStateReplaySourceClockLastFrame
		
		if ExperienceStateReplayFixedStepSourceClockFastFlag and ExperienceStateReplaySourceClockOutputFpsFastInt <= 0 then
			warn("[SOURCECLOCK] failed: missing or invalid output fps")
			
			if Callback then
				Callback("missing or invalid output fps")
			end
			return
		else
			local ExperienceStateRecordingService = game:GetService("ExperienceStateRecordingService")
			local RunService = game:GetService("RunService")
			
			if ExperienceStateReplayFixedStepSourceClockFastFlag and p2 then
				ExperienceStateRecordingService = p2.recordingService or ExperienceStateRecordingService
				RunService = p2.runService or RunService
			end
			local _ = function()
				-- upvalues: p1 (copy)
				if p1.noteSourceClockFrameApplied then
					p1.noteSourceClockFrameApplied()
				end
			end
			
			local Flag = false
			local Flag1 = false
			local Total = 0
			local Count = 0
			local NewFixedStepFrameOffsetResult = nil
			local Flag2 = false
			RunService:BindToRenderStep("ReplaySourceClock", Enum.RenderPriority.Camera.Value - 1, function(DeltaTime)
				-- upvalues: Flag2 (ref), p1 (copy), SourceClockPlaybackDriverModule (upval), ExperienceStateReplaySourceClockFirstFrameFastInt (copy), ExperienceStateReplaySourceClockLastFrameFastInt (copy), RunService (ref), Callback (copy), Flag (ref), ExperienceStateRecordingService (ref), ExperienceStateReplayFixedStepSourceClockFastFlag (copy), Number (copy), ExperienceStateReplaySourceClockOutputFpsFastInt (copy), Count (ref), NewFixedStepFrameOffsetResult (ref), FFlagExperienceStateReplayUseRecordedCurrentCameraModule (upval), Flag1 (ref), Total (ref), Callback1 (copy)
				if Flag2 then return end
				if p1.state.Loading then return end
				local MinLoadedFrameNumber = p1.minLoadedFrameNumber
				local MaxLoadedFrameNumber = p1.maxLoadedFrameNumber
				
				if MinLoadedFrameNumber == nil or MaxLoadedFrameNumber == nil then return end
				local ResolveRangeResult, ResolveRangeResult2 = SourceClockPlaybackDriverModule.resolveRange(MinLoadedFrameNumber, MaxLoadedFrameNumber, ExperienceStateReplaySourceClockFirstFrameFastInt, ExperienceStateReplaySourceClockLastFrameFastInt)
				
				if ResolveRangeResult == nil or ResolveRangeResult2 == nil then
					RunService:UnbindFromRenderStep("ReplaySourceClock")
					local Formatted = string.format("requested range outside loaded %d..%d", MinLoadedFrameNumber, MaxLoadedFrameNumber)
					warn("[SOURCECLOCK] failed: " .. Formatted)
					
					if Callback then
						Callback(Formatted)
					end
					return
				elseif Flag then
					local Smallest = nil
					
					if ExperienceStateReplayFixedStepSourceClockFastFlag then
						Count += 1
						Smallest = math.min(ResolveRangeResult2, ResolveRangeResult + SourceClockPlaybackDriverModule.fixedStepFrameOffset(Count, Number, ExperienceStateReplaySourceClockOutputFpsFastInt))
					else
						Total += DeltaTime
						Smallest = math.min(ResolveRangeResult2, MinLoadedFrameNumber + math.floor(Total * Number))
					end
					local PlaybackCurrentFrame = nil
					local Success1, Result1 = pcall(function()
						-- upvalues: ExperienceStateRecordingService (upval), Smallest (ref), PlaybackCurrentFrame (ref)
						ExperienceStateRecordingService:SetPlaybackFrame(Smallest)
						PlaybackCurrentFrame = ExperienceStateRecordingService:GetPlaybackCurrentFrame()
					end)
					
					if Success1 then
						if PlaybackCurrentFrame == nil then
							RunService:UnbindFromRenderStep("ReplaySourceClock")
							local Text = "at frame " .. tostring(Smallest) .. ": no applied playback frame"
							warn("[SOURCECLOCK] failed: " .. Text)
							
							if Callback then
								Callback(Text)
							end
							return
						else
							if FFlagExperienceStateReplayUseRecordedCurrentCameraModule and p1.noteSourceClockFrameApplied then
								p1.noteSourceClockFrameApplied()
							end
							if not Flag1 and ResolveRangeResult <= PlaybackCurrentFrame then
								Flag1 = true
								print(string.format("[SOURCECLOCK] start first=%d last=%d fps=%.6f", ResolveRangeResult, ResolveRangeResult2, Number))
							end
							if ResolveRangeResult2 <= Smallest then
								RunService:UnbindFromRenderStep("ReplaySourceClock")
								print("[SOURCECLOCK] reached frame=" .. tostring(Smallest))
								
								if PlaybackCurrentFrame == ResolveRangeResult2 then
									print("[PLAYBACK] complete frame=" .. tostring(PlaybackCurrentFrame))
									
									if Callback1 then
										Callback1(PlaybackCurrentFrame)
									end
								else
									local Formatted = string.format("final scrub requested=%d applied=%d", ResolveRangeResult2, PlaybackCurrentFrame)
									warn("[SOURCECLOCK] failed: " .. Formatted)
									
									if Callback then
										Callback(Formatted)
									end
								end
							end
							return
						end
					else
						RunService:UnbindFromRenderStep("ReplaySourceClock")
						local Text = "at frame " .. tostring(Smallest) .. ": " .. tostring(Result1)
						warn("[SOURCECLOCK] failed: " .. Text)
						
						if Callback then
							Callback(Text)
						end
						return
					end
				else
					local Success, Result = pcall(function()
						-- upvalues: ExperienceStateRecordingService (upval), ExperienceStateReplayFixedStepSourceClockFastFlag (upval), Number (upval), ExperienceStateReplaySourceClockOutputFpsFastInt (upval), ResolveRangeResult (copy), MinLoadedFrameNumber (copy), Count (upval), NewFixedStepFrameOffsetResult (upval), SourceClockPlaybackDriverModule (upval)
						ExperienceStateRecordingService:SetPlaybackMode(Enum.ExperienceStateRecordingPlaybackMode.Stopped)
						
						if ExperienceStateReplayFixedStepSourceClockFastFlag then
							local NumberRatio = Number / ExperienceStateReplaySourceClockOutputFpsFastInt
							Count = -math.min(math.ceil(4 / math.min(NumberRatio, 1)), (math.floor((ResolveRangeResult - MinLoadedFrameNumber) / NumberRatio)))
							NewFixedStepFrameOffsetResult = ResolveRangeResult + SourceClockPlaybackDriverModule.fixedStepFrameOffset(Count, Number, ExperienceStateReplaySourceClockOutputFpsFastInt)
						else
							NewFixedStepFrameOffsetResult = MinLoadedFrameNumber
						end
						ExperienceStateRecordingService:SetPlaybackFrame(NewFixedStepFrameOffsetResult)
					end)
					
					if Success then
						if FFlagExperienceStateReplayUseRecordedCurrentCameraModule and p1.noteSourceClockFrameApplied then
							p1.noteSourceClockFrameApplied()
						end
						Flag = true
						
						if ResolveRangeResult <= NewFixedStepFrameOffsetResult then
							Flag1 = true
							print(string.format("[SOURCECLOCK] start first=%d last=%d fps=%.6f", ResolveRangeResult, ResolveRangeResult2, Number))
						end
						return
					else
						RunService:UnbindFromRenderStep("ReplaySourceClock")
						local Text = "failed to start: " .. tostring(Result)
						warn("[SOURCECLOCK] failed: " .. Text)
						
						if Callback then
							Callback(Text)
						end
					end
				end
			end)
			
			return function()
				-- upvalues: Flag2 (ref), RunService (ref)
				if not Flag2 then
					Flag2 = true
					RunService:UnbindFromRenderStep("ReplaySourceClock")
				end
			end
		end
	end
end

return SourceClockPlaybackDriverModule