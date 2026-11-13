local AppChat = script:FindFirstAncestor("AppChat")
local Parent = AppChat.Parent
local ReactModule = require(Parent.React)
local UseLocalizationFunction = require(Parent.Localization).Hooks.useLocalization
local UseAssetFetchStatusFunction = require(Parent.RoactUtils).Hooks.useAssetFetchStatus
local AppTelemetryLayerModule = require(AppChat.Telemetry.Layers.AppTelemetryLayer)
local AssetCardTypesModule = require(AppChat.Components.ChatConversation.AssetCardView.AssetCardTypes)
local GenericShareLinkTelemetryEventsModule = require(script.Parent.GenericShareLinkTelemetryEvents)
local GetShareLinkV2StoreModule = require(AppChat.Stores.GetShareLinkV2Store)
local _ = require(AppChat.Components.ChatConversation.Grouping.MessageGroupShape)
local FFlagAppChatGenericShareLinkPreviewModule = require(AppChat.Flags.FFlagAppChatGenericShareLinkPreview)
local _ = require(AppChat.Components.ChatConversation.Utils.RobloxUrlUtils.ShareLinkClassification)
local ShareLinkV2EnumsModule = require(AppChat.Components.ChatConversation.Utils.RobloxUrlUtils.ShareLinkV2Enums)
local LoadFoundationCloudAssetModule = require(AppChat.Utils.loadFoundationCloudAsset)
local UseIsInExperienceModule = require(AppChat.Hooks.useIsInExperience)
local UseTelemetryModule = require(AppChat.Telemetry.useTelemetry)

local function _(Text: string): string
	return if string.match(Text, "^%a[%w+.-]*://") then Text else `https://{Text}`
end

local function openInApp(Url)
	-- upvalues: Parent (copy)
	local LinkingProtocolModule = require(Parent.LinkingProtocol)
	local DeepLinkSource = LinkingProtocolModule.Enums.DeepLinkSource
	local Default = LinkingProtocolModule.LinkingProtocol.default
	
	if Default:isInternalDlicEnabled() then
		local InternalDlic = Default:createInternalDlic(Url, DeepLinkSource.LuaInternal)
		
		if InternalDlic ~= nil and InternalDlic ~= "" then
			Default:detectDeeplinkIntent(InternalDlic)
			
			return
		end
	end
	Default:detectURL(Url)
end

