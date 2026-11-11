local CorePackages = game:GetService("CorePackages")
local RunService = game:GetService("RunService")
local ContentProvider = game:GetService("ContentProvider")
local HttpService = game:GetService("HttpService")
local LaunchGameFunction = require(CorePackages.Workspace.Packages.GameLaunch).LaunchGame
local ReactModule = require(CorePackages.Packages.React)
local FoundationModule = require(CorePackages.Packages.Foundation)
local _ = require(script.Parent.useNextUpSort)
local LeaveGameModule = require(script.Parent.Parent.Parent.leaveGame)
local ImageOrSkeletonModule = require(script.Parent.ImageOrSkeleton)
local TelemetryModule = require(script.Parent.Telemetry)
local AddSponsoredFooterOnNextUp = game:DefineFastFlag("AddSponsoredFooterOnNextUp", false)
local FFlagEnableNextUpImageLatencyTelemetryModule = require(script.Parent.Flags.FFlagEnableNextUpImageLatencyTelemetry)
local EnableNextUpTileLeaveGameOnTileJoin = game:DefineFastFlag("EnableNextUpTileLeaveGameOnTileJoin", false)
local SponsoredFooterModule = if AddSponsoredFooterOnNextUp then require(script.Parent.SponsoredFooter) else nil
local AppEventIngestService = require(CorePackages.Workspace.Packages.RoactServiceTags).AppEventIngestService
local UseLocalizationFunction = require(CorePackages.Workspace.Packages.Localization).Hooks.useLocalization
local GamePlayIntentFunction = require(CorePackages.Workspace.Packages.DiscoveryAnalytics).Events.gamePlayIntent
local UseRoactServiceFunction = require(CorePackages.Workspace.Packages.RobloxAppHooks).useRoactService
local LoadableImage = require(CorePackages.Packages.UIBlox).App.Loading.LoadableImage
local View = FoundationModule.View
local Text = FoundationModule.Text
local Skeleton = FoundationModule.Skeleton
local UseTokensFunction = FoundationModule.Hooks.useTokens

local function _(p1): string
	if p1 then
		local NewUpVotes = p1.upVotes + p1.downVotes
		
		return if NewUpVotes == 0 then "--" else tostring((math.floor(p1.upVotes / NewUpVotes * 100)))
	else
		return "--"
	end
end

