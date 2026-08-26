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
local sharedFlagsModule = require(parent.SharedFlags)
local sduiActionType = sduiCoreSystemModule.SduiActionType
local sduiErrorType = sduiCoreSystemModule.SduiErrors.SduiErrorType
local getActionTelemetryFieldValue = sduiCoreSystemModule.getActionTelemetryFieldValue
local getSduiPageEntrySnackbarStore = require(parent.SduiSharedUtilities).getSduiPageEntrySnackbarStore
local urlBase = urlBuilderModule.UrlBase
local urlBuilder = urlBuilderModule.UrlBuilder
local gameCopyExperienceLink = discoveryAnalyticsModule.Events.gameCopyExperienceLink
local gameShareExperienceLink = discoveryAnalyticsModule.Events.gameShareExperienceLink
local fFlagSduiExperienceDetailsSupport = sharedFlagsModule.FFlagSduiExperienceDetailsSupport
local fFlagSduiEventDetailsSupport = sharedFlagsModule.FFlagSduiEventDetailsSupport

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

local function handleGenericShare(p1, p2, p3, p4)
	-- upvalues: sduiErrorType (ref), sduiActionType (ref), default (ref), userInputService (ref), getSduiPageEntrySnackbarStore (ref), foundationModule (ref)
	local url = p2 and p2.url
	local shareUrlContext = p2 and p2.shareUrlContext
	
	if url == nil then
		p4.dependencies.logger.reportError(sduiErrorType.InvalidActionParams, {
			name = sduiActionType.Share,
			message = `Missing url in shareLinkData for {p1} share type`
		}, p4.appPage)
		
		return
	elseif shareUrlContext == nil then
		p4.dependencies.logger.reportError(sduiErrorType.InvalidActionParams, {
			name = sduiActionType.Share,
			message = `Missing shareUrlContext in shareLinkData for {p1} share type`
		}, p4.appPage)
		
		return
	end
	default:shareUrl({ context = shareUrlContext, url = url })
	local platform = userInputService:GetPlatform()
	
	if if platform ~= Enum.Platform.Windows then if platform ~= Enum.Platform.OSX then platform == Enum.Platform.UWP else true else true then
		if p3 == nil then
			p4.dependencies.logger.reportError(sduiErrorType.InvalidActionParams, {
				message = "Missing entryPointKey in SduiShareAction",
				name = sduiActionType.Share
			}, p4.appPage)
			
			return
		end
		getSduiPageEntrySnackbarStore().show(p3, {
			title = p4.dependencies.localization:Format("Feature.GameDetails.Toast.LinkCopied"),
			icon = foundationModule.Enums.IconName.CircleCheck
		})
	end
end

local function fetchShareLinkId(p5, p6)
	-- upvalues: urlBuilder (ref), urlBase (ref), httpService (ref), httpRequestModule (ref)
	return httpRequestModule.config({
		requestFunction = function(p7, p8, p9)
			-- upvalues: httpRequestModule (copy)
			return httpRequestModule.requestFunctions.RequestInternal(p7, p8, p9)
		end
	})(urlBuilder.new({
		path = "sharelinks/v1/get-or-create-link",
		base = urlBase.APIS
	})(), "POST", {
		postBody = httpService:JSONEncode({ linkType = p5, data = httpService:JSONEncode(p6) })
	}):andThen(function(p7)
		local responseBody = p7.responseBody or p7.result
		
		if responseBody and responseBody.linkId then
			return responseBody.linkId
		end
		error("Share link response missing linkId")
	end)
end

return function(p5, p6, p7)
	-- upvalues: sduiErrorType (ref), sduiActionType (ref), fFlagSduiExperienceDetailsSupport (ref), fFlagSduiEventDetailsSupport (ref), promiseModule (ref), fetchShareLinkId (ref), urlBuilder (ref), default (ref), userInputService (ref), getSduiPageEntrySnackbarStore (ref), foundationModule (ref), getActionTelemetryFieldValue (ref), logExperienceDetailsShareAnalytics (ref), handleGenericShare (ref)
	local var1 = if p5 then p5.actionParams else nil
	
	if var1 == nil then
		p7.dependencies.logger.reportError(sduiErrorType.InvalidActionParams, {
			message = "Missing actionParams",
			name = sduiActionType.Share
		}, p7.appPage)
		
		return
	elseif not fFlagSduiExperienceDetailsSupport and not fFlagSduiEventDetailsSupport then
		handleGenericShare(var1.shareLinkType, var1.shareLinkData or {}, var1.entryPointKey or nil, p7)
		
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
		var2 = if linkData == nil then promiseModule.reject(`Missing linkData in ShareLinkFetchData (linkType={linkType})`) else fetchShareLinkId(linkType, linkData):andThen(function(p8)
			-- upvalues: var4 (write), var5 (write), urlBuilder (copy), linkType (ref)
			var4 = p8
			var5 = tostring(DateTime.now().UnixTimestampMillis)
			
			return urlBuilder.sharelinks.shortUrl({ linkId = p8, type = linkType, stamp = var5 })
		end)
	else
		local url = shareLinkData.url
		var2 = if url == nil then promiseModule.reject("Missing url in shareLinkData") else promiseModule.resolve(url)
	end
	var2:andThen(function(p8)
		-- upvalues: default (copy), shareUrlContext (ref), userInputService (copy), entryPointKey (ref), p7 (ref), getSduiPageEntrySnackbarStore (copy), foundationModule (copy), shareLinkData (ref), getActionTelemetryFieldValue (copy), p5 (ref), p6 (ref), logExperienceDetailsShareAnalytics (copy), var4 (write), var5 (write)
		default:shareUrl({ context = shareUrlContext, url = p8 })
		local platform = userInputService:GetPlatform()
		
		if (if platform ~= Enum.Platform.Windows then if platform ~= Enum.Platform.OSX then platform == Enum.Platform.UWP else true else true) and entryPointKey then
			getSduiPageEntrySnackbarStore().show(entryPointKey, {
				title = p7.dependencies.localization:Format("Feature.GameDetails.Toast.LinkCopied"),
				icon = foundationModule.Enums.IconName.CircleCheck
			})
		end
		if shareLinkData.linkType == "ExperienceDetails" then
			local var6 = getActionTelemetryFieldValue(p5, p6, "rootPlaceId") or getActionTelemetryFieldValue(p5, p6, "placeId")
			
			if var6 ~= nil then
				logExperienceDetailsShareAnalytics(tostring(var6), getActionTelemetryFieldValue(p5, p6, "ctx") or "ExperienceDetailsShare", var4, var5)
			end
		end
	end):catch(function(p8)
		-- upvalues: p7 (ref), sduiErrorType (copy), sduiActionType (copy), entryPointKey (ref), getSduiPageEntrySnackbarStore (copy), foundationModule (copy)
		p7.dependencies.logger.reportError(sduiErrorType.FailedToExecuteAction, { name = sduiActionType.Share, message = tostring(p8) }, p7.appPage)
		
		if entryPointKey then
			getSduiPageEntrySnackbarStore().show(entryPointKey, {
				title = p7.dependencies.localization:Format("Feature.Toast.NetworkingError.SomethingIsWrong"),
				icon = foundationModule.Enums.IconName.TriangleExclamation
			})
		end
	end)
end