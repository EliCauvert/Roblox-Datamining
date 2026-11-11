local Songbird = script:FindFirstAncestor("Songbird")
local HttpService = game:GetService("HttpService")
local MarketplaceService = game:GetService("MarketplaceService")
local Players = game:GetService("Players")
local ConstantsModule = require(Songbird.constants)
local LoggerModule = require(Songbird.logger)
local CryoModule = require(Songbird.Parent.Cryo)
local FoundationModule = require(Songbird.Parent.Foundation)
local ReactModule = require(Songbird.Parent.React)
local DefaultTwoStepReportFlowModule = require(Songbird.Parent.GenericAbuseReporting.DefaultTwoStepReportFlow)
local AnalyticActionsModule = require(Songbird.Analytics.AnalyticActions)
local SendChromeWindowAnalyticsModule = require(Songbird.Analytics.sendChromeWindowAnalytics)
local ReportAudioPopupContextModule = require(Songbird.Components.ReportAudioPopupContext)
local GetFFlagSongbirdMusicIconThumbnailModule = require(Songbird.Flags.getFFlagSongbirdMusicIconThumbnail)
local config = {
	localizationKey = "CoreScripts.TopBar.Label.InappropriateAudio",
	value = "ABUSE_CATEGORY_INAPT_CONTENT"
}
local list = {
	config,
	{
		localizationKey = "Feature.SongDetails.Label.InappropriateThumbnail",
		value = "ABUSE_CATEGORY_INAPT_THUMBNAIL"
	}
}
local list1 = { config }
local config1 = {
	maxSize = ConstantsModule.BIG_VECTOR,
	onClose = function() end,
	Players = Players
}

function buildReport(p1, Data, Data1, p2, p3)
	-- upvalues: GetFFlagSongbirdMusicIconThumbnailModule (copy), HttpService (copy)
	return HttpService:JSONEncode({
		tags = {
			ENTRY_POINT = { valueList = { { data = "in-experience" } } },
			SUBMITTER_USER_ID = { valueList = { { data = tostring(p1) } } },
			REPORTED_ABUSE_CATEGORY = { valueList = { { data = Data } } },
			REPORTER_COMMENT = { valueList = { { data = Data1 } } },
			REPORT_TARGET_ASSET_ID = { valueList = { { data = tostring(p2) } } },
			REPORTED_ABUSE_VECTOR = {
				valueList = {
					{
						data = if GetFFlagSongbirdMusicIconThumbnailModule() and p3 then p3 else "audio"
					}
				}
			},
			VARIANT = { valueList = { { data = "ChromeMusicWhatsPlaying" } } }
		}
	})
end

return function(p1)
	-- upvalues: CryoModule (copy), config1 (copy), ReportAudioPopupContextModule (copy), GetFFlagSongbirdMusicIconThumbnailModule (copy), list (copy), list1 (copy), MarketplaceService (copy), config (copy), Players (copy), LoggerModule (copy), SendChromeWindowAnalyticsModule (copy), AnalyticActionsModule (copy), ReactModule (copy), DefaultTwoStepReportFlowModule (copy), ConstantsModule (copy), FoundationModule (copy)
	local JoinResult = CryoModule.Dictionary.join(config1, p1)
	local UseResult = ReportAudioPopupContextModule.use()
	local List = if GetFFlagSongbirdMusicIconThumbnailModule() and UseResult.hasThumbnail then list else list1
	
	local function OnAbandon()
		-- upvalues: JoinResult (copy), UseResult (copy)
		JoinResult.onClose()
		UseResult.setVisibility(false)
	end
	
	local config2 = {
		AbuseReportFlow = ReactModule.createElement(DefaultTwoStepReportFlowModule, {
			analyticsContext = ConstantsModule.AUDIO_ANALYTICS_CONTEXT,
			onCloseProps = { hasPreviousSteps = false, onAbandon = OnAbandon },
			onSubmitProps = {
				hasNextSteps = false,
				onSubmit = function(Text, Text1): boolean
					-- upvalues: JoinResult (copy), UseResult (copy), MarketplaceService (upval), GetFFlagSongbirdMusicIconThumbnailModule (upval), config (upval), Players (upval), LoggerModule (upval), SendChromeWindowAnalyticsModule (upval), AnalyticActionsModule (upval)
					local LocalPlayer = JoinResult.Players.LocalPlayer
					
					if LocalPlayer and UseResult.assetId then
						local AssetId = UseResult.assetId
						local Success, Result = pcall(function()
							-- upvalues: MarketplaceService (upval), AssetId (copy)
							return if game:GetEngineFeature("AsyncRenamesUsedInLuaApps") then MarketplaceService:GetProductInfoAsync(AssetId) else MarketplaceService:GetProductInfo(AssetId)
						end)
						
						if Success then
							if Result.AssetTypeId == Enum.AssetType.Audio.Value then
								local Report = buildReport(LocalPlayer.UserId, Text, Text1, UseResult.assetId, if GetFFlagSongbirdMusicIconThumbnailModule() then if Text == config.value then "audio" else "image" else nil)
								
								if Report then
									Players:ReportAbuseV3(LocalPlayer, Report)
									LoggerModule:info("Audio abuse report submitted for asset [" .. tostring(UseResult.assetId) .. "] with reason [" .. Text .. "] and comment [" .. Text1 .. "]")
									SendChromeWindowAnalyticsModule({
										assetId = AssetId,
										action = AnalyticActionsModule.SubmitAudioReport
									})
								end
							else
								LoggerModule:info("Atempted to submit report for non-audio asset [" .. tostring(UseResult.assetId) .. "] with reason [" .. Text .. "] and comment [" .. Text1 .. "]")
								SendChromeWindowAnalyticsModule({
									assetId = AssetId,
									action = AnalyticActionsModule.PreventNonAudioReport
								})
							end
						else
							LoggerModule:warning("Failed to fetch ProductInfo for asset [" .. tostring(UseResult.assetId) .. "]")
							SendChromeWindowAnalyticsModule({
								assetId = AssetId,
								action = AnalyticActionsModule.PreventNonAudioReport
							})
						end
					end
					return true
				end
			},
			onComplete = OnAbandon,
			reportCategories = List,
			reportCategoryDefaultKey = config.value,
			isReportCategoryReadonly = #List == 1,
			localizationKeys = { formTitle = "CoreScripts.TopBar.Label.ReportAudio" }
		})
	}
	
	return if UseResult.isVisible then if GetFFlagSongbirdMusicIconThumbnailModule() then ReactModule.createElement("Frame", { BackgroundTransparency = 1, Size = UDim2.fromScale(1, 1) }, config2) else ReactModule.createElement(FoundationModule.View, { tag = "size-full", sizeConstraint = nil }, config2) else nil
end