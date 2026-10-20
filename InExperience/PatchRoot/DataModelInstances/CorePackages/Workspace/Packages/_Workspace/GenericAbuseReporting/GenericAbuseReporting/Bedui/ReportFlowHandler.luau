local GenericAbuseReporting = script:FindFirstAncestor("GenericAbuseReporting")
local Parent = GenericAbuseReporting.Parent
local Players = game:GetService("Players")
local ArgCheckModule = require(Parent.ArgCheck)
local CryoModule = require(Parent.Cryo)
local DashModule = require(Parent.Dash)
local ReactModule = require(Parent.React)
local RoactNetworking = require(Parent.RoactServiceTags).RoactNetworking
local FoundationModule = require(Parent.Foundation)
local ButtonVariant = FoundationModule.Enums.ButtonVariant
local Empty = FoundationModule.Empty
local FillBehavior = FoundationModule.Enums.FillBehavior
local Radius = FoundationModule.Enums.Radius
local Skeleton = FoundationModule.Skeleton
local UseLayerCollectorFunction = require(Parent.UIBlox).Core.Layout.LayerCollector.useLayerCollector
local UseRoactServiceFunction = require(Parent.RobloxAppHooks).useRoactService
local UseTokensFunction = FoundationModule.Hooks.useTokens
local AbuseReportBeduiTypesModule = require(GenericAbuseReporting.Bedui.Provider.AbuseReportBeduiTypes)
local AbuseReportBeduiContextStatus = AbuseReportBeduiTypesModule.AbuseReportBeduiContextStatus
local AbuseCategoryModule = require(GenericAbuseReporting.Enums.AbuseCategory)
local AbuseVectorModule = require(GenericAbuseReporting.Enums.AbuseVector)
local BeduiAnalyticsModule = require(GenericAbuseReporting.Bedui.Utils.BeduiAnalytics)
local CreateReportModule = require(GenericAbuseReporting.Bedui.Utils.createReport)
local GetReportBodyModule = require(GenericAbuseReporting.Bedui.Utils.getReportBody)
local GetReportTagsModule = require(GenericAbuseReporting.Bedui.Utils.getReportTags)
local InnerContentConfigType = AbuseReportBeduiTypesModule.InnerContentConfigType
local SendAnalyticsEventFunction = BeduiAnalyticsModule.sendAnalyticsEvent
local SingleStepContainerModule = require(GenericAbuseReporting.Bedui.SingleStepContainer)
local SingleStepInnerContentRendererModule = require(GenericAbuseReporting.Bedui.SingleStepInnerContentRenderer)
local StepperModule = require(GenericAbuseReporting.Common.Stepper)
local TelemetryEventType = BeduiAnalyticsModule.TelemetryEventType
local SubmitReportModule = require(GenericAbuseReporting.Bedui.Utils.submitReport)
local SubmitReportV1Module = require(GenericAbuseReporting.Bedui.Utils.submitReportV1)
local UseAnalyticsContextModule = require(GenericAbuseReporting.Bedui.Provider.useAnalyticsContext)
local UseBeduiDataModule = require(GenericAbuseReporting.Bedui.Provider.useBeduiData)
local UseFormDataModule = require(GenericAbuseReporting.Bedui.Provider.useFormData)
local ValidateBeduiDataModule = require(GenericAbuseReporting.Bedui.Provider.validateBeduiData)
local ValueToAbuseCategoryModule = require(GenericAbuseReporting.Enums.ValueToAbuseCategory)
local FFlagAddThumbnailSelectorReport = require(Parent.SharedFlags).FFlagAddThumbnailSelectorReport
local FFlagGenericAbuseReportingUnifyReportTagsModule = require(GenericAbuseReporting.Flags.FFlagGenericAbuseReportingUnifyReportTags)