return function(p1)
	-- upvalues: ReactModule (copy), LoadFoundationCloudAssetModule (copy), UseLocalizationFunction (copy), UseIsInExperienceModule (copy), UseTelemetryModule (copy), AppTelemetryLayerModule (copy), ShareLinkV2EnumsModule (copy), GetShareLinkV2StoreModule (copy), GenericShareLinkTelemetryEventsModule (copy), Parent (copy), openInApp (copy), FFlagAppChatGenericShareLinkPreviewModule (copy), UseAssetFetchStatusFunction (copy), AssetCardTypesModule (copy)
	local UseMemoResult = ReactModule.useMemo(function()
		-- upvalues: LoadFoundationCloudAssetModule (upval)
		return Content.fromUri((LoadFoundationCloudAssetModule("pictograms/logo")))
	end, {})
	local UseLocalizationResult = UseLocalizationFunction({ errorText = "Feature.Chat.Label.ContentLoadingFailed" })
	local UseIsInExperienceModuleResult = UseIsInExperienceModule()
	local UseTelemetryModuleResult = UseTelemetryModule(AppTelemetryLayerModule.Context)
	local UseRefResult = ReactModule.useRef(UseTelemetryModuleResult)
	UseRefResult.current = UseTelemetryModuleResult
	local LinkId = p1.linkId
	local LinkType = p1.linkType or ShareLinkV2EnumsModule.LinkType.Unknown
	local Status = if p1.isInvalid then p1.status or ShareLinkV2EnumsModule.Status.Invalid else ShareLinkV2EnumsModule.Status.Valid
	ReactModule.useEffect(function()
		-- upvalues: GetShareLinkV2StoreModule (upval), LinkId (copy), UseRefResult (copy), GenericShareLinkTelemetryEventsModule (upval), LinkType (copy), Status (copy)
		if GetShareLinkV2StoreModule(false).claimFirstRenderLog(LinkId) then
			UseRefResult.current.emit(GenericShareLinkTelemetryEventsModule.Rendered, { linkType = LinkType, status = Status })
		end
	end, { LinkId, LinkType, Status })
	local Url: string = p1.url
	local Url1 = if string.match(Url, "^%a[%w+.-]*://") then Url else `https://{Url}`
	local UseStateResult, UseStateResult2 = ReactModule.useState(false)
	ReactModule.useEffect(function()
		-- upvalues: UseIsInExperienceModuleResult (copy), p1 (copy), UseStateResult2 (copy), Parent (upval), Url1 (copy)
		if UseIsInExperienceModuleResult or p1.isInvalid then
			UseStateResult2(false)
			
			return nil
		else
			local Flag = false
			UseStateResult2(false)
			require(Parent.LinkingProtocol).LinkingProtocol.default:isURLRegistered(Url1):catch(function(): boolean
				return false
			end):andThen(function(Enabled)
				-- upvalues: Flag (ref), UseStateResult2 (upval)
				if not Flag then
					UseStateResult2(Enabled == true)
				end
			end)
			
			return function()
				-- upvalues: Flag (ref)
				Flag = true
			end
		end
	end, { UseIsInExperienceModuleResult, p1.isInvalid, Url1 })
	local UseMemoResult1 = ReactModule.useMemo(function()
		-- upvalues: UseIsInExperienceModuleResult (copy), p1 (copy), UseStateResult (copy), UseRefResult (copy), GenericShareLinkTelemetryEventsModule (upval), LinkType (copy), openInApp (upval), Url1 (copy)
		return if UseIsInExperienceModuleResult or p1.isInvalid or not UseStateResult then nil else function()
			-- upvalues: UseRefResult (upval), GenericShareLinkTelemetryEventsModule (upval), LinkType (upval), openInApp (upval), Url1 (upval)
			UseRefResult.current.emit(GenericShareLinkTelemetryEventsModule.Tapped, { linkType = LinkType })
			openInApp(Url1)
		end
	end, {
		UseIsInExperienceModuleResult,
		p1.isInvalid,
		UseStateResult,
		Url1,
		LinkType
	})
	local Preview = if FFlagAppChatGenericShareLinkPreviewModule then p1.preview else nil
	local RbxthumbName = if Preview and Preview.assetId then `rbxthumb://type=Asset&id={Preview.assetId}&w={420}&h={420}` else nil
	local IsFailureMatch = false
	
	if FFlagAppChatGenericShareLinkPreviewModule then
		local UseAssetFetchStatusResult = UseAssetFetchStatusFunction(RbxthumbName)
		IsFailureMatch = UseAssetFetchStatusResult == Enum.AssetFetchStatus.Failure or UseAssetFetchStatusResult == Enum.AssetFetchStatus.TimedOut
	end
	local Title = if Preview then Preview.title or Preview.description else nil
	local Description = if Preview and Preview.title then Preview.description else nil
	
	return ReactModule.useMemo(function()
		-- upvalues: p1 (copy), AssetCardTypesModule (upval), UseLocalizationResult (copy), RbxthumbName (copy), IsFailureMatch (ref), UseMemoResult (copy), UseMemoResult1 (copy), Title (copy), Url (copy), Description (copy)
		if p1.isInvalid then
			return {
				status = AssetCardTypesModule.Status.Error,
				groupShape = p1.groupShape,
				errorText = UseLocalizationResult.errorText,
				media = { aspectRatio = 2, isSelectable = false }
			}
		else
			local Content1 = if RbxthumbName and not IsFailureMatch then Content.fromUri(RbxthumbName) else nil
			
			return {
				status = AssetCardTypesModule.Status.Ready,
				groupShape = p1.groupShape,
				mediaRef = p1.mediaRef,
				media = {
					pictogramScale = 1,
					image = Content1 or UseMemoResult,
					aspectRatio = if RbxthumbName then 1 else 2,
					isPictogram = Content1 == nil,
					imageScale = if Content1 then 0.75 else nil,
					onActivated = UseMemoResult1,
					isSelectable = UseMemoResult1 ~= nil
				},
				footer = {
					titleMaxLines = 2,
					titleText = Title or Url,
					subtitleText = Description,
					onActivated = UseMemoResult1
				}
			}
		end
	end, {
		p1.isInvalid, p1.groupShape, p1.mediaRef, UseMemoResult,
		UseLocalizationResult.errorText, Url, UseMemoResult1, RbxthumbName,
		IsFailureMatch, Title, Description
	})
end