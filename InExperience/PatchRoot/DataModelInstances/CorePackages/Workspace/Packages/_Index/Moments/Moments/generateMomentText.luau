local moments = script:FindFirstAncestor("Moments")
local parent = moments.Parent
local promiseModule = require(parent.Promise)
local momentsCommonModule = require(parent.MomentsCommon)
local isStudioModule = require(parent.MomentsCommon.isStudio)
local getFFlagEnableMomentTextGeneration = momentsCommonModule.Flags.GetFFlagEnableMomentTextGeneration
local getFFlagMomentTextGenerationDisableCacheModule = require(moments.Flags.GetFFlagMomentTextGenerationDisableCache)
local fFlagMomentTextGenerationFilteredSignal = momentsCommonModule.Flags.FFlagMomentTextGenerationFilteredSignal
local t = {}

local function log(p0, ...) --[[ line: 57 ]]
	if _G.__MOMENTS_DISABLE_GEN_TEXT_LOG__ then
		return
	end
	print(`[moments-gen] {string.format(p0, ...)}`)
end

local function _() --[[ line: 64 | named "mockResult" ]]
	return {
		summary = "insane save",
		description = "no way i pulled this off \226\128\148 clutch save on the last second, everyone was screaming lol",
		error = nil
	}
end

local function captureKey(p1) --[[ line: 72 ]]
	local var9 = nil
	pcall(function() --[[ line: 74 ]]
		-- upvalues: var9 (write), p1 (ref)
		var9 = p1.LocalId
	end)
	
	return if var9 == nil then if typeof(p1) == "table" and p1.assetId ~= nil then `asset:{p1.assetId}` else `capture:{tostring(p1)}` else `local:{var9}`
end

local _ = function(p2) --[[ line: 89 | named "resultName" ]]
	if p2 == nil then
		return nil
	end
	local ok, status = pcall(function() --[[ line: 93 ]]
		-- upvalues: p2 (ref)
		return p2.Name
	end)
	
	return if ok and typeof(status) == "string" then status else nil
end

local function runGeneration(p3, p4, p5) --[[ line: 102 ]]
	-- upvalues: promiseModule (ref), log (ref), isStudioModule (ref), fFlagMomentTextGenerationFilteredSignal (ref), getFFlagEnableMomentTextGeneration (ref)
	local captureService = p5.captureService or game:GetService("CaptureService")
	local pollIntervalSeconds = p5.pollIntervalSeconds or 1
	local maxPollAttempts = p5.maxPollAttempts or 30
	
	return promiseModule.new(function(p6, _, p7) --[[ line: 107 ]]
		-- upvalues: captureService (ref), p3 (ref), log (copy), p4 (ref), isStudioModule (copy), maxPollAttempts (ref), pollIntervalSeconds (ref), fFlagMomentTextGenerationFilteredSignal (copy), getFFlagEnableMomentTextGeneration (copy)
		local thread = task.spawn(function() --[[ line: 108 ]]
			-- upvalues: captureService (copy), p3 (copy), log (copy), p4 (copy), isStudioModule (copy), p6 (ref), maxPollAttempts (copy), pollIntervalSeconds (copy), fFlagMomentTextGenerationFilteredSignal (copy)
			local ok, status, var14 = pcall(function() --[[ line: 109 ]]
				-- upvalues: captureService (copy), p3 (copy)
				return captureService:GenerateMomentTextAsync(p3)
			end)
			
			if ok then
				local var15
				if status == nil then
					var15 = nil
				else
					local ok_1, status_1 = pcall(function() --[[ line: 93 ]]
						-- upvalues: status (ref)
						return status.Name
					end)
					var15 = if ok_1 and typeof(status_1) == "string" then status_1 else nil
				end
				if var15 == "Success" and typeof(var14) == "string" and #var14 ~= 0 then
					log("generation started for %s", p4)
					
					for _ = 1, maxPollAttempts do
						local var18
						task.wait(pollIntervalSeconds)
						local ok_1, status_1, var16, var17 = pcall(function() --[[ line: 132 ]]
							-- upvalues: captureService (copy), var14 (ref)
							return captureService:CheckMomentTextStatusAsync(var14)
						end)
						
						if not ok_1 then
							continue
						end
						if status_1 == nil then
							var18 = nil
						else
							local ok_2, status_2 = pcall(function() --[[ line: 93 ]]
								-- upvalues: status_1 (ref)
								return status_1.Name
							end)
							var18 = if ok_2 and typeof(status_2) == "string" then status_2 else nil
						end
						if var18 ~= "Success" then
							if not fFlagMomentTextGenerationFilteredSignal or var18 ~= "Filtered" then
								if var18 ~= "Failed" then
									continue
								end
								p6({ error = "GENERATION_FAILED" })
								
								return
							end
							p6({ error = "CONTENT_FILTERED" })
							
							return
						end
						log("generation succeeded for %s", p4)
						p6({ summary = var16, description = var17 })
						
						return
					end
					p6({ error = "TIMEOUT" })
					
					return
				elseif not ok then
					log("generation start failed for %s", p4)
				end
				if isStudioModule() then
					p6({
						summary = "insane save",
						description = "no way i pulled this off \226\128\148 clutch save on the last second, everyone was screaming lol",
						error = nil
					})
					
					return
				end
				p6({ error = "REQUEST_FAILED" })
			end
		end)
		
		if getFFlagEnableMomentTextGeneration() then
			p7(function() --[[ line: 160 ]]
				-- upvalues: log (copy), p4 (copy), thread (ref)
				log("generation cancelled for %s", p4)
				task.cancel(thread)
			end)
		end
	end)
