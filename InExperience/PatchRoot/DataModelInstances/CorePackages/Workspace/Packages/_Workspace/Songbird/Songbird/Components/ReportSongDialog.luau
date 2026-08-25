local songbird = script:FindFirstAncestor("Songbird")
local httpService = game:GetService("HttpService")
local playersService = game:GetService("Players")
local assetFavoritesModule = require(songbird.Parent.AssetFavorites)
local foundationModule = require(songbird.Parent.Foundation)
local reactModule = require(songbird.Parent.React)
local focusNavigationUtilsModule = require(songbird.Parent.FocusNavigationUtils)
local loggerModule = require(songbird.logger)
local _ = require(songbird.types)
local focusRoot = focusNavigationUtilsModule.FocusRoot
local focusNavigableSurfaceIdentifierEnum = focusNavigationUtilsModule.FocusNavigableSurfaceIdentifierEnum
local defaultTwoStepReportFlowModule = require(songbird.Parent.GenericAbuseReporting.DefaultTwoStepReportFlow)
local abuseCategoryModule = require(songbird.Parent.GenericAbuseReporting.AbuseCategory)
local abuseEntrypointModule = require(songbird.Parent.GenericAbuseReporting.AbuseEntrypoint)
local useCallback = reactModule.useCallback
local useLocalUserId = assetFavoritesModule.useLocalUserId
local list = {
	{
		localizationKey = "Feature.SongDetails.Label.InappropriateAudio",
		value = "InappropriateAudio"
	},
	{
		localizationKey = "Feature.SongDetails.Label.InappropriateThumbnail",
		value = "InappropriateThumbnail"
	}
}
local _ = { Audio = "audio", Image = "image" }

local function buildReport(p0)
	-- upvalues: abuseEntrypointModule (ref), abuseCategoryModule (ref), httpService (ref)
	local t = {
		tags = {
			ENTRY_POINT = { valueList = { { data = abuseEntrypointModule.APP } } },
			SUBMITTER_USER_ID = { valueList = { { data = tostring(p0.userId) } } },
			REPORTED_ABUSE_CATEGORY = {
				valueList = {
					{ data = abuseCategoryModule.ABUSE_CATEGORY_INAPT_CONTENT }
				}
			},
			REPORTER_COMMENT = { valueList = { { data = p0.comment } } },
			REPORT_TARGET_ASSET_ID = { valueList = { { data = p0.assetId } } },
			REPORTED_ABUSE_VECTOR = { valueList = { { data = p0.abuseVector } } },
			VARIANT = { valueList = { { data = p0.variant } } }
		}
	}
	local ok, status = pcall(function()
		-- upvalues: httpService (copy), t (ref)
		return httpService:JSONEncode(t)
	end)
	
	return if ok then status else nil
end

return reactModule.memo(function(p1)
	-- upvalues: useLocalUserId (ref), useCallback (ref), list (ref), buildReport (ref), playersService (ref), loggerModule (ref), reactModule (ref), foundationModule (ref), focusRoot (ref), focusNavigableSurfaceIdentifierEnum (ref), defaultTwoStepReportFlowModule (ref)
	local var14 = useLocalUserId()
	local var15 = useCallback(function()
		-- upvalues: p1 (ref)
		if p1.onClose then
			p1.onClose()
		end
	end, { p1.onClose })
	
	return reactModule.createElement(foundationModule.View, { tag = "size-full-0 auto-y", selectionGroup = true }, {
		FocusRoot = reactModule.createElement(focusRoot, {
			isIsolated = true,
			isAutoFocusRoot = true,
			surfaceIdentifier = focusNavigableSurfaceIdentifierEnum.CentralOverlay
		}, {
			AbuseReportFlow = reactModule.createElement(defaultTwoStepReportFlowModule, {
				analyticsContext = p1.analyticsSource,
				onCloseProps = { hasPreviousSteps = false, onAbandon = var15 },
				onSubmitProps = {
					hasNextSteps = false,
					onSubmit = useCallback(function(p2, p3)
						-- upvalues: list (copy), p1 (ref), buildReport (copy), var14 (ref), playersService (copy), loggerModule (copy)
						local var16 = p2 == list[1].value
						local var17 = if var16 then p1.audio.assetId else p1.audio.thumbnailAssetId
						
						if var17 then
							local var18 = buildReport({
								userId = var14,
								comment = p3,
								assetId = var17,
								abuseVector = if var16 then "audio" else "image",
								variant = p1.analyticsSource
							})
							
							if var18 then
								local localPlayer = playersService.LocalPlayer
								
								if localPlayer then
									local ok, status = pcall(function()
										-- upvalues: playersService (copy), localPlayer (ref), var18 (ref)
										playersService:ReportAbuseV3(localPlayer, var18)
									end)
									
									if ok then
										loggerModule:info(`Abuse report sent for asset [{var17}] with reason [{p2}] and comment [{p3}]`)
									else
										loggerModule:warning(`Failed to submit abuse report for asset {var17}: {status}`)
									end
								end
							end
						end
						return true
					end, {
						p1.analyticsSource,
						p1.audio.assetId,
						p1.audio.thumbnailAssetId,
						var14
					})
				},
				onComplete = var15,
				reportCategories = list,
				reportCategoryDefaultKey = list[1].value,
				localizationKeys = { formTitle = "Feature.SongDetails.Action.ReportAudio" }
			})
		})
	})
end)