local avatarExperienceProfilePictureEditor = script:FindFirstAncestor("AvatarExperienceProfilePictureEditor")
local reactModule = require(avatarExperienceProfilePictureEditor.Parent.React)
local fetchInternalModule = require(avatarExperienceProfilePictureEditor.Api.fetchInternal)
local editProfileImageAnalyticsModule = require(avatarExperienceProfilePictureEditor.Analytics.EditProfileImageAnalytics)
local profileFramesWidgetsApiModule = require(avatarExperienceProfilePictureEditor.Api.profileFramesWidgetsApi)
local mapWidgetContentToFrameItemsModule = require(avatarExperienceProfilePictureEditor.Utils.mapWidgetContentToFrameItems)

return function()
	-- upvalues: reactModule (ref), profileFramesWidgetsApiModule (ref), fetchInternalModule (ref), mapWidgetContentToFrameItemsModule (ref), editProfileImageAnalyticsModule (ref)
	local var1, var2 = reactModule.useState({})
	local var3, var4 = reactModule.useState(true)
	local var5, var6 = reactModule.useState(false)
	local var7 = reactModule.useCallback(function()
		-- upvalues: profileFramesWidgetsApiModule (copy), fetchInternalModule (copy), mapWidgetContentToFrameItemsModule (copy), var6 (ref), var2 (ref), var4 (ref), editProfileImageAnalyticsModule (copy)
		profileFramesWidgetsApiModule.fetchProfileFramesWidgets(fetchInternalModule):andThen(function(p1)
			-- upvalues: mapWidgetContentToFrameItemsModule (copy), var6 (copy), var2 (copy), var4 (copy)
			local var8 = mapWidgetContentToFrameItemsModule.mapWidgetContentToFrameItems(if p1 and p1.widgetContent then p1.widgetContent else {}, if p1 then p1.hydrateResponseBody else nil)
			var6(false)
			var2(var8)
			var4(false)
		end):catch(function(_)
			-- upvalues: editProfileImageAnalyticsModule (copy), var6 (copy), var2 (copy), var4 (copy)
			editProfileImageAnalyticsModule.logFetchFailure({ assetType = "frames" })
			var6(true)
			var2({})
			var4(false)
		end)
	end, {})
	local var8 = reactModule.useCallback(function()
		-- upvalues: var4 (ref), var6 (ref), var7 (ref)
		var4(true)
		var6(false)
		var7()
	end, { var7 })
	reactModule.useEffect(function()
		-- upvalues: var7 (ref)
		var7()
	end, { var7 })
	
	return {
		frameItems = var1,
		isLoading = var3,
		hasError = var5,
		refetch = var8
	}
end