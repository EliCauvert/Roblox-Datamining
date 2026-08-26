local parent = script:FindFirstAncestor("FriendsMenu").Parent
local reactModule = require(parent.React)
local foundationModule = require(parent.Foundation)
local useLocalization = require(parent.Localization).Hooks.useLocalization
local iconSize = foundationModule.Enums.IconSize
local useDispatch = require(parent.RoactUtils).Hooks.RoactRodux.useDispatch
local reducerDependencies = require(parent.NotificationsCommon).ReducerDependencies
local shareLinksNetworking = reducerDependencies.ShareLinksNetworking
local shareLinksRodux = reducerDependencies.ShareLinksRodux
local default = require(parent.ExternalContentSharingProtocol).ExternalContentSharingProtocol.default
local deviceInfo = require(parent.NotificationsCommon).DeviceInfo
local throttle = require(parent.NotificationsCommon).Throttle
local popover = foundationModule.Popover
local popoverAlign = foundationModule.Enums.PopoverAlign

return function(p1)
	-- upvalues: useDispatch (ref), deviceInfo (ref), reactModule (ref), shareLinksNetworking (ref), shareLinksRodux (ref), default (ref), useLocalization (ref), foundationModule (ref), throttle (ref), popover (ref), iconSize (ref), popoverAlign (ref)
	local var1 = useDispatch()
	local var2 = deviceInfo.isDesktopDevice()
	local var3, var4 = reactModule.useState(false)
	
	local var5 = function()
		-- upvalues: var2 (ref), var3 (ref), var1 (ref), shareLinksNetworking (copy), shareLinksRodux (copy), default (copy)
		if var2 and var3 then
			return
		end
		var1(shareLinksNetworking.GenerateLink.API({
			linkType = shareLinksRodux.Enums.LinkType.ExperienceInvite.rawValue()
		})):andThen(function(p2)
			-- upvalues: default (copy)
			if p2 and p2.responseBody and (p2.responseBody.shortUrl and default) then
				default:shareUrl({ context = "V1Menu", url = p2.responseBody.shortUrl })
			end
		end):catch(function(p2)
			warn(p2)
		end)
	end
	
	local var6 = useLocalization({
		copied = "Feature.SocialShare.Label.Copied",
		copyLink = if not var2 then "Feature.SocialShare.ShareWithPeopleYouKnow" else "Feature.SocialShare.Label.CopyLinkToShareWithPeople"
	})
	
	return reactModule.createElement(foundationModule.View, {
		tag = "row size-full-1400 padding-x-xxlarge gap-medium align-y-center",
		LayoutOrder = p1.layoutOrder,
		onActivated = throttle(function()
			-- upvalues: var5 (ref), var2 (ref), var4 (ref)
			var5()
			
			if var2 then
				var4(true)
				task.delay(2, function()
					-- upvalues: var4 (copy)
					var4(false)
				end)
			end
		end)
	}, {
		PopoverRoot = reactModule.createElement(popover.Root, { isOpen = var3 }, {
			ShareIconContainer = reactModule.createElement(foundationModule.View, {
				tag = "col radius-circle bg-surface-300 align-x-center align-y-center",
				Size = UDim2.fromOffset(56, 56)
			}, {
				ShareIcon = reactModule.createElement(foundationModule.Icon, {
					name = if not var2 then "icons/actions/share" else "icons/menu/link",
					size = iconSize.Medium
				})
			}),
			PopoverAnchor = reactModule.createElement(popover.Anchor, nil, {
				LabelText = reactModule.createElement(foundationModule.Text, {
					tag = "text-title-large size-full align-x-left text-align-x-left",
					Text = var6.copyLink
				})
			}),
			Content = reactModule.createElement(popover.Content, {
				tags = "size-full auto-y",
				hasArrow = false,
				align = popoverAlign.End
			}, {
				CopiedPopoverText = reactModule.createElement(foundationModule.Text, {
					tag = "auto-xy text-title-small text-align-x-center padding-medium",
					Text = var6.copied
				})
			})
		})
	})
end