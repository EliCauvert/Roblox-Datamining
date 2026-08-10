local genericAbuseReporting = script:FindFirstAncestor("GenericAbuseReporting")
local parent = genericAbuseReporting.Parent
local playersService = game:GetService("Players")
local argCheckModule = require(parent.ArgCheck)
local cryoModule = require(parent.Cryo)
local dashModule = require(parent.Dash)
local reactModule = require(parent.React)
local roactNetworking = require(parent.RoactServiceTags).RoactNetworking
local foundationModule = require(parent.Foundation)
local buttonVariant = foundationModule.Enums.ButtonVariant
local empty = foundationModule.Empty
local fillBehavior = foundationModule.Enums.FillBehavior
local radius = foundationModule.Enums.Radius
local skeleton = foundationModule.Skeleton
local useLayerCollector = require(parent.UIBlox).Core.Layout.LayerCollector.useLayerCollector
local useRoactService = require(parent.RobloxAppHooks).useRoactService
local useTokens = foundationModule.Hooks.useTokens
local abuseReportBeduiTypesModule = require(genericAbuseReporting.Bedui.Provider.AbuseReportBeduiTypes)
local abuseReportBeduiContextStatus = abuseReportBeduiTypesModule.AbuseReportBeduiContextStatus
local abuseCategoryModule = require(genericAbuseReporting.Enums.AbuseCategory)
local abuseVectorModule = require(genericAbuseReporting.Enums.AbuseVector)
local beduiAnalyticsModule = require(genericAbuseReporting.Bedui.Utils.BeduiAnalytics)
local createReportModule = require(genericAbuseReporting.Bedui.Utils.createReport)
local getReportBodyModule = require(genericAbuseReporting.Bedui.Utils.getReportBody)
local getReportTagsModule = require(genericAbuseReporting.Bedui.Utils.getReportTags)
local innerContentConfigType = abuseReportBeduiTypesModule.InnerContentConfigType
local sendAnalyticsEvent = beduiAnalyticsModule.sendAnalyticsEvent
local singleStepContainerModule = require(genericAbuseReporting.Bedui.SingleStepContainer)
local singleStepInnerContentRendererModule = require(genericAbuseReporting.Bedui.SingleStepInnerContentRenderer)
local stepperModule = require(genericAbuseReporting.Common.Stepper)
local telemetryEventType = beduiAnalyticsModule.TelemetryEventType
local submitReportModule = require(genericAbuseReporting.Bedui.Utils.submitReport)
local submitReportV1Module = require(genericAbuseReporting.Bedui.Utils.submitReportV1)
local useAnalyticsContextModule = require(genericAbuseReporting.Bedui.Provider.useAnalyticsContext)
local useBeduiDataModule = require(genericAbuseReporting.Bedui.Provider.useBeduiData)
local useFormDataModule = require(genericAbuseReporting.Bedui.Provider.useFormData)
local validateBeduiDataModule = require(genericAbuseReporting.Bedui.Provider.validateBeduiData)
local valueToAbuseCategoryModule = require(genericAbuseReporting.Enums.ValueToAbuseCategory)
local fFlagAddThumbnailSelectorReport = require(parent.SharedFlags).FFlagAddThumbnailSelectorReport
local fFlagGenericAbuseReportingUnifyReportTagsModule = require(genericAbuseReporting.Flags.FFlagGenericAbuseReportingUnifyReportTags)

