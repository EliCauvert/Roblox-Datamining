local Parent = script:FindFirstAncestor("FriendsMenu").Parent
local ReactModule = require(Parent.React)
local FoundationModule = require(Parent.Foundation)
local UseLocalizationFunction = require(Parent.Localization).Hooks.useLocalization
local IconSize = FoundationModule.Enums.IconSize
local UseDispatchFunction = require(Parent.RoactUtils).Hooks.RoactRodux.useDispatch
local ReducerDependencies = require(Parent.NotificationsCommon).ReducerDependencies
local ShareLinksNetworking = ReducerDependencies.ShareLinksNetworking
local ShareLinksRodux = ReducerDependencies.ShareLinksRodux
local Default = require(Parent.ExternalContentSharingProtocol).ExternalContentSharingProtocol.default
local DeviceInfo = require(Parent.NotificationsCommon).DeviceInfo
local ThrottleFunction = require(Parent.NotificationsCommon).Throttle
local Popover = FoundationModule.Popover
local PopoverAlign = FoundationModule.Enums.PopoverAlign

return function(p1) --[[ Line: 27 ]]
	-- upvalues: UseDispatchFunction (copy), DeviceInfo (copy), ReactModule (copy), ShareLinksNetworking (copy), ShareLinksRodux (copy), Default (copy), UseLocalizationFunction (copy), FoundationModule (copy), ThrottleFunction (copy), Popover (copy), IconSize (copy), PopoverAlign (copy)
	local UseDispatchResult = UseDispatchFunction()
	local IsDesktopDevice = DeviceInfo.isDesktopDevice()
	local UseStateResult, UseStateResult2 = ReactModule.useState(false)
	
	local function v15() --[[ Line: 31 ]]
		-- upvalues: IsDesktopDevice (copy), UseStateResult (copy), UseDispatchResult (copy), ShareLinksNetworking (upval), ShareLinksRodux (upval), Default (upval)
		if not IsDesktopDevice or not UseStateResult then
			UseDispatchResult(ShareLinksNetworking.GenerateLink.API({
				linkType = ShareLinksRodux.Enums.LinkType.ExperienceInvite.rawValue()
			})):andThen(function(Result) --[[ Line: 40 ]]
				-- upvalues: Default (upval)
				if Result and Result.responseBody and Result.responseBody.shortUrl and Default then
					Default:shareUrl({ context = "V1Menu", url = Result.responseBody.shortUrl })
				end
			end):catch(function(Err) --[[ Line: 53 ]]
				warn(Err)
			end)
			
			return
		end
	end
	
	local UseLocalizationResult = UseLocalizationFunction({
		copied = "Feature.SocialShare.Label.Copied",
		copyLink = if IsDesktopDevice then "Feature.SocialShare.Label.CopyLinkToShareWithPeople" else "Feature.SocialShare.ShareWithPeopleYouKnow"
	})
	
	return ReactModule.createElement(FoundationModule.View, {
		tag = "row size-full-1400 padding-x-xxlarge gap-medium align-y-center",
		LayoutOrder = p1.layoutOrder,
		onActivated = ThrottleFunction(function() --[[ Line: 66 ]]
			-- upvalues: v15 (copy), IsDesktopDevice (copy), UseStateResult2 (copy)
			v15()
			
			if IsDesktopDevice then
				UseStateResult2(true)
				task.delay(2, function() --[[ Line: 70 ]]
					-- upvalues: UseStateResult2 (upval)
					UseStateResult2(false)
				end)
			end
		end)
	}, {
		PopoverRoot = ReactModule.createElement(Popover.Root, { isOpen = UseStateResult }, {
			ShareIconContainer = ReactModule.createElement(FoundationModule.View, {
				tag = "col radius-circle bg-surface-300 align-x-center align-y-center",
				Size = UDim2.fromOffset(56, 56)
			}, {
				ShareIcon = ReactModule.createElement(FoundationModule.Icon, {
					name = if IsDesktopDevice then "icons/menu/link" else "icons/actions/share",
					size = IconSize.Medium
				})
			}),
			PopoverAnchor = ReactModule.createElement(Popover.Anchor, nil, {
				LabelText = ReactModule.createElement(FoundationModule.Text, {
					tag = "text-title-large size-full align-x-left text-align-x-left",
					Text = UseLocalizationResult.copyLink
				})
			}),
			Content = ReactModule.createElement(Popover.Content, {
				tags = "size-full auto-y",
				hasArrow = false,
				align = PopoverAlign.End
			}, {
				CopiedPopoverText = ReactModule.createElement(FoundationModule.Text, {
					tag = "auto-xy text-title-small text-align-x-center padding-medium",
					Text = UseLocalizationResult.copied
				})
			})
		})
	})
end