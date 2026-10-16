local Moments = script:FindFirstAncestor("Moments")
local Parent = Moments.Parent
local PromiseModule = require(Parent.Promise)
local MomentsCommonModule = require(Parent.MomentsCommon)
local IsStudioModule = require(Parent.MomentsCommon.isStudio)
local GetFFlagEnableMomentTextGenerationFunction = MomentsCommonModule.Flags.GetFFlagEnableMomentTextGeneration
local GetFFlagMomentTextGenerationDisableCacheModule = require(Moments.Flags.GetFFlagMomentTextGenerationDisableCache)
local FFlagMomentTextGenerationFilteredSignal = MomentsCommonModule.Flags.FFlagMomentTextGenerationFilteredSignal
local NewResults = {}

local function log(Template: string, ...) --[[ Line: 60 ]]
	if not _G.__MOMENTS_DISABLE_GEN_TEXT_LOG__ then
		print(`[moments-gen] {string.format(Template, ...)}`)
		
		return
	end
end

local function _() --[[ Line: 67 | Named "mockResult" ]]
	return {
		summary = "insane save",
		description = "no way i pulled this off — clutch save on the last second, everyone was screaming lol",
		error = nil
	}
end

local function captureKey(Capture): string --[[ Line: 75 ]]
	local LocalId = nil
	pcall(function() --[[ Line: 77 ]]
		-- upvalues: LocalId (ref), Capture (copy)
		LocalId = Capture.LocalId
	end)
	
	return if LocalId == nil then if typeof(Capture) == "table" and Capture.assetId ~= nil then `asset:{Capture.assetId}` else `capture:{tostring(Capture)}` else `local:{LocalId}`
end

local _ = function(p1) --[[ Line: 92 | Named "resultName" ]]
	if p1 == nil then
		return nil
	else
		local Success, Result = pcall(function() --[[ Line: 96 ]]
			-- upvalues: p1 (copy)
			return p1.Name
		end)
		
		return if Success and typeof(Result) == "string" then Result else nil
	end
end

local function runGeneration(Capture, ToneName, Tone, p1) --[[ Line: 105 ]]
	-- upvalues: PromiseModule (copy), log (copy), IsStudioModule (copy), FFlagMomentTextGenerationFilteredSignal (copy), GetFFlagEnableMomentTextGenerationFunction (copy)
	local CaptureService = p1.captureService or game:GetService("CaptureService")
	local PollIntervalSeconds = p1.pollIntervalSeconds or 1
	local MaxPollAttempts = p1.maxPollAttempts or 30
	
	return PromiseModule.new(function(Callback1, _, Callback: (any) -> ()) --[[ Line: 110 ]]
		-- upvalues: Tone (copy), CaptureService (copy), Capture (copy), log (upval), ToneName (copy), IsStudioModule (upval), MaxPollAttempts (copy), PollIntervalSeconds (copy), FFlagMomentTextGenerationFilteredSignal (upval), GetFFlagEnableMomentTextGenerationFunction (upval)
		local SpawnedThread = task.spawn(function() --[[ Line: 111 ]]
			-- upvalues: Tone (upval), CaptureService (upval), Capture (upval), log (upval), ToneName (upval), IsStudioModule (upval), Callback1 (copy), MaxPollAttempts (upval), PollIntervalSeconds (upval), FFlagMomentTextGenerationFilteredSignal (upval)
			local Success, Result, Result3 = pcall(function() --[[ Line: 112 ]]
				-- upvalues: Tone (upval), CaptureService (upval), Capture (upval)
				return if Tone == nil then CaptureService:GenerateMomentTextAsync(Capture) else CaptureService:GenerateMomentTextAsync(Capture, Tone)
			end)
			
			if Success then
				local v1 = nil
				if Result == nil then
					v1 = nil
				else
					local Success1, Result1 = pcall(function() --[[ Line: 96 ]]
						-- upvalues: Result (copy)
						return Result.Name
					end)
					v1 = if Success1 and typeof(Result1) == "string" then Result1 else nil
				end
				if v1 == "Success" and typeof(Result3) == "string" and #Result3 ~= 0 then
					log("generation started for %s", ToneName)
					local Result3_1 = nil
					local Result4 = nil
					
					for _ = 1, MaxPollAttempts do
						task.wait(PollIntervalSeconds)
						local Success2, Result2
						Success2, Result2, Result3_1, Result4 = pcall(function() --[[ Line: 141 ]]
							-- upvalues: CaptureService (upval), Result3 (copy)
							return CaptureService:CheckMomentTextStatusAsync(Result3)
						end)
						
						if Success2 then
							local v2 = nil
							if Result2 == nil then
								v2 = nil
							else
								local Success3, Result5 = pcall(function() --[[ Line: 96 ]]
									-- upvalues: Result2 (copy)
									return Result2.Name
								end)
								v2 = if Success3 and typeof(Result5) == "string" then Result5 else nil
							end
							if v2 == "Success" then
								log("generation succeeded for %s", ToneName)
								Callback1({
									summary = Result3_1,
									description = Result4,
									generationToken = Result3
								})
								
								return
							end
							if FFlagMomentTextGenerationFilteredSignal and v2 == "Filtered" then
								Callback1({ error = "CONTENT_FILTERED" })
								
								return
							end
							if v2 == "Failed" then
								Callback1({ error = "GENERATION_FAILED" })
								
								return
							end
						end
					end
					Callback1({ error = "TIMEOUT" })
					
					return
				end
			end
			if not Success then
				log("generation start failed for %s", ToneName)
			end
			if IsStudioModule() then
				Callback1({
					summary = "insane save",
					description = "no way i pulled this off — clutch save on the last second, everyone was screaming lol",
					error = nil
				})
				
				return
			else
				Callback1({ error = "REQUEST_FAILED" })
			end
		end)
		
		if GetFFlagEnableMomentTextGenerationFunction() then
			Callback(function() --[[ Line: 171 ]]
				-- upvalues: log (upval), ToneName (upval), SpawnedThread (copy)
				log("generation cancelled for %s", ToneName)
				task.cancel(SpawnedThread)
			end)
		end
	end)
