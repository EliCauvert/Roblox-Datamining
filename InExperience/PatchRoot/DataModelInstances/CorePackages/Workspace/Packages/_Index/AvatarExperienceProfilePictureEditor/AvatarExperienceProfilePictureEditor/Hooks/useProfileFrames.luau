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
	local var12, var13 = reactModule.useState(0)
	local var14 = reactModule.useCallback(function() --[[ line: 28 ]]
		-- upvalues: var9 (ref), var11 (ref), var7 (ref), var13 (ref)
		var9(true)
		var11(false)
		var7({})
		var13(function(p0) --[[ line: 32 ]]
			return p0 + 1
		end)
	end, {})
	reactModule.useEffect(function() --[[ line: 37 ]]
		-- upvalues: profileFramesWidgetsApiModule (copy), fetchInternalModule (copy), mapWidgetContentToFrameItemsModule (copy), var11 (ref), var7 (ref), var9 (ref), editProfileImageAnalyticsModule (copy)
		local var15 = false
		profileFramesWidgetsApiModule.fetchProfileFramesWidgets(fetchInternalModule):andThen(function(p1) --[[ line: 42 ]]
			-- upvalues: var15 (write), mapWidgetContentToFrameItemsModule (copy), var11 (copy), var7 (copy), var9 (copy)
			if var15 then return end
			local var16 = mapWidgetContentToFrameItemsModule.mapWidgetContentToFrameItems(if p1 and p1.widgetContent then p1.widgetContent else {}, if p1 then p1.hydrateResponseBody else nil)
			var11(false)
			var7(var16)
			var9(false)
		end):catch(function(_) --[[ line: 58 ]]
			-- upvalues: var15 (write), editProfileImageAnalyticsModule (copy), var11 (copy), var7 (copy), var9 (copy)
			if var15 then
				return
			end
			editProfileImageAnalyticsModule.logFetchFailure({ assetType = "frames" })
			var11(true)
			var7({})
			var9(false)
		end)
		
		return function() --[[ line: 71 ]]
			-- upvalues: var15 (write)
			var15 = true
		end
	end, { var12 })
	
	return {
		frameItems = var6,
		isLoading = var8,
		hasError = var10,
		refetch = var14
	}
end