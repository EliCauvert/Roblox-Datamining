local Songbird = script:FindFirstAncestor("Songbird")
local CoreGui = game:GetService("CoreGui")
local ReactModule = require(Songbird.Parent.React)
local ReactRobloxModule = require(Songbird.Parent.ReactRoblox)
local FoundationModule = require(Songbird.Parent.Foundation)
local CustomFoundationChipModule = require(Songbird.Components.CustomFoundationChip)
local AnalyticActionsModule = require(Songbird.Analytics.AnalyticActions)
local SendAudioPlayerAnalyticsModule = require(Songbird.Analytics.sendAudioPlayerAnalytics)
local _ = require(Songbird.types)
local ReportSongDialogModule = require(Songbird.Components.ReportSongDialog)
local GetFFlagSongDetailsPageDesignPassFunction = require(Songbird.Parent.SharedFlags).GetFFlagSongDetailsPageDesignPass
local UseLocalizationFunction = require(Songbird.Parent.Localization).Hooks.useLocalization
local UseCallbackFunction = ReactModule.useCallback
local UseStateFunction = ReactModule.useState
local CreateNextOrderFunction = require(Songbird.Parent.ReactUtils).createNextOrder

return function(Frame) --[[ Line: 37 | Named "AudioPlayerActions" ]]
	-- upvalues: UseLocalizationFunction (copy), UseStateFunction (copy), CreateNextOrderFunction (copy), UseCallbackFunction (copy), SendAudioPlayerAnalyticsModule (copy), AnalyticActionsModule (copy), ReactModule (copy), FoundationModule (copy), GetFFlagSongDetailsPageDesignPassFunction (copy), CustomFoundationChipModule (copy), ReactRobloxModule (copy), ReportSongDialogModule (copy), CoreGui (copy)
	local UseLocalizationResult = UseLocalizationFunction({
		favorite = "Feature.SongDetails.Action.Favorite",
		report = "Feature.SongDetails.Action.Report"
	})
	local UseStateResult, UseStateResult2 = UseStateFunction(false)
	local NextOrder = CreateNextOrderFunction()
	local UseCallbackResult = UseCallbackFunction(function(Action) --[[ Line: 47 ]]
		-- upvalues: Frame (copy), SendAudioPlayerAnalyticsModule (upval)
		SendAudioPlayerAnalyticsModule({
			action = Action,
			songId = Frame.audio.assetId:gsub("rbxassetid://", ""),
			thumbnailId = (if Frame.audio.thumbnailAssetId then Frame.audio.thumbnailAssetId:gsub("rbxassetid://", "") else nil) or "-1",
			source = Frame.analyticsSource
		})
	end, {
		Frame.audio.assetId,
		Frame.audio.thumbnail,
		Frame.audio.thumbnailAssetId,
		Frame.analyticsSource
	})
	local UseCallbackResult1 = UseCallbackFunction(function() --[[ Line: 72 ]]
		-- upvalues: Frame (copy), UseCallbackResult (copy), AnalyticActionsModule (upval)
		if Frame.audio.isLiked then
			if Frame.onUnlike then
				UseCallbackResult(AnalyticActionsModule.Unlike)
				Frame.onUnlike()
				
				return
			end
		elseif Frame.onLike then
			UseCallbackResult(AnalyticActionsModule.Like)
			Frame.onLike()
		end
	end, {
		Frame.audio.isLiked,
		Frame.onLike,
		Frame.onUnlike,
		UseCallbackResult
	})
	local UseCallbackResult2 = UseCallbackFunction(function() --[[ Line: 93 ]]
		-- upvalues: UseCallbackResult (copy), AnalyticActionsModule (upval), UseStateResult2 (copy)
		UseCallbackResult(AnalyticActionsModule.StartAudioReport)
		UseStateResult2(true)
	end, {})
	local UseCallbackResult3 = UseCallbackFunction(function() --[[ Line: 98 ]]
		-- upvalues: UseStateResult2 (copy)
		UseStateResult2(false)
	end, {})
	
	return ReactModule.createElement(FoundationModule.View, {
		tag = "auto-xy row gap-small",
		LayoutOrder = Frame.LayoutOrder
	}, {
		Favorite = if GetFFlagSongDetailsPageDesignPassFunction() then ReactModule.createElement(FoundationModule.Chip, {
			text = UseLocalizationResult.favorite,
			leading = {
				iconName = FoundationModule.Enums.IconName.Star,
				iconVariant = if Frame.audio.isLiked then FoundationModule.Enums.IconVariant.Filled else nil
			},
			onActivated = UseCallbackResult1,
			LayoutOrder = NextOrder()
		}) else ReactModule.createElement(CustomFoundationChipModule, {
			LayoutOrder = NextOrder(),
			text = UseLocalizationResult.favorite,
			icon = if Frame.audio.isLiked then "icons/actions/favoriteOn" else "icons/actions/favoriteOff",
			onActivated = UseCallbackResult1
		}),
		Report = if GetFFlagSongDetailsPageDesignPassFunction() then ReactModule.createElement(FoundationModule.Chip, {
			text = UseLocalizationResult.report,
			leading = { iconName = FoundationModule.Enums.IconName.Flag },
			onActivated = UseCallbackResult2,
			LayoutOrder = NextOrder()
		}) else ReactModule.createElement(CustomFoundationChipModule, {
			icon = "icons/actions/feedback",
			LayoutOrder = NextOrder(),
			text = UseLocalizationResult.report,
			onActivated = UseCallbackResult2
		}),
		ReportDialog = UseStateResult and ReactRobloxModule.createPortal(ReactModule.createElement("ScreenGui", {
			DisplayOrder = 2,
			ZIndexBehavior = Enum.ZIndexBehavior.Sibling
		}, {
			Background = ReactModule.createElement(FoundationModule.View, {
				tag = "size-full row align-y-center align-x-center bg-over-media-100",
				stateLayer = {
					affordance = FoundationModule.Enums.StateLayerAffordance.None
				},
				onActivated = UseCallbackResult3
			}, {
				Dialog = ReactModule.createElement(ReportSongDialogModule, {
					audio = Frame.audio,
					analyticsSource = Frame.analyticsSource or "unknown",
					onClose = UseCallbackResult3
				})
			})
		}), CoreGui)
	})
end