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
local sharedFlagsModule = require(parent.SharedFlags)
local fixRevampDropdownString = game:DefineFastFlag("FixRevampDropdownString", false)
local fFlagAddThumbnailSelectorReport = sharedFlagsModule.FFlagAddThumbnailSelectorReport
local dynamicReportPrettyErrorMessage = game:DefineFastFlag("DynamicReportPrettyErrorMessage", false)
local fFlagFixNotificationReportsMobile = sharedFlagsModule.FFlagFixNotificationReportsMobile

return reactModule.memo(function(p0) --[[ line: 64 | named "ReportFlowHandler" ]]
	-- upvalues: useTokens (ref), reactModule (ref), useBeduiDataModule (ref), useFormDataModule (ref), useRoactService (ref), roactNetworking (ref), useAnalyticsContextModule (ref), useLayerCollector (ref), abuseReportBeduiContextStatus (ref), validateBeduiDataModule (ref), sendAnalyticsEvent (ref), telemetryEventType (ref), innerContentConfigType (ref), cryoModule (ref), playersService (ref), abuseVectorModule (ref), getReportBodyModule (ref), submitReportV1Module (ref), fFlagFixNotificationReportsMobile (ref), dynamicReportPrettyErrorMessage (ref), dashModule (ref), fFlagAddThumbnailSelectorReport (ref), getReportTagsModule (ref), submitReportModule (ref), createReportModule (ref), fixRevampDropdownString (ref), valueToAbuseCategoryModule (ref), abuseCategoryModule (ref), singleStepContainerModule (ref), singleStepInnerContentRendererModule (ref), argCheckModule (ref), buttonVariant (ref), fillBehavior (ref), skeleton (ref), radius (ref), empty (ref), stepperModule (ref)
	local var27 = useTokens()
	local var28, var29 = reactModule.useState({})
	local var30 = useBeduiDataModule()
	local formData = useFormDataModule().formData
	local additionalReportTags = useFormDataModule().additionalReportTags
	local var31 = useRoactService(roactNetworking)
	local var32 = useAnalyticsContextModule()
	local isReportSubmitted = var32.isReportSubmitted
	local setIsReportSubmitted = var32.setIsReportSubmitted
	local var33 = useLayerCollector().absoluteSize.X < 540
	local var34 = reactModule.useMemo(function() --[[ line: 80 ]]
		-- upvalues: var30 (ref), abuseReportBeduiContextStatus (copy)
		return if var30 ~= nil then var30.status == abuseReportBeduiContextStatus.Loading else true
	end, { var30 })
	local var35 = reactModule.useMemo(function() --[[ line: 84 ]]
		-- upvalues: var34 (ref), var30 (ref), validateBeduiDataModule (copy), sendAnalyticsEvent (copy), telemetryEventType (copy), var32 (ref), abuseReportBeduiContextStatus (copy)
		if var34 or var30 == nil then
			return true
		end
		local var39, var40 = validateBeduiDataModule(var30.beduiData)
		
		if var39 then
			return var30.status == abuseReportBeduiContextStatus.Error
		end
		sendAnalyticsEvent({
			eventType = telemetryEventType.Error,
			context = var32,
			meta = {
				error = `ReportFlowHandler - Invalid Bedui data: {tostring(var40)}`
			}
		})
		
		return true
	end, {
		var30,
		var34,
		validateBeduiDataModule,
		sendAnalyticsEvent,
		var32
	})
	local var36 = reactModule.useCallback(function(p1) --[[ line: 103 ]]
		-- upvalues: innerContentConfigType (copy), formData (ref), var29 (ref), cryoModule (copy), var28 (ref)
		if p1 == nil then
			return true
		end
		local var41 = false
		
		if p1.type == innerContentConfigType.ConfigurableComponentList then
			for i, v in p1.configurableComponentList.components do
				if not v.isOptional and formData[v.formDataKey] == nil then
					var41 = true
					var29(cryoModule.List.join(var28, { v.formDataKey }))
				end
			end
		end
		return not var41
	end, { formData, var28 })
	local var37 = reactModule.useCallback(function() --[[ line: 122 ]]
		-- upvalues: playersService (copy), sendAnalyticsEvent (copy), telemetryEventType (copy), var32 (ref), p0 (ref), abuseVectorModule (copy), getReportBodyModule (copy), formData (ref), additionalReportTags (ref), submitReportV1Module (copy), var31 (ref), fFlagFixNotificationReportsMobile (copy), dynamicReportPrettyErrorMessage (copy), dashModule (copy), fFlagAddThumbnailSelectorReport (copy), getReportTagsModule (copy), submitReportModule (copy), createReportModule (copy), fixRevampDropdownString (copy), valueToAbuseCategoryModule (copy), abuseCategoryModule (copy)
		local localPlayer = playersService.LocalPlayer
		
		if localPlayer == nil then
			sendAnalyticsEvent({
				eventType = telemetryEventType.Error,
				context = var32,
				meta = { error = "ReportFlowHandler - LocalPlayer is nil" }
			})
			
			return
		elseif p0.abuseVector == abuseVectorModule.AdV2 then
			submitReportV1Module(var31, getReportBodyModule({
				abuseVector = p0.abuseVector,
				formData = formData,
				localPlayerUserId = localPlayer.UserId,
				targetIdStr = p0.targetId,
				additionalReportTags = additionalReportTags
			})):andThen(function(_) --[[ line: 144 ]]
				-- upvalues: sendAnalyticsEvent (copy), telemetryEventType (copy), var32 (copy), fFlagFixNotificationReportsMobile (copy), p0 (copy)
				sendAnalyticsEvent({
					eventType = telemetryEventType.Submitted,
					context = var32
				})
				
				if fFlagFixNotificationReportsMobile and p0.onSubmit then
					p0.onSubmit()
				end
			end):catch(function(p2) --[[ line: 153 ]]
				-- upvalues: dynamicReportPrettyErrorMessage (copy), dashModule (copy), sendAnalyticsEvent (copy), telemetryEventType (copy), var32 (copy)
				if dynamicReportPrettyErrorMessage then
					sendAnalyticsEvent({
						eventType = telemetryEventType.Error,
						context = var32,
						meta = {
							error = `ReportFlowHandler - Submitting v1 report: {dashModule.pretty(p2, { depth = 10 })}`
						}
					})
					
					return
				end
				sendAnalyticsEvent({
					eventType = telemetryEventType.Error,
					context = var32,
					meta = {
						error = `ReportFlowHandler - Submitting v1 report: {tostring(p2)}`
					}
				})
			end)
			
			return
		elseif fFlagAddThumbnailSelectorReport then
			submitReportModule(var31, getReportTagsModule({
				formData = formData,
				localPlayerUserId = tostring(localPlayer.UserId),
				abuseVector = p0.abuseVector,
				targetId = p0.targetId,
				custom = p0.custom,
				additionalReportTags = additionalReportTags
			})):andThen(function(_) --[[ line: 184 ]]
				-- upvalues: sendAnalyticsEvent (copy), telemetryEventType (copy), var32 (copy), fFlagFixNotificationReportsMobile (copy), p0 (copy)
				sendAnalyticsEvent({
					eventType = telemetryEventType.Submitted,
					context = var32
				})
				
				if fFlagFixNotificationReportsMobile and p0.onSubmit then
					p0.onSubmit()
				end
			end):catch(function(p3) --[[ line: 193 ]]
				-- upvalues: dynamicReportPrettyErrorMessage (copy), dashModule (copy), sendAnalyticsEvent (copy), telemetryEventType (copy), var32 (copy)
				if dynamicReportPrettyErrorMessage then
					sendAnalyticsEvent({
						eventType = telemetryEventType.Error,
						context = var32,
						meta = {
							error = `ReportFlowHandler - Submitting report: {dashModule.pretty(p3, { depth = 10 })}`
						}
					})
					
					return
				end
				sendAnalyticsEvent({
					eventType = telemetryEventType.Error,
					context = var32,
					meta = {
						error = `ReportFlowHandler - Submitting report: {tostring(p3)}`
					}
				})
			end)
			
			return
		end
		submitReportModule(var31, createReportModule({
			abuseCategory = if fixRevampDropdownString then valueToAbuseCategoryModule[formData.legacy_abuse_category] or (formData.abuse_category or abuseCategoryModule.ABUSE_CATEGORY_INVALID) else valueToAbuseCategoryModule[formData.legacy_abuse_category] or abuseCategoryModule.ABUSE_CATEGORY_INVALID,
			abuseVector = p0.abuseVector,
			comment = formData.free_comment,
			submitterId = tostring(localPlayer.UserId),
			targetId = p0.targetId,
			custom = p0.custom
		})):andThen(function(_) --[[ line: 228 ]]
			-- upvalues: sendAnalyticsEvent (copy), telemetryEventType (copy), var32 (copy)
			sendAnalyticsEvent({
				eventType = telemetryEventType.Submitted,
				context = var32
			})
		end):catch(function(p4) --[[ line: 234 ]]
			-- upvalues: dynamicReportPrettyErrorMessage (copy), dashModule (copy), sendAnalyticsEvent (copy), telemetryEventType (copy), var32 (copy)
			if dynamicReportPrettyErrorMessage then
				sendAnalyticsEvent({
					eventType = telemetryEventType.Error,
					context = var32,
					meta = {
						error = `ReportFlowHandler - Submitting report: {dashModule.pretty(p4, { depth = 10 })}`
					}
				})
				
				return
			end
			sendAnalyticsEvent({
				eventType = telemetryEventType.Error,
				context = var32,
				meta = {
					error = `ReportFlowHandler - Submitting report: {tostring(p4)}`
				}
			})
		end)
	end, {
		formData, playersService.LocalPlayer, p0.abuseVector, p0.targetId,
		sendAnalyticsEvent, var32
	})
	local var38 = reactModule.useMemo(function() --[[ line: 267 ]]
		-- upvalues: var34 (ref), var35 (ref), var30 (ref), sendAnalyticsEvent (copy), telemetryEventType (copy), var32 (ref), dashModule (copy), var33 (ref), cryoModule (copy), reactModule (copy), singleStepContainerModule (copy), var28 (ref), singleStepInnerContentRendererModule (copy), argCheckModule (copy), isReportSubmitted (ref), var37 (ref), setIsReportSubmitted (ref), var36 (ref), buttonVariant (copy), fillBehavior (copy)
		if var34 then
			return {}
		elseif var35 or not var30.beduiData or not var30.beduiData.nodes then
			sendAnalyticsEvent({
				eventType = telemetryEventType.Error,
				context = var32,
				meta = {
					error = "ReportFlowHandler - Invalid Bedui data or no nodes found"
				}
			})
			
			return {}
		end
		local t = {}
		
		for i, v in var30.beduiData.nodes do
			local var43 = dashModule.joinDeep({}, v)
			local innerContentConfig = var43.innerContentConfig
			local footerContentConfig = var33 and v.footerContentConfig
			
			if footerContentConfig then
				innerContentConfig = {
					type = innerContentConfig.type,
					configurableComponentList = {
						components = cryoModule.List.join(innerContentConfig.configurableComponentList.components, var43.footerContentConfig.configurableComponentList.components)
					}
				}
			end
			if t[var43.stepId] == nil then
				t[var43.stepId] = {
					onStepCancel = nil,
					stepId = var43.stepId,
					predefinedNextStepId = var43.actionInfo.predefinedNextStepId,
					content = reactModule.createElement(singleStepContainerModule, {
						node = var43,
						contentConfig = innerContentConfig,
						formDataKeysWithError = var28
					}),
					footer = if var43.footerContentConfig and not footerContentConfig then reactModule.createElement(singleStepInnerContentRendererModule, {
						contentConfig = var43.footerContentConfig,
						formDataKeysWithError = var28
					}) else nil,
					labels = { continueButton = var43.actionInfo.actionLabel },
					onStepContinue = function() --[[ line: 330 ]]
						-- upvalues: argCheckModule (copy), isReportSubmitted (copy), sendAnalyticsEvent (copy), telemetryEventType (copy), var32 (copy), var43 (ref), var37 (copy), setIsReportSubmitted (copy)
						argCheckModule.assert(isReportSubmitted == false, "Report should only be able to be submitted once")
						
						if isReportSubmitted then
							sendAnalyticsEvent({
								eventType = telemetryEventType.Error,
								context = var32,
								meta = {
									error = `ReportFlowHandler - Report already submitted for stepId: {tostring(var43.stepId)}`
								}
							})
						end
						if var43.actionInfo.shouldSubmit and not isReportSubmitted then
							var37()
							setIsReportSubmitted(true)
						end
					end,
					validateState = function() --[[ line: 348 ]]
						-- upvalues: var36 (copy), innerContentConfig (write)
						return var36(innerContentConfig)
					end,
					stepStyle = {
						buttonXAlignment = "align-x-right",
						continueButton = {
							variant = if var43.actionInfo.shouldSubmit then buttonVariant.Emphasis else buttonVariant.Standard,
							fillBehavior = if var33 then fillBehavior.Fill else fillBehavior.Fit
						}
					}
				}
			end
			sendAnalyticsEvent({
				eventType = telemetryEventType.Error,
				context = var32,
				meta = {
					error = `ReportFlowHandler - Duplicate stepId found: {tostring(var43.stepId)}`
				}
			})
			
			return {}
		end
		return t
	end, {
		var34, var35, var30, var28, var33, var37, var36, isReportSubmitted,
		sendAnalyticsEvent, var32
	})
	
	return if var34 then reactModule.createElement(skeleton, {
		radius = radius.Medium,
		Size = UDim2.new(1, 0, 0, var27.Size.Size_2500)
	}) elseif var35 or not next(var38) then reactModule.createElement(empty, {}) elseif next(var38) and var30.beduiData then reactModule.createElement(stepperModule, { currentStep = var30.beduiData.rootStepId, steps = var38 }) else nil
end)