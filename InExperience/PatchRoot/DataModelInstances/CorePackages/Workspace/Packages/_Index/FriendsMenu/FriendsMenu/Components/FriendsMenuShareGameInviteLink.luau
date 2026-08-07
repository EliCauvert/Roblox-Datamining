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

return function(p0) --[[ line: 27 ]]
	-- upvalues: useDispatch (ref), deviceInfo (ref), reactModule (ref), shareLinksNetworking (ref), shareLinksRodux (ref), default (ref), useLocalization (ref), foundationModule (ref), throttle (ref), popover (ref), iconSize (ref), popoverAlign (ref)
	local var2 = useDispatch()
	local var3 = deviceInfo.isDesktopDevice()
	local var4, var5 = reactModule.useState(false)
	
	local var6 = function() --[[ line: 31 ]]
		-- upvalues: var3 (ref), var4 (ref), var2 (ref), shareLinksNetworking (copy), shareLinksRodux (copy), default (copy)
		if var3 and var4 then
			return
		end
		var2(shareLinksNetworking.GenerateLink.API({
			linkType = shareLinksRodux.Enums.LinkType.ExperienceInvite.rawValue()
		})):andThen(function(p2) --[[ line: 40 ]]
			-- upvalues: default (copy)
			if p2 and p2.responseBody and (p2.responseBody.shortUrl and default) then
				default:shareUrl({ context = "V1Menu", url = p2.responseBody.shortUrl })
			end
		end):catch(function(p1) --[[ line: 53 ]]
			warn(p1)
		end)
	end
	
	local var7 = useLocalization({
		copied = "Feature.SocialShare.Label.Copied",
		copyLink = if not var3 then "Feature.SocialShare.ShareWithPeopleYouKnow" else "Feature.SocialShare.Label.CopyLinkToShareWithPeople"
	})
	
	return reactModule.createElement(foundationModule.View, {
		tag = "row size-full-1400 padding-x-xxlarge gap-medium align-y-center",
		LayoutOrder = p0.layoutOrder,
		onActivated = throttle(function() --[[ line: 66 ]]
			-- upvalues: var6 (ref), var3 (ref), var5 (ref)
			var6()
			
			if var3 then
				var5(true)
				task.delay(2, function() --[[ line: 70 ]]
					-- upvalues: var5 (copy)
					var5(false)
				end)
			end
		end)
	}, {
		PopoverRoot = reactModule.createElement(popover.Root, { isOpen = var4 }, {
			ShareIconContainer = reactModule.createElement(foundationModule.View, {
				tag = "col radius-circle bg-surface-300 align-x-center align-y-center",
				Size = UDim2.fromOffset(56, 56)
			}, {
				ShareIcon = reactModule.createElement(foundationModule.Icon, {
					name = if not var3 then "icons/actions/share" else "icons/menu/link",
					size = iconSize.Medium
				})
			}),
			PopoverAnchor = reactModule.createElement(popover.Anchor, nil, {
				LabelText = reactModule.createElement(foundationModule.Text, {
					tag = "text-title-large size-full align-x-left text-align-x-left",
					Text = var7.copyLink
				})
			}),
			Content = reactModule.createElement(popover.Content, {
				tags = "size-full auto-y",
				hasArrow = false,
				align = popoverAlign.End
			}, {
				CopiedPopoverText = reactModule.createElement(foundationModule.Text, {
					tag = "auto-xy text-title-small text-align-x-center padding-medium",
					Text = var7.copied
				})
			})
		})
	})
end