local Parent = script:FindFirstAncestor("ServerDrivenUi").Parent
local ReactModule = require(Parent.React)
local HttpService = game:GetService("HttpService")
local Players = game:GetService("Players")
local Default = require(Parent.ExternalContentSharingProtocol).ExternalContentSharingProtocol.default
local UrlBuilderModule = require(Parent.UrlBuilder)
local ToastRoduxModule = require(Parent.ToastRodux)
local HttpRequestModule = require(Parent.HttpRequest)
local _ = require(Parent.LuauPolyfill)
local DiscoveryAnalyticsModule = require(Parent.DiscoveryAnalytics)
local DiscoveryUtilsModule = require(Parent.DiscoveryUtils)
local UseDispatchFunction = require(Parent.RoactUtils).Hooks.RoactRodux.useDispatch
local UseAppPolicyFunction = require(Parent.UniversalAppPolicy).useAppPolicy
local UrlBuilder = UrlBuilderModule.UrlBuilder
local UrlBase = UrlBuilderModule.UrlBase
local AppPage = require(Parent.RobloxAppEnums).AppPage
local NavigateDownFunction = require(Parent.NavigationRodux).Thunks.NavigateDown
local FFlagSignalsNavP3Dispatch = require(Parent.SharedFlags).FFlagSignalsNavP3Dispatch
local NavigationCommands = if FFlagSignalsNavP3Dispatch then require(Parent.RobloxAppNavigation).NavigationCommands else nil
local ToastType = ToastRoduxModule.Enums.ToastType
local SetCurrentToastMessageFunction = ToastRoduxModule.Actions.SetCurrentToastMessage
local GameCopyExperienceLinkFunction = DiscoveryAnalyticsModule.Events.gameCopyExperienceLink
local GameShareExperienceLinkFunction = DiscoveryAnalyticsModule.Events.gameShareExperienceLink
local LogResponseErrorFunction = DiscoveryUtilsModule.logResponseError
local DiscoveryEventErrorLogger = DiscoveryUtilsModule.DiscoveryEventErrorLogger

local function fetchShareLinkId(UniverseId)
	-- upvalues: UrlBuilder (copy), UrlBase (copy), HttpService (copy), HttpRequestModule (copy), DiscoveryEventErrorLogger (copy), LogResponseErrorFunction (copy)
	local config = {
		linkType = "ExperienceDetails",
		data = { universeId = UniverseId }
	}
	
	return HttpRequestModule.config({
		requestFunction = function(p1, p2, p3)
			-- upvalues: HttpRequestModule (upval)
			return HttpRequestModule.requestFunctions.RequestInternal(p1, p2, p3)
		end
	})(UrlBuilder.new({
		path = "sharelinks/v1/get-or-create-link",
		base = UrlBase.APIS
	})(), "POST", {
		postBody = HttpService:JSONEncode({
			linkType = config.linkType,
			data = HttpService:JSONEncode(config.data)
		})
	}):andThen(function(Result)
		-- upvalues: DiscoveryEventErrorLogger (upval), UniverseId (copy)
		local ResponseBody = Result.responseBody or Result.result
		
		if ResponseBody and ResponseBody.linkId then
			return ResponseBody.linkId
		else
			DiscoveryEventErrorLogger.reportError("FetchShareLinkIdInvalidResponse", "Share link response missing linkId", {
				universeId = UniverseId,
				responseBody = Result.responseBody or Result.result
			})
			error("Failed to fetch share link id")
		end
	end):catch(function(Err)
		-- upvalues: LogResponseErrorFunction (upval), DiscoveryEventErrorLogger (upval), UniverseId (copy)
		local StatusCode = if type(Err) == "table" and Err.StatusCode then Err.StatusCode else nil
		LogResponseErrorFunction("sharelinks/v1/get-or-create-link", { StatusCode = StatusCode })
		DiscoveryEventErrorLogger.reportError("FetchShareLinkIdFailed", "Failed to fetch share link id", {
			universeId = UniverseId,
			statusCode = StatusCode,
			error = tostring(Err)
		})
		error(Err)
	end)
end

local function generateExperienceDetailsShareLinkUrl(LinkId, UniverseId, PlaceId)
	-- upvalues: UrlBuilder (copy)
	local Stamp: string? = nil
	
	if LinkId then
		Stamp = tostring(DateTime.now().UnixTimestampMillis)
		
		return UrlBuilder.sharelinks.shortUrl({
			type = "ExperienceDetails",
			linkId = LinkId,
			stamp = Stamp
		}), Stamp
	else
		return UrlBuilder.game.info.appsflyer({ universeId = UniverseId, placeId = PlaceId }), Stamp
	end
end

