local AppChat = script:FindFirstAncestor("AppChat")
local Parent = AppChat.Parent
local ReactModule = require(Parent.React)
local FoundationModule = require(Parent.Foundation)
local _ = require(Parent.MomentsTypes)
local UserProfilesModule = require(Parent.UserProfiles)
local _ = require(script.Parent.MomentShareCardView)
local MomentDetailsStatusModule = require(script.Parent.MomentDetailsStatus)
local BuildMomentShareCardMediaModule = require(script.Parent.buildMomentShareCardMedia)
local GetMomentShareCardCornerRadiiModule = require(script.Parent.getMomentShareCardCornerRadii)
local ResolveMomentShareCardMetadataTextModule = require(script.Parent.resolveMomentShareCardMetadataText)
local UseExperienceNameModule = require(script.Parent.useExperienceName)
local UseIsMomentsViewingEligibleModule = require(script.Parent.useIsMomentsViewingEligible)
local UseMomentDetailsModule = require(script.Parent.useMomentDetails)
local UseMomentShareCardVideoFrameModule = require(script.Parent.useMomentShareCardVideoFrame)
local ConstantsModule = require(AppChat.Constants)
local FFlagAppChatMomentShareCardLoadingSkeletonsModule = require(AppChat.Flags.FFlagAppChatMomentShareCardLoadingSkeletons)
local FFlagAppChatMomentShareCardEdgeCasesModule = require(AppChat.Flags.FFlagAppChatMomentShareCardEdgeCases)
local UseScaledValueFunction = FoundationModule.Hooks.useScaledValue
local UseAssetFetchStatusFunction = require(Parent.RoactUtils).Hooks.useAssetFetchStatus
local UseTokensFunction = FoundationModule.Hooks.useTokens