end

return function(p8, p9) --[[ line: 168 | named "generateMomentText" ]]
	-- upvalues: isStudioModule (ref), promiseModule (ref), captureKey (ref), getFFlagMomentTextGenerationDisableCacheModule (ref), runGeneration (ref), t (ref), log (ref), fFlagMomentTextGenerationFilteredSignal (ref), getFFlagEnableMomentTextGeneration (ref)
	p9 = p9 or {}
	
	if (p9.isEngineEnabled or function() --[[ line: 171 ]]
		return game:GetEngineFeature("CaptureServiceGenerateMomentText")
	end)() then
		local var20 = captureKey(p8)
		
		if getFFlagMomentTextGenerationDisableCacheModule() then
			return runGeneration(p8, var20, p9)
		elseif t[var20] ~= nil then
			return t[var20]
		end
		local captureService = p9.captureService or game:GetService("CaptureService")
		local pollIntervalSeconds = p9.pollIntervalSeconds or 1
		local maxPollAttempts = p9.maxPollAttempts or 30
		local var24 = promiseModule.new(function(p10, _, p11) --[[ line: 107 ]]
			-- upvalues: captureService (ref), p8 (ref), log (copy), var20 (ref), isStudioModule (copy), maxPollAttempts (ref), pollIntervalSeconds (ref), fFlagMomentTextGenerationFilteredSignal (copy), getFFlagEnableMomentTextGeneration (copy)
			local thread = task.spawn(function() --[[ line: 108 ]]
				-- upvalues: captureService (copy), p8 (copy), log (copy), var20 (copy), isStudioModule (copy), p10 (ref), maxPollAttempts (copy), pollIntervalSeconds (copy), fFlagMomentTextGenerationFilteredSignal (copy)
				local ok, status, var25 = pcall(function() --[[ line: 109 ]]
					-- upvalues: captureService (copy), p8 (copy)
					return captureService:GenerateMomentTextAsync(p8)
				end)
				
				if ok then
					local var15
					if status == nil then
						var15 = nil
					else
						local ok_1, status_1 = pcall(function() --[[ line: 93 ]]
							-- upvalues: status (ref)
							return status.Name
						end)
						var15 = if ok_1 and typeof(status_1) == "string" then status_1 else nil
					end
					if var15 == "Success" and typeof(var25) == "string" and #var25 ~= 0 then
						log("generation started for %s", var20)
						
						for _ = 1, maxPollAttempts do
							local var18
							task.wait(pollIntervalSeconds)
							local ok_1, status_1, var26, var27 = pcall(function() --[[ line: 132 ]]
								-- upvalues: captureService (copy), var25 (ref)
								return captureService:CheckMomentTextStatusAsync(var25)
							end)
							
							if not ok_1 then
								continue
								continue
							end
							if status_1 == nil then
								var18 = nil
							else
								local ok_2, status_2 = pcall(function() --[[ line: 93 ]]
									-- upvalues: status_1 (ref)
									return status_1.Name
								end)
								var18 = if ok_2 and typeof(status_2) == "string" then status_2 else nil
							end
							if var18 ~= "Success" then
								if not fFlagMomentTextGenerationFilteredSignal or var18 ~= "Filtered" then
									if var18 ~= "Failed" then
										continue
										continue
									end
									p10({ error = "GENERATION_FAILED" })
									
									return
								end
								p10({ error = "CONTENT_FILTERED" })
								
								return
							end
							log("generation succeeded for %s", var20)
							p10({ summary = var26, description = var27 })
							
							return
						end
						p10({ error = "TIMEOUT" })
						
						return
					elseif not ok then
						log("generation start failed for %s", var20)
					end
					if isStudioModule() then
						p10({
							summary = "insane save",
							description = "no way i pulled this off \226\128\148 clutch save on the last second, everyone was screaming lol",
							error = nil
						})
						
						return
					end
					p10({ error = "REQUEST_FAILED" })
				end
			end)
			
			if getFFlagEnableMomentTextGeneration() then
				p11(function() --[[ line: 160 ]]
					-- upvalues: log (copy), var20 (copy), thread (ref)
					log("generation cancelled for %s", var20)
					task.cancel(thread)
				end)
			end
		end)
		t[var20] = var24
		var24:andThen(function(p12) --[[ line: 199 ]]
			-- upvalues: t (copy), var20 (ref)
			if p12 == nil or p12.error ~= nil then
				t[var20] = nil
			end
		end, function() --[[ line: 203 ]]
			-- upvalues: t (copy), var20 (ref)
			t[var20] = nil
		end)
		
		if getFFlagEnableMomentTextGeneration() then
			var24:finally(function(p13) --[[ line: 211 ]]
				-- upvalues: promiseModule (copy), t (copy), var20 (ref)
				if p13 == promiseModule.Status.Cancelled then
					t[var20] = nil
				end
			end)
		end
		return var24
	else
		return if isStudioModule() then promiseModule.resolve({
			summary = "insane save",
			description = "no way i pulled this off \226\128\148 clutch save on the last second, everyone was screaming lol",
			error = nil
		}) else promiseModule.resolve({ error = "ENGINE_UNSUPPORTED" })
	end
end