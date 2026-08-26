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

return function(p1)
	-- upvalues: useMomentDetailsModule (ref), useScaledValue (ref), constantsModule (ref), useTokens (ref), userProfilesModule (ref), resolveMomentShareCardMetadataTextModule (ref), useExperienceNameModule (ref), momentDetailsStatusModule (ref), fFlagAppChatMomentShareCardLoadingSkeletonsModule (ref), reactModule (ref), buildMomentShareCardMediaModule (ref), useMomentShareCardVideoFrameModule (ref), useAssetFetchStatus (ref), getMomentShareCardCornerRadiiModule (ref)
	local var1
	local var2 = useMomentDetailsModule(p1.momentId, p1.targetIdType)
	local status = var2.status
	local var3 = useScaledValue(constantsModule.GameCard.THUMBNAIL_WIDTH)
	local var4 = useTokens()
	local creatorId = var2.creatorId
	local var5 = userProfilesModule.Hooks.useUserProfilesFetch({
		userIds = if creatorId then { tostring(creatorId) } else {},
		query = userProfilesModule.Queries.userProfilesCombinedNameAndUsernameByUserIds
	})
	local var6 = if creatorId and var5.data then userProfilesModule.Selectors.getUsernameFromId(var5.data, creatorId) else nil
	local var7 = resolveMomentShareCardMetadataTextModule(var2.description, nil, nil)
	local var8 = resolveMomentShareCardMetadataTextModule(nil, var2.experienceName, nil)
	local var9 = useExperienceNameModule(var2.universeId, var7 == nil and var8 == nil)
	local var10 = resolveMomentShareCardMetadataTextModule(var7, var8, var9.name)
	local var11 = status == momentDetailsStatusModule.Loading
	local var12 = fFlagAppChatMomentShareCardLoadingSkeletonsModule and (var6 == nil and (var11 or (creatorId ~= nil and (if var5.loading ~= true then var5.isRetrying == true else true))))
	local var13 = fFlagAppChatMomentShareCardLoadingSkeletonsModule and (var10 == nil and (var11 or var9.isLoading))
	local assetId = var2.assetId
	local captureType = var2.captureType
	local assetAccessContext = var2.assetAccessContext
	local var14 = reactModule.useMemo(function()
		-- upvalues: status (ref), momentDetailsStatusModule (copy), buildMomentShareCardMediaModule (copy), assetId (ref), captureType (ref), assetAccessContext (ref)
		return if status == momentDetailsStatusModule.Ready then buildMomentShareCardMediaModule({
			assetId = assetId,
			captureType = captureType,
			assetAccessContext = assetAccessContext
		}) else nil
	end, { status, assetId, captureType, assetAccessContext })
	local var15 = var14 ~= nil and var14.captureType == Enum.CaptureType.Video
	local var16 = useMomentShareCardVideoFrameModule(if var14 == nil or var14.captureType ~= Enum.CaptureType.Video then nil else var14.content)
	local var17 = if var14 == nil then nil elseif var15 then var16 else var14.posterContent
	local var18 = useAssetFetchStatus(if var15 or var17 == nil then nil else var17.Uri) == Enum.AssetFetchStatus.Success
	
	if var15 then
		var1 = var16 ~= nil
		var1 = nil
	else
		var1 = var18
	end
	local size500 = var4.Size.Size_500
	local openMomentsDeepLink = p1.openMomentsDeepLink
	
	return {
		status = var2.status,
		mediaSize = var3,
		hasMedia = if status ~= momentDetailsStatusModule.Loading then var14 ~= nil else true,
		isVideo = var15,
		playIconStyle = var4.Color.Content.Emphasis,
		posterContent = var17,
		isPosterLoaded = var1,
		cornerRadii = reactModule.useMemo(function()
			-- upvalues: getMomentShareCardCornerRadiiModule (copy), p1 (ref), size500 (ref)
			return getMomentShareCardCornerRadiiModule(p1.isStartOfGroup, p1.isIncoming, size500)
		end, { p1.isStartOfGroup, p1.isIncoming, size500 }),
		username = var6,
		metadataText = var10,
		isUsernameLoading = var12,
		isMetadataLoading = var13,
		onActivated = reactModule.useCallback(function()
			-- upvalues: openMomentsDeepLink (ref), var2 (ref), momentDetailsStatusModule (copy), p1 (ref)
			if openMomentsDeepLink and var2.status == momentDetailsStatusModule.Ready then
				openMomentsDeepLink(p1.momentId, p1.targetIdType)
			end
		end, {
			openMomentsDeepLink,
			var2.status,
			p1.momentId,
			p1.targetIdType
		}),
		selectable = status == momentDetailsStatusModule.Ready and openMomentsDeepLink ~= nil,
		LayoutOrder = p1.LayoutOrder
	}
end