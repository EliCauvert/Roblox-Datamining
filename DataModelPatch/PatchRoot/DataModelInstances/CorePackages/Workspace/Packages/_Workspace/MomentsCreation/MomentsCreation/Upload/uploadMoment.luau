local CaptureService = game:GetService("CaptureService")
local MomentsCreation = script:FindFirstAncestor("MomentsCreation")
local Parent = MomentsCreation.Parent
local MomentsCommonModule = require(Parent.MomentsCommon)
local _ = require(Parent.MomentsTypes)
local EventNames = MomentsCommonModule.Analytics.EventNames
local FireAnalyticsEventModule = require(MomentsCreation.Analytics.fireAnalyticsEvent)
local MakeCreationEventFieldsModule = require(MomentsCreation.Analytics.makeCreationEventFields)
local GetFFlagMomentsAnalyticsProducerPrereqsFunction = MomentsCommonModule.Flags.GetFFlagMomentsAnalyticsProducerPrereqs
local EnumNameFunction = MakeCreationEventFieldsModule.enumName
local v1 = game
local CaptureServiceUploadUniverseIdOverrideEngineFeature = game:GetEngineFeature("CaptureServiceUploadUniverseIdOverride")
local CaptureServiceStartUploadCoreScriptBypassEngineFeature = game:GetEngineFeature("CaptureServiceStartUploadCoreScriptBypass")
game:DefineFastString("MomentsUploadUniverseId", "8357232245")

local function _(Tbl)
	-- upvalues: v1 (copy)
	local GameId: number = v1.GameId
	
	if GameId == nil or GameId <= 0 then
		local Copy = table.clone(Tbl)
		Copy.universeIdOverride = tonumber(game:GetFastString("MomentsUploadUniverseId"))
		
		return Copy
	else
		return Tbl
	end
end