local function handleCopyLink(UniverseId, PlaceId, Ctx, Callback)
	-- upvalues: fetchShareLinkId (copy), generateExperienceDetailsShareLinkUrl (copy), Players (copy), GameCopyExperienceLinkFunction (copy), Default (copy), SetCurrentToastMessageFunction (copy), ToastType (copy)
	fetchShareLinkId(UniverseId):andThen(function(Result)
		-- upvalues: generateExperienceDetailsShareLinkUrl (upval), UniverseId (copy), PlaceId (copy), Players (upval), GameCopyExperienceLinkFunction (upval), Ctx (copy), Default (upval), Callback (copy), SetCurrentToastMessageFunction (upval), ToastType (upval)
		local ExperienceDetailsShareLinkUrl, ExperienceDetailsShareLinkUrl2 = generateExperienceDetailsShareLinkUrl(Result, UniverseId, PlaceId)
		GameCopyExperienceLinkFunction({
			ctx = Ctx,
			uid = tostring(Players.LocalPlayer and Players.LocalPlayer.UserId),
			placeId = PlaceId,
			stamp = ExperienceDetailsShareLinkUrl2
		}, Ctx)
		Default:shareUrl({
			context = "GameDetailsMoreWebURL",
			url = ExperienceDetailsShareLinkUrl
		})
		Callback(SetCurrentToastMessageFunction({
			toastMessage = "Feature.GameDetails.Toast.LinkCopied",
			toastType = ToastType.SuccessConfirmation
		}))
	end):catch(function(_)
		-- upvalues: Callback (copy), SetCurrentToastMessageFunction (upval), ToastType (upval)
		Callback(SetCurrentToastMessageFunction({
			toastMessage = "Feature.Toast.NetworkingError.SomethingIsWrong",
			toastType = ToastType.NetworkingError
		}))
	end)
end

return function(UniverseId, PlaceId, Ctx)
	-- upvalues: UseDispatchFunction (copy), UseAppPolicyFunction (copy), ReactModule (copy), handleCopyLink (copy), AppPage (copy), FFlagSignalsNavP3Dispatch (copy), NavigationCommands (copy), NavigateDownFunction (copy), fetchShareLinkId (copy), generateExperienceDetailsShareLinkUrl (copy), Players (copy), GameShareExperienceLinkFunction (copy), Default (copy), UrlBuilder (copy)
	local UseDispatchResult = UseDispatchFunction()
	local UseAppPolicyResult = UseAppPolicyFunction(function(p1)
		return p1.shouldShareToAccountProvider()
	end)
	
	return ReactModule.useCallback(function()
		-- upvalues: PlaceId (copy), UseAppPolicyResult (copy), handleCopyLink (upval), UniverseId (copy), Ctx (copy), UseDispatchResult (copy), AppPage (upval), FFlagSignalsNavP3Dispatch (upval), NavigationCommands (upval), NavigateDownFunction (upval), fetchShareLinkId (upval), generateExperienceDetailsShareLinkUrl (upval), Players (upval), GameShareExperienceLinkFunction (upval), Default (upval), UrlBuilder (upval)
		if not PlaceId then return end
		if not UseAppPolicyResult then
			handleCopyLink(UniverseId, PlaceId, Ctx, UseDispatchResult)
			
			return
		end
		if not UseAppPolicyResult then
			fetchShareLinkId(UniverseId):andThen(function(Result)
				-- upvalues: generateExperienceDetailsShareLinkUrl (upval), UniverseId (upval), PlaceId (upval), Players (upval), GameShareExperienceLinkFunction (upval), Ctx (upval), Default (upval)
				local ExperienceDetailsShareLinkUrl, ExperienceDetailsShareLinkUrl2 = generateExperienceDetailsShareLinkUrl(Result, UniverseId, PlaceId)
				GameShareExperienceLinkFunction({
					shareToAppsflyer = true,
					ctx = Ctx,
					uid = tostring(Players.LocalPlayer and Players.LocalPlayer.UserId),
					placeId = PlaceId,
					shortShareLinkFailed = not Result,
					stamp = ExperienceDetailsShareLinkUrl2,
					linkId = Result
				}, Ctx)
				Default:shareUrl({
					context = "GameDetailsMoreWebURL",
					url = ExperienceDetailsShareLinkUrl
				})
			end):catch(function(_)
				-- upvalues: UniverseId (upval), PlaceId (upval), UrlBuilder (upval), Players (upval), GameShareExperienceLinkFunction (upval), Ctx (upval), Default (upval)
				local AppsflyerResult = UrlBuilder.game.info.appsflyer({ universeId = UniverseId, placeId = PlaceId })
				GameShareExperienceLinkFunction({
					shortShareLinkFailed = true,
					shareToAppsflyer = true,
					linkId = nil,
					ctx = Ctx,
					uid = tostring(Players.LocalPlayer and Players.LocalPlayer.UserId),
					placeId = PlaceId,
					stamp = nil
				}, Ctx)
				Default:shareUrl({ context = "GameDetailsMoreWebURL", url = AppsflyerResult })
			end)
			
			return
		end
		local config = {
			name = AppPage.SdkShare,
			extraProps = {
				context = "GameDetailsMoreWebURL",
				universeId = UniverseId
			}
		}
		
		if FFlagSignalsNavP3Dispatch then
			NavigationCommands.down(NavigationCommands.fromLegacyPage(config))
			
			return
		else
			UseDispatchResult(NavigateDownFunction(config))
		end
	end, {
		UniverseId,
		PlaceId,
		UseAppPolicyResult,
		UseDispatchResult,
		Ctx
	})
end