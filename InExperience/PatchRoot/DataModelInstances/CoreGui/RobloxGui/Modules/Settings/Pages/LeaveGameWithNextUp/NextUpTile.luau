local corePackagesService = game:GetService("CorePackages")
local runService = game:GetService("RunService")
local contentProviderService = game:GetService("ContentProvider")
local httpService = game:GetService("HttpService")
local launchGame = require(corePackagesService.Workspace.Packages.GameLaunch).LaunchGame
local reactModule = require(corePackagesService.Packages.React)
local discoveryAnalyticsModule = require(corePackagesService.Workspace.Packages.DiscoveryAnalytics)
local localizationModule = require(corePackagesService.Workspace.Packages.Localization)
local robloxAppHooksModule = require(corePackagesService.Workspace.Packages.RobloxAppHooks)
local roactServiceTagsModule = require(corePackagesService.Workspace.Packages.RoactServiceTags)
local UIBloxModule = require(corePackagesService.Packages.UIBlox)
local foundationModule = require(corePackagesService.Packages.Foundation)
local _ = require(script.Parent.useNextUpSort)
local leaveGameModule = require(script.Parent.Parent.Parent.leaveGame)
local imageOrSkeletonModule = require(script.Parent.ImageOrSkeleton)
local telemetryModule = require(script.Parent.Telemetry)
local addSponsoredFooterOnNextUp = game:DefineFastFlag("AddSponsoredFooterOnNextUp", false)
local fFlagEnableNextUpImageLatencyTelemetryModule = require(script.Parent.Flags.FFlagEnableNextUpImageLatencyTelemetry)
local enableNextUpTileLeaveGameOnTileJoin = game:DefineFastFlag("EnableNextUpTileLeaveGameOnTileJoin", false)
local var17 = if addSponsoredFooterOnNextUp then require(script.Parent.SponsoredFooter) else nil
local appEventIngestService = roactServiceTagsModule.AppEventIngestService
local useLocalization = localizationModule.Hooks.useLocalization
local gamePlayIntent = discoveryAnalyticsModule.Events.gamePlayIntent
local useRoactService = robloxAppHooksModule.useRoactService
local loadableImage = UIBloxModule.App.Loading.LoadableImage
local view = foundationModule.View
local text = foundationModule.Text
local skeleton = foundationModule.Skeleton
local useTokens = foundationModule.Hooks.useTokens

local function _(p0) --[[ line: 39 | named "getRatingText" ]]
	if not p0 then
		return "--"
	end
	local var18 = p0.upVotes + p0.downVotes
	
	return if var18 == 0 then "--" else tostring(math.floor(p0.upVotes / var18 * 100))
end

