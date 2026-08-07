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
local var12 = if fFlagSignalsNavP3Dispatch then require(parent.RobloxAppNavigation).NavigationCommands else nil
local toastType = toastRoduxModule.Enums.ToastType
local setCurrentToastMessage = toastRoduxModule.Actions.SetCurrentToastMessage
local gameCopyExperienceLink = discoveryAnalyticsModule.Events.gameCopyExperienceLink
local gameShareExperienceLink = discoveryAnalyticsModule.Events.gameShareExperienceLink
local logResponseError = discoveryUtilsModule.logResponseError
local discoveryEventErrorLogger = discoveryUtilsModule.DiscoveryEventErrorLogger

local function fetchShareLinkId(p0) --[[ line: 44 ]]
	-- upvalues: urlBuilder (ref), urlBase (ref), httpService (ref), httpRequestModule (ref), discoveryEventErrorLogger (ref), logResponseError (ref)
	local t = {
		linkType = "ExperienceDetails",
		data = { universeId = p0 }
	}
	
	return httpRequestModule.config({
		requestFunction = function(p3, p4, p5) --[[ line: 63 ]]
			-- upvalues: httpRequestModule (copy)
			return httpRequestModule.requestFunctions.RequestInternal(p3, p4, p5)
		end
	})(urlBuilder.new({
		path = "sharelinks/v1/get-or-create-link",
		base = urlBase.APIS
	})(), "POST", {
		postBody = httpService:JSONEncode({
			linkType = t.linkType,
			data = httpService:JSONEncode(t.data)
		})
	}):andThen(function(p2) --[[ line: 71 ]]
		-- upvalues: discoveryEventErrorLogger (copy), p0 (ref)
		local responseBody = p2.responseBody or p2.result
		
		if responseBody and responseBody.linkId then
			return responseBody.linkId
		end
		discoveryEventErrorLogger.reportError("FetchShareLinkIdInvalidResponse", "Share link response missing linkId", {
			universeId = p0,
			responseBody = p2.responseBody or p2.result
		})
		error("Failed to fetch share link id")
	end):catch(function(p1) --[[ line: 87 ]]
		-- upvalues: logResponseError (copy), discoveryEventErrorLogger (copy), p0 (ref)
		local var17 = if type(p1) == "table" and p1.StatusCode then p1.StatusCode else nil
		logResponseError("sharelinks/v1/get-or-create-link", { StatusCode = var17 })
		discoveryEventErrorLogger.reportError("FetchShareLinkIdFailed", "Failed to fetch share link id", {
			universeId = p0,
			statusCode = var17,
			error = tostring(p1)
		})
		error(p1)
	end)
end

local function generateExperienceDetailsShareLinkUrl(p6, p7, p8) --[[ line: 99 ]]
	-- upvalues: urlBuilder (ref)
	local _ = nil
	local var19 = nil
	
	if p6 then
		var19 = tostring(DateTime.now().UnixTimestampMillis)
		
		return urlBuilder.sharelinks.shortUrl({ type = "ExperienceDetails", linkId = p6, stamp = var19 }), var19
	end
	return urlBuilder.game.info.appsflyer({ universeId = p7, placeId = p8 }), var19
end

local function handleCopyLink(p9, p10, p11, p12) --[[ line: 117 ]]
	-- upvalues: fetchShareLinkId (ref), generateExperienceDetailsShareLinkUrl (ref), playersService (ref), gameCopyExperienceLink (ref), default (ref), setCurrentToastMessage (ref), toastType (ref)
	fetchShareLinkId(p9):andThen(function(p13) --[[ line: 119 ]]
		-- upvalues: generateExperienceDetailsShareLinkUrl (copy), p9 (ref), p10 (ref), playersService (copy), gameCopyExperienceLink (copy), p11 (ref), default (copy), p12 (ref), setCurrentToastMessage (copy), toastType (copy)
		local var20, var21 = generateExperienceDetailsShareLinkUrl(p13, p9, p10)
		gameCopyExperienceLink({
			ctx = p11,
			uid = tostring(playersService.LocalPlayer and playersService.LocalPlayer.UserId),
			placeId = p10,
			stamp = var21
		}, p11)
		default:shareUrl({ context = "GameDetailsMoreWebURL", url = var20 })
		p12(setCurrentToastMessage({
			toastMessage = "Feature.GameDetails.Toast.LinkCopied",
			toastType = toastType.SuccessConfirmation
		}))
	end):catch(function(_) --[[ line: 140 ]]
		-- upvalues: p12 (ref), setCurrentToastMessage (copy), toastType (copy)
		p12(setCurrentToastMessage({
			toastMessage = "Feature.Toast.NetworkingError.SomethingIsWrong",
			toastType = toastType.NetworkingError
		}))
	end)
