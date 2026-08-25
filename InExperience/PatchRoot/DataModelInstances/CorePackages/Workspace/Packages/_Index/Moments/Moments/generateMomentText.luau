local moments = script:FindFirstAncestor("Moments")
local parent = moments.Parent
local promiseModule = require(parent.Promise)
local momentsCommonModule = require(parent.MomentsCommon)
local isStudioModule = require(parent.MomentsCommon.isStudio)
local getFFlagEnableMomentTextGeneration = momentsCommonModule.Flags.GetFFlagEnableMomentTextGeneration
local getFFlagMomentTextGenerationDisableCacheModule = require(moments.Flags.GetFFlagMomentTextGenerationDisableCache)
local fFlagMomentTextGenerationFilteredSignal = momentsCommonModule.Flags.FFlagMomentTextGenerationFilteredSignal
local t = {}

local function log(p0, ...)
	if _G.__MOMENTS_DISABLE_GEN_TEXT_LOG__ then
		return
	end
	print(`[moments-gen] {string.format(p0, ...)}`)
end

local function _()
	return {
		summary = "insane save",
		description = "no way i pulled this off \226\128\148 clutch save on the last second, everyone was screaming lol",
		error = nil
	}
end

local function captureKey(p1)
	local var9 = nil
	pcall(function()
		-- upvalues: var9 (write), p1 (ref)
		var9 = p1.LocalId
	end)
	
	return if var9 == nil then if typeof(p1) == "table" and p1.assetId ~= nil then `asset:{p1.assetId}` else `capture:{tostring(p1)}` else `local:{var9}`
end

local _ = function(p2)
	if p2 == nil then
		return nil
	end
	local ok, status = pcall(function()
		-- upvalues: p2 (ref)
		return p2.Name
	end)
	
	return if ok and typeof(status) == "string" then status else nil
end