return function(Capture, Tbl, FeedRegistrationInfo, p1, p2, p3, p4, p5, CreationSessionId)
	-- upvalues: CaptureServiceUploadUniverseIdOverrideEngineFeature (copy), v1 (copy), GetFFlagMomentsAnalyticsProducerPrereqsFunction (copy), FireAnalyticsEventModule (copy), EventNames (copy), CaptureServiceStartUploadCoreScriptBypassEngineFeature (copy), CaptureService (copy), MakeCreationEventFieldsModule (copy), EnumNameFunction (copy)
	local MomentMetadata = nil
	if CaptureServiceUploadUniverseIdOverrideEngineFeature then
		local GameId: number = v1.GameId
		
		if GameId == nil or GameId <= 0 then
			local Copy = table.clone(Tbl)
			Copy.universeIdOverride = tonumber(game:GetFastString("MomentsUploadUniverseId"))
			MomentMetadata = Copy
		else
			MomentMetadata = Tbl
		end
	else
		MomentMetadata = Tbl
	end
	p2.setUploading()
	p3.triggerToast({ title = p1.publishingTitle, text = p1.publishingBody })
	local FFlagMomentsAnalyticsProducerPrereqs = GetFFlagMomentsAnalyticsProducerPrereqsFunction()
	
	local function _(p6)
		-- upvalues: FFlagMomentsAnalyticsProducerPrereqs (copy), CreationSessionId (copy)
		if FFlagMomentsAnalyticsProducerPrereqs then
			p6.creationSessionId = CreationSessionId
		end
		return p6
	end
	
	local _ = function(p6, p7)
		-- upvalues: FFlagMomentsAnalyticsProducerPrereqs (copy), Capture (copy), CreationSessionId (copy), FireAnalyticsEventModule (upval), EventNames (upval)
		if not FFlagMomentsAnalyticsProducerPrereqs and not p7 then return end
		if FFlagMomentsAnalyticsProducerPrereqs then
			p6.localId = tostring(Capture.LocalId)
			p6.creationSessionId = CreationSessionId
		end
		FireAnalyticsEventModule(EventNames.UploadCaptureFailed, p6)
	end
	
	task.spawn(function()
		-- upvalues: CaptureServiceStartUploadCoreScriptBypassEngineFeature (upval), CaptureService (upval), Capture (copy), MomentMetadata (copy), FeedRegistrationInfo (copy), FireAnalyticsEventModule (upval), EventNames (upval), MakeCreationEventFieldsModule (upval), FFlagMomentsAnalyticsProducerPrereqs (copy), CreationSessionId (copy), p2 (copy), p3 (copy), p1 (copy), EnumNameFunction (upval), p4 (copy), p5 (copy)
		if CaptureServiceStartUploadCoreScriptBypassEngineFeature then
			local Success1, Result1, Result3 = pcall(function()
				-- upvalues: CaptureService (upval), Capture (upval)
				return CaptureService:StartUploadCaptureAsync(Capture)
			end)
			
			if Success1 then
				if Result1 == Enum.UploadCaptureResult.Success then
					pcall(function()
						-- upvalues: CaptureService (upval), Capture (upval), MomentMetadata (upval), FeedRegistrationInfo (upval)
						CaptureService:UploadCaptureAndPostMoment(Capture, MomentMetadata, FeedRegistrationInfo)
					end)
					local EditingFlowMomentPublished = EventNames.EditingFlowMomentPublished
					local CaptureDescriptorFields = MakeCreationEventFieldsModule.makeCaptureDescriptorFields(Capture)
					
					if FFlagMomentsAnalyticsProducerPrereqs then
						CaptureDescriptorFields.creationSessionId = CreationSessionId
					end
					FireAnalyticsEventModule(EditingFlowMomentPublished, CaptureDescriptorFields)
					local Result2 = nil
					local Result3_1 = nil
					
					for _ = 1, 120 do
						task.wait(5)
						local Success2
						Success2, Result2, Result3_1 = pcall(function()
							-- upvalues: CaptureService (upval), Result3 (copy)
							return CaptureService:CheckUploadCaptureStatusAsync(Result3)
						end)
						
						if not Success2 then
							p2.setFailed("PollError")
							p3.triggerToast({ title = p1.failedTitle, text = p1.failedBody })
							local config = {
								status = "PollError",
								error = tostring(Result2),
								captureType = EnumNameFunction(Capture.CaptureType)
							}
							
							if not FFlagMomentsAnalyticsProducerPrereqs then return end
							if FFlagMomentsAnalyticsProducerPrereqs then
								config.localId = tostring(Capture.LocalId)
								config.creationSessionId = CreationSessionId
							end
							FireAnalyticsEventModule(EventNames.UploadCaptureFailed, config)
							
							return
						elseif Result2 ~= Enum.UploadCaptureResult.Success then
							if Result2 == Enum.UploadCaptureResult.UploadPending then
								continue
							elseif Result2 == Enum.UploadCaptureResult.CaptureModerated then
								p2.setFailed("Moderated")
								p3.triggerToast({ title = p1.removedTitle, text = p1.removedBody })
								local config = {
									status = EnumNameFunction(Result2),
									captureType = EnumNameFunction(Capture.CaptureType)
								}
								
								if not FFlagMomentsAnalyticsProducerPrereqs then return end
								if FFlagMomentsAnalyticsProducerPrereqs then
									config.localId = tostring(Capture.LocalId)
									config.creationSessionId = CreationSessionId
								end
								FireAnalyticsEventModule(EventNames.UploadCaptureFailed, config)
								
								return
							else
								p2.setFailed((tostring(Result2)))
								p3.triggerToast({ title = p1.failedTitle, text = p1.failedBody })
								local config1 = {
									status = EnumNameFunction(Result2),
									captureType = EnumNameFunction(Capture.CaptureType)
								}
								
								if not FFlagMomentsAnalyticsProducerPrereqs then return end
								if FFlagMomentsAnalyticsProducerPrereqs then
									config1.localId = tostring(Capture.LocalId)
									config1.creationSessionId = CreationSessionId
								end
								FireAnalyticsEventModule(EventNames.UploadCaptureFailed, config1)
								
								return
							end
						else
							p2.setSuccess(Result3_1)
							
							if p4 then
								p4.prependItem({ assetId = Result3_1 })
							end
							if p5 then
								p5.prependItem({ assetId = Result3_1 })
								p5.invalidateCount()
							end
							local EditingFlowMomentPostedToFeed = EventNames.EditingFlowMomentPostedToFeed
							local config = {
								assetId = tostring(Result3_1),
								localId = tostring(Capture.LocalId),
								captureType = EnumNameFunction(Capture.CaptureType)
							}
							
							if FFlagMomentsAnalyticsProducerPrereqs then
								config.creationSessionId = CreationSessionId
							end
							FireAnalyticsEventModule(EditingFlowMomentPostedToFeed, config)
							p3.triggerToast({ title = p1.publishedTitle, text = p1.publishedBody })
							
							return
						end
					end
					p2.setFailed("Timeout")
					p3.triggerToast({ title = p1.failedTitle, text = p1.failedBody })
					local config = {
						status = "Timeout",
						captureType = EnumNameFunction(Capture.CaptureType)
					}
					
					if not FFlagMomentsAnalyticsProducerPrereqs then return end
					if FFlagMomentsAnalyticsProducerPrereqs then
						config.localId = tostring(Capture.LocalId)
						config.creationSessionId = CreationSessionId
					end
					FireAnalyticsEventModule(EventNames.UploadCaptureFailed, config)
					
					return
				else
					if Result1 == Enum.UploadCaptureResult.CaptureModerated then
						p3.triggerToast({ title = p1.removedTitle, text = p1.removedBody })
					elseif Result1 == Enum.UploadCaptureResult.UploadQuotaReached then
						p3.triggerToast({ title = p1.failedTitle, text = p1.uploadQuotaReachedBody })
					else
						p3.triggerToast({ title = p1.failedTitle, text = p1.failedBody })
					end
					p2.setFailed((tostring(Result1)))
					local config = {
						status = EnumNameFunction(Result1),
						captureType = EnumNameFunction(Capture.CaptureType)
					}
					local _ = not FFlagMomentsAnalyticsProducerPrereqs
					
					if FFlagMomentsAnalyticsProducerPrereqs then
						config.localId = tostring(Capture.LocalId)
						config.creationSessionId = CreationSessionId
					end
					FireAnalyticsEventModule(EventNames.UploadCaptureFailed, config)
					
					return
				end
			else
				p2.setFailed("StartUploadFailed")
				p3.triggerToast({ title = p1.failedTitle, text = p1.failedBody })
				local config = {
					status = EnumNameFunction(Result1),
					captureType = EnumNameFunction(Capture.CaptureType)
				}
				local _ = not FFlagMomentsAnalyticsProducerPrereqs
				
				if FFlagMomentsAnalyticsProducerPrereqs then
					config.localId = tostring(Capture.LocalId)
					config.creationSessionId = CreationSessionId
				end
				FireAnalyticsEventModule(EventNames.UploadCaptureFailed, config)
				
				return
			end
		else
			local Success, Result = pcall(function()
				-- upvalues: CaptureService (upval), Capture (upval), MomentMetadata (upval), FeedRegistrationInfo (upval)
				CaptureService:UploadCaptureAndPostMoment(Capture, MomentMetadata, FeedRegistrationInfo)
			end)
			local EditingFlowMomentPublished = EventNames.EditingFlowMomentPublished
			local CaptureDescriptorFields = MakeCreationEventFieldsModule.makeCaptureDescriptorFields(Capture)
			
			if FFlagMomentsAnalyticsProducerPrereqs then
				CaptureDescriptorFields.creationSessionId = CreationSessionId
			end
			FireAnalyticsEventModule(EditingFlowMomentPublished, CaptureDescriptorFields)
			
			if not Success then
				p2.setFailed("GenericFailure")
				p3.triggerToast({ title = p1.failedTitle, text = p1.failedBody })
				local config = {
					error = tostring(Result),
					captureType = EnumNameFunction(Capture.CaptureType)
				}
				local _ = not FFlagMomentsAnalyticsProducerPrereqs
				
				if FFlagMomentsAnalyticsProducerPrereqs then
					config.localId = tostring(Capture.LocalId)
					config.creationSessionId = CreationSessionId
				end
				FireAnalyticsEventModule(EventNames.UploadCaptureFailed, config)
			end
		end
	end)
end