end

return function(p14, p15, p16) --[[ line: 153 | named "useExperienceDetailsShare" ]]
	-- upvalues: useDispatch (ref), useAppPolicy (ref), reactModule (ref), handleCopyLink (ref), appPage (ref), fFlagSignalsNavP3Dispatch (ref), var12 (ref), navigateDown (ref), fetchShareLinkId (ref), generateExperienceDetailsShareLinkUrl (ref), playersService (ref), gameShareExperienceLink (ref), default (ref), urlBuilder (ref)
	local var22 = useDispatch()
	local var23 = useAppPolicy(function(p17) --[[ line: 159 ]]
		return p17.shouldShareToAccountProvider()
	end)
	
	return reactModule.useCallback(function() --[[ line: 163 ]]
		-- upvalues: p15 (ref), var23 (ref), handleCopyLink (copy), p14 (ref), p16 (ref), var22 (ref), appPage (copy), fFlagSignalsNavP3Dispatch (copy), var12 (copy), navigateDown (copy), fetchShareLinkId (copy), generateExperienceDetailsShareLinkUrl (copy), playersService (copy), gameShareExperienceLink (copy), default (copy), urlBuilder (copy)
		if not p15 then return end
		if not var23 then
			handleCopyLink(p14, p15, p16, var22)
			
			return
		elseif not var23 then
			fetchShareLinkId(p14):andThen(function(p18) --[[ line: 191 ]]
				-- upvalues: generateExperienceDetailsShareLinkUrl (copy), p14 (copy), p15 (copy), playersService (copy), gameShareExperienceLink (copy), p16 (copy), default (copy)
				local var26, var27 = generateExperienceDetailsShareLinkUrl(p18, p14, p15)
				gameShareExperienceLink({
					shareToAppsflyer = true,
					ctx = p16,
					uid = tostring(playersService.LocalPlayer and playersService.LocalPlayer.UserId),
					placeId = p15,
					shortShareLinkFailed = not p18,
					stamp = var27,
					linkId = p18
				}, p16)
				default:shareUrl({ context = "GameDetailsMoreWebURL", url = var26 })
			end):catch(function(_) --[[ line: 213 ]]
				-- upvalues: p14 (copy), p15 (copy), urlBuilder (copy), playersService (copy), gameShareExperienceLink (copy), p16 (copy), default (copy)
				local _ = nil
				local var25 = urlBuilder.game.info.appsflyer({ universeId = p14, placeId = p15 })
				gameShareExperienceLink({
					shortShareLinkFailed = true,
					shareToAppsflyer = true,
					linkId = nil,
					ctx = p16,
					uid = tostring(playersService.LocalPlayer and playersService.LocalPlayer.UserId),
					placeId = p15,
					stamp = nil
				}, p16)
				default:shareUrl({ context = "GameDetailsMoreWebURL", url = var25 })
			end)
			
			return
		end
		local t = {
			name = appPage.SdkShare,
			extraProps = { context = "GameDetailsMoreWebURL", universeId = p14 }
		}
		
		if fFlagSignalsNavP3Dispatch then
			var12.down(var12.fromLegacyPage(t))
			
			return
		end
		var22(navigateDown(t))
	end, {
		p14,
		p15,
		var23,
		var22,
		p16
	})
end