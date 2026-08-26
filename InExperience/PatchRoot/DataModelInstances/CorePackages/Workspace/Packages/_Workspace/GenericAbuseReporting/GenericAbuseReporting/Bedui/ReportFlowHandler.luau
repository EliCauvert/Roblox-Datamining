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

return reactModule.memo(function(p1)
	-- upvalues: useTokens (ref), reactModule (ref), useBeduiDataModule (ref), useFormDataModule (ref), useRoactService (ref), roactNetworking (ref), useAnalyticsContextModule (ref), useLayerCollector (ref), abuseReportBeduiContextStatus (ref), validateBeduiDataModule (ref), sendAnalyticsEvent (ref), telemetryEventType (ref), innerContentConfigType (ref), cryoModule (ref), playersService (ref), abuseVectorModule (ref), getReportBodyModule (ref), submitReportV1Module (ref), dashModule (ref), fFlagGenericAbuseReportingUnifyReportTagsModule (ref), fFlagAddThumbnailSelectorReport (ref), getReportTagsModule (ref), submitReportModule (ref), createReportModule (ref), valueToAbuseCategoryModule (ref), abuseCategoryModule (ref), singleStepContainerModule (ref), singleStepInnerContentRendererModule (ref), argCheckModule (ref), buttonVariant (ref), fillBehavior (ref), skeleton (ref), radius (ref), empty (ref), stepperModule (ref)
	local var1 = useTokens()
	local var2, var3 = reactModule.useState({})
	local var4 = useBeduiDataModule()
	local formData = useFormDataModule().formData
	local additionalReportTags = useFormDataModule().additionalReportTags
	local var5 = useRoactService(roactNetworking)
	local var6 = useAnalyticsContextModule()
	local isReportSubmitted = var6.isReportSubmitted
	local setIsReportSubmitted = var6.setIsReportSubmitted
	local var7 = useLayerCollector().absoluteSize.X < 540
	local var8 = reactModule.useMemo(function()
		-- upvalues: var4 (ref), abuseReportBeduiContextStatus (copy)
		return if var4 ~= nil then var4.status == abuseReportBeduiContextStatus.Loading else true
	end, { var4 })
	local var9 = reactModule.useMemo(function()
		-- upvalues: var8 (ref), var4 (ref), validateBeduiDataModule (copy), sendAnalyticsEvent (copy), telemetryEventType (copy), var6 (ref), abuseReportBeduiContextStatus (copy)
		if var8 or var4 == nil then
			return true
		end
		local var10, var11 = validateBeduiDataModule(var4.beduiData)
		
		if var10 then
			return var4.status == abuseReportBeduiContextStatus.Error
		end
		sendAnalyticsEvent({
			eventType = telemetryEventType.Error,
			context = var6,
			meta = {
				error = `ReportFlowHandler - Invalid Bedui data: {tostring(var11)}`
			}
		})
		
		return true
	end, {
		var4,
		var8,
		validateBeduiDataModule,
		sendAnalyticsEvent,
		var6
	})
	local var10 = reactModule.useCallback(function(p2)
		-- upvalues: innerContentConfigType (copy), formData (ref), var3 (ref), cryoModule (copy), var2 (ref)
		if p2 == nil then
			return true
		end
		local var11 = false
		
		if p2.type == innerContentConfigType.ConfigurableComponentList then
			for i, v in p2.configurableComponentList.components do
				if not v.isOptional and formData[v.formDataKey] == nil then
					var11 = true
					var3(cryoModule.List.join(var2, { v.formDataKey }))
				end
			end
		end
		return not var11
	end, { formData, var2 })
	local var12 = reactModule.useCallback(function()
		-- upvalues: playersService (copy), sendAnalyticsEvent (copy), telemetryEventType (copy), var6 (ref), p1 (ref), abuseVectorModule (copy), getReportBodyModule (copy), formData (ref), additionalReportTags (ref), submitReportV1Module (copy), var5 (ref), dashModule (copy), fFlagGenericAbuseReportingUnifyReportTagsModule (copy), fFlagAddThumbnailSelectorReport (copy), getReportTagsModule (copy), submitReportModule (copy), createReportModule (copy), valueToAbuseCategoryModule (copy), abuseCategoryModule (copy)
		local localPlayer = playersService.LocalPlayer
		
		if localPlayer == nil then
			sendAnalyticsEvent({
				eventType = telemetryEventType.Error,
				context = var6,
				meta = { error = "ReportFlowHandler - LocalPlayer is nil" }
			})
			
			return
		elseif p1.abuseVector == abuseVectorModule.AdV2 then
			submitReportV1Module(var5, getReportBodyModule({
				abuseVector = p1.abuseVector,
				formData = formData,
				localPlayerUserId = localPlayer.UserId,
				targetIdStr = p1.targetId,
				additionalReportTags = additionalReportTags
			})):andThen(function(_)
				-- upvalues: sendAnalyticsEvent (copy), telemetryEventType (copy), var6 (copy), p1 (copy)
				sendAnalyticsEvent({
					eventType = telemetryEventType.Submitted,
					context = var6
				})
				
				if p1.onSubmit then
					p1.onSubmit()
				end
			end):catch(function(p3)
				-- upvalues: dashModule (copy), sendAnalyticsEvent (copy), telemetryEventType (copy), var6 (copy)
				sendAnalyticsEvent({
					eventType = telemetryEventType.Error,
					context = var6,
					meta = {
						error = `ReportFlowHandler - Submitting v1 report: {dashModule.pretty(p3, { depth = 10 })}`
					}
				})
			end)
			
			return
		elseif fFlagGenericAbuseReportingUnifyReportTagsModule or fFlagAddThumbnailSelectorReport then
			submitReportModule(var5, getReportTagsModule({
				formData = formData,
				localPlayerUserId = tostring(localPlayer.UserId),
				abuseVector = p1.abuseVector,
				targetId = p1.targetId,
				custom = p1.custom,
				additionalReportTags = additionalReportTags
			})):andThen(function(_)
				-- upvalues: sendAnalyticsEvent (copy), telemetryEventType (copy), var6 (copy), p1 (copy)
				sendAnalyticsEvent({
					eventType = telemetryEventType.Submitted,
					context = var6
				})
				
				if p1.onSubmit then
					p1.onSubmit()
				end
			end):catch(function(p3)
				-- upvalues: dashModule (copy), sendAnalyticsEvent (copy), telemetryEventType (copy), var6 (copy)
				sendAnalyticsEvent({
					eventType = telemetryEventType.Error,
					context = var6,
					meta = {
						error = `ReportFlowHandler - Submitting report: {dashModule.pretty(p3, { depth = 10 })}`
					}
				})
			end)
			
			return
		end
		submitReportModule(var5, createReportModule({
			abuseCategory = valueToAbuseCategoryModule[formData.legacy_abuse_category] or (formData.abuse_category or abuseCategoryModule.ABUSE_CATEGORY_INVALID),
			abuseVector = p1.abuseVector,
			comment = formData.free_comment,
			submitterId = tostring(localPlayer.UserId),
			targetId = p1.targetId,
			custom = p1.custom
		})):andThen(function(_)
			-- upvalues: sendAnalyticsEvent (copy), telemetryEventType (copy), var6 (copy)
			sendAnalyticsEvent({
				eventType = telemetryEventType.Submitted,
				context = var6
			})
		end):catch(function(p3)
			-- upvalues: dashModule (copy), sendAnalyticsEvent (copy), telemetryEventType (copy), var6 (copy)
			sendAnalyticsEvent({
				eventType = telemetryEventType.Error,
				context = var6,
				meta = {
					error = `ReportFlowHandler - Submitting report: {dashModule.pretty(p3, { depth = 10 })}`
				}
			})
		end)
	end, {
		formData, playersService.LocalPlayer, p1.abuseVector, p1.targetId,
		sendAnalyticsEvent, var6
	})
	local var13 = reactModule.useMemo(function()
		-- upvalues: var8 (ref), var9 (ref), var4 (ref), sendAnalyticsEvent (copy), telemetryEventType (copy), var6 (ref), dashModule (copy), var7 (ref), cryoModule (copy), reactModule (copy), singleStepContainerModule (copy), var2 (ref), singleStepInnerContentRendererModule (copy), argCheckModule (copy), isReportSubmitted (ref), var12 (ref), setIsReportSubmitted (ref), var10 (ref), buttonVariant (copy), fillBehavior (copy)
		if var8 then
			return {}
		elseif var9 or not var4.beduiData or not var4.beduiData.nodes then
			sendAnalyticsEvent({
				eventType = telemetryEventType.Error,
				context = var6,
				meta = {
					error = "ReportFlowHandler - Invalid Bedui data or no nodes found"
				}
			})
			
			return {}
		end
		local t = {}
		
		for i, v in var4.beduiData.nodes do
			local var14 = dashModule.joinDeep({}, v)
			local innerContentConfig = var14.innerContentConfig
			local footerContentConfig = var7 and v.footerContentConfig
			
			if footerContentConfig then
				innerContentConfig = {
					type = innerContentConfig.type,
					configurableComponentList = {
						components = cryoModule.List.join(innerContentConfig.configurableComponentList.components, var14.footerContentConfig.configurableComponentList.components)
					}
				}
			end
			if t[var14.stepId] == nil then
				t[var14.stepId] = {
					onStepCancel = nil,
					stepId = var14.stepId,
					predefinedNextStepId = var14.actionInfo.predefinedNextStepId,
					content = reactModule.createElement(singleStepContainerModule, {
						node = var14,
						contentConfig = innerContentConfig,
						formDataKeysWithError = var2
					}),
					footer = if var14.footerContentConfig and not footerContentConfig then reactModule.createElement(singleStepInnerContentRendererModule, {
						contentConfig = var14.footerContentConfig,
						formDataKeysWithError = var2
					}) else nil,
					labels = { continueButton = var14.actionInfo.actionLabel },
					onStepContinue = function()
						-- upvalues: argCheckModule (copy), isReportSubmitted (copy), sendAnalyticsEvent (copy), telemetryEventType (copy), var6 (copy), var14 (ref), var12 (copy), setIsReportSubmitted (copy)
						argCheckModule.assert(isReportSubmitted == false, "Report should only be able to be submitted once")
						
						if isReportSubmitted then
							sendAnalyticsEvent({
								eventType = telemetryEventType.Error,
								context = var6,
								meta = {
									error = `ReportFlowHandler - Report already submitted for stepId: {tostring(var14.stepId)}`
								}
							})
						end
						if var14.actionInfo.shouldSubmit and not isReportSubmitted then
							var12()
							setIsReportSubmitted(true)
						end
					end,
					validateState = function()
						-- upvalues: var10 (copy), innerContentConfig (write)
						return var10(innerContentConfig)
					end,
					stepStyle = {
						buttonXAlignment = "align-x-right",
						continueButton = {
							variant = if var14.actionInfo.shouldSubmit then buttonVariant.Emphasis else buttonVariant.Standard,
							fillBehavior = if var7 then fillBehavior.Fill else fillBehavior.Fit
						}
					}
				}
			end
			sendAnalyticsEvent({
				eventType = telemetryEventType.Error,
				context = var6,
				meta = {
					error = `ReportFlowHandler - Duplicate stepId found: {tostring(var14.stepId)}`
				}
			})
			
			return {}
		end
		return t
	end, {
		var8, var9, var4, var2, var7, var12, var10, isReportSubmitted,
		sendAnalyticsEvent, var6
	})
	
	return if var8 then reactModule.createElement(skeleton, {
		radius = radius.Medium,
		Size = UDim2.new(1, 0, 0, var1.Size.Size_2500)
	}) elseif var9 or not next(var13) then reactModule.createElement(empty, {}) elseif next(var13) and var4.beduiData then reactModule.createElement(stepperModule, { currentStep = var4.beduiData.rootStepId, steps = var13 }) else nil
end)