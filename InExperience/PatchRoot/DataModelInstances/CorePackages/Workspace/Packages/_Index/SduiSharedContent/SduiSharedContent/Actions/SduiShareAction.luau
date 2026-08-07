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

local function _() --[[ line: 38 | named "isDesktopPlatform" ]]
	-- upvalues: userInputService (ref)
	local platform = userInputService:GetPlatform()
	
	return if platform ~= Enum.Platform.Windows then if platform ~= Enum.Platform.OSX then platform == Enum.Platform.UWP else true else true
end

local function logExperienceDetailsShareAnalytics(p0, p1, p2, p3) --[[ line: 45 ]]
	-- upvalues: playersService (ref), userInputService (ref), gameCopyExperienceLink (ref), gameShareExperienceLink (ref)
	local localPlayer = playersService.LocalPlayer
	
	if not localPlayer then return end
	local var14 = tostring(localPlayer.UserId)
	local platform = userInputService:GetPlatform()
	
	if if platform ~= Enum.Platform.Windows then if platform ~= Enum.Platform.OSX then platform == Enum.Platform.UWP else true else true then
		gameCopyExperienceLink({ ctx = p1, uid = var14, placeId = p0, stamp = p3 }, p1)
		
		return
	end
	gameShareExperienceLink({
		shareToAppsflyer = true,
		ctx = p1,
		uid = var14,
		placeId = p0,
		shortShareLinkFailed = p2 == nil,
		stamp = p3,
		linkId = p2
	}, p1)
end

local function handleGenericShare(p4, p5, p6, p7) --[[ line: 77 ]]
	-- upvalues: sduiErrorType (ref), sduiActionType (ref), default (ref), userInputService (ref), getSduiPageEntrySnackbarStore (ref), foundationModule (ref)
	local url = p5 and p5.url
	local shareUrlContext = p5 and p5.shareUrlContext
	
	if url == nil then
		p7.dependencies.logger.reportError(sduiErrorType.InvalidActionParams, {
			name = sduiActionType.Share,
			message = `Missing url in shareLinkData for {p4} share type`
		}, p7.appPage)
		
		return
	elseif shareUrlContext == nil then
		p7.dependencies.logger.reportError(sduiErrorType.InvalidActionParams, {
			name = sduiActionType.Share,
			message = `Missing shareUrlContext in shareLinkData for {p4} share type`
		}, p7.appPage)
		
		return
	end
	default:shareUrl({ context = shareUrlContext, url = url })
	local platform = userInputService:GetPlatform()
	
	if if platform ~= Enum.Platform.Windows then if platform ~= Enum.Platform.OSX then platform == Enum.Platform.UWP else true else true then
		if p6 == nil then
			p7.dependencies.logger.reportError(sduiErrorType.InvalidActionParams, {
				message = "Missing entryPointKey in SduiShareAction",
				name = sduiActionType.Share
			}, p7.appPage)
			
			return
		end
		getSduiPageEntrySnackbarStore().show(p6, {
			title = p7.dependencies.localization:Format("Feature.GameDetails.Toast.LinkCopied"),
			icon = foundationModule.Enums.IconName.CircleCheck
		})
	end
end

local function fetchShareLinkId(p8, p9) --[[ line: 131 ]]
	-- upvalues: urlBuilder (ref), urlBase (ref), httpService (ref), httpRequestModule (ref)
	return httpRequestModule.config({
		requestFunction = function(p11, p12, p13) --[[ line: 143 ]]
			-- upvalues: httpRequestModule (copy)
			return httpRequestModule.requestFunctions.RequestInternal(p11, p12, p13)
		end
	})(urlBuilder.new({
		path = "sharelinks/v1/get-or-create-link",
		base = urlBase.APIS
	})(), "POST", {
		postBody = httpService:JSONEncode({ linkType = p8, data = httpService:JSONEncode(p9) })
	}):andThen(function(p10) --[[ line: 148 ]]
		local responseBody = p10.responseBody or p10.result
		
		if responseBody and responseBody.linkId then
			return responseBody.linkId
		end
		error("Share link response missing linkId")
	end)
end

