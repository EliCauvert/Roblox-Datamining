local CaptureService = game:GetService("CaptureService")
local MomentsCreation = script:FindFirstAncestor("MomentsCreation")
local Parent = MomentsCreation.Parent
local MomentsCommonModule = require(Parent.MomentsCommon)
local _ = require(Parent.MomentsTypes)
local EventNames = MomentsCommonModule.Analytics.EventNames
local FireAnalyticsEventModule = require(MomentsCreation.Analytics.fireAnalyticsEvent)
local MakeCreationEventFieldsModule = require(MomentsCreation.Analytics.makeCreationEventFields)
local NormalizeMomentMetadataModule = require(MomentsCreation.Utils.normalizeMomentMetadata)
local CompleteMomentUploadModule = require(MomentsCreation.Upload.completeMomentUpload)
local LoggerModule = require(MomentsCreation.Logger)
local FFlagMomentsTextOverlayV2Redesign = require(Parent.MomentsCommon).Flags.FFlagMomentsTextOverlayV2Redesign
local GetFFlagMomentsUseUploadPostAsyncFunction = MomentsCommonModule.Flags.GetFFlagMomentsUseUploadPostAsync
local FFlagMomentsUploadOutcomeTelemetry = MomentsCommonModule.Flags.FFlagMomentsUploadOutcomeTelemetry
local MomentsPostUploadFailureReasons = game:DefineFastFlag("MomentsPostUploadFailureReasons", false)
local GetFFlagMomentsUseMomentsServiceForUploadFunction = MomentsCommonModule.Flags.GetFFlagMomentsUseMomentsServiceForUpload
local MakePostMetadataModule = require(MomentsCreation.Utils.makePostMetadata)
local EnumNameFunction = MakeCreationEventFieldsModule.enumName
local v1 = game
local CaptureServiceUploadUniverseIdOverrideEngineFeature = game:GetEngineFeature("CaptureServiceUploadUniverseIdOverride")
local CaptureServiceStartUploadCoreScriptBypassEngineFeature = game:GetEngineFeature("CaptureServiceStartUploadCoreScriptBypass")
game:DefineFastString("MomentsUploadUniverseId", "8357232245")
game:DefineFastInt("MomentsUploadPollIntervalSeconds", 5)
game:DefineFastInt("MomentsUploadMaxPollAttempts", 120)

local function _(p1): string
	-- upvalues: EnumNameFunction (copy)
	return (string.gsub(string.gsub(EnumNameFunction(p1) or "nil", "\r", "\\r"), "\n", "\\n"))
end

local _ = function(Tbl)
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