return function(Frame) --[[ Line: 39 | Named "useMomentShareCardViewModel" ]]
	-- upvalues: UseMomentDetailsModule (copy), UseScaledValueFunction (copy), ConstantsModule (copy), UseTokensFunction (copy), FFlagAppChatMomentShareCardEdgeCasesModule (copy), UseIsMomentsViewingEligibleModule (copy), UserProfilesModule (copy), ResolveMomentShareCardMetadataTextModule (copy), UseExperienceNameModule (copy), MomentDetailsStatusModule (copy), FFlagAppChatMomentShareCardLoadingSkeletonsModule (copy), ReactModule (copy), BuildMomentShareCardMediaModule (copy), UseMomentShareCardVideoFrameModule (copy), UseAssetFetchStatusFunction (copy), GetMomentShareCardCornerRadiiModule (copy)
	local UseMomentDetailsModuleResult = UseMomentDetailsModule(Frame.momentId, Frame.targetIdType)
	local Status = UseMomentDetailsModuleResult.status
	local UseScaledValueResult = UseScaledValueFunction(ConstantsModule.GameCard.THUMBNAIL_WIDTH)
	local UseTokensResult = UseTokensFunction()
	local NoFFlagAppChatMomentShareCardEdgeCasesModule = not FFlagAppChatMomentShareCardEdgeCasesModule or UseIsMomentsViewingEligibleModule()
	local NoNoFFlagAppChatMomentShareCardEdgeCasesModule: boolean = FFlagAppChatMomentShareCardEdgeCasesModule and not NoFFlagAppChatMomentShareCardEdgeCasesModule
	local CreatorId = UseMomentDetailsModuleResult.creatorId
	local UseUserProfilesFetchResult = UserProfilesModule.Hooks.useUserProfilesFetch({
		userIds = if CreatorId then { (tostring(CreatorId)) } else {},
		query = UserProfilesModule.Queries.userProfilesCombinedNameAndUsernameByUserIds
	})
	local UsernameFromId = if CreatorId and UseUserProfilesFetchResult.data then UserProfilesModule.Selectors.getUsernameFromId(UseUserProfilesFetchResult.data, CreatorId) else nil
	local ResolveMomentShareCardMetadataTextModuleResult = ResolveMomentShareCardMetadataTextModule(UseMomentDetailsModuleResult.description, nil, nil)
	local ResolveMomentShareCardMetadataTextModuleResult1 = ResolveMomentShareCardMetadataTextModule(nil, UseMomentDetailsModuleResult.experienceName, nil)
	local UseExperienceNameModuleResult = UseExperienceNameModule(UseMomentDetailsModuleResult.universeId, ResolveMomentShareCardMetadataTextModuleResult == nil and ResolveMomentShareCardMetadataTextModuleResult1 == nil)
	local ResolveMomentShareCardMetadataTextModuleResult2 = ResolveMomentShareCardMetadataTextModule(ResolveMomentShareCardMetadataTextModuleResult, ResolveMomentShareCardMetadataTextModuleResult1, UseExperienceNameModuleResult.name)
	local IsStatusMatch = Status == MomentDetailsStatusModule.Loading
	local IsLoading: boolean = CreatorId ~= nil and (UseUserProfilesFetchResult.loading == true or UseUserProfilesFetchResult.isRetrying == true)
	local IsStatusMatch1: boolean = FFlagAppChatMomentShareCardLoadingSkeletonsModule and (UsernameFromId == nil and (IsStatusMatch or IsLoading))
	local IsStatusMatch2 = FFlagAppChatMomentShareCardLoadingSkeletonsModule and (ResolveMomentShareCardMetadataTextModuleResult2 == nil and (IsStatusMatch or UseExperienceNameModuleResult.isLoading))
	local AssetId = UseMomentDetailsModuleResult.assetId
	local CaptureType = UseMomentDetailsModuleResult.captureType
	local AssetAccessContext = UseMomentDetailsModuleResult.assetAccessContext
	local UseMemoResult = ReactModule.useMemo(function() --[[ Line: 77 ]]
		-- upvalues: NoNoFFlagAppChatMomentShareCardEdgeCasesModule (copy), Status (copy), MomentDetailsStatusModule (upval), BuildMomentShareCardMediaModule (upval), AssetId (copy), CaptureType (copy), AssetAccessContext (copy)
		return if NoNoFFlagAppChatMomentShareCardEdgeCasesModule or Status ~= MomentDetailsStatusModule.Ready then nil else BuildMomentShareCardMediaModule({
			assetId = AssetId,
			captureType = CaptureType,
			assetAccessContext = AssetAccessContext
		})
	end, {
		NoNoFFlagAppChatMomentShareCardEdgeCasesModule,
		Status,
		AssetId,
		CaptureType,
		AssetAccessContext
	})
	local IsCaptureTypeMatch: boolean = UseMemoResult ~= nil and UseMemoResult.captureType == Enum.CaptureType.Video
	local UseMomentShareCardVideoFrameModuleResult = UseMomentShareCardVideoFrameModule(if UseMemoResult == nil or UseMemoResult.captureType ~= Enum.CaptureType.Video then nil else UseMemoResult.content)
	local UseMomentShareCardVideoFrameModuleResult1 = if UseMemoResult == nil then nil elseif IsCaptureTypeMatch then UseMomentShareCardVideoFrameModuleResult else UseMemoResult.posterContent
	local IsUseAssetFetchStatusResultMatch = UseAssetFetchStatusFunction(if IsCaptureTypeMatch or UseMomentShareCardVideoFrameModuleResult1 == nil then nil else UseMomentShareCardVideoFrameModuleResult1.Uri) == Enum.AssetFetchStatus.Success
	local Size500 = UseTokensResult.Size.Size_500
	local OpenMomentsDeepLinkFunction = Frame.openMomentsDeepLink
	
	return {
		status = if NoNoFFlagAppChatMomentShareCardEdgeCasesModule then MomentDetailsStatusModule.Locked else UseMomentDetailsModuleResult.status,
		mediaSize = UseScaledValueResult,
		hasMedia = not NoNoFFlagAppChatMomentShareCardEdgeCasesModule and (Status == MomentDetailsStatusModule.Loading or UseMemoResult ~= nil),
		isVideo = IsCaptureTypeMatch,
		playIconStyle = UseTokensResult.Color.Content.Emphasis,
		posterContent = UseMomentShareCardVideoFrameModuleResult1,
		isPosterLoaded = if IsCaptureTypeMatch then UseMomentShareCardVideoFrameModuleResult ~= nil else IsUseAssetFetchStatusResultMatch,
		cornerRadii = ReactModule.useMemo(function() --[[ Line: 104 ]]
			-- upvalues: GetMomentShareCardCornerRadiiModule (upval), Frame (copy), Size500 (copy)
			return GetMomentShareCardCornerRadiiModule(Frame.isStartOfGroup, Frame.isIncoming, Size500)
		end, { Frame.isStartOfGroup, Frame.isIncoming, Size500 }),
		username = UsernameFromId,
		metadataText = ResolveMomentShareCardMetadataTextModuleResult2,
		isUsernameLoading = IsStatusMatch1,
		isMetadataLoading = IsStatusMatch2,
		onActivated = ReactModule.useCallback(function() --[[ Line: 110 ]]
			-- upvalues: NoNoFFlagAppChatMomentShareCardEdgeCasesModule (copy), OpenMomentsDeepLinkFunction (copy), UseMomentDetailsModuleResult (copy), MomentDetailsStatusModule (upval), Frame (copy)
			if NoNoFFlagAppChatMomentShareCardEdgeCasesModule then return end
			if OpenMomentsDeepLinkFunction and UseMomentDetailsModuleResult.status == MomentDetailsStatusModule.Ready then
				OpenMomentsDeepLinkFunction(Frame.momentId, Frame.targetIdType)
			end
		end, {
			NoNoFFlagAppChatMomentShareCardEdgeCasesModule,
			OpenMomentsDeepLinkFunction,
			UseMomentDetailsModuleResult.status,
			Frame.momentId,
			Frame.targetIdType
		}),
		selectable = not NoNoFFlagAppChatMomentShareCardEdgeCasesModule and (Status == MomentDetailsStatusModule.Ready and OpenMomentsDeepLinkFunction ~= nil),
		LayoutOrder = Frame.LayoutOrder
	}
end