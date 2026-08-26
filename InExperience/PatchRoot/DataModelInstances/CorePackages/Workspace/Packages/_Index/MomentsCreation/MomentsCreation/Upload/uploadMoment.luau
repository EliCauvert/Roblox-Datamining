local captureService = game:GetService("CaptureService")
local momentsCreation = script:FindFirstAncestor("MomentsCreation")
local parent = momentsCreation.Parent
local momentsCommonModule = require(parent.MomentsCommon)
local _ = require(parent.MomentsTypes)
local eventNames = momentsCommonModule.Analytics.EventNames
local fireAnalyticsEventModule = require(momentsCreation.Analytics.fireAnalyticsEvent)
local makeCreationEventFieldsModule = require(momentsCreation.Analytics.makeCreationEventFields)
local normalizeMomentMetadataModule = require(momentsCreation.Utils.normalizeMomentMetadata)
local completeMomentUploadModule = require(momentsCreation.Upload.completeMomentUpload)
local loggerModule = require(momentsCreation.Logger)
local getFFlagMomentsCreationNormalizeMetadataEnumsModule = require(momentsCreation.Flags.GetFFlagMomentsCreationNormalizeMetadataEnums)
local getFFlagMomentsUseBackendPostStatusNotificationModule = require(momentsCreation.Flags.GetFFlagMomentsUseBackendPostStatusNotification)
local getFFlagMomentsAnalyticsProducerPrereqs = momentsCommonModule.Flags.GetFFlagMomentsAnalyticsProducerPrereqs
local getFFlagMomentsUseUploadPostAsync = momentsCommonModule.Flags.GetFFlagMomentsUseUploadPostAsync
local fFlagMomentsRealtimeSessionTelemetry = momentsCommonModule.Flags.FFlagMomentsRealtimeSessionTelemetry
local fFlagMomentsUploadOutcomeTelemetry = momentsCommonModule.Flags.FFlagMomentsUploadOutcomeTelemetry
local makePostMetadataModule = require(momentsCreation.Utils.makePostMetadata)
local enumName = makeCreationEventFieldsModule.enumName
local _game = game
local captureServiceUploadUniverseIdOverrideEngineFeature = game:GetEngineFeature("CaptureServiceUploadUniverseIdOverride")
local captureServiceStartUploadCoreScriptBypassEngineFeature = game:GetEngineFeature("CaptureServiceStartUploadCoreScriptBypass")
game:DefineFastString("MomentsUploadUniverseId", "8357232245")

local function _(p1)
	-- upvalues: enumName (ref)
	return string.gsub(string.gsub(enumName(p1) or "nil", "\r", "\\r"), "\n", "\\n")
end

local _ = function(p1)
	-- upvalues: _game (ref)
	local gameId = _game.GameId
	
	if gameId == nil or gameId <= 0 then
		local cloned = table.clone(p1)
		cloned.universeIdOverride = tonumber(game:GetFastString("MomentsUploadUniverseId"))
		
		return cloned
	end
	return p1
end

