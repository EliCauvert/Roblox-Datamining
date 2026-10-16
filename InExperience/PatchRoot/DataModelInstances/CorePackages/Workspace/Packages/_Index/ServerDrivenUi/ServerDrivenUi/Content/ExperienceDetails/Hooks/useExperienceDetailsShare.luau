local parent = script:FindFirstAncestor("ServerDrivenUi").Parent
local reactModule = require(parent.React)
local roactUtilsModule = require(parent.RoactUtils)
local universalAppPolicyModule = require(parent.UniversalAppPolicy)
local httpService = game:GetService("HttpService")
local playersService = game:GetService("Players")
local default = require(parent.ExternalContentSharingProtocol).ExternalContentSharingProtocol.default
local urlBuilderModule = require(parent.UrlBuilder)
local robloxAppEnumsModule = require(parent.RobloxAppEnums)
local navigationRoduxModule = require(parent.NavigationRodux)
local toastRoduxModule = require(parent.ToastRodux)
local httpRequestModule = require(parent.HttpRequest)
local _ = require(parent.LuauPolyfill)
local discoveryAnalyticsModule = require(parent.DiscoveryAnalytics)
local discoveryUtilsModule = require(parent.DiscoveryUtils)
local useDispatch = roactUtilsModule.Hooks.RoactRodux.useDispatch
local useAppPolicy = universalAppPolicyModule.useAppPolicy
local urlBuilder = urlBuilderModule.UrlBuilder
local urlBase = urlBuilderModule.UrlBase
local appPage = robloxAppEnumsModule.AppPage
local navigateDown = navigationRoduxModule.Thunks.NavigateDown
local fFlagSignalsNavP3Dispatch = require(parent.SharedFlags).FFlagSignalsNavP3Dispatch
local var1 = if fFlagSignalsNavP3Dispatch then require(parent.RobloxAppNavigation).NavigationCommands else nil
local toastType = toastRoduxModule.Enums.ToastType
local setCurrentToastMessage = toastRoduxModule.Actions.SetCurrentToastMessage
local gameCopyExperienceLink = discoveryAnalyticsModule.Events.gameCopyExperienceLink
local gameShareExperienceLink = discoveryAnalyticsModule.Events.gameShareExperienceLink
local logResponseError = discoveryUtilsModule.logResponseError
local discoveryEventErrorLogger = discoveryUtilsModule.DiscoveryEventErrorLogger

local function fetchShareLinkId(p1)
	-- upvalues: urlBuilder (ref), urlBase (ref), httpService (ref), httpRequestModule (ref), discoveryEventErrorLogger (ref), logResponseError (ref)
	local t = {
		linkType = "ExperienceDetails",
		data = { universeId = p1 }
	}
	
	return httpRequestModule.config({
		requestFunction = function(p2, p3, p4)
			-- upvalues: httpRequestModule (copy)
			return httpRequestModule.requestFunctions.RequestInternal(p2, p3, p4)
		end
	})(urlBuilder.new({
		path = "sharelinks/v1/get-or-create-link",
		base = urlBase.APIS
	})(), "POST", {
		postBody = httpService:JSONEncode({
			linkType = t.linkType,
			data = httpService:JSONEncode(t.data)
		})
	}):andThen(function(p2)
		-- upvalues: discoveryEventErrorLogger (copy), p1 (ref)
		local responseBody = p2.responseBody or p2.result
		
		if responseBody and responseBody.linkId then
			return responseBody.linkId
		end
		discoveryEventErrorLogger.reportError("FetchShareLinkIdInvalidResponse", "Share link response missing linkId", {
			universeId = p1,
			responseBody = p2.responseBody or p2.result
		})
		error("Failed to fetch share link id")
	end):catch(function(p2)
		-- upvalues: logResponseError (copy), discoveryEventErrorLogger (copy), p1 (ref)
		local var2 = if type(p2) == "table" and p2.StatusCode then p2.StatusCode else nil
		logResponseError("sharelinks/v1/get-or-create-link", { StatusCode = var2 })
		discoveryEventErrorLogger.reportError("FetchShareLinkIdFailed", "Failed to fetch share link id", {
			universeId = p1,
			statusCode = var2,
			error = tostring(p2)
		})
		error(p2)
	end)
end

local function generateExperienceDetailsShareLinkUrl(p1, p2, p3)
	-- upvalues: urlBuilder (ref)
	local _ = nil
	local var2 = nil
	
	if p1 then
		var2 = tostring(DateTime.now().UnixTimestampMillis)
		
		return urlBuilder.sharelinks.shortUrl({ type = "ExperienceDetails", linkId = p1, stamp = var2 }), var2
	end
	return urlBuilder.game.info.appsflyer({ universeId = p2, placeId = p3 }), var2
