local LocalizationService = game:GetService("LocalizationService")
local AbuseReporting = script:FindFirstAncestor("AbuseReporting")
local Parent = AbuseReporting.Parent
local ReactModule = require(Parent.React)
local AnalyticsModule = require(AbuseReporting.Analytics)
local ServerUIModule = require(Parent.ServerUI)
local ReactServerUIView = ServerUIModule.ReactServerUIView
local CryoModule = require(Parent.Cryo)
local Navigation = ServerUIModule.Navigation
local HttpRequestModule = require(Parent.HttpRequest)
local RoduxNetworkingModule = require(Parent.RoduxNetworking)
local ReactFocusNavigationModule = require(Parent.ReactFocusNavigation)
local FocusNavigationEventNameEnum = require(Parent.FocusNavigationUtils).FocusNavigationEventNameEnum
local InputHandlersModule = require(Parent.InputHandlers)
local ToastRoduxModule = require(Parent.ToastRodux)
local _ = require(AbuseReporting.Common.Types)
local UseStateFunction = ReactModule.useState
local UseDispatchFunction = require(Parent.RoactUtils).Hooks.RoactRodux.useDispatch
local ConstantsModule = require(AbuseReporting.Common.Constants)
local UseNavigationFunction = require(Parent.Navigation).useNavigation
local TutilsModule = require(Parent.tutils)
local MutedErrorFunction = require(Parent.Loggers).mutedError
local FFlagLuaAppDefaultHttpRetry = require(Parent.SharedFlags).FFlagLuaAppDefaultHttpRetry
local ReportFullscreenTemplateModule = require(AbuseReporting.Templates.ReportFullscreenTemplate)
local DynamicDialogUITransformerModule = require(AbuseReporting.Transformers.DynamicDialogUITransformer)
local ReportListSelectionModule = require(AbuseReporting.Components.ReportListSelection)
local ReportSubmissionModule = require(AbuseReporting.Components.ReportSubmission)
local ConstructAbuseReportTagsModule = require(AbuseReporting.Components.constructAbuseReportTags)
local SharedFlagsModule = require(Parent.SharedFlags)
local GetFFlagDSALuaGeoGateBEDUIDevModeFunction = SharedFlagsModule.GetFFlagDSALuaGeoGateBEDUIDevMode
local GetFFlagEnableAbuseReportMutedErrorFunction = SharedFlagsModule.GetFFlagEnableAbuseReportMutedError
local IsInDSAFeaturesOverrideListFunction = require(Parent.DsaIllegalContentReporting).isInDSAFeaturesOverrideList
local IsShowEUDSAIllegalContentReportingLinkFunction = require(Parent.DsaIllegalContentReporting).isShowEUDSAIllegalContentReportingLink
local config = {
	toastMessage = "Feature.ReportAbuse.Label.Confirmation.Title",
	toastSubMessage = "Feature.ReportAbuse.Label.Confirmation.Subheading",
	isLocalized = false,
	toastType = ToastRoduxModule.Enums.ToastType.SuccessConfirmation
}
local config1 = {
	toastMessage = "Feature.ReportAbuse.Message.ErrorSubmit",
	isLocalized = false,
	toastType = ToastRoduxModule.Enums.ToastType.NetworkingError
}

