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
local useIsMomentsViewingEligibleModule = require(script.Parent.useIsMomentsViewingEligible)
local useMomentDetailsModule = require(script.Parent.useMomentDetails)
local useMomentShareCardVideoFrameModule = require(script.Parent.useMomentShareCardVideoFrame)
local constantsModule = require(appChat.Constants)
local fFlagAppChatMomentShareCardLoadingSkeletonsModule = require(appChat.Flags.FFlagAppChatMomentShareCardLoadingSkeletons)
local fFlagAppChatMomentShareCardEdgeCasesModule = require(appChat.Flags.FFlagAppChatMomentShareCardEdgeCases)
local useScaledValue = foundationModule.Hooks.useScaledValue
local useAssetFetchStatus = roactUtilsModule.Hooks.useAssetFetchStatus
local useTokens = foundationModule.Hooks.useTokens

return function(p1)
	-- upvalues: useMomentDetailsModule (ref), useScaledValue (ref), constantsModule (ref), useTokens (ref), fFlagAppChatMomentShareCardEdgeCasesModule (ref), useIsMomentsViewingEligibleModule (ref), userProfilesModule (ref), resolveMomentShareCardMetadataTextModule (ref), useExperienceNameModule (ref), momentDetailsStatusModule (ref), fFlagAppChatMomentShareCardLoadingSkeletonsModule (ref), reactModule (ref), buildMomentShareCardMediaModule (ref), useMomentShareCardVideoFrameModule (ref), useAssetFetchStatus (ref), getMomentShareCardCornerRadiiModule (ref)
	local var1
	local var2 = useMomentDetailsModule(p1.momentId, p1.targetIdType)
	local status = var2.status
	local var3 = useScaledValue(constantsModule.GameCard.THUMBNAIL_WIDTH)
	local var4 = useTokens()
	local var5 = fFlagAppChatMomentShareCardEdgeCasesModule and not (if fFlagAppChatMomentShareCardEdgeCasesModule then useIsMomentsViewingEligibleModule() else true)
	local creatorId = var2.creatorId
	local var6 = userProfilesModule.Hooks.useUserProfilesFetch({
		userIds = if creatorId then { tostring(creatorId) } else {},
		query = userProfilesModule.Queries.userProfilesCombinedNameAndUsernameByUserIds
	})
	local var7 = if creatorId and var6.data then userProfilesModule.Selectors.getUsernameFromId(var6.data, creatorId) else nil
	local var8 = resolveMomentShareCardMetadataTextModule(var2.description, nil, nil)
	local var9 = resolveMomentShareCardMetadataTextModule(nil, var2.experienceName, nil)
	local var10 = useExperienceNameModule(var2.universeId, var8 == nil and var9 == nil)
	local var11 = resolveMomentShareCardMetadataTextModule(var8, var9, var10.name)
	local var12 = status == momentDetailsStatusModule.Loading
	local var13 = fFlagAppChatMomentShareCardLoadingSkeletonsModule and (var7 == nil and (var12 or (creatorId ~= nil and (if var6.loading ~= true then var6.isRetrying == true else true))))
	local var14 = fFlagAppChatMomentShareCardLoadingSkeletonsModule and (var11 == nil and (var12 or var10.isLoading))
	local assetId = var2.assetId
	local captureType = var2.captureType
	local assetAccessContext = var2.assetAccessContext
	local var15 = reactModule.useMemo(function()
		-- upvalues: var5 (ref), status (ref), momentDetailsStatusModule (copy), buildMomentShareCardMediaModule (copy), assetId (ref), captureType (ref), assetAccessContext (ref)
		return if var5 or status ~= momentDetailsStatusModule.Ready then nil else buildMomentShareCardMediaModule({
			assetId = assetId,
			captureType = captureType,
			assetAccessContext = assetAccessContext
		})
	end, {
		var5,
		status,
		assetId,
		captureType,
		assetAccessContext
	})
	local var16 = var15 ~= nil and var15.captureType == Enum.CaptureType.Video
	local var17 = useMomentShareCardVideoFrameModule(if var15 == nil or var15.captureType ~= Enum.CaptureType.Video then nil else var15.content)
	local var18 = if var15 == nil then nil elseif var16 then var17 else var15.posterContent
	local var19 = useAssetFetchStatus(if var16 or var18 == nil then nil else var18.Uri) == Enum.AssetFetchStatus.Success
	
	if var16 then
		var1 = var17 ~= nil
		var1 = nil
	else
		var1 = var19
	end
	local size500 = var4.Size.Size_500
	local openMomentsDeepLink = p1.openMomentsDeepLink
	
	return {
		status = if var5 then momentDetailsStatusModule.Locked else var2.status,
		mediaSize = var3,
		hasMedia = not var5 and (if status ~= momentDetailsStatusModule.Loading then var15 ~= nil else true),
		isVideo = var16,
		playIconStyle = var4.Color.Content.Emphasis,
		posterContent = var18,
		isPosterLoaded = var1,
		cornerRadii = reactModule.useMemo(function()
			-- upvalues: getMomentShareCardCornerRadiiModule (copy), p1 (ref), size500 (ref)
			return getMomentShareCardCornerRadiiModule(p1.isStartOfGroup, p1.isIncoming, size500)
		end, { p1.isStartOfGroup, p1.isIncoming, size500 }),
		username = var7,
		metadataText = var11,
		isUsernameLoading = var13,
		isMetadataLoading = var14,
		onActivated = reactModule.useCallback(function()
			-- upvalues: var5 (ref), openMomentsDeepLink (ref), var2 (ref), momentDetailsStatusModule (copy), p1 (ref)
			if var5 then return end
			if openMomentsDeepLink and var2.status == momentDetailsStatusModule.Ready then
				openMomentsDeepLink(p1.momentId, p1.targetIdType)
			end
		end, {
			var5,
			openMomentsDeepLink,
			var2.status,
			p1.momentId,
			p1.targetIdType
		}),
		selectable = not var5 and (status == momentDetailsStatusModule.Ready and openMomentsDeepLink ~= nil),
		LayoutOrder = p1.LayoutOrder
	}
end