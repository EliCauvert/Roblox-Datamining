local profilePlatform = script:FindFirstAncestor("ProfilePlatform")
local parent = profilePlatform.Parent
local horizontalPageMargin = require(parent.UIBlox).App.Container.HorizontalPageMargin
local foundationModule = require(parent.Foundation)
local reactModule = require(parent.React)
local abbreviateCount = require(parent.Localization).abbreviateCount
local useLocalization = require(parent.Localization).Hooks.useLocalization
local useDispatch = require(parent.RoactUtils).Hooks.RoactRodux.useDispatch
local navigateDown = require(parent.NavigationRodux).Thunks.NavigateDown
local appPage = require(parent.RobloxAppEnums).AppPage
local enumsModule = require(profilePlatform.Common.Enums)
local image = foundationModule.Image
local text = foundationModule.Text
local view = foundationModule.View
local socialCountsItemModule = require(profilePlatform.Components.UserProfileHeader.SocialCountsItem)
local textKeysModule = require(profilePlatform.Common.TextKeys)
local fFlagProfilePlatformUpdateUXForNonSocialCommunitiesModule = require(profilePlatform.Flags.FFlagProfilePlatformUpdateUXForNonSocialCommunities)
local fFlagEnablePressingCommunityOwnerInPeekViewModule = require(profilePlatform.Flags.FFlagEnablePressingCommunityOwnerInPeekView)
local fFlagSignalsNavP3Dispatch = require(parent.SharedFlags).FFlagSignalsNavP3Dispatch
local var8 = if fFlagSignalsNavP3Dispatch then require(parent.RobloxAppNavigation).NavigationCommands else nil

return function(p0) --[[ line: 43 | named "CommunityProfileHeader" ]]
	-- upvalues: useDispatch (ref), useLocalization (ref), textKeysModule (ref), fFlagProfilePlatformUpdateUXForNonSocialCommunitiesModule (ref), reactModule (ref), fFlagEnablePressingCommunityOwnerInPeekViewModule (ref), appPage (ref), enumsModule (ref), fFlagSignalsNavP3Dispatch (ref), var8 (ref), navigateDown (ref), horizontalPageMargin (ref), view (ref), image (ref), text (ref), socialCountsItemModule (ref), abbreviateCount (ref)
	local var9 = useDispatch()
	local var10 = useLocalization({
		byOwner = { textKeysModule.ByOwner, ownerName = p0.ownerName },
		members = textKeysModule.Members,
		followers = textKeysModule.Followers,
		follower = textKeysModule.Follower
	})
	
	return reactModule.createElement(horizontalPageMargin, {
		backgroundTransparency = 1,
		useAutomaticSizing = true,
		layoutOrder = p0.layoutOrder,
		size = UDim2.new(1, 0, 0, 0)
	}, {
		Container = reactModule.createElement(view, {
			LayoutOrder = 1,
			tag = "col size-full-0 auto-xy gap-xsmall"
		}, {
			HeaderInformation = reactModule.createElement(view, {
				LayoutOrder = 1,
				tag = "row gap-medium size-full-0 auto-xy"
			}, {
				CommunityThumbnail = reactModule.createElement(image, {
					LayoutOrder = 1,
					tag = "radius-medium self-center",
					Image = p0.thumbnail,
					Size = UDim2.new(0, 80, 0, 80)
				}),
				Names = reactModule.createElement(view, {
					LayoutOrder = 2,
					tag = "fill col size-full-0 auto-y align-y-center gap-small",
					Size = UDim2.new(1, 0, 0, 80)
				}, {
					CommunityName = if p0.name then reactModule.createElement(text, {
						LayoutOrder = 1,
						tag = "content-emphasis auto-xy text-heading-small text-wrap text-align-x-left",
						Text = p0.name
					}) else nil,
					OwnerName = if p0.ownerName then reactModule.createElement(text, {
						LayoutOrder = 2,
						tag = "content-default auto-xy text-body-medium text-wrap text-align-x-left",
						Text = var10.byOwner,
						onActivated = if fFlagEnablePressingCommunityOwnerInPeekViewModule then if fFlagEnablePressingCommunityOwnerInPeekViewModule then function() --[[ line: 68 ]]
							-- upvalues: p0 (ref), appPage (copy), enumsModule (copy), fFlagSignalsNavP3Dispatch (copy), var8 (copy), var9 (ref), navigateDown (copy)
							if p0.ownerUserId then
								local t = {
									name = appPage.ProfilePlatform,
									detail = p0.ownerUserId,
									extraProps = { profileType = enumsModule.ProfileTypes.User }
								}
								
								if fFlagSignalsNavP3Dispatch then
									var8.down(var8.fromLegacyPage(t))
									
									return
								end
								var9(navigateDown(t))
							end
						end else nil else nil
					}) else nil
				})
			}),
			Counts = reactModule.createElement(view, { LayoutOrder = 2, tag = "size-full-0 auto-xy" }, {
				MembersCount = reactModule.createElement(socialCountsItemModule, {
					layoutOrder = 1,
					text = if fFlagProfilePlatformUpdateUXForNonSocialCommunitiesModule then if fFlagProfilePlatformUpdateUXForNonSocialCommunitiesModule then reactModule.useMemo(function() --[[ line: 55 ]]
						-- upvalues: p0 (ref), var10 (ref)
						return if p0.hasSocialModules then var10.members elseif p0.membersCount == 1 then var10.follower else var10.followers
					end, { var10, p0.membersCount, p0.hasSocialModules }) else nil else var10.members,
					count = abbreviateCount(p0.membersCount),
					onActivated = function() --[[ line: 140 ]] end
				})
			})
		})
	})
end