local function ReportScreen(p1)
	-- upvalues: UseDispatchFunction (copy), UseStateFunction (copy), AnalyticsModule (copy), CryoModule (copy), ReactModule (copy), InputHandlersModule (copy), ReactFocusNavigationModule (copy), FocusNavigationEventNameEnum (copy), HttpRequestModule (copy), FFlagLuaAppDefaultHttpRetry (copy), RoduxNetworkingModule (copy), DynamicDialogUITransformerModule (copy), ReportListSelectionModule (copy), ReportSubmissionModule (copy), ConstructAbuseReportTagsModule (copy), ToastRoduxModule (copy), config (copy), GetFFlagEnableAbuseReportMutedErrorFunction (copy), MutedErrorFunction (copy), TutilsModule (copy), config1 (copy), ReportFullscreenTemplateModule (copy), ConstantsModule (copy), GetFFlagDSALuaGeoGateBEDUIDevModeFunction (copy), IsShowEUDSAIllegalContentReportingLinkFunction (copy), IsInDSAFeaturesOverrideListFunction (copy), ReactServerUIView (copy), LocalizationService (copy)
	local UseDispatchResult = UseDispatchFunction()
	local UseStateResult, UseStateResult2 = UseStateFunction({})
	local NewResult = nil
	
	local function _()
		-- upvalues: NewResult (ref), AnalyticsModule (upval), p1 (copy)
		if not NewResult then
			NewResult = AnalyticsModule.new(p1.platform, p1.context)
		end
		return NewResult
	end
	
	local _ = function(TagKey, p2)
		-- upvalues: UseStateResult2 (copy), CryoModule (upval)
		UseStateResult2(function(Tbl)
			-- upvalues: CryoModule (upval), p2 (copy), TagKey (copy)
			local Copy = table.clone(Tbl)
			table.insert(Copy, CryoModule.Dictionary.join(p2, { tagKey = TagKey }))
			
			return Copy
		end)
	end
	
	local UseEventResult = ReactFocusNavigationModule.useEventHandler(FocusNavigationEventNameEnum.NavigateBack, (ReactModule.useCallback(InputHandlersModule.onRelease(function(_)
		-- upvalues: NewResult (ref), AnalyticsModule (upval), p1 (copy)
		if not NewResult then
			NewResult = AnalyticsModule.new(p1.platform, p1.context)
		end
		NewResult:onReportAbandoned()
	end), { NewResult })))
	local ConfigResult = RoduxNetworkingModule.config({
		keyPath = "AbuseReporting",
		networkImpl = HttpRequestModule.config({
			requestFunction = HttpRequestModule.requestFunctions.HttpRbxApi,
			maxRetryCount = if FFlagLuaAppDefaultHttpRetry then game:DefineFastInt("ReportScreenHttpRetryCount", 4) else nil
		})
	})
	local NewDynamicDialogUITransformer = DynamicDialogUITransformerModule.new({
		componentMap = {
			listSelection = {
				name = "listSelection",
				component = ReportListSelectionModule,
				props = {
					onItemSelected = function(p2, p3)
						-- upvalues: UseStateResult2 (copy), CryoModule (upval), NewResult (ref), AnalyticsModule (upval), p1 (copy)
						local Params = p2.params
						local TagKey = Params.tagKey
						local config = {
							tagValues = p3.tagValues,
							heading = Params.heading,
							humanReadableText = p3.humanReadableText
						}
						UseStateResult2(function(Tbl)
							-- upvalues: CryoModule (upval), config (copy), TagKey (copy)
							local Copy = table.clone(Tbl)
							table.insert(Copy, CryoModule.Dictionary.join(config, { tagKey = TagKey }))
							
							return Copy
						end)
						
						if not NewResult then
							NewResult = AnalyticsModule.new(p1.platform, p1.context)
						end
						NewResult:onSingleListItemSelected()
					end,
					onCancel = function()
						-- upvalues: NewResult (ref), AnalyticsModule (upval), p1 (copy)
						if not NewResult then
							NewResult = AnalyticsModule.new(p1.platform, p1.context)
						end
						NewResult:onReportAbandoned()
						p1.navigation.goBack()
					end
				}
			},
			submission = {
				name = "submission",
				component = ReportSubmissionModule,
				props = {
					onCancel = function()
						-- upvalues: NewResult (ref), AnalyticsModule (upval), p1 (copy)
						if not NewResult then
							NewResult = AnalyticsModule.new(p1.platform, p1.context)
						end
						NewResult:onReportAbandoned()
						p1.navigation.goBack()
					end,
					onMounted = function()
						-- upvalues: NewResult (ref), AnalyticsModule (upval), p1 (copy)
						if not NewResult then
							NewResult = AnalyticsModule.new(p1.platform, p1.context)
						end
						NewResult:onSubmissionPageMount()
					end,
					onSubmit = function(p2)
						-- upvalues: ConstructAbuseReportTagsModule (upval), p1 (copy), ConfigResult (copy), UseDispatchResult (copy), ToastRoduxModule (upval), config (upval), GetFFlagEnableAbuseReportMutedErrorFunction (upval), MutedErrorFunction (upval), TutilsModule (upval), config1 (upval), NewResult (ref), AnalyticsModule (upval)
						local Url = p2.params.url
						local config2 = {
							safetyEvent = {
								tags = ConstructAbuseReportTagsModule(p2.report, {
									context = p1.context,
									platform = p1.platform,
									assetId = p1.assetId,
									reportAbuseVector = p1.reportAbuseVector
								})
							}
						}
						UseDispatchResult(ConfigResult.POST("SubmitAbuseReport", function(Callback, _)
							-- upvalues: Url (copy), config2 (copy)
							return Callback(Url):body(config2)
						end).API()):andThen(function(_)
							-- upvalues: UseDispatchResult (upval), ToastRoduxModule (upval), config (upval)
							UseDispatchResult(ToastRoduxModule.Actions.SetCurrentToastMessage(config))
						end):catch(function(Err)
							-- upvalues: GetFFlagEnableAbuseReportMutedErrorFunction (upval), MutedErrorFunction (upval), TutilsModule (upval), UseDispatchResult (upval), ToastRoduxModule (upval), config1 (upval)
							if GetFFlagEnableAbuseReportMutedErrorFunction() then
								MutedErrorFunction("(Abuse Reporting [Console]) submission failed: " .. TutilsModule.toString(Err))
							end
							UseDispatchResult(ToastRoduxModule.Actions.SetCurrentToastMessage(config1))
						end)
						
						if not NewResult then
							NewResult = AnalyticsModule.new(p1.platform, p1.context)
						end
						NewResult:onReportSubmitted()
						p1.navigation.goBack()
					end
				}
			}
		},
		templateMap = { default = { component = ReportFullscreenTemplateModule } }
	})
	
	local function MapComponentPropsFromState(p2)
		-- upvalues: UseStateResult (copy)
		return if p2.name == "submission" then { report = UseStateResult } else {}
	end
	
	local V1 = ConstantsModule.BEDUI_VERSIONS.V1
	
	if GetFFlagDSALuaGeoGateBEDUIDevModeFunction() then
		if IsShowEUDSAIllegalContentReportingLinkFunction() then
			V1 = ConstantsModule.BEDUI_VERSIONS.DEV
		end
	elseif IsInDSAFeaturesOverrideListFunction() then
		V1 = ConstantsModule.BEDUI_VERSIONS.DEV
	end
	return ReactModule.createElement(ReactServerUIView, {
		url = "abuse-reporting/v1/dynamic-dialog",
		queryArgs = {
			version = V1,
			surface = p1.platform,
			context = p1.context,
			locale = LocalizationService.RobloxLocaleId,
			target_type = p1.reportAbuseVector,
			target_id = p1.assetId
		},
		mapComponentPropsFromState = MapComponentPropsFromState,
		transform = function(p2)
			-- upvalues: NewDynamicDialogUITransformer (copy)
			return NewDynamicDialogUITransformer:transform(p2)
		end,
		onError = function(p2)
			-- upvalues: GetFFlagEnableAbuseReportMutedErrorFunction (upval), MutedErrorFunction (upval), TutilsModule (upval), UseDispatchResult (copy), ToastRoduxModule (upval), config1 (upval), p1 (copy)
			if GetFFlagEnableAbuseReportMutedErrorFunction() then
				MutedErrorFunction("(Abuse Reporting [Console]) BEDUI fetch failed: " .. TutilsModule.toString(p2))
			end
			UseDispatchResult(ToastRoduxModule.Actions.SetCurrentToastMessage(config1))
			p1.navigation.goBack()
		end,
		ref = UseEventResult
	})
end

return function(p1)
	-- upvalues: UseNavigationFunction (copy), ReactModule (copy), Navigation (copy), ReportScreen (copy), CryoModule (copy)
	local UseNavigationResult = UseNavigationFunction()
	
	return ReactModule.createElement(Navigation, {}, {
		Screen = ReactModule.createElement(ReportScreen, CryoModule.Dictionary.join(p1, UseNavigationResult.getParam("reportData", {}), { navigation = UseNavigationResult }))
	})
end