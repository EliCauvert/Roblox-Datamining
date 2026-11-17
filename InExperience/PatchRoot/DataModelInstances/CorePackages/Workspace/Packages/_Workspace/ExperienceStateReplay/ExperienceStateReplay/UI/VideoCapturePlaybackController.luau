local Parent = script.Parent
local LoadSlicesModule = require(Parent.LoadSlices)
local ExperienceStateRecordingService = game:GetService("ExperienceStateRecordingService")
local Players = game:GetService("Players")
local ExperienceStateReplayResumeNearSliceBoundary = game:DefineFastFlag("ExperienceStateReplayResumeNearSliceBoundary", false)
local ExperienceStateReplayClothingProbe = game:DefineFastFlag("ExperienceStateReplayClothingProbe", false)
local FFlagExperienceStateReplayRestoreRecordedClothingModule = require(Parent.Parent.Flags.FFlagExperienceStateReplayRestoreRecordedClothing)
local FFlagExperienceStateReplaySourceClockPlaybackModule = require(Parent.Parent.Flags.FFlagExperienceStateReplaySourceClockPlayback)

local function reportRecordedClothing(Floored)
	local Count = 0
	
	for _, Humanoid in workspace:GetDescendants() do
		if Humanoid:IsA("Humanoid") then
			local Parent = Humanoid.Parent
			
			if Parent and Parent:IsA("Model") then
				local Shirt = Parent:FindFirstChildOfClass("Shirt")
				local Pants = Parent:FindFirstChildOfClass("Pants")
				local HumanoidDescription = Humanoid:FindFirstChildOfClass("HumanoidDescription")
				local Success, Result = pcall(function()
					-- upvalues: Humanoid (copy)
					return Humanoid:GetAppliedDescription()
				end)
				print("[CLOTHINGPROBE] frame=" .. tostring(Floored) .. " shirtId=" .. tostring(if Success and Result then Result.Shirt else "error") .. " pantsId=" .. tostring(if Success and Result then Result.Pants else "error") .. " recordedShirtId=" .. tostring(if HumanoidDescription then HumanoidDescription.Shirt else "missing") .. " recordedPantsId=" .. tostring(if HumanoidDescription then HumanoidDescription.Pants else "missing") .. " shirtTemplate=" .. tostring(if Shirt then Shirt.ShirtTemplate else "missing") .. " pantsTemplate=" .. tostring(if Pants then Pants.PantsTemplate else "missing"))
				Count += 1
				
				if Count >= 8 then break end
			end
		end
	end
	print("[CLOTHINGPROBE] frame=" .. tostring(Floored) .. " humanoids=" .. tostring(Count))
end

local function _(Character): boolean
	-- upvalues: Players (copy)
	local LocalPlayer = Players.LocalPlayer
	
	return LocalPlayer ~= nil and LocalPlayer.Character == Character
end

local function restoreRecordedClothing(p1)
	-- upvalues: Players (copy)
	for _, Humanoid in workspace:GetDescendants() do
		if Humanoid:IsA("Humanoid") then
			local Parent = Humanoid.Parent
			
			if not p1[Humanoid] and Parent and Parent:IsA("Model") then
				local LocalPlayer = Players.LocalPlayer
				
				if LocalPlayer ~= nil and LocalPlayer.Character == Parent then
					p1[Humanoid] = true
					print("[CLOTHINGSKIP] reason=local-player")
				else
					local Success, Result = pcall(function()
						-- upvalues: Humanoid (copy)
						return Humanoid:GetAppliedDescription()
					end)
					
					if Success and Result then
						local Shirt = Parent:FindFirstChildOfClass("Shirt")
						local Pants = Parent:FindFirstChildOfClass("Pants")
						local NoShirt: boolean = Result.Shirt > 0 and (Shirt == nil or Shirt.ShirtTemplate == "")
						local NoPants: boolean = Result.Pants > 0 and (Pants == nil or Pants.PantsTemplate == "")
						
						if NoShirt or NoPants then
							p1[Humanoid] = true
							task.spawn(function()
								-- upvalues: Humanoid (copy), Result (copy)
								local Success, Result1 = pcall(function()
									-- upvalues: Humanoid (upval), Result (upval)
									Humanoid:ApplyDescriptionResetAsync(Result)
								end)
								print("[CLOTHINGRESTORE] applied=" .. tostring(Success) .. " mode=reset-with-camera-visibility" .. " shirtId=" .. tostring(Result.Shirt) .. " pantsId=" .. tostring(Result.Pants) .. " error=" .. tostring(if Success then "none" else Result1))
							end)
						end
					end
				end
			end
		end
	end
end