return function(p1, p2, p3, p4, p5, p6, p7, p8, p9, p10)
	-- upvalues: captureService (ref), captureServiceUploadUniverseIdOverrideEngineFeature (ref), _game (ref), getFFlagMomentsCreationNormalizeMetadataEnumsModule (ref), normalizeMomentMetadataModule (ref), loggerModule (ref), captureServiceStartUploadCoreScriptBypassEngineFeature (ref), enumName (ref), getFFlagMomentsUseBackendPostStatusNotificationModule (ref), getFFlagMomentsAnalyticsProducerPrereqs (ref), fFlagMomentsRealtimeSessionTelemetry (ref), fFlagMomentsUploadOutcomeTelemetry (ref), momentsCommonModule (ref), fireAnalyticsEventModule (ref), eventNames (ref), getFFlagMomentsUseUploadPostAsync (ref), makePostMetadataModule (ref), makeCreationEventFieldsModule (ref), completeMomentUploadModule (ref)
	local gameId, var1
	p10 = p10 or captureService
	
	if captureServiceUploadUniverseIdOverrideEngineFeature then
		gameId = _game.GameId
		
		if gameId == nil or gameId <= 0 then
			local cloned = table.clone(p2)
			cloned.universeIdOverride = tonumber(game:GetFastString("MomentsUploadUniverseId"))
			var1 = cloned
		else
			var1 = p2
		end
	else
		var1 = p2
	end
	if getFFlagMomentsCreationNormalizeMetadataEnumsModule() then
		var1 = normalizeMomentMetadataModule(var1)
	end
	loggerModule:debug("event=upload_start CaptureServiceStartUploadCoreScriptBypass={} MomentsUseBackendPostStatusNotification={} localId={} captureType={} sourcePlaceId={} sourceUniverseId={}", string.gsub(string.gsub(enumName(captureServiceStartUploadCoreScriptBypassEngineFeature) or "nil", "\r", "\\r"), "\n", "\\n"), string.gsub(string.gsub(enumName(getFFlagMomentsUseBackendPostStatusNotificationModule()) or "nil", "\r", "\\r"), "\n", "\\n"), string.gsub(string.gsub(enumName(p1.LocalId) or "nil", "\r", "\\r"), "\n", "\\n"), string.gsub(string.gsub(enumName(p1.CaptureType) or "nil", "\r", "\\r"), "\n", "\\n"), string.gsub(string.gsub(enumName(p1.SourcePlaceId) or "nil", "\r", "\\r"), "\n", "\\n"), string.gsub(string.gsub(enumName(p1.SourceUniverseId) or "nil", "\r", "\\r"), "\n", "\\n"))
	p5.setUploading()
	p6.triggerToast({ title = p4.publishingTitle, text = p4.publishingBody })
	gameId = getFFlagMomentsAnalyticsProducerPrereqs()
	
	local function _(p11)
		-- upvalues: gameId (ref), p9 (ref)
		if gameId then
			p11.creationSessionId = p9
		end
		return p11
	end
	
	local _ = function(p11, p12, p13)
		-- upvalues: fFlagMomentsRealtimeSessionTelemetry (copy), fFlagMomentsUploadOutcomeTelemetry (copy), momentsCommonModule (copy), gameId (ref), p11 (ref), p9 (ref), fireAnalyticsEventModule (copy), eventNames (copy)
		if fFlagMomentsRealtimeSessionTelemetry then
			momentsCommonModule.Analytics.reportMomentsCreationStep("upload", "failed", if fFlagMomentsUploadOutcomeTelemetry then p13 else nil)
		end
		if not gameId and not p12 then return end
		if gameId then
			p11.localId = tostring(p11.LocalId)
			p11.creationSessionId = p9
		end
		fireAnalyticsEventModule(eventNames.UploadCaptureFailed, p11)
	end
	
	task.spawn(function()
		-- upvalues: getFFlagMomentsUseUploadPostAsync (copy), loggerModule (copy), p1 (ref), enumName (copy), makePostMetadataModule (copy), var1 (write), fireAnalyticsEventModule (copy), eventNames (copy), makeCreationEventFieldsModule (copy), gameId (ref), p9 (ref), p10 (ref), completeMomentUploadModule (copy), p5 (ref), p6 (ref), p7 (ref), p8 (ref), p4 (ref), fFlagMomentsRealtimeSessionTelemetry (copy), fFlagMomentsUploadOutcomeTelemetry (copy), momentsCommonModule (copy), captureServiceStartUploadCoreScriptBypassEngineFeature (copy), p3 (ref)
		local ok_1
		if getFFlagMomentsUseUploadPostAsync() then
			loggerModule:debug("event=path_selected path=post_upload localId={}", string.gsub(string.gsub(enumName(p1.LocalId) or "nil", "\r", "\\r"), "\n", "\\n"))
			local var2 = makePostMetadataModule(var2)
			local editingFlowMomentPublished = eventNames.EditingFlowMomentPublished
			local var3 = makeCreationEventFieldsModule.makeCaptureDescriptorFields(p1)
			
			if gameId then
				var3.creationSessionId = p9
			end
			fireAnalyticsEventModule(editingFlowMomentPublished, var3)
			local ok, status = pcall(function()
				-- upvalues: p10 (copy), p1 (copy), var2 (ref)
				return p10:UploadPostAsync(p1, var2)
			end)
			
			if ok then
				loggerModule:debug("event=post_upload_success localId={} assetId={}", string.gsub(string.gsub(enumName(p1.LocalId) or "nil", "\r", "\\r"), "\n", "\\n"), string.gsub(string.gsub(enumName(status.assetId) or "nil", "\r", "\\r"), "\n", "\\n"))
				completeMomentUploadModule(status.assetId, {
					uploadStore = p5,
					toastStore = p6,
					feedStore = p7,
					myCreationsStore = p8,
					localizations = p4,
					onPostedToFeed = function()
						-- upvalues: fireAnalyticsEventModule (copy), eventNames (copy), status (ref), p1 (copy), enumName (copy), gameId (copy), p9 (copy)
						local editingFlowMomentPostedToFeed = eventNames.EditingFlowMomentPostedToFeed
						local t = {
							assetId = tostring(status.assetId),
							localId = tostring(p1.LocalId),
							captureType = enumName(p1.CaptureType)
						}
						
						if gameId then
							t.creationSessionId = p9
						end
						fireAnalyticsEventModule(editingFlowMomentPostedToFeed, t)
					end
				})
				
				return
			end
			loggerModule:debug("event=post_upload_failed localId={} error={}", string.gsub(string.gsub(enumName(p1.LocalId) or "nil", "\r", "\\r"), "\n", "\\n"), string.gsub(string.gsub(enumName(status) or "nil", "\r", "\\r"), "\n", "\\n"))
			p5.setFailed("GenericFailure")
			p6.triggerToast({ title = p4.failedTitle, text = p4.failedBody })
			local t = {
				status = "GenericFailure",
				error = tostring(status),
				captureType = enumName(p1.CaptureType)
			}
			
			if fFlagMomentsRealtimeSessionTelemetry then
				momentsCommonModule.Analytics.reportMomentsCreationStep("upload", "failed", if fFlagMomentsUploadOutcomeTelemetry then "GenericFailure" else nil)
			end
			local _ = not gameId
			
			if gameId then
				t.localId = tostring(p1.LocalId)
				t.creationSessionId = p9
			end
			fireAnalyticsEventModule(eventNames.UploadCaptureFailed, t)
			
			return
		elseif captureServiceStartUploadCoreScriptBypassEngineFeature then
			loggerModule:debug("event=path_selected path=two_phase localId={}", string.gsub(string.gsub(enumName(p1.LocalId) or "nil", "\r", "\\r"), "\n", "\\n"))
			ok_1, status, var24 = pcall(function()
				-- upvalues: p10 (copy), p1 (copy)
				return p10:StartUploadCaptureAsync(p1)
			end)
			
			if ok_1 then
				loggerModule:debug("event=start_upload localId={} pcallSuccess=true status={}", string.gsub(string.gsub(enumName(p1.LocalId) or "nil", "\r", "\\r"), "\n", "\\n"), string.gsub(string.gsub(enumName(status) or "nil", "\r", "\\r"), "\n", "\\n"))
			else
				loggerModule:debug("event=start_upload localId={} pcallSuccess=false status=pcall_error errorClass={}", string.gsub(string.gsub(enumName(p1.LocalId) or "nil", "\r", "\\r"), "\n", "\\n"), typeof(status))
			end
			if ok_1 then
				if status == Enum.UploadCaptureResult.Success then
					local ok_2, status_1 = pcall(function()
						-- upvalues: p10 (copy), p1 (copy), var2 (copy), p3 (copy)
						p10:UploadCaptureAndPostMoment(p1, var2, p3)
					end)
					loggerModule:debug("event=registration localId={} pcallSuccess={} errorClass={}", string.gsub(string.gsub(enumName(p1.LocalId) or "nil", "\r", "\\r"), "\n", "\\n"), tostring(ok_2), if ok_2 then "none" else typeof(status_1))
					
					if gameId and not ok_2 then
						p5.setFailed("RegistrationFailed")
						p6.triggerToast({ title = p4.failedTitle, text = p4.failedBody })
						local t = {
							status = "RegistrationFailed",
							error = tostring(status_1),
							captureType = enumName(p1.CaptureType)
						}
						
						if fFlagMomentsRealtimeSessionTelemetry then
							momentsCommonModule.Analytics.reportMomentsCreationStep("upload", "failed", if fFlagMomentsUploadOutcomeTelemetry then "RegistrationFailed" else nil)
						end
						if not gameId then return end
						if gameId then
							t.localId = tostring(p1.LocalId)
							t.creationSessionId = p9
						end
						fireAnalyticsEventModule(eventNames.UploadCaptureFailed, t)
						
						return
					else
						local editingFlowMomentPublished = eventNames.EditingFlowMomentPublished
						local var4 = makeCreationEventFieldsModule.makeCaptureDescriptorFields(p1)
						
						if gameId then
							var4.creationSessionId = p9
						end
						fireAnalyticsEventModule(editingFlowMomentPublished, var4)
						local var5 = false
						local var6 = nil
						
						for i = 1, 120 do
							task.wait(5)
							local ok_3, status_2, var7 = pcall(function()
								-- upvalues: p10 (copy), var24 (ref)
								return p10:CheckUploadCaptureStatusAsync(var24)
							end)
							local var8 = not var5 or ok_3 and status_2 ~= var6
							local var9 = not ok_3 or status_2 ~= Enum.UploadCaptureResult.UploadPending
							local var10 = i % 6 == 0
							
							if ok_3 then
								var5 = true
								var6 = status_2
							end
							if i == 1 or var8 or (var9 or var10) then
								if ok_3 then
									loggerModule:debug("event=poll localId={} attempt={} pcallSuccess=true status={} assetId={} heartbeat={}", string.gsub(string.gsub(enumName(p1.LocalId) or "nil", "\r", "\\r"), "\n", "\\n"), tostring(i), string.gsub(string.gsub(enumName(status_2) or "nil", "\r", "\\r"), "\n", "\\n"), string.gsub(string.gsub(enumName(var7) or "nil", "\r", "\\r"), "\n", "\\n"), tostring(var10 and not var8))
								else
									loggerModule:debug("event=poll localId={} attempt={} pcallSuccess=false status=pcall_error errorClass={}", string.gsub(string.gsub(enumName(p1.LocalId) or "nil", "\r", "\\r"), "\n", "\\n"), tostring(i), typeof(status_2))
								end
							end
							if ok_3 then
								if status_2 ~= Enum.UploadCaptureResult.Success then
									if status_2 == Enum.UploadCaptureResult.UploadPending then
										continue
									end
									if status_2 == Enum.UploadCaptureResult.CaptureModerated then
										p5.setFailed("Moderated")
										p6.triggerToast({ title = p4.removedTitle, text = p4.removedBody })
										local t = {
											status = enumName(status_2),
											captureType = enumName(p1.CaptureType)
										}
										local var11 = enumName(status_2)
										
										if fFlagMomentsRealtimeSessionTelemetry then
											momentsCommonModule.Analytics.reportMomentsCreationStep("upload", "failed", if fFlagMomentsUploadOutcomeTelemetry then var11 else nil)
										end
										if not gameId then return end
										if gameId then
											t.localId = tostring(p1.LocalId)
											t.creationSessionId = p9
										end
										fireAnalyticsEventModule(eventNames.UploadCaptureFailed, t)
										
										return
									else
										p5.setFailed(tostring(status_2))
										p6.triggerToast({ title = p4.failedTitle, text = p4.failedBody })
										local t = {
											status = enumName(status_2),
											captureType = enumName(p1.CaptureType)
										}
										local var12 = enumName(status_2)
										
										if fFlagMomentsRealtimeSessionTelemetry then
											momentsCommonModule.Analytics.reportMomentsCreationStep("upload", "failed", if fFlagMomentsUploadOutcomeTelemetry then var12 else nil)
										end
										if not gameId then return end
										if gameId then
											t.localId = tostring(p1.LocalId)
											t.creationSessionId = p9
										end
										fireAnalyticsEventModule(eventNames.UploadCaptureFailed, t)
										
										return
									end
								end
								completeMomentUploadModule(var7, {
									uploadStore = p5,
									toastStore = p6,
									feedStore = p7,
									myCreationsStore = p8,
									localizations = p4,
									onPostedToFeed = function()
										-- upvalues: fireAnalyticsEventModule (copy), eventNames (copy), var7 (ref), p1 (copy), enumName (copy), gameId (copy), p9 (copy)
										local editingFlowMomentPostedToFeed = eventNames.EditingFlowMomentPostedToFeed
										local t = {
											assetId = tostring(var7),
											localId = tostring(p1.LocalId),
											captureType = enumName(p1.CaptureType)
										}
										
										if gameId then
											t.creationSessionId = p9
										end
										fireAnalyticsEventModule(editingFlowMomentPostedToFeed, t)
									end
								})
								
								return
							end
							p5.setFailed("PollError")
							p6.triggerToast({ title = p4.failedTitle, text = p4.failedBody })
							local t = {
								status = "PollError",
								error = tostring(status_2),
								captureType = enumName(p1.CaptureType)
							}
							
							if fFlagMomentsRealtimeSessionTelemetry then
								momentsCommonModule.Analytics.reportMomentsCreationStep("upload", "failed", if fFlagMomentsUploadOutcomeTelemetry then "PollError" else nil)
							end
							if not gameId then return end
							if gameId then
								t.localId = tostring(p1.LocalId)
								t.creationSessionId = p9
							end
							fireAnalyticsEventModule(eventNames.UploadCaptureFailed, t)
							
							return
						end
						loggerModule:debug("event=poll_timeout localId={} attempts={}", string.gsub(string.gsub(enumName(p1.LocalId) or "nil", "\r", "\\r"), "\n", "\\n"), tostring(120))
						p5.setFailed("Timeout")
						p6.triggerToast({ title = p4.failedTitle, text = p4.failedBody })
						local t = {
							status = "Timeout",
							captureType = enumName(p1.CaptureType)
						}
						
						if fFlagMomentsRealtimeSessionTelemetry then
							momentsCommonModule.Analytics.reportMomentsCreationStep("upload", "failed", if fFlagMomentsUploadOutcomeTelemetry then "Timeout" else nil)
						end
						if not gameId then return end
						if gameId then
							t.localId = tostring(p1.LocalId)
							t.creationSessionId = p9
						end
						fireAnalyticsEventModule(eventNames.UploadCaptureFailed, t)
						
						return
					end
				elseif status == Enum.UploadCaptureResult.CaptureModerated then
					p6.triggerToast({ title = p4.removedTitle, text = p4.removedBody })
				elseif status == Enum.UploadCaptureResult.UploadQuotaReached then
					p6.triggerToast({ title = p4.failedTitle, text = p4.uploadQuotaReachedBody })
				else
					p6.triggerToast({ title = p4.failedTitle, text = p4.failedBody })
				end
				p5.setFailed(tostring(status))
				local t = {
					status = enumName(status),
					captureType = enumName(p1.CaptureType)
				}
				local var13 = enumName(status)
				
				if fFlagMomentsRealtimeSessionTelemetry then
					momentsCommonModule.Analytics.reportMomentsCreationStep("upload", "failed", if fFlagMomentsUploadOutcomeTelemetry then var13 else nil)
				end
				local _ = not gameId
				
				if gameId then
					t.localId = tostring(p1.LocalId)
					t.creationSessionId = p9
				end
				fireAnalyticsEventModule(eventNames.UploadCaptureFailed, t)
				
				return
			else
				p5.setFailed("StartUploadFailed")
				p6.triggerToast({ title = p4.failedTitle, text = p4.failedBody })
				local t = {
					status = enumName(status),
					captureType = enumName(p1.CaptureType)
				}
				
				if gameId then
					t.status = "StartUploadFailed"
					t.error = tostring(status)
				end
				if fFlagMomentsRealtimeSessionTelemetry then
					momentsCommonModule.Analytics.reportMomentsCreationStep("upload", "failed", if fFlagMomentsUploadOutcomeTelemetry then "StartUploadFailed" else nil)
				end
				local _ = not gameId
				
				if gameId then
					t.localId = tostring(p1.LocalId)
					t.creationSessionId = p9
				end
				fireAnalyticsEventModule(eventNames.UploadCaptureFailed, t)
				
				return
			end
		else
			loggerModule:debug("event=path_selected path=fallback localId={}", string.gsub(string.gsub(enumName(p1.LocalId) or "nil", "\r", "\\r"), "\n", "\\n"))
			ok_1, status = pcall(function()
				-- upvalues: p10 (copy), p1 (copy), var2 (copy), p3 (copy)
				p10:UploadCaptureAndPostMoment(p1, var2, p3)
			end)
			
			if ok_1 or not gameId then
				local var14 = fireAnalyticsEventModule
				local editingFlowMomentPublished = eventNames.EditingFlowMomentPublished
				local var15 = makeCreationEventFieldsModule.makeCaptureDescriptorFields(p1)
				
				if gameId then
					var15.creationSessionId = p9
				end
				var14(editingFlowMomentPublished, var15)
			end
			if ok_1 then
				if fFlagMomentsRealtimeSessionTelemetry and fFlagMomentsUploadOutcomeTelemetry then
					momentsCommonModule.Analytics.reportMomentsCreationStep("upload", "success")
				end
				return
			else
				p5.setFailed("GenericFailure")
				p6.triggerToast({ title = p4.failedTitle, text = p4.failedBody })
				local t = {
					error = tostring(status),
					captureType = enumName(p1.CaptureType)
				}
				
				if gameId then
					t.status = "GenericFailure"
				end
				if fFlagMomentsRealtimeSessionTelemetry then
					momentsCommonModule.Analytics.reportMomentsCreationStep("upload", "failed", if fFlagMomentsUploadOutcomeTelemetry then "GenericFailure" else nil)
				end
				local _ = not gameId
				
				if gameId then
					t.localId = tostring(p1.LocalId)
					t.creationSessionId = p9
				end
				fireAnalyticsEventModule(eventNames.UploadCaptureFailed, t)
			end
		end
	end)
end