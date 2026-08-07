local gameInvite = script:FindFirstAncestor("GameInvite")
local parent = gameInvite.Parent
local reactModule = require(parent.React)
local UIBloxModule = require(parent.UIBlox)
local roactUtilsModule = require(parent.RoactUtils)
local throttle = require(parent.NotificationsCommon).Throttle
local reducerDependencies = require(parent.NotificationsCommon).ReducerDependencies
local default = require(parent.ExternalContentSharingProtocol).ExternalContentSharingProtocol.default
local localizationHelper = require(parent.NotificationsCommon).LocalizationHelper
local gameInviteAnalyticsManagerModule = require(gameInvite.analytics.GameInviteAnalyticsManager)
local useSelector = roactUtilsModule.Hooks.RoactRodux.useSelector
local useDispatch = roactUtilsModule.Hooks.RoactRodux.useDispatch
local roduxNetworking = reducerDependencies.RoduxNetworking
local shareLinksNetworking = reducerDependencies.ShareLinksNetworking
local shareLinksRodux = reducerDependencies.ShareLinksRodux
local networkStatus = roduxNetworking.Enum.NetworkStatus
local getLocalizedStrings = localizationHelper.getLocalizedStrings
local linkButton = UIBloxModule.App.Button.LinkButton
local useStyle = UIBloxModule.Core.Style.useStyle
local imageSetButton = UIBloxModule.Core.ImageSet.ImageSetButton
local images = UIBloxModule.App.ImageSet.Images
game:DefineFastFlag("generateGameInviteShareLinkOnClick", false)
local share = images["icons/actions/share"]
local link = images["icons/menu/link"]
local t = {
	copied = "Feature.SocialShare.Label.Copied",
	copyLink = "Feature.SocialShare.Action.CopyLink"
}

return function(p0) --[[ line: 46 ]]
	-- upvalues: reactModule (ref), useSelector (ref), useStyle (ref), useDispatch (ref), getLocalizedStrings (ref), t (ref), shareLinksNetworking (ref), shareLinksRodux (ref), gameInviteAnalyticsManagerModule (ref), default (ref), throttle (ref), linkButton (ref), networkStatus (ref), imageSetButton (ref), link (ref), share (ref)
	local var6, var7 = reactModule.useState(false)
	local var8 = useSelector(function(p1) --[[ line: 49 ]]
		return p1
	end)
	local var9 = useStyle()
	local var10 = useDispatch()
	local var11 = getLocalizedStrings(t)
	local shareInviteLink = var8.ShareLinks.Invites.ShareInviteLink
	
	local var12 = function() --[[ line: 61 ]]
		-- upvalues: var10 (ref), shareLinksNetworking (copy), shareLinksRodux (copy), gameInviteAnalyticsManagerModule (copy), default (copy)
		var10(shareLinksNetworking.GenerateLink.API({
			linkType = shareLinksRodux.Enums.LinkType.ExperienceInvite.rawValue()
		})):andThen(function(p2) --[[ line: 64 ]]
			-- upvalues: gameInviteAnalyticsManagerModule (copy), shareLinksRodux (copy), default (copy)
			gameInviteAnalyticsManagerModule:linkGenerated({
				linkType = shareLinksRodux.Enums.LinkType.ExperienceInvite.rawValue(),
				linkId = p2.responseBody.linkId
			})
			
			if game:GetFastFlag("generateGameInviteShareLinkOnClick") and p2 and (p2.responseBody and p2.responseBody.shortUrl) and default then
				default:shareUrl({ context = "V1Menu", url = p2.responseBody.shortUrl })
			end
		end)
	end
	
	reactModule.useEffect(function() --[[ line: 86 ]]
		-- upvalues: shareInviteLink (ref), var12 (ref)
		if not game:GetFastFlag("generateGameInviteShareLinkOnClick") and not shareInviteLink then
			var12()
		end
	end, {})
	local var13 = throttle(function() --[[ line: 100 ]]
		-- upvalues: shareInviteLink (ref), gameInviteAnalyticsManagerModule (copy), default (copy), var12 (ref), p0 (ref), var7 (ref)
		gameInviteAnalyticsManagerModule:onShareButtonClick(if shareInviteLink then shareInviteLink.linkId else nil)
		
		if not shareInviteLink then
			var12()
		elseif default then
			default:shareUrl({ context = "V1Menu", url = shareInviteLink.shortUrl })
		end
		if p0.isDesktop then
			var7(true)
			task.delay(1, function() --[[ line: 116 ]]
				-- upvalues: var7 (copy)
				var7(false)
			end)
		end
	end)
	
	return if p0.isDesktop then if p0.isFullSize then reactModule.createElement("Frame", {
		BorderSizePixel = 0,
		BackgroundTransparency = 1,
		Size = p0.size,
		LayoutOrder = p0.layoutOrder
	}, {
		LinkButton = reactModule.createElement(linkButton, {
			isLoading = false,
			isDisabled = if shareLinksNetworking.GenerateLink.getStatus(var8, {
				linkType = shareLinksRodux.Enums.LinkType.ExperienceInvite.rawValue()
			}) ~= networkStatus.Fetching then var6 else true,
			onActivated = var13,
			size = p0.size,
			text = if var6 then var11.copied else var11.copyLink
		})
	}) else reactModule.createElement(imageSetButton, {
		LayoutOrder = p0.layoutOrder,
		BackgroundTransparency = 1,
		Size = p0.size,
		[reactModule.Event.Activated] = var13,
		Image = link,
		ImageColor3 = var9.Theme.IconEmphasis.Color,
		ImageTransparency = var9.Theme.IconEmphasis.Transparency,
		BorderSizePixel = 0
	}) else reactModule.createElement(imageSetButton, {
		LayoutOrder = p0.layoutOrder,
		BackgroundTransparency = 1,
		Size = p0.size,
		[reactModule.Event.Activated] = var13,
		Image = share,
		ImageColor3 = var9.Theme.IconEmphasis.Color,
		ImageTransparency = var9.Theme.IconEmphasis.Transparency,
		BorderSizePixel = 0
	})
end