return {
	start = function(p2, Text: string, p3)
		-- upvalues: FFlagExperienceStateReplaySourceClockPlaybackModule (copy), LoadSlicesModule (copy), ExperienceStateRecordingService (copy), restoreRecordedClothing (copy), ExperienceStateReplayResumeNearSliceBoundary (copy), FFlagExperienceStateReplayRestoreRecordedClothingModule (copy), ExperienceStateReplayClothingProbe (copy), reportRecordedClothing (copy), Parent (copy)
		local IsRWS: boolean = FFlagExperienceStateReplaySourceClockPlaybackModule and string.sub(Text, 1, 4) == "RWS;"
		local LoadForCapture = if p3 and p3.loadForCapture then p3.loadForCapture else LoadSlicesModule.loadForCapture
		local ConnectPlaybackStatusUpdated = if p3 and p3.connectPlaybackStatusUpdated then p3.connectPlaybackStatusUpdated else function(Callback)
			-- upvalues: ExperienceStateRecordingService (upval)
			local PlaybackStatusUpdatedConnection = ExperienceStateRecordingService.PlaybackStatusUpdated:Connect(Callback)
			
			return function()
				-- upvalues: PlaybackStatusUpdatedConnection (copy)
				PlaybackStatusUpdatedConnection:Disconnect()
			end
		end
		local ScreenGui = p2.screenGui
		
		if ScreenGui == nil then
			warn("[VIDEOCAPTURE] failed reason=replay GUI is unavailable")
			
			return
		end
		local Flag = false
		local Flag1 = false
		local Flag2 = false
		local v1 = 0
		local Value = 0
		local v2 = nil
		local v3 = -600
		local v4 = -1
		local Floored = 0
		local t = {}
		local RestoreRecordedClothing = if p3 and p3.restoreRecordedClothing then p3.restoreRecordedClothing else function()
			-- upvalues: restoreRecordedClothing (upval), t (copy)
			restoreRecordedClothing(t)
		end
		
		local function v43() end
		
		local Callback: () -> () = nil
		local AnonymizationFailure = if p3 and p3.anonymizationFailure then p3.anonymizationFailure else function()
			return nil
		end
		
		local function fail(p4)
			-- upvalues: Flag (ref), v43 (ref), Callback (ref)
			if Flag then return end
			Flag = true
			v43()
			
			if Callback ~= nil then
				Callback()
			end
			warn("[VIDEOCAPTURE] failed reason=" .. tostring(p4))
		end
		
		local function _(): boolean
			-- upvalues: AnonymizationFailure (copy), Flag (ref), v43 (ref), Callback (ref)
			local AnonymizationFailureResult = AnonymizationFailure()
			
			if AnonymizationFailureResult == nil then
				return false
			end
			local Text = "playback anonymization failed: " .. AnonymizationFailureResult
			
			if not Flag then
				Flag = true
				v43()
				
				if Callback ~= nil then
					Callback()
				end
				warn("[VIDEOCAPTURE] failed reason=" .. tostring(Text))
			end
			return true
		end
		
		local function finishIfComplete()
			-- upvalues: Flag (ref), Flag1 (ref), Flag2 (ref), p2 (copy), IsRWS (copy), v2 (ref), Value (ref), v1 (ref), AnonymizationFailure (copy), v43 (ref), Callback (ref)
			if Flag or not Flag1 or not Flag2 then return end
			local MaxLoadedFrameNumber: number = p2.maxLoadedFrameNumber
			
			if if IsRWS then v2 ~= nil else MaxLoadedFrameNumber ~= nil and (MaxLoadedFrameNumber <= Value or v1 >= 1 and Value >= MaxLoadedFrameNumber - 1) then
				local AnonymizationFailureResult = AnonymizationFailure()
				local Flag3 = nil
				
				if AnonymizationFailureResult == nil then
					Flag3 = false
				else
					local Text = "playback anonymization failed: " .. AnonymizationFailureResult
					
					if not Flag then
						Flag = true
						v43()
						
						if Callback ~= nil then
							Callback()
						end
						warn("[VIDEOCAPTURE] failed reason=" .. tostring(Text))
					end
					Flag3 = true
				end
				if Flag3 then return end
				if p2.hasSyncedRecordedCamera == nil or not p2.hasSyncedRecordedCamera() then
					if Flag then return end
					Flag = true
					v43()
					
					if Callback ~= nil then
						Callback()
					end
					warn("[VIDEOCAPTURE] failed reason=" .. tostring("recorded playback camera was never synchronized"))
					
					return
				else
					Flag = true
					v43()
					print("[VIDEOCAPTURE] finished frame=" .. tostring((math.floor(Value))))
				end
			end
		end
		
		local _ = function()
			-- upvalues: Flag (ref), IsRWS (copy), p2 (copy), Flag1 (ref), v1 (ref), ExperienceStateReplayResumeNearSliceBoundary (upval), Value (ref)
			if Flag or IsRWS then return end
			local MaxLoadedFrameNumber = p2.maxLoadedFrameNumber
			
			if Flag1 and (v1 >= 1 or ExperienceStateReplayResumeNearSliceBoundary and v1 >= 0.99) and MaxLoadedFrameNumber ~= nil and Value < MaxLoadedFrameNumber and p2.SetPlaying ~= nil then
				v1 = 0
				p2.SetPlaying()
			end
		end
		
		ScreenGui.Enabled = false
		local AnonymizationFailureResult = AnonymizationFailure()
		local Flag3 = nil
		
		if AnonymizationFailureResult == nil then
			Flag3 = false
		else
			local Text1 = "playback anonymization failed: " .. AnonymizationFailureResult
			
			if not Flag then
				Flag = true
				v43()
				
				if Callback ~= nil then
					Callback()
				end
				warn("[VIDEOCAPTURE] failed reason=" .. tostring(Text1))
			end
			Flag3 = true
		end
		if Flag3 then return end
		local Success, Result = pcall(function(): boolean
			-- upvalues: LoadForCapture (copy), p2 (copy), Text (copy), Flag (ref), AnonymizationFailure (copy), v43 (ref), Callback (ref), IsRWS (copy), ConnectPlaybackStatusUpdated (copy), v1 (ref), Value (ref), FFlagExperienceStateReplayRestoreRecordedClothingModule (upval), Flag1 (ref), Floored (ref), RestoreRecordedClothing (copy), ExperienceStateReplayClothingProbe (upval), v4 (ref), reportRecordedClothing (upval), v3 (ref), finishIfComplete (copy), ExperienceStateReplayResumeNearSliceBoundary (upval), p3 (copy), Parent (upval), v2 (ref), fail (copy), Flag2 (ref)
			LoadForCapture(p2, Text, function()
				-- upvalues: Flag (upval), AnonymizationFailure (upval), v43 (upval), Callback (upval), p2 (upval), IsRWS (upval), ConnectPlaybackStatusUpdated (upval), v1 (upval), Value (upval), FFlagExperienceStateReplayRestoreRecordedClothingModule (upval), Flag1 (upval), Floored (upval), RestoreRecordedClothing (upval), ExperienceStateReplayClothingProbe (upval), v4 (upval), reportRecordedClothing (upval), v3 (upval), finishIfComplete (upval), ExperienceStateReplayResumeNearSliceBoundary (upval), p3 (upval), Parent (upval), v2 (upval), fail (upval)
				if not Flag then
					local AnonymizationFailureResult = AnonymizationFailure()
					local Flag2 = nil
					
					if AnonymizationFailureResult == nil then
						Flag2 = false
					else
						local Text = "playback anonymization failed: " .. AnonymizationFailureResult
						
						if not Flag then
							Flag = true
							v43()
							
							if Callback ~= nil then
								Callback()
							end
							warn("[VIDEOCAPTURE] failed reason=" .. tostring(Text))
						end
						Flag2 = true
					end
					if not Flag2 then
						if p2.activateFollowRecordedCamera then
							p2.activateFollowRecordedCamera(IsRWS)
						end
						local MaxLoadedFrameNumber: number = p2.maxLoadedFrameNumber
						
						if MaxLoadedFrameNumber == nil or MaxLoadedFrameNumber <= 0 then
							if Flag then return end
							Flag = true
							v43()
							
							if Callback ~= nil then
								Callback()
							end
							warn("[VIDEOCAPTURE] failed reason=" .. tostring("maxLoadedFrameNumber is not positive after loading the capture"))
							
							return
						elseif IsRWS or p2.SetPlaying ~= nil then
							v43 = ConnectPlaybackStatusUpdated(function(p4, Value1: number)
								-- upvalues: Flag (upval), AnonymizationFailure (upval), v43 (upval), Callback (upval), v1 (upval), Value (upval), FFlagExperienceStateReplayRestoreRecordedClothingModule (upval), Flag1 (upval), Floored (upval), RestoreRecordedClothing (upval), ExperienceStateReplayClothingProbe (upval), v4 (upval), reportRecordedClothing (upval), v3 (upval), finishIfComplete (upval), p2 (upval), IsRWS (upval), ExperienceStateReplayResumeNearSliceBoundary (upval)
								if not Flag then
									local AnonymizationFailureResult = AnonymizationFailure()
									local Flag2 = nil
									
									if AnonymizationFailureResult == nil then
										Flag2 = false
									else
										local Text = "playback anonymization failed: " .. AnonymizationFailureResult
										
										if not Flag then
											Flag = true
											v43()
											
											if Callback ~= nil then
												Callback()
											end
											warn("[VIDEOCAPTURE] failed reason=" .. tostring(Text))
										end
										Flag2 = true
									end
									if not Flag2 then
										v1 = p4
										Value = Value1
										
										if FFlagExperienceStateReplayRestoreRecordedClothingModule and Flag1 and Floored + 60 <= Value1 then
											Floored = Value1
											RestoreRecordedClothing()
										end
										if ExperienceStateReplayClothingProbe and v4 < 600 and Value1 >= 600 then
											v4 = Value1
											reportRecordedClothing((math.floor(Value1)))
										end
										if v3 + 600 <= Value1 then
											v3 = Value1
											print("[VIDEOCAPTURE] progress frame=" .. tostring((math.floor(Value1))) .. " percentage=" .. tostring(p4))
										end
										finishIfComplete()
										local MaxLoadedFrameNumber: number = p2.maxLoadedFrameNumber
										
										if not Flag and MaxLoadedFrameNumber ~= nil and Value1 < MaxLoadedFrameNumber - 1 and not Flag then
											if IsRWS then return end
											local MaxLoadedFrameNumber1 = p2.maxLoadedFrameNumber
											
											if Flag1 and (v1 >= 1 or ExperienceStateReplayResumeNearSliceBoundary and v1 >= 0.99) and (MaxLoadedFrameNumber1 ~= nil and Value < MaxLoadedFrameNumber1 and p2.SetPlaying ~= nil) then
												v1 = 0
												p2.SetPlaying()
											end
										end
										return
									end
								end
							end)
							
							if Flag then
								v43()
							end
							Flag1 = true
							Floored = math.floor(p2.minLoadedFrameNumber or 0)
							
							if ExperienceStateReplayClothingProbe then
								reportRecordedClothing((math.floor(p2.minLoadedFrameNumber or 0)))
							end
							if FFlagExperienceStateReplayRestoreRecordedClothingModule then
								RestoreRecordedClothing()
							end
							print("[VIDEOCAPTURE] started frame=" .. tostring((math.floor(p2.minLoadedFrameNumber or 0))) .. " epochMs=" .. tostring((math.floor(p2.minLoadedEpoch or 0))) .. " maxFrame=" .. tostring((math.floor(p2.maxLoadedFrameNumber or 0))) .. " maxEpochMs=" .. tostring((math.floor(p2.maxLoadedEpoch or 0))))
							
							if IsRWS then
								Callback = (if p3 and p3.startSourceClock then p3.startSourceClock else require(Parent.SourceClockPlaybackDriver).start)(p2, function(p4)
									-- upvalues: Value (upval), v2 (upval), finishIfComplete (upval)
									Value = p4
									v2 = p4
									finishIfComplete()
								end, fail)
								
								return
							end
							local SetPlayingFunction: () -> () = p2.SetPlaying
							
							if SetPlayingFunction then
								SetPlayingFunction()
							end
							return
						else
							if Flag then return end
							Flag = true
							v43()
							
							if Callback ~= nil then
								Callback()
							end
							warn("[VIDEOCAPTURE] failed reason=" .. tostring("replay controls are unavailable after loading the capture"))
							
							return
						end
					end
				end
			end, fail, function()
				-- upvalues: Flag2 (upval), finishIfComplete (upval), Flag (upval), IsRWS (upval), p2 (upval), Flag1 (upval), v1 (upval), ExperienceStateReplayResumeNearSliceBoundary (upval), Value (upval)
				Flag2 = true
				finishIfComplete()
				
				if not Flag and not Flag then
					if IsRWS then return end
					local MaxLoadedFrameNumber = p2.maxLoadedFrameNumber
					
					if Flag1 and (v1 >= 1 or ExperienceStateReplayResumeNearSliceBoundary and v1 >= 0.99) and MaxLoadedFrameNumber ~= nil and Value < MaxLoadedFrameNumber and p2.SetPlaying ~= nil then
						v1 = 0
						p2.SetPlaying()
					end
				end
			end, function()
				-- upvalues: Flag (upval), IsRWS (upval), p2 (upval), Flag1 (upval), v1 (upval), ExperienceStateReplayResumeNearSliceBoundary (upval), Value (upval)
				if not Flag then
					if IsRWS then return end
					local MaxLoadedFrameNumber = p2.maxLoadedFrameNumber
					
					if Flag1 and (v1 >= 1 or ExperienceStateReplayResumeNearSliceBoundary and v1 >= 0.99) and MaxLoadedFrameNumber ~= nil and Value < MaxLoadedFrameNumber and p2.SetPlaying ~= nil then
						v1 = 0
						p2.SetPlaying()
					end
				end
			end)
			
			return true
		end)
		
		if not Success and not Flag then
			Flag = true
			v43()
			
			if Callback ~= nil then
				Callback()
			end
			warn("[VIDEOCAPTURE] failed reason=" .. tostring(Result))
		end
	end
}