end

local function handleCopyLink(p1, p2, p3, p4)
	-- upvalues: fetchShareLinkId (ref), generateExperienceDetailsShareLinkUrl (ref), playersService (ref), gameCopyExperienceLink (ref), default (ref), setCurrentToastMessage (ref), toastType (ref)
	fetchShareLinkId(p1):andThen(function(p5)
		-- upvalues: generateExperienceDetailsShareLinkUrl (copy), p1 (ref), p2 (ref), playersService (copy), gameCopyExperienceLink (copy), p3 (ref), default (copy), p4 (ref), setCurrentToastMessage (copy), toastType (copy)
		local var2, var3 = generateExperienceDetailsShareLinkUrl(p5, p1, p2)
		gameCopyExperienceLink({
			ctx = p3,
			uid = tostring(playersService.LocalPlayer and playersService.LocalPlayer.UserId),
			placeId = p2,
			stamp = var3
		}, p3)
		default:shareUrl({ context = "GameDetailsMoreWebURL", url = var2 })
		p4(setCurrentToastMessage({
			toastMessage = "Feature.GameDetails.Toast.LinkCopied",
			toastType = toastType.SuccessConfirmation
		}))
	end):catch(function(_)
		-- upvalues: p4 (ref), setCurrentToastMessage (copy), toastType (copy)
		p4(setCurrentToastMessage({
			toastMessage = "Feature.Toast.NetworkingError.SomethingIsWrong",
			toastType = toastType.NetworkingError
		}))
	end)
end

return function(p1, p2, p3)
	-- upvalues: useDispatch (ref), useAppPolicy (ref), reactModule (ref), handleCopyLink (ref), appPage (ref), fFlagSignalsNavP3Dispatch (ref), var1 (ref), navigateDown (ref), fetchShareLinkId (ref), generateExperienceDetailsShareLinkUrl (ref), playersService (ref), gameShareExperienceLink (ref), default (ref), urlBuilder (ref)
	local var2 = useDispatch()
	local var3 = useAppPolicy(function(p4)
		return p4.shouldShareToAccountProvider()
	end)
	
	return reactModule.useCallback(function()
		-- upvalues: p2 (ref), var3 (ref), handleCopyLink (copy), p1 (ref), p3 (ref), var2 (ref), appPage (copy), fFlagSignalsNavP3Dispatch (copy), var1 (copy), navigateDown (copy), fetchShareLinkId (copy), generateExperienceDetailsShareLinkUrl (copy), playersService (copy), gameShareExperienceLink (copy), default (copy), urlBuilder (copy)
		if not p2 then return end
		if not var3 then
			handleCopyLink(p1, p2, p3, var2)
			
			return
		elseif not var3 then
			fetchShareLinkId(p1):andThen(function(p4)
				-- upvalues: generateExperienceDetailsShareLinkUrl (copy), p1 (copy), p2 (copy), playersService (copy), gameShareExperienceLink (copy), p3 (copy), default (copy)
				local var4, var5 = generateExperienceDetailsShareLinkUrl(p4, p1, p2)
				gameShareExperienceLink({
					shareToAppsflyer = true,
					ctx = p3,
					uid = tostring(playersService.LocalPlayer and playersService.LocalPlayer.UserId),
					placeId = p2,
					shortShareLinkFailed = not p4,
					stamp = var5,
					linkId = p4
				}, p3)
				default:shareUrl({ context = "GameDetailsMoreWebURL", url = var4 })
			end):catch(function(_)
				-- upvalues: p1 (copy), p2 (copy), urlBuilder (copy), playersService (copy), gameShareExperienceLink (copy), p3 (copy), default (copy)
				local _ = nil
				local var4 = urlBuilder.game.info.appsflyer({ universeId = p1, placeId = p2 })
				gameShareExperienceLink({
					shortShareLinkFailed = true,
					shareToAppsflyer = true,
					linkId = nil,
					ctx = p3,
					uid = tostring(playersService.LocalPlayer and playersService.LocalPlayer.UserId),
					placeId = p2,
					stamp = nil
				}, p3)
				default:shareUrl({ context = "GameDetailsMoreWebURL", url = var4 })
			end)
			
			return
		end
		local t = {
			name = appPage.SdkShare,
			extraProps = { context = "GameDetailsMoreWebURL", universeId = p1 }
		}
		
		if fFlagSignalsNavP3Dispatch then
			var1.down(var1.fromLegacyPage(t))
			
			return
		end
		var2(navigateDown(t))
	end, {
		p1,
		p2,
		var3,
		var2,
		p3
	})
end