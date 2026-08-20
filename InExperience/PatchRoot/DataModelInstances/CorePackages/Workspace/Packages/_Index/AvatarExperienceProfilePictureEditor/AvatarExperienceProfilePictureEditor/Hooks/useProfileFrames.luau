local avatarExperienceProfilePictureEditor = script:FindFirstAncestor("AvatarExperienceProfilePictureEditor")
local reactModule = require(avatarExperienceProfilePictureEditor.Parent.React)
local fetchInternalModule = require(avatarExperienceProfilePictureEditor.Api.fetchInternal)
local editProfileImageAnalyticsModule = require(avatarExperienceProfilePictureEditor.Analytics.EditProfileImageAnalytics)
local profileFramesWidgetsApiModule = require(avatarExperienceProfilePictureEditor.Api.profileFramesWidgetsApi)
local mapWidgetContentToFrameItemsModule = require(avatarExperienceProfilePictureEditor.Utils.mapWidgetContentToFrameItems)

return function() --[[ line: 22 | named "useProfileFrames" ]]
	-- upvalues: reactModule (ref), profileFramesWidgetsApiModule (ref), fetchInternalModule (ref), mapWidgetContentToFrameItemsModule (ref), editProfileImageAnalyticsModule (ref)
	local var6, var7 = reactModule.useState({})
	local var8, var9 = reactModule.useState(true)
	local var10, var11 = reactModule.useState(false)
	local var12 = reactModule.useCallback(function() --[[ line: 27 ]]
		-- upvalues: profileFramesWidgetsApiModule (copy), fetchInternalModule (copy), mapWidgetContentToFrameItemsModule (copy), var11 (ref), var7 (ref), var9 (ref), editProfileImageAnalyticsModule (copy)
		profileFramesWidgetsApiModule.fetchProfileFramesWidgets(fetchInternalModule):andThen(function(p0) --[[ line: 30 ]]
			-- upvalues: mapWidgetContentToFrameItemsModule (copy), var11 (copy), var7 (copy), var9 (copy)
			local var14 = mapWidgetContentToFrameItemsModule.mapWidgetContentToFrameItems(if p0 and p0.widgetContent then p0.widgetContent else {}, if p0 then p0.hydrateResponseBody else nil)
			var11(false)
			var7(var14)
			var9(false)
		end):catch(function(_) --[[ line: 42 ]]
			-- upvalues: editProfileImageAnalyticsModule (copy), var11 (copy), var7 (copy), var9 (copy)
			editProfileImageAnalyticsModule.logFetchFailure({ assetType = "frames" })
			var11(true)
			var7({})
			var9(false)
		end)
	end, {})
	local var13 = reactModule.useCallback(function() --[[ line: 52 ]]
		-- upvalues: var9 (ref), var11 (ref), var12 (ref)
		var9(true)
		var11(false)
		var12()
	end, { var12 })
	reactModule.useEffect(function() --[[ line: 58 ]]
		-- upvalues: var12 (ref)
		var12()
	end, { var12 })
	
	return {
		frameItems = var6,
		isLoading = var8,
		hasError = var10,
		refetch = var13
	}
end