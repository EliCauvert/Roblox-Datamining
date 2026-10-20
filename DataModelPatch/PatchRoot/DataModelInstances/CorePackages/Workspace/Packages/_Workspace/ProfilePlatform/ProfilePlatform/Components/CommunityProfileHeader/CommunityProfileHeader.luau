local ProfilePlatform = script:FindFirstAncestor("ProfilePlatform")
local Parent = ProfilePlatform.Parent
local HorizontalPageMargin = require(Parent.UIBlox).App.Container.HorizontalPageMargin
local FoundationModule = require(Parent.Foundation)
local ReactModule = require(Parent.React)
local AbbreviateCountFunction = require(Parent.Localization).abbreviateCount
local UseLocalizationFunction = require(Parent.Localization).Hooks.useLocalization
local UseDispatchFunction = require(Parent.RoactUtils).Hooks.RoactRodux.useDispatch
local NavigateDownFunction = require(Parent.NavigationRodux).Thunks.NavigateDown
local AppPage = require(Parent.RobloxAppEnums).AppPage
local EnumsModule = require(ProfilePlatform.Common.Enums)
local Image = FoundationModule.Image
local Text = FoundationModule.Text
local View = FoundationModule.View
local SocialCountsItemModule = require(ProfilePlatform.Components.UserProfileHeader.SocialCountsItem)
local TextKeysModule = require(ProfilePlatform.Common.TextKeys)
local FFlagProfilePlatformUpdateUXForNonSocialCommunitiesModule = require(ProfilePlatform.Flags.FFlagProfilePlatformUpdateUXForNonSocialCommunities)
local FFlagEnablePressingCommunityOwnerInPeekViewModule = require(ProfilePlatform.Flags.FFlagEnablePressingCommunityOwnerInPeekView)
local FFlagSignalsNavP3Dispatch = require(Parent.SharedFlags).FFlagSignalsNavP3Dispatch
local NavigationCommands = if FFlagSignalsNavP3Dispatch then require(Parent.RobloxAppNavigation).NavigationCommands else nil

return function(p1)
	-- upvalues: UseDispatchFunction (copy), UseLocalizationFunction (copy), TextKeysModule (copy), FFlagProfilePlatformUpdateUXForNonSocialCommunitiesModule (copy), ReactModule (copy), FFlagEnablePressingCommunityOwnerInPeekViewModule (copy), AppPage (copy), EnumsModule (copy), FFlagSignalsNavP3Dispatch (copy), NavigationCommands (copy), NavigateDownFunction (copy), HorizontalPageMargin (copy), View (copy), Image (copy), Text (copy), SocialCountsItemModule (copy), AbbreviateCountFunction (copy)
	local UseDispatchResult = UseDispatchFunction()
	local UseLocalizationResult = UseLocalizationFunction({
		byOwner = { TextKeysModule.ByOwner, ownerName = p1.ownerName },
		members = TextKeysModule.Members,
		followers = TextKeysModule.Followers,
		follower = TextKeysModule.Follower
	})
	local UseMemoResult = if FFlagProfilePlatformUpdateUXForNonSocialCommunitiesModule then ReactModule.useMemo(function()
		-- upvalues: p1 (copy), UseLocalizationResult (copy)
		return if p1.hasSocialModules then UseLocalizationResult.members elseif p1.membersCount == 1 then UseLocalizationResult.follower else UseLocalizationResult.followers
	end, {
		UseLocalizationResult,
		p1.membersCount,
		p1.hasSocialModules
	}) else nil
	local v1 = if FFlagEnablePressingCommunityOwnerInPeekViewModule then function()
		-- upvalues: p1 (copy), AppPage (upval), EnumsModule (upval), FFlagSignalsNavP3Dispatch (upval), NavigationCommands (upval), UseDispatchResult (copy), NavigateDownFunction (upval)
		if p1.ownerUserId then
			local config = {
				name = AppPage.ProfilePlatform,
				detail = p1.ownerUserId,
				extraProps = { profileType = EnumsModule.ProfileTypes.User }
			}
			
			if FFlagSignalsNavP3Dispatch then
				NavigationCommands.down(NavigationCommands.fromLegacyPage(config))
				
				return
			end
			UseDispatchResult(NavigateDownFunction(config))
		end
	end else nil
	
	return ReactModule.createElement(HorizontalPageMargin, {
		backgroundTransparency = 1,
		useAutomaticSizing = true,
		layoutOrder = p1.layoutOrder,
		size = UDim2.new(1, 0, 0, 0)
	}, {
		Container = ReactModule.createElement(View, {
			LayoutOrder = 1,
			tag = "col size-full-0 auto-xy gap-xsmall"
		}, {
			HeaderInformation = ReactModule.createElement(View, {
				LayoutOrder = 1,
				tag = "row gap-medium size-full-0 auto-xy"
			}, {
				CommunityThumbnail = ReactModule.createElement(Image, {
					LayoutOrder = 1,
					tag = "radius-medium self-center",
					Image = p1.thumbnail,
					Size = UDim2.new(0, 80, 0, 80)
				}),
				Names = ReactModule.createElement(View, {
					LayoutOrder = 2,
					tag = "fill col size-full-0 auto-y align-y-center gap-small",
					Size = UDim2.new(1, 0, 0, 80)
				}, {
					CommunityName = if p1.name then ReactModule.createElement(Text, {
						LayoutOrder = 1,
						tag = "content-emphasis auto-xy text-heading-small text-wrap text-align-x-left",
						Text = p1.name
					}) else nil,
					OwnerName = if p1.ownerName then ReactModule.createElement(Text, {
						LayoutOrder = 2,
						tag = "content-default auto-xy text-body-medium text-wrap text-align-x-left",
						Text = UseLocalizationResult.byOwner,
						onActivated = if FFlagEnablePressingCommunityOwnerInPeekViewModule then v1 else nil
					}) else nil
				})
			}),
			Counts = ReactModule.createElement(View, { LayoutOrder = 2, tag = "size-full-0 auto-xy" }, {
				MembersCount = ReactModule.createElement(SocialCountsItemModule, {
					layoutOrder = 1,
					text = if FFlagProfilePlatformUpdateUXForNonSocialCommunitiesModule then UseMemoResult else UseLocalizationResult.members,
					count = AbbreviateCountFunction(p1.membersCount),
					onActivated = function() end
				})
			})
		})
	})
end