return ReactModule.memo(function(p1)
	-- upvalues: UseTokensFunction (copy), ReactModule (copy), UseBeduiDataModule (copy), UseFormDataModule (copy), UseRoactServiceFunction (copy), RoactNetworking (copy), UseAnalyticsContextModule (copy), UseLayerCollectorFunction (copy), AbuseReportBeduiContextStatus (copy), ValidateBeduiDataModule (copy), SendAnalyticsEventFunction (copy), TelemetryEventType (copy), InnerContentConfigType (copy), CryoModule (copy), Players (copy), AbuseVectorModule (copy), GetReportBodyModule (copy), SubmitReportV1Module (copy), DashModule (copy), FFlagGenericAbuseReportingUnifyReportTagsModule (copy), FFlagAddThumbnailSelectorReport (copy), GetReportTagsModule (copy), SubmitReportModule (copy), CreateReportModule (copy), ValueToAbuseCategoryModule (copy), AbuseCategoryModule (copy), SingleStepContainerModule (copy), SingleStepInnerContentRendererModule (copy), ArgCheckModule (copy), ButtonVariant (copy), FillBehavior (copy), Skeleton (copy), Radius (copy), Empty (copy), StepperModule (copy)
	local UseTokensResult = UseTokensFunction()
	local UseStateResult, UseStateResult2 = ReactModule.useState({})
	local UseBeduiDataModuleResult = UseBeduiDataModule()
	local FormData = UseFormDataModule().formData
	local AdditionalReportTags = UseFormDataModule().additionalReportTags
	local UseRoactServiceResult = UseRoactServiceFunction(RoactNetworking)
	local UseAnalyticsContextModuleResult = UseAnalyticsContextModule()
	local IsReportSubmitted = UseAnalyticsContextModuleResult.isReportSubmitted
	local SetIsReportSubmittedFunction = UseAnalyticsContextModuleResult.setIsReportSubmitted
	local IsXBelow = UseLayerCollectorFunction().absoluteSize.X < 540
	local UseMemoResult = ReactModule.useMemo(function(): boolean
		-- upvalues: UseBeduiDataModuleResult (copy), AbuseReportBeduiContextStatus (upval)
		return UseBeduiDataModuleResult == nil or UseBeduiDataModuleResult.status == AbuseReportBeduiContextStatus.Loading
	end, { UseBeduiDataModuleResult })
	local UseMemoResult1 = ReactModule.useMemo(function(): boolean
		-- upvalues: UseMemoResult (copy), UseBeduiDataModuleResult (copy), ValidateBeduiDataModule (upval), SendAnalyticsEventFunction (upval), TelemetryEventType (upval), UseAnalyticsContextModuleResult (copy), AbuseReportBeduiContextStatus (upval)
		if UseMemoResult or UseBeduiDataModuleResult == nil then
			return true
		end
		local ValidateBeduiDataModuleResult, ValidateBeduiDataModuleResult2 = ValidateBeduiDataModule(UseBeduiDataModuleResult.beduiData)
		
		if ValidateBeduiDataModuleResult then
			return UseBeduiDataModuleResult.status == AbuseReportBeduiContextStatus.Error
		else
			SendAnalyticsEventFunction({
				eventType = TelemetryEventType.Error,
				context = UseAnalyticsContextModuleResult,
				meta = {
					error = `ReportFlowHandler - Invalid Bedui data: {tostring(ValidateBeduiDataModuleResult2)}`
				}
			})
			
			return true
		end
	end, {
		UseBeduiDataModuleResult,
		UseMemoResult,
		ValidateBeduiDataModule,
		SendAnalyticsEventFunction,
		UseAnalyticsContextModuleResult
	})
	local UseResult = ReactModule.useCallback(function(p2): boolean
		-- upvalues: InnerContentConfigType (upval), FormData (copy), UseStateResult2 (copy), CryoModule (upval), UseStateResult (copy)
		if p2 == nil then
			return true
		end
		local Flag = false
		
		if p2.type == InnerContentConfigType.ConfigurableComponentList then
			for _, component in p2.configurableComponentList.components do
				if not component.isOptional and FormData[component.formDataKey] == nil then
					Flag = true
					UseStateResult2(CryoModule.List.join(UseStateResult, { component.formDataKey }))
				end
			end
		end
		return not Flag
	end, { FormData, UseStateResult })
	local UseResult1 = ReactModule.useCallback(function()
		-- upvalues: Players (upval), SendAnalyticsEventFunction (upval), TelemetryEventType (upval), UseAnalyticsContextModuleResult (copy), p1 (copy), AbuseVectorModule (upval), GetReportBodyModule (upval), FormData (copy), AdditionalReportTags (copy), SubmitReportV1Module (upval), UseRoactServiceResult (copy), DashModule (upval), FFlagGenericAbuseReportingUnifyReportTagsModule (upval), FFlagAddThumbnailSelectorReport (upval), GetReportTagsModule (upval), SubmitReportModule (upval), CreateReportModule (upval), ValueToAbuseCategoryModule (upval), AbuseCategoryModule (upval)
		local LocalPlayer = Players.LocalPlayer
		
		if LocalPlayer == nil then
			SendAnalyticsEventFunction({
				eventType = TelemetryEventType.Error,
				context = UseAnalyticsContextModuleResult,
				meta = { error = "ReportFlowHandler - LocalPlayer is nil" }
			})
			
			return
		end
		if p1.abuseVector == AbuseVectorModule.AdV2 then
			SubmitReportV1Module(UseRoactServiceResult, (GetReportBodyModule({
				abuseVector = p1.abuseVector,
				formData = FormData,
				localPlayerUserId = LocalPlayer.UserId,
				targetIdStr = p1.targetId,
				additionalReportTags = AdditionalReportTags
			}))):andThen(function(_)
				-- upvalues: SendAnalyticsEventFunction (upval), TelemetryEventType (upval), UseAnalyticsContextModuleResult (upval), p1 (upval)
				SendAnalyticsEventFunction({
					eventType = TelemetryEventType.Submitted,
					context = UseAnalyticsContextModuleResult
				})
				
				if p1.onSubmit then
					p1.onSubmit()
				end
			end):catch(function(Err)
				-- upvalues: DashModule (upval), SendAnalyticsEventFunction (upval), TelemetryEventType (upval), UseAnalyticsContextModuleResult (upval)
				SendAnalyticsEventFunction({
					eventType = TelemetryEventType.Error,
					context = UseAnalyticsContextModuleResult,
					meta = {
						error = `ReportFlowHandler - Submitting v1 report: {DashModule.pretty(Err, { depth = 10 })}`
					}
				})
			end)
			
			return
		end
		if FFlagGenericAbuseReportingUnifyReportTagsModule or FFlagAddThumbnailSelectorReport then
			SubmitReportModule(UseRoactServiceResult, (GetReportTagsModule({
				formData = FormData,
				localPlayerUserId = tostring(LocalPlayer.UserId),
				abuseVector = p1.abuseVector,
				targetId = p1.targetId,
				custom = p1.custom,
				additionalReportTags = AdditionalReportTags
			}))):andThen(function(_)
				-- upvalues: SendAnalyticsEventFunction (upval), TelemetryEventType (upval), UseAnalyticsContextModuleResult (upval), p1 (upval)
				SendAnalyticsEventFunction({
					eventType = TelemetryEventType.Submitted,
					context = UseAnalyticsContextModuleResult
				})
				
				if p1.onSubmit then
					p1.onSubmit()
				end
			end):catch(function(Err)
				-- upvalues: DashModule (upval), SendAnalyticsEventFunction (upval), TelemetryEventType (upval), UseAnalyticsContextModuleResult (upval)
				SendAnalyticsEventFunction({
					eventType = TelemetryEventType.Error,
					context = UseAnalyticsContextModuleResult,
					meta = {
						error = `ReportFlowHandler - Submitting report: {DashModule.pretty(Err, { depth = 10 })}`
					}
				})
			end)
			
			return
		else
			SubmitReportModule(UseRoactServiceResult, (CreateReportModule({
				abuseCategory = ValueToAbuseCategoryModule[FormData.legacy_abuse_category] or (FormData.abuse_category or AbuseCategoryModule.ABUSE_CATEGORY_INVALID),
				abuseVector = p1.abuseVector,
				comment = FormData.free_comment,
				submitterId = tostring(LocalPlayer.UserId),
				targetId = p1.targetId,
				custom = p1.custom
			}))):andThen(function(_)
				-- upvalues: SendAnalyticsEventFunction (upval), TelemetryEventType (upval), UseAnalyticsContextModuleResult (upval)
				SendAnalyticsEventFunction({
					eventType = TelemetryEventType.Submitted,
					context = UseAnalyticsContextModuleResult
				})
			end):catch(function(Err)
				-- upvalues: DashModule (upval), SendAnalyticsEventFunction (upval), TelemetryEventType (upval), UseAnalyticsContextModuleResult (upval)
				SendAnalyticsEventFunction({
					eventType = TelemetryEventType.Error,
					context = UseAnalyticsContextModuleResult,
					meta = {
						error = `ReportFlowHandler - Submitting report: {DashModule.pretty(Err, { depth = 10 })}`
					}
				})
			end)
		end
	end, {
		FormData, Players.LocalPlayer, p1.abuseVector, p1.targetId,
		SendAnalyticsEventFunction, UseAnalyticsContextModuleResult
	})
	local UseMemoResult2 = ReactModule.useMemo(function()
		-- upvalues: UseMemoResult (copy), UseMemoResult1 (copy), UseBeduiDataModuleResult (copy), SendAnalyticsEventFunction (upval), TelemetryEventType (upval), UseAnalyticsContextModuleResult (copy), DashModule (upval), IsXBelow (copy), CryoModule (upval), ReactModule (upval), SingleStepContainerModule (upval), UseStateResult (copy), SingleStepInnerContentRendererModule (upval), ArgCheckModule (upval), IsReportSubmitted (copy), UseResult1 (copy), SetIsReportSubmittedFunction (copy), UseResult (copy), ButtonVariant (upval), FillBehavior (upval)
		if UseMemoResult then
			return {}
		end
		if UseMemoResult1 or not UseBeduiDataModuleResult.beduiData or not UseBeduiDataModuleResult.beduiData.nodes then
			SendAnalyticsEventFunction({
				eventType = TelemetryEventType.Error,
				context = UseAnalyticsContextModuleResult,
				meta = {
					error = "ReportFlowHandler - Invalid Bedui data or no nodes found"
				}
			})
			
			return {}
		end
		local t = {}
		local JoinDeepResult = nil
		
		for _, node in UseBeduiDataModuleResult.beduiData.nodes do
			JoinDeepResult = DashModule.joinDeep({}, node)
			local InnerContentConfig = JoinDeepResult.innerContentConfig
			local FooterContentConfig = IsXBelow and node.footerContentConfig
			
			if FooterContentConfig then
				InnerContentConfig = {
					type = InnerContentConfig.type,
					configurableComponentList = {
						components = CryoModule.List.join(InnerContentConfig.configurableComponentList.components, JoinDeepResult.footerContentConfig.configurableComponentList.components)
					}
				}
			end
			if t[JoinDeepResult.stepId] ~= nil then
				SendAnalyticsEventFunction({
					eventType = TelemetryEventType.Error,
					context = UseAnalyticsContextModuleResult,
					meta = {
						error = `ReportFlowHandler - Duplicate stepId found: {tostring(JoinDeepResult.stepId)}`
					}
				})
				
				return {}
			end
			t[JoinDeepResult.stepId] = {
				onStepCancel = nil,
				stepId = JoinDeepResult.stepId,
				predefinedNextStepId = JoinDeepResult.actionInfo.predefinedNextStepId,
				content = ReactModule.createElement(SingleStepContainerModule, {
					node = JoinDeepResult,
					contentConfig = InnerContentConfig,
					formDataKeysWithError = UseStateResult
				}),
				footer = if JoinDeepResult.footerContentConfig and not FooterContentConfig then ReactModule.createElement(SingleStepInnerContentRendererModule, {
					contentConfig = JoinDeepResult.footerContentConfig,
					formDataKeysWithError = UseStateResult
				}) else nil,
				labels = { continueButton = JoinDeepResult.actionInfo.actionLabel },
				onStepContinue = function()
					-- upvalues: ArgCheckModule (upval), IsReportSubmitted (upval), SendAnalyticsEventFunction (upval), TelemetryEventType (upval), UseAnalyticsContextModuleResult (upval), JoinDeepResult (copy), UseResult1 (upval), SetIsReportSubmittedFunction (upval)
					ArgCheckModule.assert(IsReportSubmitted == false, "Report should only be able to be submitted once")
					
					if IsReportSubmitted then
						SendAnalyticsEventFunction({
							eventType = TelemetryEventType.Error,
							context = UseAnalyticsContextModuleResult,
							meta = {
								error = `ReportFlowHandler - Report already submitted for stepId: {tostring(JoinDeepResult.stepId)}`
							}
						})
					end
					if JoinDeepResult.actionInfo.shouldSubmit and not IsReportSubmitted then
						UseResult1()
						SetIsReportSubmittedFunction(true)
					end
				end,
				validateState = function()
					-- upvalues: UseResult (upval), InnerContentConfig (ref)
					return UseResult(InnerContentConfig)
				end,
				stepStyle = {
					buttonXAlignment = "align-x-right",
					continueButton = {
						variant = if JoinDeepResult.actionInfo.shouldSubmit then ButtonVariant.Emphasis else ButtonVariant.Standard,
						fillBehavior = if IsXBelow then FillBehavior.Fill else FillBehavior.Fit
					}
				}
			}
		end
		return t
	end, {
		UseMemoResult, UseMemoResult1, UseBeduiDataModuleResult, UseStateResult,
		IsXBelow, UseResult1, UseResult, IsReportSubmitted, SendAnalyticsEventFunction,
		UseAnalyticsContextModuleResult
	})
	
	return if UseMemoResult then ReactModule.createElement(Skeleton, {
		radius = Radius.Medium,
		Size = UDim2.new(1, 0, 0, UseTokensResult.Size.Size_2500)
	}) elseif UseMemoResult1 or not next(UseMemoResult2) then ReactModule.createElement(Empty, {}) elseif next(UseMemoResult2) and UseBeduiDataModuleResult.beduiData then ReactModule.createElement(StepperModule, {
		currentStep = UseBeduiDataModuleResult.beduiData.rootStepId,
		steps = UseMemoResult2
	}) else nil
end)