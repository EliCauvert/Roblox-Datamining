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
local SduiActionType = SduiCoreSystemModule.SduiActionType
local SduiErrorType = SduiCoreSystemModule.SduiErrors.SduiErrorType
local GetActionTelemetryFieldValueFunction = SduiCoreSystemModule.getActionTelemetryFieldValue
local GetSduiPageEntrySnackbarStoreFunction = require(Parent.SduiSharedUtilities).getSduiPageEntrySnackbarStore
local UrlBase = UrlBuilderModule.UrlBase
local UrlBuilder = UrlBuilderModule.UrlBuilder
local GameCopyExperienceLinkFunction = DiscoveryAnalyticsModule.Events.gameCopyExperienceLink
local GameShareExperienceLinkFunction = DiscoveryAnalyticsModule.Events.gameShareExperienceLink
local FFlagLuaAppAddUniverseIdToEngagementEvents = require(Parent.SharedFlags).FFlagLuaAppAddUniverseIdToEngagementEvents

local function _(): boolean --[[ Line: 36 | Named "isDesktopPlatform" ]]
	-- upvalues: UserInputService (copy)
	local Platform = UserInputService:GetPlatform()
	
	return Platform == Enum.Platform.Windows or (Platform == Enum.Platform.OSX or Platform == Enum.Platform.UWP)
end

local function logExperienceDetailsShareAnalytics(PlaceId, Ctx, LinkId, Stamp, p1) --[[ Line: 43 ]]
	-- upvalues: Players (copy), UserInputService (copy), GameCopyExperienceLinkFunction (copy), FFlagLuaAppAddUniverseIdToEngagementEvents (copy), GameShareExperienceLinkFunction (copy)
	local LocalPlayer = Players.LocalPlayer
	
	if not LocalPlayer then return end
	local Text = tostring(LocalPlayer.UserId)
	local Platform = UserInputService:GetPlatform()
	
	if Platform == Enum.Platform.Windows or (Platform == Enum.Platform.OSX or Platform == Enum.Platform.UWP) then
		GameCopyExperienceLinkFunction({
			ctx = Ctx,
			uid = Text,
			placeId = PlaceId,
			stamp = Stamp,
			universeId = if FFlagLuaAppAddUniverseIdToEngagementEvents then p1 else nil
		}, Ctx)
		
		return
	else
		GameShareExperienceLinkFunction({
			shareToAppsflyer = true,
			ctx = Ctx,
			uid = Text,
			placeId = PlaceId,
			shortShareLinkFailed = LinkId == nil,
			stamp = Stamp,
			linkId = LinkId,
			universeId = if FFlagLuaAppAddUniverseIdToEngagementEvents then p1 else nil
		}, Ctx)
	end
end

local function fetchShareLinkId(LinkType, LinkData) --[[ Line: 78 ]]
	-- upvalues: UrlBuilder (copy), UrlBase (copy), HttpService (copy), HttpRequestModule (copy)
	return HttpRequestModule.config({
		requestFunction = function(p1, p2, p3) --[[ Line: 90 ]]
			-- upvalues: HttpRequestModule (upval)
			return HttpRequestModule.requestFunctions.RequestInternal(p1, p2, p3)
		end
	})(UrlBuilder.new({
		path = "sharelinks/v1/get-or-create-link",
		base = UrlBase.APIS
	})(), "POST", {
		postBody = HttpService:JSONEncode({
			linkType = LinkType,
			data = HttpService:JSONEncode(LinkData)
		})
	}):andThen(function(Result) --[[ Line: 95 ]]
		local ResponseBody = Result.responseBody or Result.result
		
		if ResponseBody and ResponseBody.linkId then
			return ResponseBody.linkId
		else
			error("Share link response missing linkId")
		end
	end)
end

