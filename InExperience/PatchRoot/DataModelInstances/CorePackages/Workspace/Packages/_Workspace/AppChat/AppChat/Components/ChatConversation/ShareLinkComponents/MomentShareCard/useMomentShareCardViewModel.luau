local appChat = script:FindFirstAncestor("AppChat")
local parent = appChat.Parent
local reactModule = require(parent.React)
local foundationModule = require(parent.Foundation)
local _ = require(parent.MomentsTypes)
local roactUtilsModule = require(parent.RoactUtils)
local userProfilesModule = require(parent.UserProfiles)
local _ = require(script.Parent.MomentShareCardView)
local momentDetailsStatusModule = require(script.Parent.MomentDetailsStatus)
local buildMomentShareCardMediaModule = require(script.Parent.buildMomentShareCardMedia)
local getMomentShareCardCornerRadiiModule = require(script.Parent.getMomentShareCardCornerRadii)
local resolveMomentShareCardMetadataTextModule = require(script.Parent.resolveMomentShareCardMetadataText)
local useExperienceNameModule = require(script.Parent.useExperienceName)
local useMomentDetailsModule = require(script.Parent.useMomentDetails)
local useMomentShareCardVideoFrameModule = require(script.Parent.useMomentShareCardVideoFrame)
local constantsModule = require(appChat.Constants)
local fFlagAppChatMomentShareCardLoadingSkeletonsModule = require(appChat.Flags.FFlagAppChatMomentShareCardLoadingSkeletons)
local useScaledValue = foundationModule.Hooks.useScaledValue
local useAssetFetchStatus = roactUtilsModule.Hooks.useAssetFetchStatus
local useTokens = foundationModule.Hooks.useTokens

return function(p0) --[[ line: 37 | named "useMomentShareCardViewModel" ]]
	-- upvalues: useMomentDetailsModule (ref), useScaledValue (ref), constantsModule (ref), useTokens (ref), userProfilesModule (ref), resolveMomentShareCardMetadataTextModule (ref), useExperienceNameModule (ref), momentDetailsStatusModule (ref), fFlagAppChatMomentShareCardLoadingSkeletonsModule (ref), reactModule (ref), buildMomentShareCardMediaModule (ref), useMomentShareCardVideoFrameModule (ref), useAssetFetchStatus (ref), getMomentShareCardCornerRadiiModule (ref)
	local var31
	local var14 = useMomentDetailsModule(p0.momentId, p0.targetIdType)
	local status = var14.status
	local var15 = useScaledValue(constantsModule.GameCard.THUMBNAIL_WIDTH)
	local var16 = useTokens()
	local creatorId = var14.creatorId
	local var17 = userProfilesModule.Hooks.useUserProfilesFetch({
		userIds = if creatorId then { tostring(creatorId) } else {},
		query = userProfilesModule.Queries.userProfilesCombinedNameAndUsernameByUserIds
	})
	local var18 = if creatorId and var17.data then userProfilesModule.Selectors.getUsernameFromId(var17.data, creatorId) else nil
	local var19 = resolveMomentShareCardMetadataTextModule(var14.description, nil, nil)
	local var20 = resolveMomentShareCardMetadataTextModule(nil, var14.experienceName, nil)
	local var21 = useExperienceNameModule(var14.universeId, var19 == nil and var20 == nil)
	local var22 = resolveMomentShareCardMetadataTextModule(var19, var20, var21.name)
	local var23 = status == momentDetailsStatusModule.Loading
	local var24 = fFlagAppChatMomentShareCardLoadingSkeletonsModule and (var18 == nil and (var23 or (creatorId ~= nil and (if var17.loading ~= true then var17.isRetrying == true else true))))
	local var25 = fFlagAppChatMomentShareCardLoadingSkeletonsModule and (var22 == nil and (var23 or var21.isLoading))
	local assetId = var14.assetId
	local captureType = var14.captureType
	local assetAccessContext = var14.assetAccessContext
	local var26 = reactModule.useMemo(function() --[[ line: 71 ]]
		-- upvalues: status (ref), momentDetailsStatusModule (copy), buildMomentShareCardMediaModule (copy), assetId (ref), captureType (ref), assetAccessContext (ref)
		return if status == momentDetailsStatusModule.Ready then buildMomentShareCardMediaModule({
			assetId = assetId,
			captureType = captureType,
			assetAccessContext = assetAccessContext
		}) else nil
	end, { status, assetId, captureType, assetAccessContext })
	local var27 = var26 ~= nil and var26.captureType == Enum.CaptureType.Video
	local var28 = useMomentShareCardVideoFrameModule(if var26 == nil or var26.captureType ~= Enum.CaptureType.Video then nil else var26.content)
	local var29 = if var26 == nil then nil elseif var27 then var28 else var26.posterContent
	local var30 = useAssetFetchStatus(if var27 or var29 == nil then nil else var29.Uri) == Enum.AssetFetchStatus.Success
	
	if var27 then
		var31 = var28 ~= nil
		var31 = nil
	else
		var31 = var30
	end
	local size500 = var16.Size.Size_500
	local openMomentsDeepLink = p0.openMomentsDeepLink
	
	return {
		status = var14.status,
		mediaSize = var15,
		hasMedia = if status ~= momentDetailsStatusModule.Loading then var26 ~= nil else true,
		isVideo = var27,
		playIconStyle = var16.Color.Content.Emphasis,
		posterContent = var29,
		isPosterLoaded = var31,
		cornerRadii = reactModule.useMemo(function() --[[ line: 97 ]]
			-- upvalues: getMomentShareCardCornerRadiiModule (copy), p0 (ref), size500 (ref)
			return getMomentShareCardCornerRadiiModule(p0.isStartOfGroup, p0.isIncoming, size500)
		end, { p0.isStartOfGroup, p0.isIncoming, size500 }),
		username = var18,
		metadataText = var22,
		isUsernameLoading = var24,
		isMetadataLoading = var25,
		onActivated = reactModule.useCallback(function() --[[ line: 102 ]]
			-- upvalues: openMomentsDeepLink (ref), var14 (ref), momentDetailsStatusModule (copy), p0 (ref)
			if openMomentsDeepLink and var14.status == momentDetailsStatusModule.Ready then
				openMomentsDeepLink(p0.momentId, p0.targetIdType)
			end
		end, {
			openMomentsDeepLink,
			var14.status,
			p0.momentId,
			p0.targetIdType
		}),
		selectable = status == momentDetailsStatusModule.Ready and openMomentsDeepLink ~= nil,
		LayoutOrder = p0.LayoutOrder
	}
end