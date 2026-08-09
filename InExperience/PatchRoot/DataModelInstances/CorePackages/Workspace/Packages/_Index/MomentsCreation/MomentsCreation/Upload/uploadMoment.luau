local captureService = game:GetService("CaptureService")
local momentsCreation = script:FindFirstAncestor("MomentsCreation")
local parent = momentsCreation.Parent
local _ = require(parent.MomentsTypes)
local eventNames = require(parent.MomentsCommon).Analytics.EventNames
local fireAnalyticsEventModule = require(momentsCreation.Analytics.fireAnalyticsEvent)
local _game = game
local captureServiceUploadUniverseIdOverrideEngineFeature = game:GetEngineFeature("CaptureServiceUploadUniverseIdOverride")
local captureServiceStartUploadCoreScriptBypassEngineFeature = game:GetEngineFeature("CaptureServiceStartUploadCoreScriptBypass")
game:DefineFastString("MomentsUploadUniverseId", "8357232245")

local function _(p0) --[[ line: 61 | named "injectUniverseIdOverride" ]]
	-- upvalues: _game (ref)
	local gameId = _game.GameId
	
	if gameId == nil or gameId <= 0 then
		local cloned = table.clone(p0)
		cloned.universeIdOverride = tonumber(game:GetFastString("MomentsUploadUniverseId"))
		
		return cloned
	end
	return p0
end

return function(p1, p2, p3, p4, p5, p6, p7, p8) --[[ line: 71 | named "uploadMoment" ]]
	-- upvalues: captureServiceUploadUniverseIdOverrideEngineFeature (ref), _game (ref), captureServiceStartUploadCoreScriptBypassEngineFeature (ref), captureService (ref), fireAnalyticsEventModule (ref), eventNames (ref)
	local var7
	if captureServiceUploadUniverseIdOverrideEngineFeature then
		local gameId = _game.GameId
		
		if gameId == nil or gameId <= 0 then
			local cloned = table.clone(p2)
			cloned.universeIdOverride = tonumber(game:GetFastString("MomentsUploadUniverseId"))
			var7 = cloned
		else
			var7 = p2
		end
	else
		var7 = p2
	end
	p5.setUploading()
	p6.triggerToast({ title = p4.publishingTitle, text = p4.publishingBody })
	task.spawn(function() --[[ line: 92 ]]
		-- upvalues: captureServiceStartUploadCoreScriptBypassEngineFeature (copy), captureService (copy), p1 (ref), var7 (ref), p3 (ref), fireAnalyticsEventModule (copy), eventNames (copy), p5 (ref), p6 (ref), p4 (ref), p7 (ref), p8 (ref)
		if captureServiceStartUploadCoreScriptBypassEngineFeature then
			local ok, status, var9 = pcall(function() --[[ line: 115 ]]
				-- upvalues: captureService (copy), p1 (copy)
				return captureService:StartUploadCaptureAsync(p1)
			end)
			
			if not ok then
				p5.setFailed("StartUploadFailed")
				p6.triggerToast({ title = p4.failedTitle, text = p4.failedBody })
				fireAnalyticsEventModule(eventNames.UploadCaptureFailed, {
					status = tostring(status),
					captureType = tostring(p1.CaptureType)
				})
				
				return
			elseif status == Enum.UploadCaptureResult.Success then
				pcall(function() --[[ line: 152 ]]
					-- upvalues: captureService (copy), p1 (copy), var7 (copy), p3 (copy)
					captureService:UploadCaptureAndPostMoment(p1, var7, p3)
				end)
				fireAnalyticsEventModule(eventNames.EditingFlowMomentPublished, {
					sourcePlaceId = tostring(p1.SourcePlaceId),
					localId = tostring(p1.LocalId),
					captureType = tostring(p1.CaptureType)
				})
				
				for _ = 1, 120 do
					task.wait(5)
					local ok_1, status_1, var10 = pcall(function() --[[ line: 166 ]]
						-- upvalues: captureService (copy), var9 (ref)
						return captureService:CheckUploadCaptureStatusAsync(var9)
					end)
					
					if ok_1 then
						if status_1 ~= Enum.UploadCaptureResult.Success then
							if status_1 == Enum.UploadCaptureResult.UploadPending then
								continue
							end
							if status_1 == Enum.UploadCaptureResult.CaptureModerated then
								p5.setFailed("Moderated")
								p6.triggerToast({ title = p4.removedTitle, text = p4.removedBody })
								
								return
							end
							p5.setFailed(tostring(status_1))
							p6.triggerToast({ title = p4.failedTitle, text = p4.failedBody })
							
							return
						end
						p5.setSuccess(var10)
						
						if p7 then
							p7.prependItem({ assetId = var10 })
						end
						if p8 then
							p8.prependItem({ assetId = var10 })
							p8.invalidateCount()
						end
						fireAnalyticsEventModule(eventNames.EditingFlowMomentPostedToFeed, {
							assetId = tostring(var10),
							localId = tostring(p1.LocalId),
							captureType = tostring(p1.CaptureType)
						})
						p6.triggerToast({ title = p4.publishedTitle, text = p4.publishedBody })
						
						return
					end
					p5.setFailed("PollError")
					p6.triggerToast({ title = p4.failedTitle, text = p4.failedBody })
					
					return
				end
				p5.setFailed("Timeout")
				p6.triggerToast({ title = p4.failedTitle, text = p4.failedBody })
				
				return
			elseif status == Enum.UploadCaptureResult.CaptureModerated then
				p6.triggerToast({ title = p4.removedTitle, text = p4.removedBody })
			elseif status == Enum.UploadCaptureResult.UploadQuotaReached then
				p6.triggerToast({ title = p4.failedTitle, text = p4.uploadQuotaReachedBody })
			else
				p6.triggerToast({ title = p4.failedTitle, text = p4.failedBody })
			end
			p5.setFailed(tostring(status))
			fireAnalyticsEventModule(eventNames.UploadCaptureFailed, {
				status = tostring(status),
				captureType = tostring(p1.CaptureType)
			})
			
			return
		else
			local ok, status = pcall(function() --[[ line: 95 ]]
				-- upvalues: captureService (copy), p1 (copy), var7 (copy), p3 (copy)
				captureService:UploadCaptureAndPostMoment(p1, var7, p3)
			end)
			fireAnalyticsEventModule(eventNames.EditingFlowMomentPublished, {
				sourcePlaceId = tostring(p1.SourcePlaceId),
				localId = tostring(p1.LocalId),
				captureType = tostring(p1.CaptureType)
			})
			
			if not ok then
				p5.setFailed("GenericFailure")
				p6.triggerToast({ title = p4.failedTitle, text = p4.failedBody })
				fireAnalyticsEventModule(eventNames.UploadCaptureFailed, {
					error = tostring(status),
					captureType = tostring(p1.CaptureType)
				})
			end
		end
	end)
end