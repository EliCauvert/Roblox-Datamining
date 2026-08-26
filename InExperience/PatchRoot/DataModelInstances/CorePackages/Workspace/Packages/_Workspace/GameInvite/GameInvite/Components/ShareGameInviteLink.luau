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

return function(p1)
	-- upvalues: reactModule (ref), useSelector (ref), useStyle (ref), useDispatch (ref), getLocalizedStrings (ref), t (ref), shareLinksNetworking (ref), shareLinksRodux (ref), gameInviteAnalyticsManagerModule (ref), default (ref), throttle (ref), linkButton (ref), networkStatus (ref), imageSetButton (ref), link (ref), share (ref)
	local var1, var2 = reactModule.useState(false)
	local var3 = useSelector(function(p2)
		return p2
	end)
	local var4 = useStyle()
	local var5 = useDispatch()
	local var6 = getLocalizedStrings(t)
	local shareInviteLink = var3.ShareLinks.Invites.ShareInviteLink
	
	local var7 = function()
		-- upvalues: var5 (ref), shareLinksNetworking (copy), shareLinksRodux (copy), gameInviteAnalyticsManagerModule (copy), default (copy)
		var5(shareLinksNetworking.GenerateLink.API({
			linkType = shareLinksRodux.Enums.LinkType.ExperienceInvite.rawValue()
		})):andThen(function(p2)
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
	
	reactModule.useEffect(function()
		-- upvalues: shareInviteLink (ref), var7 (ref)
		if not game:GetFastFlag("generateGameInviteShareLinkOnClick") and not shareInviteLink then
			var7()
		end
	end, {})
	local var8 = throttle(function()
		-- upvalues: shareInviteLink (ref), gameInviteAnalyticsManagerModule (copy), default (copy), var7 (ref), p1 (ref), var2 (ref)
		gameInviteAnalyticsManagerModule:onShareButtonClick(if shareInviteLink then shareInviteLink.linkId else nil)
		
		if not shareInviteLink then
			var7()
		elseif default then
			default:shareUrl({ context = "V1Menu", url = shareInviteLink.shortUrl })
		end
		if p1.isDesktop then
			var2(true)
			task.delay(1, function()
				-- upvalues: var2 (copy)
				var2(false)
			end)
		end
	end)
	
	return if p1.isDesktop then if p1.isFullSize then reactModule.createElement("Frame", {
		BorderSizePixel = 0,
		BackgroundTransparency = 1,
		Size = p1.size,
		LayoutOrder = p1.layoutOrder
	}, {
		LinkButton = reactModule.createElement(linkButton, {
			isLoading = false,
			isDisabled = if shareLinksNetworking.GenerateLink.getStatus(var3, {
				linkType = shareLinksRodux.Enums.LinkType.ExperienceInvite.rawValue()
			}) ~= networkStatus.Fetching then var1 else true,
			onActivated = var8,
			size = p1.size,
			text = if var1 then var6.copied else var6.copyLink
		})
	}) else reactModule.createElement(imageSetButton, {
		LayoutOrder = p1.layoutOrder,
		BackgroundTransparency = 1,
		Size = p1.size,
		[reactModule.Event.Activated] = var8,
		Image = link,
		ImageColor3 = var4.Theme.IconEmphasis.Color,
		ImageTransparency = var4.Theme.IconEmphasis.Transparency,
		BorderSizePixel = 0
	}) else reactModule.createElement(imageSetButton, {
		LayoutOrder = p1.layoutOrder,
		BackgroundTransparency = 1,
		Size = p1.size,
		[reactModule.Event.Activated] = var8,
		Image = share,
		ImageColor3 = var4.Theme.IconEmphasis.Color,
		ImageTransparency = var4.Theme.IconEmphasis.Transparency,
		BorderSizePixel = 0
	})
end