return function(p1, p2, p3) --[[ Line: 105 ]]
	-- upvalues: SduiErrorType (copy), SduiActionType (copy), PromiseModule (copy), fetchShareLinkId (copy), UrlBuilder (copy), Default (copy), UserInputService (copy), GetSduiPageEntrySnackbarStoreFunction (copy), FoundationModule (copy), GetActionTelemetryFieldValueFunction (copy), FFlagLuaAppAddUniverseIdToEngagementEvents (copy), logExperienceDetailsShareAnalytics (copy)
	local ActionParams = p1 and p1.actionParams or nil
	
	if ActionParams == nil then
		p3.dependencies.logger.reportError(SduiErrorType.InvalidActionParams, {
			message = "Missing actionParams",
			name = SduiActionType.Share
		}, p3.appPage)
		
		return
	end
	local ShareLinkData = ActionParams.shareLinkData or {}
	local EntryPointKey = ActionParams.entryPointKey or nil
	local ShareUrlContext = ShareLinkData.shareUrlContext or ""
	local LinkId = nil
	local Text = nil
	local RejectResult = nil
	
	if ShareLinkData.linkType ~= nil then
		local LinkType = ShareLinkData.linkType
		local LinkData = ShareLinkData.linkData
		RejectResult = if LinkData == nil then PromiseModule.reject(`Missing linkData in ShareLinkFetchData (linkType={LinkType})`) else fetchShareLinkId(LinkType, LinkData):andThen(function(Result) --[[ Line: 136 ]]
			-- upvalues: LinkId (ref), Text (ref), UrlBuilder (upval), LinkType (copy)
			LinkId = Result
			Text = tostring(DateTime.now().UnixTimestampMillis)
			
			return UrlBuilder.sharelinks.shortUrl({ linkId = Result, type = LinkType, stamp = Text })
		end)
	else
		local Url = ShareLinkData.url
		RejectResult = if Url == nil then PromiseModule.reject("Missing url in shareLinkData") else PromiseModule.resolve(Url)
	end
	RejectResult:andThen(function(Result) --[[ Line: 156 ]]
		-- upvalues: Default (upval), ShareUrlContext (copy), UserInputService (upval), EntryPointKey (copy), p3 (copy), GetSduiPageEntrySnackbarStoreFunction (upval), FoundationModule (upval), ShareLinkData (copy), GetActionTelemetryFieldValueFunction (upval), p1 (copy), p2 (copy), FFlagLuaAppAddUniverseIdToEngagementEvents (upval), logExperienceDetailsShareAnalytics (upval), LinkId (ref), Text (ref)
		Default:shareUrl({ context = ShareUrlContext, url = Result })
		local Platform = UserInputService:GetPlatform()
		
		if (Platform == Enum.Platform.Windows or (Platform == Enum.Platform.OSX or Platform == Enum.Platform.UWP)) and EntryPointKey then
			GetSduiPageEntrySnackbarStoreFunction().show(EntryPointKey, {
				title = p3.dependencies.localization:Format("Feature.GameDetails.Toast.LinkCopied"),
				icon = FoundationModule.Enums.IconName.CircleCheck
			})
		end
		if ShareLinkData.linkType == "ExperienceDetails" then
			local RootPlaceId = GetActionTelemetryFieldValueFunction(p1, p2, "rootPlaceId") or GetActionTelemetryFieldValueFunction(p1, p2, "placeId")
			
			if RootPlaceId ~= nil then
				local Ctx = GetActionTelemetryFieldValueFunction(p1, p2, "ctx") or "ExperienceDetailsShare"
				
				if FFlagLuaAppAddUniverseIdToEngagementEvents then
					local UniverseId = GetActionTelemetryFieldValueFunction(p1, p2, "universeId")
					
					if UniverseId == nil and type(ShareLinkData.linkData) == "table" then
						UniverseId = ShareLinkData.linkData.universeId
					end
					logExperienceDetailsShareAnalytics(tostring(RootPlaceId), Ctx, LinkId, Text, if UniverseId == nil then nil else tostring(UniverseId))
					
					return
				else
					logExperienceDetailsShareAnalytics(tostring(RootPlaceId), Ctx, LinkId, Text)
				end
			end
		end
	end):catch(function(Err) --[[ Line: 199 ]]
		-- upvalues: p3 (copy), SduiErrorType (upval), SduiActionType (upval), EntryPointKey (copy), GetSduiPageEntrySnackbarStoreFunction (upval), FoundationModule (upval)
		p3.dependencies.logger.reportError(SduiErrorType.FailedToExecuteAction, { name = SduiActionType.Share, message = tostring(Err) }, p3.appPage)
		
		if EntryPointKey then
			GetSduiPageEntrySnackbarStoreFunction().show(EntryPointKey, {
				title = p3.dependencies.localization:Format("Feature.Toast.NetworkingError.SomethingIsWrong"),
				icon = FoundationModule.Enums.IconName.TriangleExclamation
			})
		end
	end)
end