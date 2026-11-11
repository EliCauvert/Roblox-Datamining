local HttpService = game:GetService("HttpService")
local Players = game:GetService("Players")
local UserInputService = game:GetService("UserInputService")
local Parent = script:FindFirstAncestor("SduiSharedContent").Parent
local DiscoveryAnalyticsModule = require(Parent.DiscoveryAnalytics)
local Default = require(Parent.ExternalContentSharingProtocol).ExternalContentSharingProtocol.default
local FoundationModule = require(Parent.Foundation)
local HttpRequestModule = require(Parent.HttpRequest)
local PromiseModule = require(Parent.Promise)
local SduiCoreSystemModule = require(Parent.SduiCoreSystem)
local UrlBuilderModule = require(Parent.UrlBuilder)
local SharedFlagsModule = require(Parent.SharedFlags)
local SduiActionType = SduiCoreSystemModule.SduiActionType
local SduiErrorType = SduiCoreSystemModule.SduiErrors.SduiErrorType
local GetActionTelemetryFieldValueFunction = SduiCoreSystemModule.getActionTelemetryFieldValue
local GetSduiPageEntrySnackbarStoreFunction = require(Parent.SduiSharedUtilities).getSduiPageEntrySnackbarStore
local UrlBase = UrlBuilderModule.UrlBase
local UrlBuilder = UrlBuilderModule.UrlBuilder
local GameCopyExperienceLinkFunction = DiscoveryAnalyticsModule.Events.gameCopyExperienceLink
local GameShareExperienceLinkFunction = DiscoveryAnalyticsModule.Events.gameShareExperienceLink
local FFlagSduiExperienceDetailsSupport = SharedFlagsModule.FFlagSduiExperienceDetailsSupport
local FFlagSduiEventDetailsSupport = SharedFlagsModule.FFlagSduiEventDetailsSupport

local function _(): boolean
	-- upvalues: UserInputService (copy)
	local Platform = UserInputService:GetPlatform()
	
	return Platform == Enum.Platform.Windows or (Platform == Enum.Platform.OSX or Platform == Enum.Platform.UWP)
end

local function logExperienceDetailsShareAnalytics(PlaceId, Ctx, LinkId, Stamp)
	-- upvalues: Players (copy), UserInputService (copy), GameCopyExperienceLinkFunction (copy), GameShareExperienceLinkFunction (copy)
	local LocalPlayer = Players.LocalPlayer
	
	if not LocalPlayer then return end
	local Text = tostring(LocalPlayer.UserId)
	local Platform = UserInputService:GetPlatform()
	
	if Platform == Enum.Platform.Windows or (Platform == Enum.Platform.OSX or Platform == Enum.Platform.UWP) then
		GameCopyExperienceLinkFunction({ ctx = Ctx, uid = Text, placeId = PlaceId, stamp = Stamp }, Ctx)
		
		return
	else
		GameShareExperienceLinkFunction({
			shareToAppsflyer = true,
			ctx = Ctx,
			uid = Text,
			placeId = PlaceId,
			shortShareLinkFailed = LinkId == nil,
			stamp = Stamp,
			linkId = LinkId
		}, Ctx)
	end
end

local function handleGenericShare(ShareLinkType, ShareLinkData, EntryPointKey, p1)
	-- upvalues: SduiErrorType (copy), SduiActionType (copy), Default (copy), UserInputService (copy), GetSduiPageEntrySnackbarStoreFunction (copy), FoundationModule (copy)
	local Url = ShareLinkData and ShareLinkData.url
	local ShareUrlContext = ShareLinkData and ShareLinkData.shareUrlContext
	
	if Url == nil then
		p1.dependencies.logger.reportError(SduiErrorType.InvalidActionParams, {
			name = SduiActionType.Share,
			message = `Missing url in shareLinkData for {ShareLinkType} share type`
		}, p1.appPage)
		
		return
	end
	if ShareUrlContext == nil then
		p1.dependencies.logger.reportError(SduiErrorType.InvalidActionParams, {
			name = SduiActionType.Share,
			message = `Missing shareUrlContext in shareLinkData for {ShareLinkType} share type`
		}, p1.appPage)
		
		return
	end
	Default:shareUrl({ context = ShareUrlContext, url = Url })
	local Platform = UserInputService:GetPlatform()
	
	if Platform == Enum.Platform.Windows or (Platform == Enum.Platform.OSX or Platform == Enum.Platform.UWP) then
		if EntryPointKey == nil then
			p1.dependencies.logger.reportError(SduiErrorType.InvalidActionParams, {
				message = "Missing entryPointKey in SduiShareAction",
				name = SduiActionType.Share
			}, p1.appPage)
			
			return
		end
		GetSduiPageEntrySnackbarStoreFunction().show(EntryPointKey, {
			title = p1.dependencies.localization:Format("Feature.GameDetails.Toast.LinkCopied"),
			icon = FoundationModule.Enums.IconName.CircleCheck
		})
	end
end

