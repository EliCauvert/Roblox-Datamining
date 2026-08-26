local moments = script:FindFirstAncestor("Moments")
local parent = moments.Parent
local promiseModule = require(parent.Promise)
local momentsCommonModule = require(parent.MomentsCommon)
local isStudioModule = require(parent.MomentsCommon.isStudio)
local getFFlagEnableMomentTextGeneration = momentsCommonModule.Flags.GetFFlagEnableMomentTextGeneration
local getFFlagMomentTextGenerationDisableCacheModule = require(moments.Flags.GetFFlagMomentTextGenerationDisableCache)
local fFlagMomentTextGenerationFilteredSignal = momentsCommonModule.Flags.FFlagMomentTextGenerationFilteredSignal
local t = {}

local function log(p1, ...)
	if _G.__MOMENTS_DISABLE_GEN_TEXT_LOG__ then
		return
	end
	print(`[moments-gen] {string.format(p1, ...)}`)
end

local function _()
	return {
		summary = "insane save",
		description = "no way i pulled this off \226\128\148 clutch save on the last second, everyone was screaming lol",
		error = nil
	}
end

local function captureKey(p1)
	local var1 = nil
	pcall(function()
		-- upvalues: var1 (write), p1 (ref)
		var1 = p1.LocalId
	end)
	
	return if var1 == nil then if typeof(p1) == "table" and p1.assetId ~= nil then `asset:{p1.assetId}` else `capture:{tostring(p1)}` else `local:{var1}`
end

local _ = function(p1)
	if p1 == nil then
		return nil
	end
	local ok, status = pcall(function()
		-- upvalues: p1 (ref)
		return p1.Name
	end)
	
	return if ok and typeof(status) == "string" then status else nil
end

local function runGeneration(p1, p2, p3, p4)
	-- upvalues: promiseModule (ref), log (ref), isStudioModule (ref), fFlagMomentTextGenerationFilteredSignal (ref), getFFlagEnableMomentTextGeneration (ref)
	local captureService = p4.captureService or game:GetService("CaptureService")
	local pollIntervalSeconds = p4.pollIntervalSeconds or 1
	local maxPollAttempts = p4.maxPollAttempts or 30
	
	return promiseModule.new(function(p5, _, p6)
		-- upvalues: p3 (ref), captureService (ref), p1 (ref), log (copy), p2 (ref), isStudioModule (copy), maxPollAttempts (ref), pollIntervalSeconds (ref), fFlagMomentTextGenerationFilteredSignal (copy), getFFlagEnableMomentTextGeneration (copy)
		local thread = task.spawn(function()
			-- upvalues: p3 (copy), captureService (copy), p1 (copy), log (copy), p2 (copy), isStudioModule (copy), p5 (ref), maxPollAttempts (copy), pollIntervalSeconds (copy), fFlagMomentTextGenerationFilteredSignal (copy)
			local ok, status, var1 = pcall(function()
				-- upvalues: p3 (copy), captureService (copy), p1 (copy)
				return if p3 == nil then captureService:GenerateMomentTextAsync(p1) else captureService:GenerateMomentTextAsync(p1, p3)
			end)
			
			if ok then
				local var2
				if status == nil then
					var2 = nil
				else
					local ok_1, status_1 = pcall(function()
						-- upvalues: status (ref)
						return status.Name
					end)
					var2 = if ok_1 and typeof(status_1) == "string" then status_1 else nil
				end
				if var2 == "Success" and typeof(var1) == "string" and #var1 ~= 0 then
					log("generation started for %s", p2)
					
					for _ = 1, maxPollAttempts do
						local var3
						task.wait(pollIntervalSeconds)
						local ok_1, status_1, var4, var5 = pcall(function()
							-- upvalues: captureService (copy), var1 (ref)
							return captureService:CheckMomentTextStatusAsync(var1)
						end)
						
						if not ok_1 then
							continue
						end
						if status_1 == nil then
							var3 = nil
						else
							local ok_2, status_2 = pcall(function()
								-- upvalues: status_1 (ref)
								return status_1.Name
							end)
							var3 = if ok_2 and typeof(status_2) == "string" then status_2 else nil
						end
						if var3 ~= "Success" then
							if not fFlagMomentTextGenerationFilteredSignal or var3 ~= "Filtered" then
								if var3 ~= "Failed" then
									continue
								end
								p5({ error = "GENERATION_FAILED" })
								
								return
							end
							p5({ error = "CONTENT_FILTERED" })
							
							return
						end
						log("generation succeeded for %s", p2)
						p5({
							summary = var4,
							description = var5,
							generationToken = var1
						})
						
						return
					end
					p5({ error = "TIMEOUT" })
					
					return
				elseif not ok then
					log("generation start failed for %s", p2)
				end
				if isStudioModule() then
					p5({
						summary = "insane save",
						description = "no way i pulled this off \226\128\148 clutch save on the last second, everyone was screaming lol",
						error = nil
					})
					
					return
				end
				p5({ error = "REQUEST_FAILED" })
			end
		end)
		
		if getFFlagEnableMomentTextGeneration() then
			p6(function()
				-- upvalues: log (copy), p2 (copy), thread (ref)
				log("generation cancelled for %s", p2)
				task.cancel(thread)
			end)
		end
	end)
