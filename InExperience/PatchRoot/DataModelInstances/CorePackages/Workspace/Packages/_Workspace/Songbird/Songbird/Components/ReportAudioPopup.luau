local songbird = script:FindFirstAncestor("Songbird")
local httpService = game:GetService("HttpService")
local marketplaceService = game:GetService("MarketplaceService")
local playersService = game:GetService("Players")
local constantsModule = require(songbird.constants)
local loggerModule = require(songbird.logger)
local cryoModule = require(songbird.Parent.Cryo)
local foundationModule = require(songbird.Parent.Foundation)
local reactModule = require(songbird.Parent.React)
local defaultTwoStepReportFlowModule = require(songbird.Parent.GenericAbuseReporting.DefaultTwoStepReportFlow)
local analyticActionsModule = require(songbird.Analytics.AnalyticActions)
local sendChromeWindowAnalyticsModule = require(songbird.Analytics.sendChromeWindowAnalytics)
local reportAudioPopupContextModule = require(songbird.Components.ReportAudioPopupContext)
local getFFlagSongbirdMusicIconThumbnailModule = require(songbird.Flags.getFFlagSongbirdMusicIconThumbnail)
local t = {
	localizationKey = "CoreScripts.TopBar.Label.InappropriateAudio",
	value = "ABUSE_CATEGORY_INAPT_CONTENT"
}
local list = {
	t,
	{
		localizationKey = "Feature.SongDetails.Label.InappropriateThumbnail",
		value = "ABUSE_CATEGORY_INAPT_THUMBNAIL"
	}
}
local list_1 = { t }
local t_1 = {
	maxSize = constantsModule.BIG_VECTOR,
	onClose = function() --[[ line: 39 ]] end,
	Players = playersService
}

function buildReport(p0, p1, p2, p3, p4) --[[ line: 55 ]]
	-- upvalues: getFFlagSongbirdMusicIconThumbnailModule (ref), httpService (ref)
	return httpService:JSONEncode({
		tags = {
			ENTRY_POINT = { valueList = { { data = "in-experience" } } },
			SUBMITTER_USER_ID = { valueList = { { data = tostring(p0) } } },
			REPORTED_ABUSE_CATEGORY = { valueList = { { data = p1 } } },
			REPORTER_COMMENT = { valueList = { { data = p2 } } },
			REPORT_TARGET_ASSET_ID = { valueList = { { data = tostring(p3) } } },
			REPORTED_ABUSE_VECTOR = {
				valueList = {
					{
						data = if getFFlagSongbirdMusicIconThumbnailModule() and p4 then p4 else "audio"
					}
				}
			},
			VARIANT = { valueList = { { data = "ChromeMusicWhatsPlaying" } } }
		}
	})
end

return function(p5) --[[ line: 104 | named "ReportAudioPopup" ]]
	-- upvalues: cryoModule (ref), t_1 (ref), reportAudioPopupContextModule (ref), getFFlagSongbirdMusicIconThumbnailModule (ref), list (ref), list_1 (ref), marketplaceService (ref), t (ref), playersService (ref), loggerModule (ref), sendChromeWindowAnalyticsModule (ref), analyticActionsModule (ref), reactModule (ref), defaultTwoStepReportFlowModule (ref), constantsModule (ref), foundationModule (ref)
	local var18 = cryoModule.Dictionary.join(t_1, p5)
	local var19 = reportAudioPopupContextModule.use()
	local var20 = if getFFlagSongbirdMusicIconThumbnailModule() and var19.hasThumbnail then list else list_1
	
	local var21 = function() --[[ line: 112 ]]
		-- upvalues: var18 (ref), var19 (ref)
		var18.onClose()
		var19.setVisibility(false)
	end
	
	local t_2 = {
		AbuseReportFlow = reactModule.createElement(defaultTwoStepReportFlowModule, {
			analyticsContext = constantsModule.AUDIO_ANALYTICS_CONTEXT,
			onCloseProps = { hasPreviousSteps = false, onAbandon = var21 },
			onSubmitProps = {
				hasNextSteps = false,
				onSubmit = function(p6, p7) --[[ line: 118 ]]
					-- upvalues: var18 (ref), var19 (ref), marketplaceService (copy), getFFlagSongbirdMusicIconThumbnailModule (copy), t (copy), playersService (copy), loggerModule (copy), sendChromeWindowAnalyticsModule (copy), analyticActionsModule (copy)
					local localPlayer = var18.Players.LocalPlayer
					
					if localPlayer and var19.assetId then
						local assetId = var19.assetId
						local ok, status = pcall(function() --[[ line: 123 ]]
							-- upvalues: marketplaceService (copy), assetId (ref)
							return if game:GetEngineFeature("AsyncRenamesUsedInLuaApps") then marketplaceService:GetProductInfoAsync(assetId) else marketplaceService:GetProductInfo(assetId)
						end)
						
						if not ok then
							loggerModule:warning("Failed to fetch ProductInfo for asset [" .. tostring(var19.assetId) .. "]")
							sendChromeWindowAnalyticsModule({
								assetId = assetId,
								action = analyticActionsModule.PreventNonAudioReport
							})
						elseif status.AssetTypeId == Enum.AssetType.Audio.Value then
							local var23 = buildReport(localPlayer.UserId, p6, p7, var19.assetId, if getFFlagSongbirdMusicIconThumbnailModule() then if p6 == t.value then "audio" else "image" else nil)
							
							if var23 then
								playersService:ReportAbuseV3(localPlayer, var23)
								loggerModule:info("Audio abuse report submitted for asset [" .. tostring(var19.assetId) .. "] with reason [" .. p6 .. "] and comment [" .. p7 .. "]")
								sendChromeWindowAnalyticsModule({
									assetId = assetId,
									action = analyticActionsModule.SubmitAudioReport
								})
							end
						else
							loggerModule:info("Atempted to submit report for non-audio asset [" .. tostring(var19.assetId) .. "] with reason [" .. p6 .. "] and comment [" .. p7 .. "]")
							sendChromeWindowAnalyticsModule({
								assetId = assetId,
								action = analyticActionsModule.PreventNonAudioReport
							})
						end
					end
					return true
				end
			},
			onComplete = var21,
			reportCategories = var20,
			reportCategoryDefaultKey = t.value,
			isReportCategoryReadonly = #var20 == 1,
			localizationKeys = { formTitle = "CoreScripts.TopBar.Label.ReportAudio" }
		})
	}
	
	return if var19.isVisible then if getFFlagSongbirdMusicIconThumbnailModule() then reactModule.createElement("Frame", { BackgroundTransparency = 1, Size = UDim2.fromScale(1, 1) }, t_2) else reactModule.createElement(foundationModule.View, { tag = "size-full", sizeConstraint = nil }, t_2) else nil
end