local function fetchShareLinkId(LinkType, LinkData)
	-- upvalues: UrlBuilder (copy), UrlBase (copy), HttpService (copy), HttpRequestModule (copy)
	return HttpRequestModule.config({
		requestFunction = function(p2, p3, p4)
			-- upvalues: HttpRequestModule (upval)
			return HttpRequestModule.requestFunctions.RequestInternal(p2, p3, p4)
		end
	})(UrlBuilder.new({
		path = "sharelinks/v1/get-or-create-link",
		base = UrlBase.APIS
	})(), "POST", {
		postBody = HttpService:JSONEncode({
			linkType = LinkType,
			data = HttpService:JSONEncode(LinkData)
		})
	}):andThen(function(Result)
		local ResponseBody = Result.responseBody or Result.result
		
		if ResponseBody and ResponseBody.linkId then
			return ResponseBody.linkId
		else
			error("Share link response missing linkId")
		end
	end)
end

return function(p2, p3, p4)
	-- upvalues: SduiErrorType (copy), SduiActionType (copy), FFlagSduiExperienceDetailsSupport (copy), FFlagSduiEventDetailsSupport (copy), PromiseModule (copy), fetchShareLinkId (copy), UrlBuilder (copy), Default (copy), UserInputService (copy), GetSduiPageEntrySnackbarStoreFunction (copy), FoundationModule (copy), GetActionTelemetryFieldValueFunction (copy), logExperienceDetailsShareAnalytics (copy), handleGenericShare (copy)
	local ActionParams = p2 and p2.actionParams or nil
	
	if ActionParams == nil then
		p4.dependencies.logger.reportError(SduiErrorType.InvalidActionParams, {
			message = "Missing actionParams",
			name = SduiActionType.Share
		}, p4.appPage)
		
		return
	end
	if not FFlagSduiExperienceDetailsSupport and not FFlagSduiEventDetailsSupport then
		local ShareLinkData1 = ActionParams.shareLinkData or {}
		local Text = ActionParams.entryPointKey or nil
		handleGenericShare(ActionParams.shareLinkType, ShareLinkData1, Text, p4)
		
		return
	end
	local ShareLinkData = ActionParams.shareLinkData or {}
	local EntryPointKey = ActionParams.entryPointKey or nil
	local ShareUrlContext = ShareLinkData.shareUrlContext or ""
	local ShareLinkData1 = nil
	local Text = nil
	local RejectResult = nil
	
	if ShareLinkData.linkType ~= nil then
		local LinkType = ShareLinkData.linkType
		local LinkData = ShareLinkData.linkData
		RejectResult = if LinkData == nil then PromiseModule.reject(`Missing linkData in ShareLinkFetchData (linkType={LinkType})`) else fetchShareLinkId(LinkType, LinkData):andThen(function(Result)
			-- upvalues: ShareLinkData1 (ref), Text (ref), UrlBuilder (upval), LinkType (copy)
			ShareLinkData1 = Result
			Text = tostring(DateTime.now().UnixTimestampMillis)
			
			return UrlBuilder.sharelinks.shortUrl({ linkId = Result, type = LinkType, stamp = Text })
		end)
	else
		local Url = ShareLinkData.url
		RejectResult = if Url == nil then PromiseModule.reject("Missing url in shareLinkData") else PromiseModule.resolve(Url)
	end
	RejectResult:andThen(function(Result)
		-- upvalues: Default (upval), ShareUrlContext (copy), UserInputService (upval), EntryPointKey (copy), p4 (copy), GetSduiPageEntrySnackbarStoreFunction (upval), FoundationModule (upval), ShareLinkData (copy), GetActionTelemetryFieldValueFunction (upval), p2 (copy), p3 (copy), logExperienceDetailsShareAnalytics (upval), ShareLinkData1 (ref), Text (ref)
		Default:shareUrl({ context = ShareUrlContext, url = Result })
		local Platform = UserInputService:GetPlatform()
		
		if (Platform == Enum.Platform.Windows or (Platform == Enum.Platform.OSX or Platform == Enum.Platform.UWP)) and EntryPointKey then
			GetSduiPageEntrySnackbarStoreFunction().show(EntryPointKey, {
				title = p4.dependencies.localization:Format("Feature.GameDetails.Toast.LinkCopied"),
				icon = FoundationModule.Enums.IconName.CircleCheck
			})
		end
		if ShareLinkData.linkType == "ExperienceDetails" then
			local RootPlaceId = GetActionTelemetryFieldValueFunction(p2, p3, "rootPlaceId") or GetActionTelemetryFieldValueFunction(p2, p3, "placeId")
			
			if RootPlaceId ~= nil then
				logExperienceDetailsShareAnalytics(tostring(RootPlaceId), GetActionTelemetryFieldValueFunction(p2, p3, "ctx") or "ExperienceDetailsShare", ShareLinkData1, Text)
			end
		end
	end):catch(function(Err)
		-- upvalues: p4 (copy), SduiErrorType (upval), SduiActionType (upval), EntryPointKey (copy), GetSduiPageEntrySnackbarStoreFunction (upval), FoundationModule (upval)
		p4.dependencies.logger.reportError(SduiErrorType.FailedToExecuteAction, { name = SduiActionType.Share, message = tostring(Err) }, p4.appPage)
		
		if EntryPointKey then
			GetSduiPageEntrySnackbarStoreFunction().show(EntryPointKey, {
				title = p4.dependencies.localization:Format("Feature.Toast.NetworkingError.SomethingIsWrong"),
				icon = FoundationModule.Enums.IconName.TriangleExclamation
			})
		end
	end)
end