end

return function(Capture, Tone, p2) --[[ Line: 179 | Named "generateMomentText" ]]
	-- upvalues: IsStudioModule (copy), PromiseModule (copy), captureKey (copy), GetFFlagMomentTextGenerationDisableCacheModule (copy), runGeneration (copy), NewResults (copy), log (copy), FFlagMomentTextGenerationFilteredSignal (copy), GetFFlagEnableMomentTextGenerationFunction (copy)
	local P9 = p2 or {}
	
	if not (P9.isEngineEnabled or function() --[[ Line: 182 ]]
		return game:GetEngineFeature("CaptureServiceGenerateMomentText")
	end)() then
		return if IsStudioModule() then PromiseModule.resolve({
			summary = "insane save",
			description = "no way i pulled this off — clutch save on the last second, everyone was screaming lol",
			error = nil
		}) else PromiseModule.resolve({ error = "ENGINE_UNSUPPORTED" })
	end
	local CaptureKeyResult = captureKey(Capture)
	
	if Tone ~= nil and Tone ~= "" then
		CaptureKeyResult = `{CaptureKeyResult}|tone:{Tone}`
	end
	if GetFFlagMomentTextGenerationDisableCacheModule() then
		return runGeneration(Capture, CaptureKeyResult, Tone, P9)
	end
	if NewResults[CaptureKeyResult] ~= nil then
		return NewResults[CaptureKeyResult]
	end
	local ToneName: string = CaptureKeyResult
	local CaptureService = P9.captureService or game:GetService("CaptureService")
	local PollIntervalSeconds = P9.pollIntervalSeconds or 1
	local MaxPollAttempts = P9.maxPollAttempts or 30
	local NewPromise = PromiseModule.new(function(Callback1, _, Callback: (any) -> ()) --[[ Line: 110 ]]
		-- upvalues: Tone (copy), CaptureService (copy), Capture (copy), log (upval), ToneName (copy), IsStudioModule (upval), MaxPollAttempts (copy), PollIntervalSeconds (copy), FFlagMomentTextGenerationFilteredSignal (upval), GetFFlagEnableMomentTextGenerationFunction (upval)
		local SpawnedThread = task.spawn(function() --[[ Line: 111 ]]
			-- upvalues: Tone (upval), CaptureService (upval), Capture (upval), log (upval), ToneName (upval), IsStudioModule (upval), Callback1 (copy), MaxPollAttempts (upval), PollIntervalSeconds (upval), FFlagMomentTextGenerationFilteredSignal (upval)
			local Success, Result, Result3 = pcall(function() --[[ Line: 112 ]]
				-- upvalues: Tone (upval), CaptureService (upval), Capture (upval)
				return if Tone == nil then CaptureService:GenerateMomentTextAsync(Capture) else CaptureService:GenerateMomentTextAsync(Capture, Tone)
			end)
			
			if Success then
				local v1 = nil
				if Result == nil then
					v1 = nil
				else
					local Success1, Result1 = pcall(function() --[[ Line: 96 ]]
						-- upvalues: Result (copy)
						return Result.Name
					end)
					v1 = if Success1 and typeof(Result1) == "string" then Result1 else nil
				end
				if v1 == "Success" and typeof(Result3) == "string" and #Result3 ~= 0 then
					log("generation started for %s", ToneName)
					local Result3_1 = nil
					local Result4 = nil
					
					for _ = 1, MaxPollAttempts do
						task.wait(PollIntervalSeconds)
						local Success2, Result2
						Success2, Result2, Result3_1, Result4 = pcall(function() --[[ Line: 141 ]]
							-- upvalues: CaptureService (upval), Result3 (copy)
							return CaptureService:CheckMomentTextStatusAsync(Result3)
						end)
						
						if Success2 then
							local v2 = nil
							if Result2 == nil then
								v2 = nil
							else
								local Success3, Result5 = pcall(function() --[[ Line: 96 ]]
									-- upvalues: Result2 (copy)
									return Result2.Name
								end)
								v2 = if Success3 and typeof(Result5) == "string" then Result5 else nil
							end
							if v2 == "Success" then
								log("generation succeeded for %s", ToneName)
								Callback1({
									summary = Result3_1,
									description = Result4,
									generationToken = Result3
								})
								
								return
							end
							if FFlagMomentTextGenerationFilteredSignal and v2 == "Filtered" then
								Callback1({ error = "CONTENT_FILTERED" })
								
								return
							end
							if v2 == "Failed" then
								Callback1({ error = "GENERATION_FAILED" })
								
								return
							end
						end
					end
					Callback1({ error = "TIMEOUT" })
					
					return
				end
			end
			if not Success then
				log("generation start failed for %s", ToneName)
			end
			if IsStudioModule() then
				Callback1({
					summary = "insane save",
					description = "no way i pulled this off — clutch save on the last second, everyone was screaming lol",
					error = nil
				})
				
				return
			else
				Callback1({ error = "REQUEST_FAILED" })
			end
		end)
		
		if GetFFlagEnableMomentTextGenerationFunction() then
			Callback(function() --[[ Line: 171 ]]
				-- upvalues: log (upval), ToneName (upval), SpawnedThread (copy)
				log("generation cancelled for %s", ToneName)
				task.cancel(SpawnedThread)
			end)
		end
	end)
	NewResults[CaptureKeyResult] = NewPromise
	NewPromise:andThen(function(Result) --[[ Line: 216 ]]
		-- upvalues: NewResults (upval), CaptureKeyResult (ref)
		if Result == nil or Result.error ~= nil then
			NewResults[CaptureKeyResult] = nil
		end
	end, function() --[[ Line: 220 ]]
		-- upvalues: NewResults (upval), CaptureKeyResult (ref)
		NewResults[CaptureKeyResult] = nil
	end)
	
	if GetFFlagEnableMomentTextGenerationFunction() then
		NewPromise:finally(function(Cancelled) --[[ Line: 228 ]]
			-- upvalues: PromiseModule (upval), NewResults (upval), CaptureKeyResult (ref)
			if Cancelled == PromiseModule.Status.Cancelled then
				NewResults[CaptureKeyResult] = nil
			end
		end)
	end
	return NewPromise
end