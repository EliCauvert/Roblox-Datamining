local moments = script:FindFirstAncestor("Moments")
local parent = moments.Parent
local promiseModule = require(parent.Promise)
local isStudioModule = require(parent.MomentsCommon.isStudio)
local getFFlagEnableMomentTextGeneration = require(parent.MomentsCommon).Flags.GetFFlagEnableMomentTextGeneration
local getFFlagMomentTextGenerationDisableCacheModule = require(moments.Flags.GetFFlagMomentTextGenerationDisableCache)
local t = {}

local function log(p0, ...) --[[ line: 56 ]]
	if _G.__MOMENTS_DISABLE_GEN_TEXT_LOG__ then
		return
	end
	print(`[moments-gen] {string.format(p0, ...)}`)
end

local function _() --[[ line: 63 | named "mockResult" ]]
	return {
		summary = "insane save",
		description = "no way i pulled this off \226\128\148 clutch save on the last second, everyone was screaming lol",
		error = nil
	}
end

local function captureKey(p1) --[[ line: 71 ]]
	local var8 = nil
	pcall(function() --[[ line: 73 ]]
		-- upvalues: var8 (write), p1 (ref)
		var8 = p1.LocalId
	end)
	
	return if var8 == nil then if typeof(p1) == "table" and p1.assetId ~= nil then `asset:{p1.assetId}` else `capture:{tostring(p1)}` else `local:{var8}`
end

local _ = function(p2) --[[ line: 88 | named "resultName" ]]
	if p2 == nil then
		return nil
	end
	local ok, status = pcall(function() --[[ line: 92 ]]
		-- upvalues: p2 (ref)
		return p2.Name
	end)
	
	return if ok and typeof(status) == "string" then status else nil
end

