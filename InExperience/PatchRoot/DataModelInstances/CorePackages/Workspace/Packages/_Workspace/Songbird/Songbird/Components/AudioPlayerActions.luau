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

return function(p1)
	-- upvalues: useLocalization (ref), useState (ref), createNextOrder (ref), useCallback (ref), sendAudioPlayerAnalyticsModule (ref), analyticActionsModule (ref), reactModule (ref), foundationModule (ref), getFFlagSongDetailsPageDesignPass (ref), customFoundationChipModule (ref), reactRobloxModule (ref), reportSongDialogModule (ref), coreGuiService (ref)
	local var1 = useLocalization({
		favorite = "Feature.SongDetails.Action.Favorite",
		report = "Feature.SongDetails.Action.Report"
	})
	local var2, var3 = useState(false)
	local var4 = createNextOrder()
	local var5 = useCallback(function(p2)
		-- upvalues: p1 (ref), sendAudioPlayerAnalyticsModule (copy)
		sendAudioPlayerAnalyticsModule({
			action = p2,
			songId = p1.audio.assetId:gsub("rbxassetid://", ""),
			thumbnailId = (if p1.audio.thumbnailAssetId then p1.audio.thumbnailAssetId:gsub("rbxassetid://", "") else nil) or "-1",
			source = p1.analyticsSource
		})
	end, {
		p1.audio.assetId,
		p1.audio.thumbnail,
		p1.audio.thumbnailAssetId,
		p1.analyticsSource
	})
	local var6 = useCallback(function()
		-- upvalues: p1 (ref), var5 (ref), analyticActionsModule (copy)
		if p1.audio.isLiked then
			if p1.onUnlike then
				var5(analyticActionsModule.Unlike)
				p1.onUnlike()
				
				return
			end
		elseif p1.onLike then
			var5(analyticActionsModule.Like)
			p1.onLike()
		end
	end, { p1.audio.isLiked, p1.onLike, p1.onUnlike, var5 })
	local var7 = useCallback(function()
		-- upvalues: var5 (ref), analyticActionsModule (copy), var3 (ref)
		var5(analyticActionsModule.StartAudioReport)
		var3(true)
	end, {})
	local var8 = useCallback(function()
		-- upvalues: var3 (ref)
		var3(false)
	end, {})
	
	return reactModule.createElement(foundationModule.View, {
		tag = "auto-xy row gap-small",
		LayoutOrder = p1.LayoutOrder
	}, {
		Favorite = if getFFlagSongDetailsPageDesignPass() then reactModule.createElement(foundationModule.Chip, {
			text = var1.favorite,
			leading = {
				iconName = foundationModule.Enums.IconName.Star,
				iconVariant = if p1.audio.isLiked then foundationModule.Enums.IconVariant.Filled else nil
			},
			onActivated = var6,
			LayoutOrder = var4()
		}) else reactModule.createElement(customFoundationChipModule, {
			LayoutOrder = var4(),
			text = var1.favorite,
			icon = if p1.audio.isLiked then "icons/actions/favoriteOn" else "icons/actions/favoriteOff",
			onActivated = var6
		}),
		Report = if getFFlagSongDetailsPageDesignPass() then reactModule.createElement(foundationModule.Chip, {
			text = var1.report,
			leading = { iconName = foundationModule.Enums.IconName.Flag },
			onActivated = var7,
			LayoutOrder = var4()
		}) else reactModule.createElement(customFoundationChipModule, {
			icon = "icons/actions/feedback",
			LayoutOrder = var4(),
			text = var1.report,
			onActivated = var7
		}),
		ReportDialog = var2 and reactRobloxModule.createPortal(reactModule.createElement("ScreenGui", {
			DisplayOrder = 2,
			ZIndexBehavior = Enum.ZIndexBehavior.Sibling
		}, {
			Background = reactModule.createElement(foundationModule.View, {
				tag = "size-full row align-y-center align-x-center bg-over-media-100",
				stateLayer = {
					affordance = foundationModule.Enums.StateLayerAffordance.None
				},
				onActivated = var8
			}, {
				Dialog = reactModule.createElement(reportSongDialogModule, {
					audio = p1.audio,
					analyticsSource = p1.analyticsSource or "unknown",
					onClose = var8
				})
			})
		}), coreGuiService)
	})
end