return function(Capture, Tbl, FeedRegistrationInfo, Localizations, UploadStore, ToastStore, FeedStore, MyCreationsStore, CreationSessionId, p1, p2)
	-- upvalues: CaptureService (copy), CaptureServiceUploadUniverseIdOverrideEngineFeature (copy), v1 (copy), NormalizeMomentMetadataModule (copy), LoggerModule (copy), CaptureServiceStartUploadCoreScriptBypassEngineFeature (copy), EnumNameFunction (copy), FFlagMomentsUploadOutcomeTelemetry (copy), MomentsCommonModule (copy), FireAnalyticsEventModule (copy), EventNames (copy), GetFFlagMomentsUseUploadPostAsyncFunction (copy), MakePostMetadataModule (copy), FFlagMomentsTextOverlayV2Redesign (copy), GetFFlagMomentsUseMomentsServiceForUploadFunction (copy), MakeCreationEventFieldsModule (copy), CompleteMomentUploadModule (copy), MomentsPostUploadFailureReasons (copy), MomentsCreation (copy)
	local P9 = p1 or CaptureService
	local Tbl1 = nil
	
	if CaptureServiceUploadUniverseIdOverrideEngineFeature then
		local GameId: number = v1.GameId
		
		if GameId == nil or GameId <= 0 then
			local Copy = table.clone(Tbl)
			Copy.universeIdOverride = tonumber(game:GetFastString("MomentsUploadUniverseId"))
			Tbl1 = Copy
		else
			Tbl1 = Tbl
		end
	else
		Tbl1 = Tbl
	end
	local Tbl2 = Tbl1
	local NormalizeMomentMetadataModuleResult = NormalizeMomentMetadataModule(Tbl1)
	LoggerModule:debug("event=upload_start CaptureServiceStartUploadCoreScriptBypass={} MomentsUseBackendPostStatusNotification={} localId={} captureType={} sourcePlaceId={} sourceUniverseId={}", string.gsub(string.gsub(EnumNameFunction(CaptureServiceStartUploadCoreScriptBypassEngineFeature) or "nil", "\r", "\\r"), "\n", "\\n"), string.gsub(string.gsub(EnumNameFunction(true) or "nil", "\r", "\\r"), "\n", "\\n"), string.gsub(string.gsub(EnumNameFunction(Capture.LocalId) or "nil", "\r", "\\r"), "\n", "\\n"), string.gsub(string.gsub(EnumNameFunction(Capture.CaptureType) or "nil", "\r", "\\r"), "\n", "\\n"), string.gsub(string.gsub(EnumNameFunction(Capture.SourcePlaceId) or "nil", "\r", "\\r"), "\n", "\\n"), (string.gsub(string.gsub(EnumNameFunction(Capture.SourceUniverseId) or "nil", "\r", "\\r"), "\n", "\\n")))
	UploadStore.setUploading()
	ToastStore.triggerToast({
		title = Localizations.publishingTitle,
		text = Localizations.publishingBody
	})
	
	local function _(p3)
		-- upvalues: CreationSessionId (copy)
		p3.creationSessionId = CreationSessionId
		
		return p3
	end
	
	local _ = function(p3, p4)
		-- upvalues: FFlagMomentsUploadOutcomeTelemetry (upval), MomentsCommonModule (upval), Capture (copy), CreationSessionId (copy), FireAnalyticsEventModule (upval), EventNames (upval)
		MomentsCommonModule.Analytics.reportMomentsCreationStep("upload", "failed", if FFlagMomentsUploadOutcomeTelemetry then p4 else nil)
		p3.localId = tostring(Capture.LocalId)
		p3.creationSessionId = CreationSessionId
		FireAnalyticsEventModule(EventNames.UploadCaptureFailed, p3)
	end
	
	task.spawn(function()
		-- upvalues: GetFFlagMomentsUseUploadPostAsyncFunction (upval), LoggerModule (upval), Capture (copy), EnumNameFunction (upval), MakePostMetadataModule (upval), FFlagMomentsTextOverlayV2Redesign (upval), Tbl2 (copy), NormalizeMomentMetadataModuleResult (ref), GetFFlagMomentsUseMomentsServiceForUploadFunction (upval), FireAnalyticsEventModule (upval), EventNames (upval), MakeCreationEventFieldsModule (upval), CreationSessionId (copy), p2 (copy), P9 (copy), CompleteMomentUploadModule (upval), UploadStore (copy), ToastStore (copy), FeedStore (copy), MyCreationsStore (copy), Localizations (copy), MomentsPostUploadFailureReasons (upval), MomentsCreation (upval), FFlagMomentsUploadOutcomeTelemetry (upval), MomentsCommonModule (upval), CaptureServiceStartUploadCoreScriptBypassEngineFeature (upval), FeedRegistrationInfo (copy)
		if GetFFlagMomentsUseUploadPostAsyncFunction() then
			LoggerModule:debug("event=path_selected path=post_upload localId={}", (string.gsub(string.gsub(EnumNameFunction(Capture.LocalId) or "nil", "\r", "\\r"), "\n", "\\n")))
			local PostMetadataModule = MakePostMetadataModule(if FFlagMomentsTextOverlayV2Redesign then Tbl2 else NormalizeMomentMetadataModuleResult, if GetFFlagMomentsUseMomentsServiceForUploadFunction() then Capture else nil)
			local CaptureDescriptorFields = MakeCreationEventFieldsModule.makeCaptureDescriptorFields(Capture)
			CaptureDescriptorFields.creationSessionId = CreationSessionId
			FireAnalyticsEventModule(EventNames.EditingFlowMomentPublished, CaptureDescriptorFields)
			local Success, Result = pcall(function()
				-- upvalues: GetFFlagMomentsUseMomentsServiceForUploadFunction (upval), p2 (upval), PostMetadataModule (copy), P9 (upval), Capture (upval)
				return if GetFFlagMomentsUseMomentsServiceForUploadFunction() then (p2 or game:GetService("MomentsService")):CreatePostAsync(PostMetadataModule) else P9:UploadPostAsync(Capture, PostMetadataModule)
			end)
			
			if Success then
				LoggerModule:debug("event=post_upload_success localId={} assetId={}", string.gsub(string.gsub(EnumNameFunction(Capture.LocalId) or "nil", "\r", "\\r"), "\n", "\\n"), (string.gsub(string.gsub(EnumNameFunction(Result.assetId) or "nil", "\r", "\\r"), "\n", "\\n")))
				CompleteMomentUploadModule(Result.assetId, {
					uploadStore = UploadStore,
					toastStore = ToastStore,
					feedStore = FeedStore,
					myCreationsStore = MyCreationsStore,
					localizations = Localizations,
					onPostedToFeed = function()
						-- upvalues: FireAnalyticsEventModule (upval), EventNames (upval), Result (copy), Capture (upval), EnumNameFunction (upval), CreationSessionId (upval)
						FireAnalyticsEventModule(EventNames.EditingFlowMomentPostedToFeed, {
							assetId = tostring(Result.assetId),
							localId = tostring(Capture.LocalId),
							captureType = EnumNameFunction(Capture.CaptureType),
							creationSessionId = CreationSessionId
						})
					end
				})
				
				return
			else
				LoggerModule:debug("event=post_upload_failed localId={} error={}", string.gsub(string.gsub(EnumNameFunction(Capture.LocalId) or "nil", "\r", "\\r"), "\n", "\\n"), (string.gsub(string.gsub(EnumNameFunction(Result) or "nil", "\r", "\\r"), "\n", "\\n")))
				UploadStore.setFailed("GenericFailure")
				ToastStore.triggerToast({
					title = Localizations.failedTitle,
					text = Localizations.failedBody
				})
				local config = {
					status = "GenericFailure",
					error = tostring(Result),
					captureType = EnumNameFunction(Capture.CaptureType)
				}
				local GenericFailure = if MomentsPostUploadFailureReasons then require(MomentsCreation.Upload.classifyPostUploadError)(Result) else "GenericFailure"
				MomentsCommonModule.Analytics.reportMomentsCreationStep("upload", "failed", if FFlagMomentsUploadOutcomeTelemetry then GenericFailure else nil)
				config.localId = tostring(Capture.LocalId)
				config.creationSessionId = CreationSessionId
				FireAnalyticsEventModule(EventNames.UploadCaptureFailed, config)
				
				return
			end
		elseif CaptureServiceStartUploadCoreScriptBypassEngineFeature then
			LoggerModule:debug("event=path_selected path=two_phase localId={}", (string.gsub(string.gsub(EnumNameFunction(Capture.LocalId) or "nil", "\r", "\\r"), "\n", "\\n")))
			local Success2, Result2, Result3 = pcall(function()
				-- upvalues: P9 (upval), Capture (upval)
				return P9:StartUploadCaptureAsync(Capture)
			end)
			
			if Success2 then
				LoggerModule:debug("event=start_upload localId={} pcallSuccess=true status={}", string.gsub(string.gsub(EnumNameFunction(Capture.LocalId) or "nil", "\r", "\\r"), "\n", "\\n"), (string.gsub(string.gsub(EnumNameFunction(Result2) or "nil", "\r", "\\r"), "\n", "\\n")))
			else
				LoggerModule:debug("event=start_upload localId={} pcallSuccess=false status=pcall_error errorClass={}", string.gsub(string.gsub(EnumNameFunction(Capture.LocalId) or "nil", "\r", "\\r"), "\n", "\\n"), (typeof(Result2)))
			end
			if not Success2 then
				UploadStore.setFailed("StartUploadFailed")
				ToastStore.triggerToast({
					title = Localizations.failedTitle,
					text = Localizations.failedBody
				})
				local config = {
					status = EnumNameFunction(Result2),
					captureType = EnumNameFunction(Capture.CaptureType)
				}
				config.status = "StartUploadFailed"
				config.error = tostring(Result2)
				MomentsCommonModule.Analytics.reportMomentsCreationStep("upload", "failed", if FFlagMomentsUploadOutcomeTelemetry then "StartUploadFailed" else nil)
				config.localId = tostring(Capture.LocalId)
				config.creationSessionId = CreationSessionId
				FireAnalyticsEventModule(EventNames.UploadCaptureFailed, config)
				
				return
			end
			if Result2 == Enum.UploadCaptureResult.Success then
				local Success3, Result4 = pcall(function()
					-- upvalues: P9 (upval), Capture (upval), NormalizeMomentMetadataModuleResult (upval), FeedRegistrationInfo (upval)
					P9:UploadCaptureAndPostMoment(Capture, NormalizeMomentMetadataModuleResult, FeedRegistrationInfo)
				end)
				LoggerModule:debug("event=registration localId={} pcallSuccess={} errorClass={}", string.gsub(string.gsub(EnumNameFunction(Capture.LocalId) or "nil", "\r", "\\r"), "\n", "\\n"), tostring(Success3), if Success3 then "none" else typeof(Result4))
				
				if not Success3 then
					UploadStore.setFailed("RegistrationFailed")
					ToastStore.triggerToast({
						title = Localizations.failedTitle,
						text = Localizations.failedBody
					})
					local config = {
						status = "RegistrationFailed",
						error = tostring(Result4),
						captureType = EnumNameFunction(Capture.CaptureType)
					}
					MomentsCommonModule.Analytics.reportMomentsCreationStep("upload", "failed", if FFlagMomentsUploadOutcomeTelemetry then "RegistrationFailed" else nil)
					config.localId = tostring(Capture.LocalId)
					config.creationSessionId = CreationSessionId
					FireAnalyticsEventModule(EventNames.UploadCaptureFailed, config)
					
					return
				end
				local CaptureDescriptorFields = MakeCreationEventFieldsModule.makeCaptureDescriptorFields(Capture)
				CaptureDescriptorFields.creationSessionId = CreationSessionId
				FireAnalyticsEventModule(EventNames.EditingFlowMomentPublished, CaptureDescriptorFields)
				local Flag = false
				local v2 = nil
				local MomentsUploadPollIntervalSecondsFastInt = game:GetFastInt("MomentsUploadPollIntervalSeconds")
				local MomentsUploadMaxPollAttemptsFastInt = game:GetFastInt("MomentsUploadMaxPollAttempts")
				local Result5 = nil
				local Result3_1 = nil
				
				for i = 1, MomentsUploadMaxPollAttemptsFastInt do
					task.wait(MomentsUploadPollIntervalSecondsFastInt)
					local Success4
					Success4, Result5, Result3_1 = pcall(function()
						-- upvalues: P9 (upval), Result3 (copy)
						return P9:CheckUploadCaptureStatusAsync(Result3)
					end)
					local NoFlag: boolean = not Flag or Success4 and Result5 ~= v2
					local NoSuccess4: boolean = not Success4 or Result5 ~= Enum.UploadCaptureResult.UploadPending
					local IsIMatch = i % 6 == 0
					
					if Success4 then
						Flag = true
						v2 = Result5
					end
					if i == 1 or NoFlag or (NoSuccess4 or IsIMatch) then
						if Success4 then
							LoggerModule:debug("event=poll localId={} attempt={} pcallSuccess=true status={} assetId={} heartbeat={}", string.gsub(string.gsub(EnumNameFunction(Capture.LocalId) or "nil", "\r", "\\r"), "\n", "\\n"), tostring(i), string.gsub(string.gsub(EnumNameFunction(Result5) or "nil", "\r", "\\r"), "\n", "\\n"), string.gsub(string.gsub(EnumNameFunction(Result3_1) or "nil", "\r", "\\r"), "\n", "\\n"), (tostring(IsIMatch and not NoFlag)))
						else
							LoggerModule:debug("event=poll localId={} attempt={} pcallSuccess=false status=pcall_error errorClass={}", string.gsub(string.gsub(EnumNameFunction(Capture.LocalId) or "nil", "\r", "\\r"), "\n", "\\n"), tostring(i), (typeof(Result5)))
						end
					end
					if not Success4 then
						UploadStore.setFailed("PollError")
						ToastStore.triggerToast({
							title = Localizations.failedTitle,
							text = Localizations.failedBody
						})
						local config = {
							status = "PollError",
							error = tostring(Result5),
							captureType = EnumNameFunction(Capture.CaptureType)
						}
						MomentsCommonModule.Analytics.reportMomentsCreationStep("upload", "failed", if FFlagMomentsUploadOutcomeTelemetry then "PollError" else nil)
						config.localId = tostring(Capture.LocalId)
						config.creationSessionId = CreationSessionId
						FireAnalyticsEventModule(EventNames.UploadCaptureFailed, config)
						
						return
					end
					if Result5 == Enum.UploadCaptureResult.Success then
						CompleteMomentUploadModule(Result3_1, {
							uploadStore = UploadStore,
							toastStore = ToastStore,
							feedStore = FeedStore,
							myCreationsStore = MyCreationsStore,
							localizations = Localizations,
							onPostedToFeed = function()
								-- upvalues: FireAnalyticsEventModule (upval), EventNames (upval), Result3_1 (copy), Capture (upval), EnumNameFunction (upval), CreationSessionId (upval)
								FireAnalyticsEventModule(EventNames.EditingFlowMomentPostedToFeed, {
									assetId = tostring(Result3_1),
									localId = tostring(Capture.LocalId),
									captureType = EnumNameFunction(Capture.CaptureType),
									creationSessionId = CreationSessionId
								})
							end
						})
						
						return
					end
					if Result5 == Enum.UploadCaptureResult.UploadPending then
						continue
					elseif Result5 == Enum.UploadCaptureResult.CaptureModerated then
						UploadStore.setFailed("Moderated")
						ToastStore.triggerToast({
							title = Localizations.removedTitle,
							text = Localizations.removedBody
						})
						local config = {
							status = EnumNameFunction(Result5),
							captureType = EnumNameFunction(Capture.CaptureType)
						}
						local EnumNameResult = EnumNameFunction(Result5)
						MomentsCommonModule.Analytics.reportMomentsCreationStep("upload", "failed", if FFlagMomentsUploadOutcomeTelemetry then EnumNameResult else nil)
						config.localId = tostring(Capture.LocalId)
						config.creationSessionId = CreationSessionId
						FireAnalyticsEventModule(EventNames.UploadCaptureFailed, config)
						
						return
					else
						UploadStore.setFailed((tostring(Result5)))
						ToastStore.triggerToast({
							title = Localizations.failedTitle,
							text = Localizations.failedBody
						})
						local config = {
							status = EnumNameFunction(Result5),
							captureType = EnumNameFunction(Capture.CaptureType)
						}
						local EnumNameResult = EnumNameFunction(Result5)
						MomentsCommonModule.Analytics.reportMomentsCreationStep("upload", "failed", if FFlagMomentsUploadOutcomeTelemetry then EnumNameResult else nil)
						config.localId = tostring(Capture.LocalId)
						config.creationSessionId = CreationSessionId
						FireAnalyticsEventModule(EventNames.UploadCaptureFailed, config)
						
						return
					end
				end
				LoggerModule:debug("event=poll_timeout localId={} attempts={}", string.gsub(string.gsub(EnumNameFunction(Capture.LocalId) or "nil", "\r", "\\r"), "\n", "\\n"), (tostring(MomentsUploadMaxPollAttemptsFastInt)))
				UploadStore.setFailed("Timeout")
				ToastStore.triggerToast({
					title = Localizations.failedTitle,
					text = Localizations.failedBody
				})
				local config = {
					status = "Timeout",
					captureType = EnumNameFunction(Capture.CaptureType)
				}
				MomentsCommonModule.Analytics.reportMomentsCreationStep("upload", "failed", if FFlagMomentsUploadOutcomeTelemetry then "Timeout" else nil)
				config.localId = tostring(Capture.LocalId)
				config.creationSessionId = CreationSessionId
				FireAnalyticsEventModule(EventNames.UploadCaptureFailed, config)
				
				return
			else
				if Result2 == Enum.UploadCaptureResult.CaptureModerated then
					ToastStore.triggerToast({
						title = Localizations.removedTitle,
						text = Localizations.removedBody
					})
				elseif Result2 == Enum.UploadCaptureResult.UploadQuotaReached then
					ToastStore.triggerToast({
						title = Localizations.failedTitle,
						text = Localizations.uploadQuotaReachedBody
					})
				else
					ToastStore.triggerToast({
						title = Localizations.failedTitle,
						text = Localizations.failedBody
					})
				end
				UploadStore.setFailed((tostring(Result2)))
				local config = {
					status = EnumNameFunction(Result2),
					captureType = EnumNameFunction(Capture.CaptureType)
				}
				local EnumNameResult = EnumNameFunction(Result2)
				MomentsCommonModule.Analytics.reportMomentsCreationStep("upload", "failed", if FFlagMomentsUploadOutcomeTelemetry then EnumNameResult else nil)
				config.localId = tostring(Capture.LocalId)
				config.creationSessionId = CreationSessionId
				FireAnalyticsEventModule(EventNames.UploadCaptureFailed, config)
				
				return
			end
		else
			LoggerModule:debug("event=path_selected path=fallback localId={}", (string.gsub(string.gsub(EnumNameFunction(Capture.LocalId) or "nil", "\r", "\\r"), "\n", "\\n")))
			local Success1, Result1 = pcall(function()
				-- upvalues: P9 (upval), Capture (upval), NormalizeMomentMetadataModuleResult (upval), FeedRegistrationInfo (upval)
				P9:UploadCaptureAndPostMoment(Capture, NormalizeMomentMetadataModuleResult, FeedRegistrationInfo)
			end)
			
			if Success1 then
				local CaptureDescriptorFields = MakeCreationEventFieldsModule.makeCaptureDescriptorFields(Capture)
				CaptureDescriptorFields.creationSessionId = CreationSessionId
				FireAnalyticsEventModule(EventNames.EditingFlowMomentPublished, CaptureDescriptorFields)
			end
			if not Success1 then
				UploadStore.setFailed("GenericFailure")
				ToastStore.triggerToast({
					title = Localizations.failedTitle,
					text = Localizations.failedBody
				})
				local config = {
					error = tostring(Result1),
					captureType = EnumNameFunction(Capture.CaptureType),
					status = "GenericFailure"
				}
				MomentsCommonModule.Analytics.reportMomentsCreationStep("upload", "failed", if FFlagMomentsUploadOutcomeTelemetry then "GenericFailure" else nil)
				config.localId = tostring(Capture.LocalId)
				config.creationSessionId = CreationSessionId
				FireAnalyticsEventModule(EventNames.UploadCaptureFailed, config)
				
				return
			elseif FFlagMomentsUploadOutcomeTelemetry then
				MomentsCommonModule.Analytics.reportMomentsCreationStep("upload", "success")
			end
		end
	end)
end