local function runGeneration(p3, p4, p5) --[[ line: 101 ]]
	-- upvalues: promiseModule (ref), log (ref), isStudioModule (ref), getFFlagEnableMomentTextGeneration (ref)
	local captureService = p5.captureService or game:GetService("CaptureService")
	local pollIntervalSeconds = p5.pollIntervalSeconds or 1
	local maxPollAttempts = p5.maxPollAttempts or 30
	
	return promiseModule.new(function(p6, _, p7) --[[ line: 106 ]]
		-- upvalues: captureService (ref), p3 (ref), log (copy), p4 (ref), isStudioModule (copy), maxPollAttempts (ref), pollIntervalSeconds (ref), getFFlagEnableMomentTextGeneration (copy)
		local thread = task.spawn(function() --[[ line: 107 ]]
			-- upvalues: captureService (copy), p3 (copy), log (copy), p4 (copy), isStudioModule (copy), p6 (ref), maxPollAttempts (copy), pollIntervalSeconds (copy)
			local ok, status, var13 = pcall(function() --[[ line: 108 ]]
				-- upvalues: captureService (copy), p3 (copy)
				return captureService:GenerateMomentTextAsync(p3)
			end)
			
			if ok then
				local var14
				if status == nil then
					var14 = nil
				else
					local ok_1, status_1 = pcall(function() --[[ line: 92 ]]
						-- upvalues: status (ref)
						return status.Name
					end)
					var14 = if ok_1 and typeof(status_1) == "string" then status_1 else nil
				end
				if var14 == "Success" and typeof(var13) == "string" and #var13 ~= 0 then
					log("generation started for %s", p4)
					
					for _ = 1, maxPollAttempts do
						local var17
						task.wait(pollIntervalSeconds)
						local ok_1, status_1, var15, var16 = pcall(function() --[[ line: 131 ]]
							-- upvalues: captureService (copy), var13 (ref)
							return captureService:CheckMomentTextStatusAsync(var13)
						end)
						
						if not ok_1 then
							continue
						end
						if status_1 == nil then
							var17 = nil
						else
							local ok_2, status_2 = pcall(function() --[[ line: 92 ]]
								-- upvalues: status_1 (ref)
								return status_1.Name
							end)
							var17 = if ok_2 and typeof(status_2) == "string" then status_2 else nil
						end
						if var17 ~= "Success" then
							if var17 ~= "Failed" then
								continue
							end
							p6({ error = "GENERATION_FAILED" })
							
							return
						end
						log("generation succeeded for %s", p4)
						p6({ summary = var15, description = var16 })
						
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
			p7(function() --[[ line: 156 ]]
				-- upvalues: log (copy), p4 (copy), thread (ref)
				log("generation cancelled for %s", p4)
				task.cancel(thread)
			end)
		end
	end)
end

return function(p8, p9) --[[ line: 164 | named "generateMomentText" ]]
	-- upvalues: isStudioModule (ref), promiseModule (ref), captureKey (ref), getFFlagMomentTextGenerationDisableCacheModule (ref), runGeneration (ref), t (ref), log (ref), getFFlagEnableMomentTextGeneration (ref)
	p9 = p9 or {}
	
	if (p9.isEngineEnabled or function() --[[ line: 167 ]]
		return game:GetEngineFeature("CaptureServiceGenerateMomentText")
	end)() then
		local var19 = captureKey(p8)
		
		if getFFlagMomentTextGenerationDisableCacheModule() then
			return runGeneration(p8, var19, p9)
		elseif t[var19] ~= nil then
			return t[var19]
		end
		local captureService = p9.captureService or game:GetService("CaptureService")
		local pollIntervalSeconds = p9.pollIntervalSeconds or 1
		local maxPollAttempts = p9.maxPollAttempts or 30
		local var23 = promiseModule.new(function(p10, _, p11) --[[ line: 106 ]]
			-- upvalues: captureService (ref), p8 (ref), log (copy), var19 (ref), isStudioModule (copy), maxPollAttempts (ref), pollIntervalSeconds (ref), getFFlagEnableMomentTextGeneration (copy)
			local thread = task.spawn(function() --[[ line: 107 ]]
				-- upvalues: captureService (copy), p8 (copy), log (copy), var19 (copy), isStudioModule (copy), p10 (ref), maxPollAttempts (copy), pollIntervalSeconds (copy)
				local ok, status, var24 = pcall(function() --[[ line: 108 ]]
					-- upvalues: captureService (copy), p8 (copy)
					return captureService:GenerateMomentTextAsync(p8)
				end)
				
				if ok then
					local var14
					if status == nil then
						var14 = nil
					else
						local ok_1, status_1 = pcall(function() --[[ line: 92 ]]
							-- upvalues: status (ref)
							return status.Name
						end)
						var14 = if ok_1 and typeof(status_1) == "string" then status_1 else nil
					end
					if var14 == "Success" and typeof(var24) == "string" and #var24 ~= 0 then
						log("generation started for %s", var19)
						
						for _ = 1, maxPollAttempts do
							local var17
							task.wait(pollIntervalSeconds)
							local ok_1, status_1, var25, var26 = pcall(function() --[[ line: 131 ]]
								-- upvalues: captureService (copy), var24 (ref)
								return captureService:CheckMomentTextStatusAsync(var24)
							end)
							
							if not ok_1 then
								continue
								continue
							end
							if status_1 == nil then
								var17 = nil
							else
								local ok_2, status_2 = pcall(function() --[[ line: 92 ]]
									-- upvalues: status_1 (ref)
									return status_1.Name
								end)
								var17 = if ok_2 and typeof(status_2) == "string" then status_2 else nil
							end
							if var17 ~= "Success" then
								if var17 ~= "Failed" then
									continue
									continue
								end
								p10({ error = "GENERATION_FAILED" })
								
								return
							end
							log("generation succeeded for %s", var19)
							p10({ summary = var25, description = var26 })
							
							return
						end
						p10({ error = "TIMEOUT" })
						
						return
					elseif not ok then
						log("generation start failed for %s", var19)
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
				p11(function() --[[ line: 156 ]]
					-- upvalues: log (copy), var19 (copy), thread (ref)
					log("generation cancelled for %s", var19)
					task.cancel(thread)
				end)
			end
		end)
		t[var19] = var23
		var23:andThen(function(p12) --[[ line: 195 ]]
			-- upvalues: t (copy), var19 (ref)
			if p12 == nil or p12.error ~= nil then
				t[var19] = nil
			end
		end, function() --[[ line: 199 ]]
			-- upvalues: t (copy), var19 (ref)
			t[var19] = nil
		end)
		
		if getFFlagEnableMomentTextGeneration() then
			var23:finally(function(p13) --[[ line: 207 ]]
				-- upvalues: promiseModule (copy), t (copy), var19 (ref)
				if p13 == promiseModule.Status.Cancelled then
					t[var19] = nil
				end
			end)
		end
		return var23
	else
		return if isStudioModule() then promiseModule.resolve({
			summary = "insane save",
			description = "no way i pulled this off \226\128\148 clutch save on the last second, everyone was screaming lol",
			error = nil
		}) else promiseModule.resolve({ error = "ENGINE_UNSUPPORTED" })
	end
end