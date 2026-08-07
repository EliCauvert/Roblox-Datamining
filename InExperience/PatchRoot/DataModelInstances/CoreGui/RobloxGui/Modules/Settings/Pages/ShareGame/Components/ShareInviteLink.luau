local corePackagesService = game:GetService("CorePackages")
local robloxGui = game:GetService("CoreGui"):WaitForChild("RobloxGui")
local userInputService = game:GetService("UserInputService")
local default = require(corePackagesService.Workspace.Packages.ExternalContentSharingProtocol).ExternalContentSharingProtocol.default
local roactModule = require(corePackagesService.Packages.Roact)
local roactRoduxModule = require(corePackagesService.Packages.RoactRodux)
local shareGame = robloxGui.Modules.Settings.Pages.ShareGame
local reducerDependencies = require(corePackagesService.Workspace.Packages.NotificationsCommon).ReducerDependencies
local constantsModule = require(shareGame.Constants)
local shareButtonModule = require(shareGame.Components.ShareButton)
local var7 = require(shareGame.getTranslator)()
local shareInviteLinkMapDispatchToPropsModule = require(shareGame.Components.ShareInviteLinkMapDispatchToProps)
local shareInviteLinkMapStateToPropsModule = require(shareGame.Components.ShareInviteLinkMapStateToProps)
local shareLinksRodux = reducerDependencies.ShareLinksRodux
local networkStatus = reducerDependencies.RoduxNetworking.Enum.NetworkStatus
local themeModule = require(robloxGui.Modules.Settings.Theme)
local getFFlagEnableNewInviteMenuModule = require(robloxGui.Modules.Flags.GetFFlagEnableNewInviteMenu)
local shareInviteLink = roactModule.PureComponent:extend("ShareInviteLink")
local var13 = 12
local var14 = 8
local var15 = 69

if getFFlagEnableNewInviteMenuModule() then
	var13 = 16
	var14 = 12
	var15 = 66
end
local color = Color3.fromRGB(79, 84, 95)
local var17 = var7:FormatByKey("Feature.SocialShare.Action.Share")
local var18 = var7:FormatByKey("Feature.SocialShare.Label.Copied")
local platform = userInputService:GetPlatform()
shareInviteLink.defaultProps = {
	externalContentSharingProtocol = default,
	isDesktopClient = if platform ~= Enum.Platform.Windows then if platform ~= Enum.Platform.OSX then platform == Enum.Platform.UWP else true else true
}

function shareInviteLink.init(p0) --[[ line: 66 ]]
	p0.state = { showCopiedText = false }
	
	function p0.displayShareSheet(p1) --[[ line: 71 ]]
		-- upvalues: p0 (ref)
		local props = p0.props
		
		if props.externalContentSharingProtocol then
			props.externalContentSharingProtocol:shareUrl({ context = "V1Menu", url = p1.shortUrl })
			
			if props.isDesktopClient then
				p0:setState({ showCopiedText = true })
				task.delay(1, function() --[[ line: 82 ]]
					-- upvalues: p0 (copy)
					p0:setState({ showCopiedText = false })
				end)
			end
		end
	end
end

function shareInviteLink.didUpdate(p2, p3) --[[ line: 90 ]]
	-- upvalues: shareLinksRodux (ref)
	local props = p2.props
	
	if p3.shareInviteLink == nil and p2.props.shareInviteLink ~= nil then
		p2.props.analytics:linkGenerated({
			linkType = shareLinksRodux.Enums.LinkType.ExperienceInvite.rawValue(),
			linkId = p2.props.shareInviteLink.linkId
		})
		p2.displayShareSheet(props.shareInviteLink)
	end
end

function shareInviteLink.render(p4) --[[ line: 103 ]]
	-- upvalues: constantsModule (ref), roactModule (ref), themeModule (ref), color (ref), var13 (write), var14 (write), var7 (ref), var15 (write), shareButtonModule (ref), var18 (ref), var17 (ref), networkStatus (ref)
	return roactModule.createElement("Frame", {
		BorderSizePixel = 0,
		Size = p4.props.size,
		Position = p4.props.position,
		LayoutOrder = p4.props.layoutOrder,
		BackgroundColor3 = themeModule.color("PlayerRowFrame", color),
		BackgroundTransparency = themeModule.transparency("PlayerRowFrame", 0),
		ZIndex = p4.props.zIndex
	}, {
		Corner = roactModule.createElement("UICorner", { CornerRadius = themeModule.MenuContainerCornerRadius }),
		UIPadding = roactModule.createElement("UIPadding", {
			PaddingLeft = UDim.new(0, var13),
			PaddingRight = UDim.new(0, var13),
			PaddingTop = UDim.new(0, var14),
			PaddingBottom = UDim.new(0, var14)
		}),
		UIListLayout = roactModule.createElement("UIListLayout", {
			FillDirection = Enum.FillDirection.Horizontal,
			HorizontalAlignment = Enum.HorizontalAlignment.Left,
			VerticalAlignment = Enum.VerticalAlignment.Center,
			SortOrder = Enum.SortOrder.LayoutOrder
		}),
		Title = roactModule.createElement("TextLabel", {
			BackgroundTransparency = 1,
			LayoutOrder = 0,
			TextXAlignment = Enum.TextXAlignment.Left,
			Text = var7:FormatByKey("Feature.SocialShare.Label.ShareServerLink"),
			Size = UDim2.new(1, -var15, 1, 0),
			TextSize = themeModule.textSize(constantsModule.LayoutSpecific[p4.props.deviceLayout].PAGE_TITLE_TEXT_SIZE, "ShareLinkTitle"),
			TextColor3 = constantsModule.Color.WHITE,
			Font = themeModule.font(Enum.Font.SourceSansSemibold, "Semibold")
		}),
		ShareButton = roactModule.createElement(shareButtonModule, {
			layoutOrder = 1,
			size = UDim2.new(0, var15, 1, 0),
			onShare = function() --[[ line: 110 ]]
				-- upvalues: p4 (ref)
				local props = p4.props
				p4.props.analytics:onShareButtonClick()
				
				if p4.props.shareInviteLink == nil then
					p4.props.fetchShareInviteLink()
					
					return
				end
				p4.displayShareSheet(props.shareInviteLink)
			end,
			text = if p4.state.showCopiedText then var18 else var17,
			isEnabled = p4.props.fetchShareInviteLinkNetworkStatus ~= networkStatus.Fetching and not p4.state.showCopiedText
		})
	})
end

return roactRoduxModule.connect(shareInviteLinkMapStateToPropsModule, shareInviteLinkMapDispatchToPropsModule)(shareInviteLink)