return function(p14, p15, p16) --[[ line: 158 ]]
	-- upvalues: sduiErrorType (ref), sduiActionType (ref), fFlagSduiExperienceDetailsSupport (ref), fFlagSduiEventDetailsSupport (ref), promiseModule (ref), fetchShareLinkId (ref), urlBuilder (ref), default (ref), userInputService (ref), getSduiPageEntrySnackbarStore (ref), foundationModule (ref), getActionTelemetryFieldValue (ref), logExperienceDetailsShareAnalytics (ref), handleGenericShare (ref)
	local var20 = if p14 then p14.actionParams else nil
	
	if var20 == nil then
		p16.dependencies.logger.reportError(sduiErrorType.InvalidActionParams, {
			message = "Missing actionParams",
			name = sduiActionType.Share
		}, p16.appPage)
		
		return
	elseif not fFlagSduiExperienceDetailsSupport and not fFlagSduiEventDetailsSupport then
		handleGenericShare(var20.shareLinkType, var20.shareLinkData or {}, var20.entryPointKey or nil, p16)
		
		return
	end
	local var27
	local shareLinkData = var20.shareLinkData or {}
	local entryPointKey = var20.entryPointKey or nil
	local shareUrlContext = shareLinkData.shareUrlContext or ""
	local var24 = shareLinkData.linkType ~= nil
	local _ = nil
	local var25 = nil
	local var26 = nil
	
	if var24 then
		local linkType = shareLinkData.linkType
		local linkData = shareLinkData.linkData
		var27 = if linkData == nil then promiseModule.reject(`Missing linkData in ShareLinkFetchData (linkType={linkType})`) else fetchShareLinkId(linkType, linkData):andThen(function(p17) --[[ line: 190 ]]
			-- upvalues: var25 (write), var26 (write), urlBuilder (copy), linkType (ref)
			var25 = p17
			var26 = tostring(DateTime.now().UnixTimestampMillis)
			
			return urlBuilder.sharelinks.shortUrl({ linkId = p17, type = linkType, stamp = var26 })
		end)
	else
		local url = shareLinkData.url
		var27 = if url == nil then promiseModule.reject("Missing url in shareLinkData") else promiseModule.resolve(url)
	end
	var27:andThen(function(p19) --[[ line: 210 ]]
		-- upvalues: default (copy), shareUrlContext (ref), userInputService (copy), entryPointKey (ref), p16 (ref), getSduiPageEntrySnackbarStore (copy), foundationModule (copy), shareLinkData (ref), getActionTelemetryFieldValue (copy), p14 (ref), p15 (ref), logExperienceDetailsShareAnalytics (copy), var25 (write), var26 (write)
		default:shareUrl({ context = shareUrlContext, url = p19 })
		local platform = userInputService:GetPlatform()
		
		if (if platform ~= Enum.Platform.Windows then if platform ~= Enum.Platform.OSX then platform == Enum.Platform.UWP else true else true) and entryPointKey then
			getSduiPageEntrySnackbarStore().show(entryPointKey, {
				title = p16.dependencies.localization:Format("Feature.GameDetails.Toast.LinkCopied"),
				icon = foundationModule.Enums.IconName.CircleCheck
			})
		end
		if shareLinkData.linkType == "ExperienceDetails" then
			local var29 = getActionTelemetryFieldValue(p14, p15, "rootPlaceId") or getActionTelemetryFieldValue(p14, p15, "placeId")
			
			if var29 ~= nil then
				logExperienceDetailsShareAnalytics(tostring(var29), getActionTelemetryFieldValue(p14, p15, "ctx") or "ExperienceDetailsShare", var25, var26)
			end
		end
	end):catch(function(p18) --[[ line: 240 ]]
		-- upvalues: p16 (ref), sduiErrorType (copy), sduiActionType (copy), entryPointKey (ref), getSduiPageEntrySnackbarStore (copy), foundationModule (copy)
		p16.dependencies.logger.reportError(sduiErrorType.FailedToExecuteAction, { name = sduiActionType.Share, message = tostring(p18) }, p16.appPage)
		
		if entryPointKey then
			getSduiPageEntrySnackbarStore().show(entryPointKey, {
				title = p16.dependencies.localization:Format("Feature.Toast.NetworkingError.SomethingIsWrong"),
				icon = foundationModule.Enums.IconName.TriangleExclamation
			})
		end
	end)
end