return reactModule.memo(function(p0) --[[ line: 62 | named "ReportFlowHandler" ]]
	-- upvalues: useTokens (ref), reactModule (ref), useBeduiDataModule (ref), useFormDataModule (ref), useRoactService (ref), roactNetworking (ref), useAnalyticsContextModule (ref), useLayerCollector (ref), abuseReportBeduiContextStatus (ref), validateBeduiDataModule (ref), sendAnalyticsEvent (ref), telemetryEventType (ref), innerContentConfigType (ref), cryoModule (ref), playersService (ref), abuseVectorModule (ref), getReportBodyModule (ref), submitReportV1Module (ref), dashModule (ref), fFlagGenericAbuseReportingUnifyReportTagsModule (ref), fFlagAddThumbnailSelectorReport (ref), getReportTagsModule (ref), submitReportModule (ref), createReportModule (ref), valueToAbuseCategoryModule (ref), abuseCategoryModule (ref), singleStepContainerModule (ref), singleStepInnerContentRendererModule (ref), argCheckModule (ref), buttonVariant (ref), fillBehavior (ref), skeleton (ref), radius (ref), empty (ref), stepperModule (ref)
	local var25 = useTokens()
	local var26, var27 = reactModule.useState({})
	local var28 = useBeduiDataModule()
	local formData = useFormDataModule().formData
	local additionalReportTags = useFormDataModule().additionalReportTags
	local var29 = useRoactService(roactNetworking)
	local var30 = useAnalyticsContextModule()
	local isReportSubmitted = var30.isReportSubmitted
	local setIsReportSubmitted = var30.setIsReportSubmitted
	local var31 = useLayerCollector().absoluteSize.X < 540
	local var32 = reactModule.useMemo(function() --[[ line: 78 ]]
		-- upvalues: var28 (ref), abuseReportBeduiContextStatus (copy)
		return if var28 ~= nil then var28.status == abuseReportBeduiContextStatus.Loading else true
	end, { var28 })
	local var33 = reactModule.useMemo(function() --[[ line: 82 ]]
		-- upvalues: var32 (ref), var28 (ref), validateBeduiDataModule (copy), sendAnalyticsEvent (copy), telemetryEventType (copy), var30 (ref), abuseReportBeduiContextStatus (copy)
		if var32 or var28 == nil then
			return true
		end
		local var37, var38 = validateBeduiDataModule(var28.beduiData)
		
		if var37 then
			return var28.status == abuseReportBeduiContextStatus.Error
		end
		sendAnalyticsEvent({
			eventType = telemetryEventType.Error,
			context = var30,
			meta = {
				error = `ReportFlowHandler - Invalid Bedui data: {tostring(var38)}`
			}
		})
		
		return true
	end, {
		var28,
		var32,
		validateBeduiDataModule,
		sendAnalyticsEvent,
		var30
	})
	local var34 = reactModule.useCallback(function(p1) --[[ line: 101 ]]
		-- upvalues: innerContentConfigType (copy), formData (ref), var27 (ref), cryoModule (copy), var26 (ref)
		if p1 == nil then
			return true
		end
		local var39 = false
		
		if p1.type == innerContentConfigType.ConfigurableComponentList then
			for i, v in p1.configurableComponentList.components do
				if not v.isOptional and formData[v.formDataKey] == nil then
					var39 = true
					var27(cryoModule.List.join(var26, { v.formDataKey }))
				end
			end
		end
		return not var39
	end, { formData, var26 })
	local var35 = reactModule.useCallback(function() --[[ line: 120 ]]
		-- upvalues: playersService (copy), sendAnalyticsEvent (copy), telemetryEventType (copy), var30 (ref), p0 (ref), abuseVectorModule (copy), getReportBodyModule (copy), formData (ref), additionalReportTags (ref), submitReportV1Module (copy), var29 (ref), dashModule (copy), fFlagGenericAbuseReportingUnifyReportTagsModule (copy), fFlagAddThumbnailSelectorReport (copy), getReportTagsModule (copy), submitReportModule (copy), createReportModule (copy), valueToAbuseCategoryModule (copy), abuseCategoryModule (copy)
		local localPlayer = playersService.LocalPlayer
		
		if localPlayer == nil then
			sendAnalyticsEvent({
				eventType = telemetryEventType.Error,
				context = var30,
				meta = { error = "ReportFlowHandler - LocalPlayer is nil" }
			})
			
			return
		elseif p0.abuseVector == abuseVectorModule.AdV2 then
			submitReportV1Module(var29, getReportBodyModule({
				abuseVector = p0.abuseVector,
				formData = formData,
				localPlayerUserId = localPlayer.UserId,
				targetIdStr = p0.targetId,
				additionalReportTags = additionalReportTags
			})):andThen(function(_) --[[ line: 142 ]]
				-- upvalues: sendAnalyticsEvent (copy), telemetryEventType (copy), var30 (copy), p0 (copy)
				sendAnalyticsEvent({
					eventType = telemetryEventType.Submitted,
					context = var30
				})
				
				if p0.onSubmit then
					p0.onSubmit()
				end
			end):catch(function(p2) --[[ line: 151 ]]
				-- upvalues: dashModule (copy), sendAnalyticsEvent (copy), telemetryEventType (copy), var30 (copy)
				sendAnalyticsEvent({
					eventType = telemetryEventType.Error,
					context = var30,
					meta = {
						error = `ReportFlowHandler - Submitting v1 report: {dashModule.pretty(p2, { depth = 10 })}`
					}
				})
			end)
			
			return
		elseif fFlagGenericAbuseReportingUnifyReportTagsModule or fFlagAddThumbnailSelectorReport then
			submitReportModule(var29, getReportTagsModule({
				formData = formData,
				localPlayerUserId = tostring(localPlayer.UserId),
				abuseVector = p0.abuseVector,
				targetId = p0.targetId,
				custom = p0.custom,
				additionalReportTags = additionalReportTags
			})):andThen(function(_) --[[ line: 172 ]]
				-- upvalues: sendAnalyticsEvent (copy), telemetryEventType (copy), var30 (copy), p0 (copy)
				sendAnalyticsEvent({
					eventType = telemetryEventType.Submitted,
					context = var30
				})
				
				if p0.onSubmit then
					p0.onSubmit()
				end
			end):catch(function(p3) --[[ line: 181 ]]
				-- upvalues: dashModule (copy), sendAnalyticsEvent (copy), telemetryEventType (copy), var30 (copy)
				sendAnalyticsEvent({
					eventType = telemetryEventType.Error,
					context = var30,
					meta = {
						error = `ReportFlowHandler - Submitting report: {dashModule.pretty(p3, { depth = 10 })}`
					}
				})
			end)
			
			return
		end
		submitReportModule(var29, createReportModule({
			abuseCategory = valueToAbuseCategoryModule[formData.legacy_abuse_category] or (formData.abuse_category or abuseCategoryModule.ABUSE_CATEGORY_INVALID),
			abuseVector = p0.abuseVector,
			comment = formData.free_comment,
			submitterId = tostring(localPlayer.UserId),
			targetId = p0.targetId,
			custom = p0.custom
		})):andThen(function(_) --[[ line: 203 ]]
			-- upvalues: sendAnalyticsEvent (copy), telemetryEventType (copy), var30 (copy)
			sendAnalyticsEvent({
				eventType = telemetryEventType.Submitted,
				context = var30
			})
		end):catch(function(p4) --[[ line: 209 ]]
			-- upvalues: dashModule (copy), sendAnalyticsEvent (copy), telemetryEventType (copy), var30 (copy)
			sendAnalyticsEvent({
				eventType = telemetryEventType.Error,
				context = var30,
				meta = {
					error = `ReportFlowHandler - Submitting report: {dashModule.pretty(p4, { depth = 10 })}`
				}
			})
		end)
	end, {
		formData, playersService.LocalPlayer, p0.abuseVector, p0.targetId,
		sendAnalyticsEvent, var30
	})
	local var36 = reactModule.useMemo(function() --[[ line: 232 ]]
		-- upvalues: var32 (ref), var33 (ref), var28 (ref), sendAnalyticsEvent (copy), telemetryEventType (copy), var30 (ref), dashModule (copy), var31 (ref), cryoModule (copy), reactModule (copy), singleStepContainerModule (copy), var26 (ref), singleStepInnerContentRendererModule (copy), argCheckModule (copy), isReportSubmitted (ref), var35 (ref), setIsReportSubmitted (ref), var34 (ref), buttonVariant (copy), fillBehavior (copy)
		if var32 then
			return {}
		elseif var33 or not var28.beduiData or not var28.beduiData.nodes then
			sendAnalyticsEvent({
				eventType = telemetryEventType.Error,
				context = var30,
				meta = {
					error = "ReportFlowHandler - Invalid Bedui data or no nodes found"
				}
			})
			
			return {}
		end
		local t = {}
		
		for i, v in var28.beduiData.nodes do
			local var41 = dashModule.joinDeep({}, v)
			local innerContentConfig = var41.innerContentConfig
			local footerContentConfig = var31 and v.footerContentConfig
			
			if footerContentConfig then
				innerContentConfig = {
					type = innerContentConfig.type,
					configurableComponentList = {
						components = cryoModule.List.join(innerContentConfig.configurableComponentList.components, var41.footerContentConfig.configurableComponentList.components)
					}
				}
			end
			if t[var41.stepId] == nil then
				t[var41.stepId] = {
					onStepCancel = nil,
					stepId = var41.stepId,
					predefinedNextStepId = var41.actionInfo.predefinedNextStepId,
					content = reactModule.createElement(singleStepContainerModule, {
						node = var41,
						contentConfig = innerContentConfig,
						formDataKeysWithError = var26
					}),
					footer = if var41.footerContentConfig and not footerContentConfig then reactModule.createElement(singleStepInnerContentRendererModule, {
						contentConfig = var41.footerContentConfig,
						formDataKeysWithError = var26
					}) else nil,
					labels = { continueButton = var41.actionInfo.actionLabel },
					onStepContinue = function() --[[ line: 295 ]]
						-- upvalues: argCheckModule (copy), isReportSubmitted (copy), sendAnalyticsEvent (copy), telemetryEventType (copy), var30 (copy), var41 (ref), var35 (copy), setIsReportSubmitted (copy)
						argCheckModule.assert(isReportSubmitted == false, "Report should only be able to be submitted once")
						
						if isReportSubmitted then
							sendAnalyticsEvent({
								eventType = telemetryEventType.Error,
								context = var30,
								meta = {
									error = `ReportFlowHandler - Report already submitted for stepId: {tostring(var41.stepId)}`
								}
							})
						end
						if var41.actionInfo.shouldSubmit and not isReportSubmitted then
							var35()
							setIsReportSubmitted(true)
						end
					end,
					validateState = function() --[[ line: 313 ]]
						-- upvalues: var34 (copy), innerContentConfig (write)
						return var34(innerContentConfig)
					end,
					stepStyle = {
						buttonXAlignment = "align-x-right",
						continueButton = {
							variant = if var41.actionInfo.shouldSubmit then buttonVariant.Emphasis else buttonVariant.Standard,
							fillBehavior = if var31 then fillBehavior.Fill else fillBehavior.Fit
						}
					}
				}
			end
			sendAnalyticsEvent({
				eventType = telemetryEventType.Error,
				context = var30,
				meta = {
					error = `ReportFlowHandler - Duplicate stepId found: {tostring(var41.stepId)}`
				}
			})
			
			return {}
		end
		return t
	end, {
		var32, var33, var28, var26, var31, var35, var34, isReportSubmitted,
		sendAnalyticsEvent, var30
	})
	
	return if var32 then reactModule.createElement(skeleton, {
		radius = radius.Medium,
		Size = UDim2.new(1, 0, 0, var25.Size.Size_2500)
	}) elseif var33 or not next(var36) then reactModule.createElement(empty, {}) elseif next(var36) and var28.beduiData then reactModule.createElement(stepperModule, { currentStep = var28.beduiData.rootStepId, steps = var36 }) else nil
end)