return ReactModule.memo(function(p1)
	-- upvalues: UseRoactServiceFunction (copy), AppEventIngestService (copy), UseTokensFunction (copy), UseLocalizationFunction (copy), FFlagEnableNextUpImageLatencyTelemetryModule (copy), ReactModule (copy), ContentProvider (copy), TelemetryModule (copy), HttpService (copy), GamePlayIntentFunction (copy), EnableNextUpTileLeaveGameOnTileJoin (copy), RunService (copy), LaunchGameFunction (copy), LeaveGameModule (copy), View (copy), ImageOrSkeletonModule (copy), LoadableImage (copy), Skeleton (copy), Text (copy), AddSponsoredFooterOnNextUp (copy), SponsoredFooterModule (copy)
	local UseRoactServiceResult = UseRoactServiceFunction(AppEventIngestService)
	local UseTokensResult = UseTokensFunction()
	local t = {}
	local RatingText = { "Feature.GameDetails.RatingPercentOnly" }
	local EntryData = p1.entryData
	local PercentRating = nil
	
	if EntryData then
		local NewUpVotes = EntryData.upVotes + EntryData.downVotes
		PercentRating = if NewUpVotes == 0 then "--" else tostring((math.floor(EntryData.upVotes / NewUpVotes * 100)))
	else
		PercentRating = "--"
	end
	RatingText.percentRating = PercentRating
	t.RatingText = RatingText
	local UseLocalizationResult = UseLocalizationFunction(t)
	
	if not FFlagEnableNextUpImageLatencyTelemetryModule then
		ReactModule.useEffect(function()
			-- upvalues: p1 (copy), ContentProvider (upval)
			if not p1.entryData or not p1.attemptPreloadImage then return end
			local Image = p1.entryData.image
			
			if Image and Image ~= "" then
				ContentProvider:PreloadAsync({ Image })
			end
		end, { p1.entryData, p1.attemptPreloadImage })
	end
	local function onJoinGame()
		-- upvalues: p1 (copy), FFlagEnableNextUpImageLatencyTelemetryModule (upval), TelemetryModule (upval), HttpService (upval), GamePlayIntentFunction (upval), UseRoactServiceResult (copy), EnableNextUpTileLeaveGameOnTileJoin (upval), RunService (upval), LaunchGameFunction (upval), LeaveGameModule (upval)
		if not p1.entryData then return end
		if FFlagEnableNextUpImageLatencyTelemetryModule then
			TelemetryModule.logNextUpExitModalAction(TelemetryModule.NextUpSortViewActionType.JoinGame)
		end
		local Lowered = HttpService:GenerateGUID(false):lower()
		GamePlayIntentFunction(UseRoactServiceResult, "InGameExitPage", {
			placeId = p1.entryData.placeId,
			rootPlaceId = tonumber(p1.entryData.placeId),
			universeId = p1.entryData.universeId,
			sortEntryIndex = tostring(p1.positionIndex),
			gameSetTypeId = p1.topicId,
			joinAttemptId = Lowered
		})
		
		if EnableNextUpTileLeaveGameOnTileJoin then
			if not RunService:IsStudio() then
				LaunchGameFunction(p1.entryData.placeId, nil, { joinAttemptId = Lowered }, nil)
			end
			LeaveGameModule(false)
			
			return
		elseif RunService:IsStudio() then
			LeaveGameModule(true)
			
			return
		else
			LaunchGameFunction(p1.entryData.placeId, nil, { joinAttemptId = Lowered }, nil)
		end
	end
	
	local UseResult = if FFlagEnableNextUpImageLatencyTelemetryModule then ReactModule.useCallback(function(p2)
		-- upvalues: p1 (copy)
		if p2 and p1.onTileImageLoaded then
			p1.onTileImageLoaded()
		end
	end, { p1.onTileImageLoaded }) else nil
	
	return ReactModule.createElement(View, {
		tag = "size-0-0 auto-y col gap-small align-x-center",
		LayoutOrder = p1.positionIndex
	}, {
		thumbnail = if FFlagEnableNextUpImageLatencyTelemetryModule then ReactModule.createElement(ImageOrSkeletonModule, {
			LayoutOrder = 1,
			tag = "radius-medium",
			SizeConstraint = Enum.SizeConstraint.RelativeXX,
			Size = UDim2.fromScale(1, 0.5625),
			onActivated = onJoinGame,
			Image = if p1.entryData then p1.entryData.image else nil,
			onImageStateChanged = UseResult
		}) else nil,
		thumbnailContainer = if FFlagEnableNextUpImageLatencyTelemetryModule then nil else ReactModule.createElement(View, {
			LayoutOrder = 1,
			SizeConstraint = Enum.SizeConstraint.RelativeXX,
			Size = UDim2.fromScale(1, 0.5625),
			onActivated = onJoinGame
		}, {
			image = if p1.entryData then ReactModule.createElement(LoadableImage, {
				BackgroundTransparency = 1,
				useShimmerAnimationWhileLoading = true,
				showFailedStateWhenLoadingFailed = true,
				cornerRadius = UDim.new(0, UseTokensResult.Radius.Medium),
				Image = p1.entryData.image,
				Size = UDim2.fromScale(1, 1)
			}) else ReactModule.createElement(Skeleton, { tag = "size-full-full radius-medium" })
		}),
		titleContainer = ReactModule.createElement(View, { tag = "size-full-0 auto-y col", LayoutOrder = 2 }, {
			title = ReactModule.createElement(Text, {
				tag = "size-full-0 auto-y text-no-wrap text-title-medium content-emphasis text-align-x-left text-truncate-end",
				LayoutOrder = 2,
				Text = if p1.entryData then p1.entryData.name else ""
			}),
			rating = if AddSponsoredFooterOnNextUp then nil else ReactModule.createElement(Text, {
				tag = "size-full-0 auto-y text-no-wrap text-body-medium content-default text-align-x-left",
				LayoutOrder = 3,
				Text = if p1.entryData then UseLocalizationResult.RatingText else ""
			}),
			footer = if AddSponsoredFooterOnNextUp then if p1.entryData and p1.entryData.isSponsored then ReactModule.createElement(SponsoredFooterModule, { LayoutOrder = 3 }) else ReactModule.createElement(Text, {
				tag = "size-full-0 auto-y text-no-wrap text-body-medium content-default text-align-x-left",
				LayoutOrder = 3,
				Text = if p1.entryData then UseLocalizationResult.RatingText else ""
			}) else nil
		})
	})
end)