end

return function(p5, p6, p7)
	-- upvalues: isStudioModule (ref), promiseModule (ref), captureKey (ref), getFFlagMomentTextGenerationDisableCacheModule (ref), runGeneration (ref), t (ref), log (ref), fFlagMomentTextGenerationFilteredSignal (ref), getFFlagEnableMomentTextGeneration (ref)
	p7 = p7 or {}
	
	if (p7.isEngineEnabled or function()
		return game:GetEngineFeature("CaptureServiceGenerateMomentText")
	end)() then
		local var1 = captureKey(p5)
		
		if p6 ~= nil and p6 ~= "" then
			var1 = `{var1}|tone:{p6}`
		end
		if getFFlagMomentTextGenerationDisableCacheModule() then
			return runGeneration(p5, var1, p6, p7)
		elseif t[var1] ~= nil then
			return t[var1]
		end
		local var2 = var1
		local captureService = p7.captureService or game:GetService("CaptureService")
		local pollIntervalSeconds = p7.pollIntervalSeconds or 1
		local maxPollAttempts = p7.maxPollAttempts or 30
		local var3 = promiseModule.new(function(p8, _, p9)
			-- upvalues: p6 (ref), captureService (ref), p5 (ref), log (copy), var2 (ref), isStudioModule (copy), maxPollAttempts (ref), pollIntervalSeconds (ref), fFlagMomentTextGenerationFilteredSignal (copy), getFFlagEnableMomentTextGeneration (copy)
			local thread = task.spawn(function()
				-- upvalues: p6 (copy), captureService (copy), p5 (copy), log (copy), var2 (copy), isStudioModule (copy), p8 (ref), maxPollAttempts (copy), pollIntervalSeconds (copy), fFlagMomentTextGenerationFilteredSignal (copy)
				local ok, status, var4 = pcall(function()
					-- upvalues: p6 (copy), captureService (copy), p5 (copy)
					return if p6 == nil then captureService:GenerateMomentTextAsync(p5) else captureService:GenerateMomentTextAsync(p5, p6)
				end)
				
				if ok then
					local var5
					if status == nil then
						var5 = nil
					else
						local ok_1, status_1 = pcall(function()
							-- upvalues: status (ref)
							return status.Name
						end)
						var5 = if ok_1 and typeof(status_1) == "string" then status_1 else nil
					end
					if var5 == "Success" and typeof(var4) == "string" and #var4 ~= 0 then
						log("generation started for %s", var2)
						
						for _ = 1, maxPollAttempts do
							local var6
							task.wait(pollIntervalSeconds)
							local ok_1, status_1, var7, var8 = pcall(function()
								-- upvalues: captureService (copy), var4 (ref)
								return captureService:CheckMomentTextStatusAsync(var4)
							end)
							
							if not ok_1 then
								continue
								continue
							end
							if status_1 == nil then
								var6 = nil
							else
								local ok_2, status_2 = pcall(function()
									-- upvalues: status_1 (ref)
									return status_1.Name
								end)
								var6 = if ok_2 and typeof(status_2) == "string" then status_2 else nil
							end
							if var6 ~= "Success" then
								if not fFlagMomentTextGenerationFilteredSignal or var6 ~= "Filtered" then
									if var6 ~= "Failed" then
										continue
										continue
									end
									p8({ error = "GENERATION_FAILED" })
									
									return
								end
								p8({ error = "CONTENT_FILTERED" })
								
								return
							end
							log("generation succeeded for %s", var2)
							p8({
								summary = var7,
								description = var8,
								generationToken = var4
							})
							
							return
						end
						p8({ error = "TIMEOUT" })
						
						return
					elseif not ok then
						log("generation start failed for %s", var2)
					end
					if isStudioModule() then
						p8({
							summary = "insane save",
							description = "no way i pulled this off \226\128\148 clutch save on the last second, everyone was screaming lol",
							error = nil
						})
						
						return
					end
					p8({ error = "REQUEST_FAILED" })
				end
			end)
			
			if getFFlagEnableMomentTextGeneration() then
				p9(function()
					-- upvalues: log (copy), var2 (copy), thread (ref)
					log("generation cancelled for %s", var2)
					task.cancel(thread)
				end)
			end
		end)
		t[var1] = var3
		var3:andThen(function(p10)
			-- upvalues: t (copy), var1 (write)
			if p10 == nil or p10.error ~= nil then
				t[var1] = nil
			end
		end, function()
			-- upvalues: t (copy), var1 (write)
			t[var1] = nil
		end)
		
		if getFFlagEnableMomentTextGeneration() then
			var3:finally(function(p10)
				-- upvalues: promiseModule (copy), t (copy), var1 (write)
				if p10 == promiseModule.Status.Cancelled then
					t[var1] = nil
				end
			end)
		end
		return var3
	else
		return if isStudioModule() then promiseModule.resolve({
			summary = "insane save",
			description = "no way i pulled this off \226\128\148 clutch save on the last second, everyone was screaming lol",
			error = nil
		}) else promiseModule.resolve({ error = "ENGINE_UNSUPPORTED" })
	end
end