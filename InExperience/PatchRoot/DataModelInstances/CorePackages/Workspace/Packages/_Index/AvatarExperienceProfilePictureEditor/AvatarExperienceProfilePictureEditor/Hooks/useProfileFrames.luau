local AvatarExperienceProfilePictureEditor = script:FindFirstAncestor("AvatarExperienceProfilePictureEditor")
local ReactModule = require(AvatarExperienceProfilePictureEditor.Parent.React)
local FetchInternalModule = require(AvatarExperienceProfilePictureEditor.Api.fetchInternal)
local EditProfileImageAnalyticsModule = require(AvatarExperienceProfilePictureEditor.Analytics.EditProfileImageAnalytics)
local ProfileFramesWidgetsApiModule = require(AvatarExperienceProfilePictureEditor.Api.profileFramesWidgetsApi)
local MapWidgetContentToFrameItemsModule = require(AvatarExperienceProfilePictureEditor.Utils.mapWidgetContentToFrameItems)

return function()
	-- upvalues: ReactModule (copy), ProfileFramesWidgetsApiModule (copy), FetchInternalModule (copy), MapWidgetContentToFrameItemsModule (copy), EditProfileImageAnalyticsModule (copy)
	local UseStateResult, UseStateResult2 = ReactModule.useState({})
	local UseStateResult1, UseStateResult2_1 = ReactModule.useState(true)
	local UseStateResult3, UseStateResult2_2 = ReactModule.useState(false)
	local UseResult = ReactModule.useCallback(function()
		-- upvalues: ProfileFramesWidgetsApiModule (upval), FetchInternalModule (upval), MapWidgetContentToFrameItemsModule (upval), UseStateResult2_2 (copy), UseStateResult2 (copy), UseStateResult2_1 (copy), EditProfileImageAnalyticsModule (upval)
		ProfileFramesWidgetsApiModule.fetchProfileFramesWidgets(FetchInternalModule):andThen(function(Result)
			-- upvalues: MapWidgetContentToFrameItemsModule (upval), UseStateResult2_2 (upval), UseStateResult2 (upval), UseStateResult2_1 (upval)
			local MapWidgetContentToFrameItemsResult = MapWidgetContentToFrameItemsModule.mapWidgetContentToFrameItems(if Result and Result.widgetContent then Result.widgetContent else {}, if Result then Result.hydrateResponseBody else nil)
			UseStateResult2_2(false)
			UseStateResult2(MapWidgetContentToFrameItemsResult)
			UseStateResult2_1(false)
		end):catch(function(_)
			-- upvalues: EditProfileImageAnalyticsModule (upval), UseStateResult2_2 (upval), UseStateResult2 (upval), UseStateResult2_1 (upval)
			EditProfileImageAnalyticsModule.logFetchFailure({ assetType = "frames" })
			UseStateResult2_2(true)
			UseStateResult2({})
			UseStateResult2_1(false)
		end)
	end, {})
	local UseResult1 = ReactModule.useCallback(function()
		-- upvalues: UseStateResult2_1 (copy), UseStateResult2_2 (copy), UseResult (copy)
		UseStateResult2_1(true)
		UseStateResult2_2(false)
		UseResult()
	end, { UseResult })
	ReactModule.useEffect(function()
		-- upvalues: UseResult (copy)
		UseResult()
	end, { UseResult })
	
	return {
		frameItems = UseStateResult,
		isLoading = UseStateResult1,
		hasError = UseStateResult3,
		refetch = UseResult1
	}
end