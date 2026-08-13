local appChat = script:FindFirstAncestor("AppChat")
local parent = appChat.Parent
local reactModule = require(parent.React)
local foundationModule = require(parent.Foundation)
local _ = require(parent.MomentsTypes)
local roactUtilsModule = require(parent.RoactUtils)
local userProfilesModule = require(parent.UserProfiles)
local _ = require(script.Parent.MomentShareCardView)
local buildMomentShareCardMediaModule = require(script.Parent.buildMomentShareCardMedia)
local getMomentShareCardCornerRadiiModule = require(script.Parent.getMomentShareCardCornerRadii)
local resolveMomentShareCardMetadataTextModule = require(script.Parent.resolveMomentShareCardMetadataText)
local useExperienceNameModule = require(script.Parent.useExperienceName)
local useMomentDetailsModule = require(script.Parent.useMomentDetails)
local useMomentShareCardVideoFrameModule = require(script.Parent.useMomentShareCardVideoFrame)
local constantsModule = require(appChat.Constants)
local useScaledValue = foundationModule.Hooks.useScaledValue
local useAssetFetchStatus = roactUtilsModule.Hooks.useAssetFetchStatus
local useTokens = foundationModule.Hooks.useTokens

return function(p0) --[[ line: 35 | named "useMomentShareCardViewModel" ]]
	-- upvalues: useMomentDetailsModule (ref), useScaledValue (ref), constantsModule (ref), useTokens (ref), userProfilesModule (ref), resolveMomentShareCardMetadataTextModule (ref), useExperienceNameModule (ref), reactModule (ref), buildMomentShareCardMediaModule (ref), useMomentShareCardVideoFrameModule (ref), useAssetFetchStatus (ref), getMomentShareCardCornerRadiiModule (ref)
	local var25
	local var12 = useMomentDetailsModule(p0.momentId, p0.targetIdType)
	local var13 = useScaledValue(constantsModule.GameCard.THUMBNAIL_WIDTH)
	local var14 = useTokens()
	local creatorId = var12.creatorId
	local var15 = userProfilesModule.Hooks.useUserProfilesFetch({
		userIds = if creatorId then { tostring(creatorId) } else {},
		query = userProfilesModule.Queries.userProfilesCombinedNameAndUsernameByUserIds
	})
	local var16 = if creatorId and var15.data then userProfilesModule.Selectors.getUsernameFromId(var15.data, creatorId) else nil
	local var17 = resolveMomentShareCardMetadataTextModule(var12.description, nil, nil)
	local var18 = resolveMomentShareCardMetadataTextModule(nil, var12.experienceName, nil)
	local var19 = resolveMomentShareCardMetadataTextModule(var17, var18, useExperienceNameModule(var12.universeId, var17 == nil and var18 == nil))
	local status = var12.status
	local assetId = var12.assetId
	local captureType = var12.captureType
	local assetAccessContext = var12.assetAccessContext
	local var20 = reactModule.useMemo(function() --[[ line: 60 ]]
		-- upvalues: status (ref), buildMomentShareCardMediaModule (copy), assetId (ref), captureType (ref), assetAccessContext (ref)
		return if status == "ready" then buildMomentShareCardMediaModule({
			assetId = assetId,
			captureType = captureType,
			assetAccessContext = assetAccessContext
		}) else nil
	end, { status, assetId, captureType, assetAccessContext })
	local var21 = var20 ~= nil and var20.captureType == Enum.CaptureType.Video
	local var22 = useMomentShareCardVideoFrameModule(if var20 == nil or var20.captureType ~= Enum.CaptureType.Video then nil else var20.content)
	local var23 = if var20 == nil then nil elseif var21 then var22 else var20.posterContent
	local var24 = useAssetFetchStatus(if var21 or var23 == nil then nil else var23.Uri) == Enum.AssetFetchStatus.Success
	
	if var21 then
		var25 = var22 ~= nil
		var25 = nil
	else
		var25 = var24
	end
	local openMomentsDeepLink = p0.openMomentsDeepLink
	
	return {
		status = var12.status,
		mediaSize = var13,
		hasMedia = if status ~= "loading" then var20 ~= nil else true,
		isVideo = var21,
		playIconStyle = var14.Color.Content.Emphasis,
		posterContent = var23,
		isPosterLoaded = var25,
		cornerRadii = reactModule.useMemo(function() --[[ line: 85 ]]
			-- upvalues: getMomentShareCardCornerRadiiModule (copy), p0 (ref)
			return getMomentShareCardCornerRadiiModule(p0.isStartOfGroup, p0.isIncoming)
		end, { p0.isStartOfGroup, p0.isIncoming }),
		username = var16,
		metadataText = var19,
		onActivated = reactModule.useCallback(function() --[[ line: 90 ]]
			-- upvalues: openMomentsDeepLink (ref), var12 (ref), p0 (ref)
			if openMomentsDeepLink and var12.status == "ready" then
				openMomentsDeepLink(p0.momentId, p0.targetIdType)
			end
		end, {
			openMomentsDeepLink,
			var12.status,
			p0.momentId,
			p0.targetIdType
		}),
		selectable = status == "ready" and openMomentsDeepLink ~= nil,
		LayoutOrder = p0.LayoutOrder
	}
end