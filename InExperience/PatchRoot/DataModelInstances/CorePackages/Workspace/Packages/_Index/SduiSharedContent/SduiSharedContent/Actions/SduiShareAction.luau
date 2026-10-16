local httpService = game:GetService("HttpService")
local playersService = game:GetService("Players")
local userInputService = game:GetService("UserInputService")
local parent = script:FindFirstAncestor("SduiSharedContent").Parent
local discoveryAnalyticsModule = require(parent.DiscoveryAnalytics)
local default = require(parent.ExternalContentSharingProtocol).ExternalContentSharingProtocol.default
local foundationModule = require(parent.Foundation)
local httpRequestModule = require(parent.HttpRequest)
local promiseModule = require(parent.Promise)
local sduiCoreSystemModule = require(parent.SduiCoreSystem)
local urlBuilderModule = require(parent.UrlBuilder)
local sduiActionType = sduiCoreSystemModule.SduiActionType
local sduiErrorType = sduiCoreSystemModule.SduiErrors.SduiErrorType
local getActionTelemetryFieldValue = sduiCoreSystemModule.getActionTelemetryFieldValue
local getSduiPageEntrySnackbarStore = require(parent.SduiSharedUtilities).getSduiPageEntrySnackbarStore
local urlBase = urlBuilderModule.UrlBase
local urlBuilder = urlBuilderModule.UrlBuilder
local gameCopyExperienceLink = discoveryAnalyticsModule.Events.gameCopyExperienceLink
local gameShareExperienceLink = discoveryAnalyticsModule.Events.gameShareExperienceLink

local function _()
	-- upvalues: userInputService (ref)
	local platform = userInputService:GetPlatform()
	
	return if platform ~= Enum.Platform.Windows then if platform ~= Enum.Platform.OSX then platform == Enum.Platform.UWP else true else true
end

local function logExperienceDetailsShareAnalytics(p1, p2, p3, p4)
	-- upvalues: playersService (ref), userInputService (ref), gameCopyExperienceLink (ref), gameShareExperienceLink (ref)
	local localPlayer = playersService.LocalPlayer
	
	if not localPlayer then return end
	local var1 = tostring(localPlayer.UserId)
	local platform = userInputService:GetPlatform()
	
	if if platform ~= Enum.Platform.Windows then if platform ~= Enum.Platform.OSX then platform == Enum.Platform.UWP else true else true then
		gameCopyExperienceLink({ ctx = p2, uid = var1, placeId = p1, stamp = p4 }, p2)
		
		return
	end
	gameShareExperienceLink({
		shareToAppsflyer = true,
		ctx = p2,
		uid = var1,
		placeId = p1,
		shortShareLinkFailed = p3 == nil,
		stamp = p4,
		linkId = p3
	}, p2)
end

local function fetchShareLinkId(p1, p2)
	-- upvalues: urlBuilder (ref), urlBase (ref), httpService (ref), httpRequestModule (ref)
	return httpRequestModule.config({
		requestFunction = function(p3, p4, p5)
			-- upvalues: httpRequestModule (copy)
			return httpRequestModule.requestFunctions.RequestInternal(p3, p4, p5)
		end
	})(urlBuilder.new({
		path = "sharelinks/v1/get-or-create-link",
		base = urlBase.APIS
	})(), "POST", {
		postBody = httpService:JSONEncode({ linkType = p1, data = httpService:JSONEncode(p2) })
	}):andThen(function(p3)
		local responseBody = p3.responseBody or p3.result
		
		if responseBody and responseBody.linkId then
			return responseBody.linkId
		end
		error("Share link response missing linkId")
	end)
end

return function(p1, p2, p3)
	-- upvalues: sduiErrorType (ref), sduiActionType (ref), promiseModule (ref), fetchShareLinkId (ref), urlBuilder (ref), default (ref), userInputService (ref), getSduiPageEntrySnackbarStore (ref), foundationModule (ref), getActionTelemetryFieldValue (ref), logExperienceDetailsShareAnalytics (ref)
	local var1 = if p1 then p1.actionParams else nil
	
	if var1 == nil then
		p3.dependencies.logger.reportError(sduiErrorType.InvalidActionParams, {
			message = "Missing actionParams",
			name = sduiActionType.Share
		}, p3.appPage)
		
		return
	end
	local var2
	local shareLinkData = var1.shareLinkData or {}
	local entryPointKey = var1.entryPointKey or nil
	local shareUrlContext = shareLinkData.shareUrlContext or ""
	local var3 = shareLinkData.linkType ~= nil
	local _ = nil
	local var4 = nil
	local var5 = nil
	
	if var3 then
		local linkType = shareLinkData.linkType
		local linkData = shareLinkData.linkData
		var2 = if linkData == nil then promiseModule.reject(`Missing linkData in ShareLinkFetchData (linkType={linkType})`) else fetchShareLinkId(linkType, linkData):andThen(function(p4)
			-- upvalues: var4 (write), var5 (write), urlBuilder (copy), linkType (ref)
			var4 = p4
			var5 = tostring(DateTime.now().UnixTimestampMillis)
			
			return urlBuilder.sharelinks.shortUrl({ linkId = p4, type = linkType, stamp = var5 })
		end)
	else
		local url = shareLinkData.url
		var2 = if url == nil then promiseModule.reject("Missing url in shareLinkData") else promiseModule.resolve(url)
	end
	var2:andThen(function(p4)
		-- upvalues: default (copy), shareUrlContext (ref), userInputService (copy), entryPointKey (ref), p3 (ref), getSduiPageEntrySnackbarStore (copy), foundationModule (copy), shareLinkData (ref), getActionTelemetryFieldValue (copy), p1 (ref), p2 (ref), logExperienceDetailsShareAnalytics (copy), var4 (write), var5 (write)
		default:shareUrl({ context = shareUrlContext, url = p4 })
		local platform = userInputService:GetPlatform()
		
		if (if platform ~= Enum.Platform.Windows then if platform ~= Enum.Platform.OSX then platform == Enum.Platform.UWP else true else true) and entryPointKey then
			getSduiPageEntrySnackbarStore().show(entryPointKey, {
				title = p3.dependencies.localization:Format("Feature.GameDetails.Toast.LinkCopied"),
				icon = foundationModule.Enums.IconName.CircleCheck
			})
		end
		if shareLinkData.linkType == "ExperienceDetails" then
			local var6 = getActionTelemetryFieldValue(p1, p2, "rootPlaceId") or getActionTelemetryFieldValue(p1, p2, "placeId")
			
			if var6 ~= nil then
				logExperienceDetailsShareAnalytics(tostring(var6), getActionTelemetryFieldValue(p1, p2, "ctx") or "ExperienceDetailsShare", var4, var5)
			end
		end
	end):catch(function(p4)
		-- upvalues: p3 (ref), sduiErrorType (copy), sduiActionType (copy), entryPointKey (ref), getSduiPageEntrySnackbarStore (copy), foundationModule (copy)
		p3.dependencies.logger.reportError(sduiErrorType.FailedToExecuteAction, { name = sduiActionType.Share, message = tostring(p4) }, p3.appPage)
		
		if entryPointKey then
			getSduiPageEntrySnackbarStore().show(entryPointKey, {
				title = p3.dependencies.localization:Format("Feature.Toast.NetworkingError.SomethingIsWrong"),
				icon = foundationModule.Enums.IconName.TriangleExclamation
			})
		end
	end)
end