return reactModule.memo(function(p1) --[[ line: 60 | named "NextUpTile" ]]
	-- upvalues: useRoactService (ref), appEventIngestService (ref), useTokens (ref), useLocalization (ref), fFlagEnableNextUpImageLatencyTelemetryModule (ref), reactModule (ref), contentProviderService (ref), telemetryModule (ref), httpService (ref), gamePlayIntent (ref), enableNextUpTileLeaveGameOnTileJoin (ref), runService (ref), launchGame (ref), leaveGameModule (ref), view (ref), imageOrSkeletonModule (ref), loadableImage (ref), skeleton (ref), text (ref), addSponsoredFooterOnNextUp (ref), var17 (ref)
	local var23
	local var19 = useRoactService(appEventIngestService)
	local var20 = useTokens()
	local t = {}
	local list = { "Feature.GameDetails.RatingPercentOnly" }
	local entryData = p1.entryData
	
	if entryData then
		local var24 = entryData.upVotes + entryData.downVotes
		var23 = if var24 == 0 then "--" else tostring(math.floor(entryData.upVotes / var24 * 100))
	else
		var23 = "--"
	end
	list.percentRating = var23
	t.RatingText = list
	local var25 = useLocalization(t)
	
	if not fFlagEnableNextUpImageLatencyTelemetryModule then
		reactModule.useEffect(function() --[[ line: 72 ]]
			-- upvalues: p1 (ref), contentProviderService (copy)
			if not p1.entryData or not p1.attemptPreloadImage then return end
			local image = p1.entryData.image
			
			if image and image ~= "" then
				contentProviderService:PreloadAsync({ image })
			end
		end, { p1.entryData, p1.attemptPreloadImage })
	end
	local function onJoinGame() --[[ line: 84 ]]
		-- upvalues: p1 (ref), fFlagEnableNextUpImageLatencyTelemetryModule (copy), telemetryModule (copy), httpService (copy), gamePlayIntent (copy), var19 (ref), enableNextUpTileLeaveGameOnTileJoin (copy), runService (copy), launchGame (copy), leaveGameModule (copy)
		if not p1.entryData then return end
		if fFlagEnableNextUpImageLatencyTelemetryModule then
			telemetryModule.logNextUpExitModalAction(telemetryModule.NextUpSortViewActionType.JoinGame)
		end
		local var27 = httpService:GenerateGUID(false):lower()
		gamePlayIntent(var19, "InGameExitPage", {
			placeId = p1.entryData.placeId,
			rootPlaceId = tonumber(p1.entryData.placeId),
			universeId = p1.entryData.universeId,
			sortEntryIndex = tostring(p1.positionIndex),
			gameSetTypeId = p1.topicId,
			joinAttemptId = var27
		})
		
		if enableNextUpTileLeaveGameOnTileJoin then
			if not runService:IsStudio() then
				launchGame(p1.entryData.placeId, nil, { joinAttemptId = var27 }, nil)
			end
			leaveGameModule(false)
			
			return
		elseif runService:IsStudio() then
			leaveGameModule(true)
			
			return
		end
		launchGame(p1.entryData.placeId, nil, { joinAttemptId = var27 }, nil)
	end
	
	return reactModule.createElement(view, {
		tag = "size-0-0 auto-y col gap-small align-x-center",
		LayoutOrder = p1.positionIndex
	}, {
		thumbnail = if fFlagEnableNextUpImageLatencyTelemetryModule then reactModule.createElement(imageOrSkeletonModule, {
			LayoutOrder = 1,
			tag = "radius-medium",
			SizeConstraint = Enum.SizeConstraint.RelativeXX,
			Size = UDim2.fromScale(1, 0.5625),
			onActivated = onJoinGame,
			Image = if p1.entryData then p1.entryData.image else nil,
			onImageStateChanged = if fFlagEnableNextUpImageLatencyTelemetryModule then reactModule.useCallback(function(p2) --[[ line: 122 ]]
				-- upvalues: p1 (ref)
				if p2 and p1.onTileImageLoaded then
					p1.onTileImageLoaded()
				end
			end, { p1.onTileImageLoaded }) else nil
		}) else nil,
		thumbnailContainer = if not fFlagEnableNextUpImageLatencyTelemetryModule then reactModule.createElement(view, {
			LayoutOrder = 1,
			SizeConstraint = Enum.SizeConstraint.RelativeXX,
			Size = UDim2.fromScale(1, 0.5625),
			onActivated = onJoinGame
		}, {
			image = if p1.entryData then reactModule.createElement(loadableImage, {
				BackgroundTransparency = 1,
				useShimmerAnimationWhileLoading = true,
				showFailedStateWhenLoadingFailed = true,
				cornerRadius = UDim.new(0, var20.Radius.Medium),
				Image = p1.entryData.image,
				Size = UDim2.fromScale(1, 1)
			}) else reactModule.createElement(skeleton, { tag = "size-full-full radius-medium" })
		}) else nil,
		titleContainer = reactModule.createElement(view, { tag = "size-full-0 auto-y col", LayoutOrder = 2 }, {
			title = reactModule.createElement(text, {
				tag = "size-full-0 auto-y text-no-wrap text-title-medium content-emphasis text-align-x-left text-truncate-end",
				LayoutOrder = 2,
				Text = if p1.entryData then p1.entryData.name else ""
			}),
			rating = if not addSponsoredFooterOnNextUp then reactModule.createElement(text, {
				tag = "size-full-0 auto-y text-no-wrap text-body-medium content-default text-align-x-left",
				LayoutOrder = 3,
				Text = if p1.entryData then var25.RatingText else ""
			}) else nil,
			footer = if not addSponsoredFooterOnNextUp then if p1.entryData and p1.entryData.isSponsored then reactModule.createElement(var17, { LayoutOrder = 3 }) else reactModule.createElement(text, {
				tag = "size-full-0 auto-y text-no-wrap text-body-medium content-default text-align-x-left",
				LayoutOrder = 3,
				Text = if p1.entryData then var25.RatingText else ""
			}) else nil
		})
	})
end)