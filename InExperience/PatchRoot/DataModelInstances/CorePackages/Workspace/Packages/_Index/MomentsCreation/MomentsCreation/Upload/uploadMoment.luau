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
local enumName = makeCreationEventFieldsModule.enumName
local _game = game
local captureServiceUploadUniverseIdOverrideEngineFeature = game:GetEngineFeature("CaptureServiceUploadUniverseIdOverride")
local captureServiceStartUploadCoreScriptBypassEngineFeature = game:GetEngineFeature("CaptureServiceStartUploadCoreScriptBypass")
game:DefineFastString("MomentsUploadUniverseId", "8357232245")

local function _(p0) --[[ line: 74 | named "logValue" ]]
	-- upvalues: enumName (ref)
	return string.gsub(string.gsub(enumName(p0) or "nil", "\r", "\\r"), "\n", "\\n")
end

local _ = function(p1) --[[ line: 81 | named "injectUniverseIdOverride" ]]
	-- upvalues: _game (ref)
	local gameId = _game.GameId
	
	if gameId == nil or gameId <= 0 then
		local cloned = table.clone(p1)
		cloned.universeIdOverride = tonumber(game:GetFastString("MomentsUploadUniverseId"))
		
		return cloned
	end
	return p1
end

return function(p2, p3, p4, p5, p6, p7, p8, p9, p10) --[[ line: 91 | named "uploadMoment" ]]
	-- upvalues: captureServiceUploadUniverseIdOverrideEngineFeature (ref), _game (ref), getFFlagMomentsCreationNormalizeMetadataEnumsModule (ref), normalizeMomentMetadataModule (ref), loggerModule (ref), captureServiceStartUploadCoreScriptBypassEngineFeature (ref), enumName (ref), getFFlagMomentsUseBackendPostStatusNotificationModule (ref), getFFlagMomentsAnalyticsProducerPrereqs (ref), fireAnalyticsEventModule (ref), eventNames (ref), captureService (ref), makeCreationEventFieldsModule (ref), completeMomentUploadModule (ref)
	local gameId, var14
	if captureServiceUploadUniverseIdOverrideEngineFeature then
		gameId = _game.GameId
		
		if gameId == nil or gameId <= 0 then
			local cloned = table.clone(p3)
			cloned.universeIdOverride = tonumber(game:GetFastString("MomentsUploadUniverseId"))
			var14 = cloned
		else
			var14 = p3
		end
	else
		var14 = p3
	end
	if getFFlagMomentsCreationNormalizeMetadataEnumsModule() then
		var14 = normalizeMomentMetadataModule(var14)
	end
	loggerModule:debug("event=upload_start CaptureServiceStartUploadCoreScriptBypass={} MomentsUseBackendPostStatusNotification={} localId={} captureType={} sourcePlaceId={} sourceUniverseId={}", string.gsub(string.gsub(enumName(captureServiceStartUploadCoreScriptBypassEngineFeature) or "nil", "\r", "\\r"), "\n", "\\n"), string.gsub(string.gsub(enumName(getFFlagMomentsUseBackendPostStatusNotificationModule()) or "nil", "\r", "\\r"), "\n", "\\n"), string.gsub(string.gsub(enumName(p2.LocalId) or "nil", "\r", "\\r"), "\n", "\\n"), string.gsub(string.gsub(enumName(p2.CaptureType) or "nil", "\r", "\\r"), "\n", "\\n"), string.gsub(string.gsub(enumName(p2.SourcePlaceId) or "nil", "\r", "\\r"), "\n", "\\n"), string.gsub(string.gsub(enumName(p2.SourceUniverseId) or "nil", "\r", "\\r"), "\n", "\\n"))
	p6.setUploading()
	p7.triggerToast({ title = p5.publishingTitle, text = p5.publishingBody })
	gameId = getFFlagMomentsAnalyticsProducerPrereqs()
	
	local function _(p11) --[[ line: 136 | named "publishFields" ]]
		-- upvalues: gameId (ref), p10 (ref)
		if gameId then
			p11.creationSessionId = p10
		end
		return p11
	end
	
	local _ = function(p12, p13) --[[ line: 144 | named "fireUploadFailed" ]]
		-- upvalues: gameId (ref), p2 (ref), p10 (ref), fireAnalyticsEventModule (copy), eventNames (copy)
		if not gameId and not p13 then return end
		if gameId then
			p12.localId = tostring(p2.LocalId)
			p12.creationSessionId = p10
		end
		fireAnalyticsEventModule(eventNames.UploadCaptureFailed, p12)
	end
	
	task.spawn(function() --[[ line: 155 ]]
		-- upvalues: captureServiceStartUploadCoreScriptBypassEngineFeature (copy), loggerModule (copy), p2 (ref), enumName (copy), captureService (copy), var14 (write), p4 (ref), gameId (ref), fireAnalyticsEventModule (copy), eventNames (copy), makeCreationEventFieldsModule (copy), p10 (ref), p6 (ref), p7 (ref), p5 (ref), completeMomentUploadModule (copy), p8 (ref), p9 (ref)
		local ok_1
		if captureServiceStartUploadCoreScriptBypassEngineFeature then
			loggerModule:debug("event=path_selected path=two_phase localId={}", string.gsub(string.gsub(enumName(p2.LocalId) or "nil", "\r", "\\r"), "\n", "\\n"))
			ok_1, status, var19 = pcall(function() --[[ line: 192 ]]
				-- upvalues: captureService (copy), p2 (copy)
				return captureService:StartUploadCaptureAsync(p2)
			end)
			
			if ok_1 then
				loggerModule:debug("event=start_upload localId={} pcallSuccess=true status={}", string.gsub(string.gsub(enumName(p2.LocalId) or "nil", "\r", "\\r"), "\n", "\\n"), string.gsub(string.gsub(enumName(status) or "nil", "\r", "\\r"), "\n", "\\n"))
			else
				loggerModule:debug("event=start_upload localId={} pcallSuccess=false status=pcall_error errorClass={}", string.gsub(string.gsub(enumName(p2.LocalId) or "nil", "\r", "\\r"), "\n", "\\n"), typeof(status))
			end
			if ok_1 then
				if status == Enum.UploadCaptureResult.Success then
					local ok_2, status_1 = pcall(function() --[[ line: 251 ]]
						-- upvalues: captureService (copy), p2 (copy), var14 (copy), p4 (copy)
						captureService:UploadCaptureAndPostMoment(p2, var14, p4)
					end)
					loggerModule:debug("event=registration localId={} pcallSuccess={} errorClass={}", string.gsub(string.gsub(enumName(p2.LocalId) or "nil", "\r", "\\r"), "\n", "\\n"), tostring(ok_2), if ok_2 then "none" else typeof(status_1))
					
					if gameId and not ok_2 then
						p6.setFailed("RegistrationFailed")
						p7.triggerToast({ title = p5.failedTitle, text = p5.failedBody })
						local t = {
							status = "RegistrationFailed",
							error = tostring(status_1),
							captureType = enumName(p2.CaptureType)
						}
						
						if not gameId then return end
						if gameId then
							t.localId = tostring(p2.LocalId)
							t.creationSessionId = p10
						end
						fireAnalyticsEventModule(eventNames.UploadCaptureFailed, t)
						
						return
					else
						local editingFlowMomentPublished = eventNames.EditingFlowMomentPublished
						local var23 = makeCreationEventFieldsModule.makeCaptureDescriptorFields(p2)
						
						if gameId then
							var23.creationSessionId = p10
						end
						fireAnalyticsEventModule(editingFlowMomentPublished, var23)
						local var24 = false
						local var25 = nil
						
						for i = 1, 120 do
							task.wait(5)
							local ok_3, status_2, var26 = pcall(function() --[[ line: 290 ]]
								-- upvalues: captureService (copy), var19 (ref)
								return captureService:CheckUploadCaptureStatusAsync(var19)
							end)
							local var27 = not var24 or ok_3 and status_2 ~= var25
							local var28 = not ok_3 or status_2 ~= Enum.UploadCaptureResult.UploadPending
							local var29 = i % 6 == 0
							
							if ok_3 then
								var24 = true
								var25 = status_2
							end
							if i == 1 or var27 or (var28 or var29) then
								if ok_3 then
									loggerModule:debug("event=poll localId={} attempt={} pcallSuccess=true status={} assetId={} heartbeat={}", string.gsub(string.gsub(enumName(p2.LocalId) or "nil", "\r", "\\r"), "\n", "\\n"), tostring(i), string.gsub(string.gsub(enumName(status_2) or "nil", "\r", "\\r"), "\n", "\\n"), string.gsub(string.gsub(enumName(var26) or "nil", "\r", "\\r"), "\n", "\\n"), tostring(var29 and not var27))
								else
									loggerModule:debug("event=poll localId={} attempt={} pcallSuccess=false status=pcall_error errorClass={}", string.gsub(string.gsub(enumName(p2.LocalId) or "nil", "\r", "\\r"), "\n", "\\n"), tostring(i), typeof(status_2))
								end
							end
							if ok_3 then
								if status_2 ~= Enum.UploadCaptureResult.Success then
									if status_2 == Enum.UploadCaptureResult.UploadPending then
										continue
									end
									if status_2 == Enum.UploadCaptureResult.CaptureModerated then
										p6.setFailed("Moderated")
										p7.triggerToast({ title = p5.removedTitle, text = p5.removedBody })
										local t = {
											status = enumName(status_2),
											captureType = enumName(p2.CaptureType)
										}
										
										if not gameId then return end
										if gameId then
											t.localId = tostring(p2.LocalId)
											t.creationSessionId = p10
										end
										fireAnalyticsEventModule(eventNames.UploadCaptureFailed, t)
										
										return
									else
										p6.setFailed(tostring(status_2))
										p7.triggerToast({ title = p5.failedTitle, text = p5.failedBody })
										local t = {
											status = enumName(status_2),
											captureType = enumName(p2.CaptureType)
										}
										
										if not gameId then return end
										if gameId then
											t.localId = tostring(p2.LocalId)
											t.creationSessionId = p10
										end
										fireAnalyticsEventModule(eventNames.UploadCaptureFailed, t)
										
										return
									end
								end
								completeMomentUploadModule(var26, {
									uploadStore = p6,
									toastStore = p7,
									feedStore = p8,
									myCreationsStore = p9,
									localizations = p5,
									onPostedToFeed = function() --[[ line: 343 ]]
										-- upvalues: fireAnalyticsEventModule (copy), eventNames (copy), var26 (ref), p2 (copy), enumName (copy), gameId (copy), p10 (copy)
										local editingFlowMomentPostedToFeed = eventNames.EditingFlowMomentPostedToFeed
										local t = {
											assetId = tostring(var26),
											localId = tostring(p2.LocalId),
											captureType = enumName(p2.CaptureType)
										}
										
										if gameId then
											t.creationSessionId = p10
										end
										fireAnalyticsEventModule(editingFlowMomentPostedToFeed, t)
									end
								})
								
								return
							end
							p6.setFailed("PollError")
							p7.triggerToast({ title = p5.failedTitle, text = p5.failedBody })
							local t = {
								status = "PollError",
								error = tostring(status_2),
								captureType = enumName(p2.CaptureType)
							}
							
							if not gameId then return end
							if gameId then
								t.localId = tostring(p2.LocalId)
								t.creationSessionId = p10
							end
							fireAnalyticsEventModule(eventNames.UploadCaptureFailed, t)
							
							return
						end
						loggerModule:debug("event=poll_timeout localId={} attempts={}", string.gsub(string.gsub(enumName(p2.LocalId) or "nil", "\r", "\\r"), "\n", "\\n"), tostring(120))
						p6.setFailed("Timeout")
						p7.triggerToast({ title = p5.failedTitle, text = p5.failedBody })
						local t = {
							status = "Timeout",
							captureType = enumName(p2.CaptureType)
						}
						
						if not gameId then return end
						if gameId then
							t.localId = tostring(p2.LocalId)
							t.creationSessionId = p10
						end
						fireAnalyticsEventModule(eventNames.UploadCaptureFailed, t)
						
						return
					end
				elseif status == Enum.UploadCaptureResult.CaptureModerated then
					p7.triggerToast({ title = p5.removedTitle, text = p5.removedBody })
				elseif status == Enum.UploadCaptureResult.UploadQuotaReached then
					p7.triggerToast({ title = p5.failedTitle, text = p5.uploadQuotaReachedBody })
				else
					p7.triggerToast({ title = p5.failedTitle, text = p5.failedBody })
				end
				p6.setFailed(tostring(status))
				local t = {
					status = enumName(status),
					captureType = enumName(p2.CaptureType)
				}
				local _ = not gameId
				
				if gameId then
					t.localId = tostring(p2.LocalId)
					t.creationSessionId = p10
				end
				fireAnalyticsEventModule(eventNames.UploadCaptureFailed, t)
				
				return
			else
				p6.setFailed("StartUploadFailed")
				p7.triggerToast({ title = p5.failedTitle, text = p5.failedBody })
				local t = {
					status = enumName(status),
					captureType = enumName(p2.CaptureType)
				}
				
				if gameId then
					t.status = "StartUploadFailed"
					t.error = tostring(status)
				end
				local _ = not gameId
				
				if gameId then
					t.localId = tostring(p2.LocalId)
					t.creationSessionId = p10
				end
				fireAnalyticsEventModule(eventNames.UploadCaptureFailed, t)
				
				return
			end
		else
			loggerModule:debug("event=path_selected path=fallback localId={}", string.gsub(string.gsub(enumName(p2.LocalId) or "nil", "\r", "\\r"), "\n", "\\n"))
			ok_1, status = pcall(function() --[[ line: 160 ]]
				-- upvalues: captureService (copy), p2 (copy), var14 (copy), p4 (copy)
				captureService:UploadCaptureAndPostMoment(p2, var14, p4)
			end)
			
			if ok_1 or not gameId then
				local var16 = fireAnalyticsEventModule
				local editingFlowMomentPublished = eventNames.EditingFlowMomentPublished
				local var17 = makeCreationEventFieldsModule.makeCaptureDescriptorFields(p2)
				
				if gameId then
					var17.creationSessionId = p10
				end
				var16(editingFlowMomentPublished, var17)
			end
			if not ok_1 then
				p6.setFailed("GenericFailure")
				p7.triggerToast({ title = p5.failedTitle, text = p5.failedBody })
				local t = {
					error = tostring(status),
					captureType = enumName(p2.CaptureType)
				}
				
				if gameId then
					t.status = "GenericFailure"
				end
				local _ = not gameId
				
				if gameId then
					t.localId = tostring(p2.LocalId)
					t.creationSessionId = p10
				end
				fireAnalyticsEventModule(eventNames.UploadCaptureFailed, t)
			end
		end
	end)
end