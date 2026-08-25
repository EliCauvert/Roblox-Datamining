local songbird = script:FindFirstAncestor("Songbird")
local coreGuiService = game:GetService("CoreGui")
local reactModule = require(songbird.Parent.React)
local reactUtilsModule = require(songbird.Parent.ReactUtils)
local reactRobloxModule = require(songbird.Parent.ReactRoblox)
local foundationModule = require(songbird.Parent.Foundation)
local localizationModule = require(songbird.Parent.Localization)
local customFoundationChipModule = require(songbird.Components.CustomFoundationChip)
local analyticActionsModule = require(songbird.Analytics.AnalyticActions)
local sendAudioPlayerAnalyticsModule = require(songbird.Analytics.sendAudioPlayerAnalytics)
local _ = require(songbird.types)
local reportSongDialogModule = require(songbird.Components.ReportSongDialog)
local getFFlagSongDetailsPageDesignPass = require(songbird.Parent.SharedFlags).GetFFlagSongDetailsPageDesignPass
local useLocalization = localizationModule.Hooks.useLocalization
local useCallback = reactModule.useCallback
local useState = reactModule.useState
local createNextOrder = reactUtilsModule.createNextOrder

return function(p0)
	-- upvalues: useLocalization (ref), useState (ref), createNextOrder (ref), useCallback (ref), sendAudioPlayerAnalyticsModule (ref), analyticActionsModule (ref), reactModule (ref), foundationModule (ref), getFFlagSongDetailsPageDesignPass (ref), customFoundationChipModule (ref), reactRobloxModule (ref), reportSongDialogModule (ref), coreGuiService (ref)
	local var11 = useLocalization({
		favorite = "Feature.SongDetails.Action.Favorite",
		report = "Feature.SongDetails.Action.Report"
	})
	local var12, var13 = useState(false)
	local var14 = createNextOrder()
	local var15 = useCallback(function(p1)
		-- upvalues: p0 (ref), sendAudioPlayerAnalyticsModule (copy)
		sendAudioPlayerAnalyticsModule({
			action = p1,
			songId = p0.audio.assetId:gsub("rbxassetid://", ""),
			thumbnailId = (if p0.audio.thumbnailAssetId then p0.audio.thumbnailAssetId:gsub("rbxassetid://", "") else nil) or "-1",
			source = p0.analyticsSource
		})
	end, {
		p0.audio.assetId,
		p0.audio.thumbnail,
		p0.audio.thumbnailAssetId,
		p0.analyticsSource
	})
	local var16 = useCallback(function()
		-- upvalues: p0 (ref), var15 (ref), analyticActionsModule (copy)
		if p0.audio.isLiked then
			if p0.onUnlike then
				var15(analyticActionsModule.Unlike)
				p0.onUnlike()
				
				return
			end
		elseif p0.onLike then
			var15(analyticActionsModule.Like)
			p0.onLike()
		end
	end, { p0.audio.isLiked, p0.onLike, p0.onUnlike, var15 })
	local var17 = useCallback(function()
		-- upvalues: var15 (ref), analyticActionsModule (copy), var13 (ref)
		var15(analyticActionsModule.StartAudioReport)
		var13(true)
	end, {})
	local var18 = useCallback(function()
		-- upvalues: var13 (ref)
		var13(false)
	end, {})
	
	return reactModule.createElement(foundationModule.View, {
		tag = "auto-xy row gap-small",
		LayoutOrder = p0.LayoutOrder
	}, {
		Favorite = if getFFlagSongDetailsPageDesignPass() then reactModule.createElement(foundationModule.Chip, {
			text = var11.favorite,
			leading = {
				iconName = foundationModule.Enums.IconName.Star,
				iconVariant = if p0.audio.isLiked then foundationModule.Enums.IconVariant.Filled else nil
			},
			onActivated = var16,
			LayoutOrder = var14()
		}) else reactModule.createElement(customFoundationChipModule, {
			LayoutOrder = var14(),
			text = var11.favorite,
			icon = if p0.audio.isLiked then "icons/actions/favoriteOn" else "icons/actions/favoriteOff",
			onActivated = var16
		}),
		Report = if getFFlagSongDetailsPageDesignPass() then reactModule.createElement(foundationModule.Chip, {
			text = var11.report,
			leading = { iconName = foundationModule.Enums.IconName.Flag },
			onActivated = var17,
			LayoutOrder = var14()
		}) else reactModule.createElement(customFoundationChipModule, {
			icon = "icons/actions/feedback",
			LayoutOrder = var14(),
			text = var11.report,
			onActivated = var17
		}),
		ReportDialog = var12 and reactRobloxModule.createPortal(reactModule.createElement("ScreenGui", {
			DisplayOrder = 2,
			ZIndexBehavior = Enum.ZIndexBehavior.Sibling
		}, {
			Background = reactModule.createElement(foundationModule.View, {
				tag = "size-full row align-y-center align-x-center bg-over-media-100",
				stateLayer = {
					affordance = foundationModule.Enums.StateLayerAffordance.None
				},
				onActivated = var18
			}, {
				Dialog = reactModule.createElement(reportSongDialogModule, {
					audio = p0.audio,
					analyticsSource = p0.analyticsSource or "unknown",
					onClose = var18
				})
			})
		}), coreGuiService)
	})
end