local function runGeneration(p3, p4, p5, p6)
	-- upvalues: promiseModule (ref), log (ref), isStudioModule (ref), fFlagMomentTextGenerationFilteredSignal (ref), getFFlagEnableMomentTextGeneration (ref)
	local captureService = p6.captureService or game:GetService("CaptureService")
	local pollIntervalSeconds = p6.pollIntervalSeconds or 1
	local maxPollAttempts = p6.maxPollAttempts or 30
	
	return promiseModule.new(function(p7, _, p8)
		-- upvalues: p5 (ref), captureService (ref), p3 (ref), log (copy), p4 (ref), isStudioModule (copy), maxPollAttempts (ref), pollIntervalSeconds (ref), fFlagMomentTextGenerationFilteredSignal (copy), getFFlagEnableMomentTextGeneration (copy)
		local thread = task.spawn(function()
			-- upvalues: p5 (copy), captureService (copy), p3 (copy), log (copy), p4 (copy), isStudioModule (copy), p7 (ref), maxPollAttempts (copy), pollIntervalSeconds (copy), fFlagMomentTextGenerationFilteredSignal (copy)
			local ok, status, var14 = pcall(function()
				-- upvalues: p5 (copy), captureService (copy), p3 (copy)
				return if p5 == nil then captureService:GenerateMomentTextAsync(p3) else captureService:GenerateMomentTextAsync(p3, p5)
			end)
			
			if ok then
				local var15
				if status == nil then
					var15 = nil
				else
					local ok_1, status_1 = pcall(function()
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
						local ok_1, status_1, var16, var17 = pcall(function()
							-- upvalues: captureService (copy), var14 (ref)
							return captureService:CheckMomentTextStatusAsync(var14)
						end)
						
						if not ok_1 then
							continue
						end
						if status_1 == nil then
							var18 = nil
						else
							local ok_2, status_2 = pcall(function()
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
								p7({ error = "GENERATION_FAILED" })
								
								return
							end
							p7({ error = "CONTENT_FILTERED" })
							
							return
						end
						log("generation succeeded for %s", p4)
						p7({
							summary = var16,
							description = var17,
							generationToken = var14
						})
						
						return
					end
					p7({ error = "TIMEOUT" })
					
					return
				elseif not ok then
					log("generation start failed for %s", p4)
				end
				if isStudioModule() then
					p7({
						summary = "insane save",
						description = "no way i pulled this off \226\128\148 clutch save on the last second, everyone was screaming lol",
						error = nil
					})
					
					return
				end
				p7({ error = "REQUEST_FAILED" })
			end
		end)
		
		if getFFlagEnableMomentTextGeneration() then
			p8(function()
				-- upvalues: log (copy), p4 (copy), thread (ref)
				log("generation cancelled for %s", p4)
				task.cancel(thread)
			end)
		end
	end)
end

return function(p9, p10, p11)
	-- upvalues: isStudioModule (ref), promiseModule (ref), captureKey (ref), getFFlagMomentTextGenerationDisableCacheModule (ref), runGeneration (ref), t (ref), log (ref), fFlagMomentTextGenerationFilteredSignal (ref), getFFlagEnableMomentTextGeneration (ref)
	p11 = p11 or {}
	
	if (p11.isEngineEnabled or function()
		return game:GetEngineFeature("CaptureServiceGenerateMomentText")
	end)() then
		local var20 = captureKey(p9)
		
		if p10 ~= nil and p10 ~= "" then
			var20 = `{var20}|tone:{p10}`
		end
		if getFFlagMomentTextGenerationDisableCacheModule() then
			return runGeneration(p9, var20, p10, p11)
		elseif t[var20] ~= nil then
			return t[var20]
		end
		local var21 = var20
		local captureService = p11.captureService or game:GetService("CaptureService")
		local pollIntervalSeconds = p11.pollIntervalSeconds or 1
		local maxPollAttempts = p11.maxPollAttempts or 30
		local var25 = promiseModule.new(function(p12, _, p13)
			-- upvalues: p10 (ref), captureService (ref), p9 (ref), log (copy), var21 (ref), isStudioModule (copy), maxPollAttempts (ref), pollIntervalSeconds (ref), fFlagMomentTextGenerationFilteredSignal (copy), getFFlagEnableMomentTextGeneration (copy)
			local thread = task.spawn(function()
				-- upvalues: p10 (copy), captureService (copy), p9 (copy), log (copy), var21 (copy), isStudioModule (copy), p12 (ref), maxPollAttempts (copy), pollIntervalSeconds (copy), fFlagMomentTextGenerationFilteredSignal (copy)
				local ok, status, var26 = pcall(function()
					-- upvalues: p10 (copy), captureService (copy), p9 (copy)
					return if p10 == nil then captureService:GenerateMomentTextAsync(p9) else captureService:GenerateMomentTextAsync(p9, p10)
				end)
				
				if ok then
					local var15
					if status == nil then
						var15 = nil
					else
						local ok_1, status_1 = pcall(function()
							-- upvalues: status (ref)
							return status.Name
						end)
						var15 = if ok_1 and typeof(status_1) == "string" then status_1 else nil
					end
					if var15 == "Success" and typeof(var26) == "string" and #var26 ~= 0 then
						log("generation started for %s", var21)
						
						for _ = 1, maxPollAttempts do
							local var18
							task.wait(pollIntervalSeconds)
							local ok_1, status_1, var27, var28 = pcall(function()
								-- upvalues: captureService (copy), var26 (ref)
								return captureService:CheckMomentTextStatusAsync(var26)
							end)
							
							if not ok_1 then
								continue
								continue
							end
							if status_1 == nil then
								var18 = nil
							else
								local ok_2, status_2 = pcall(function()
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
									p12({ error = "GENERATION_FAILED" })
									
									return
								end
								p12({ error = "CONTENT_FILTERED" })
								
								return
							end
							log("generation succeeded for %s", var21)
							p12({
								summary = var27,
								description = var28,
								generationToken = var26
							})
							
							return
						end
						p12({ error = "TIMEOUT" })
						
						return
					elseif not ok then
						log("generation start failed for %s", var21)
					end
					if isStudioModule() then
						p12({
							summary = "insane save",
							description = "no way i pulled this off \226\128\148 clutch save on the last second, everyone was screaming lol",
							error = nil
						})
						
						return
					end
					p12({ error = "REQUEST_FAILED" })
				end
			end)
			
			if getFFlagEnableMomentTextGeneration() then
				p13(function()
					-- upvalues: log (copy), var21 (copy), thread (ref)
					log("generation cancelled for %s", var21)
					task.cancel(thread)
				end)
			end
		end)
		t[var20] = var25
		var25:andThen(function(p14)
			-- upvalues: t (copy), var20 (write)
			if p14 == nil or p14.error ~= nil then
				t[var20] = nil
			end
		end, function()
			-- upvalues: t (copy), var20 (write)
			t[var20] = nil
		end)
		
		if getFFlagEnableMomentTextGeneration() then
			var25:finally(function(p15)
				-- upvalues: promiseModule (copy), t (copy), var20 (write)
				if p15 == promiseModule.Status.Cancelled then
					t[var20] = nil
				end
			end)
		end
		return var25
	else
		return if isStudioModule() then promiseModule.resolve({
			summary = "insane save",
			description = "no way i pulled this off \226\128\148 clutch save on the last second, everyone was screaming lol",
			error = nil
		}) else promiseModule.resolve({ error = "ENGINE_UNSUPPORTED" })
	end
end