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
local fFlagEnablePressingCommunityOwnerInPeekViewModule = require(profilePlatform.Flags.FFlagEnablePressingCommunityOwnerInPeekView)
local fFlagSignalsNavP3Dispatch = require(parent.SharedFlags).FFlagSignalsNavP3Dispatch
local var1 = if fFlagSignalsNavP3Dispatch then require(parent.RobloxAppNavigation).NavigationCommands else nil

return function(p1)
	-- upvalues: useDispatch (ref), useLocalization (ref), textKeysModule (ref), reactModule (ref), fFlagEnablePressingCommunityOwnerInPeekViewModule (ref), appPage (ref), enumsModule (ref), fFlagSignalsNavP3Dispatch (ref), var1 (ref), navigateDown (ref), horizontalPageMargin (ref), view (ref), image (ref), text (ref), socialCountsItemModule (ref), abbreviateCount (ref)
	local var2 = useDispatch()
	local var3 = useLocalization({
		byOwner = { textKeysModule.ByOwner, ownerName = p1.ownerName },
		members = textKeysModule.Members,
		followers = textKeysModule.Followers,
		follower = textKeysModule.Follower
	})
	
	return reactModule.createElement(horizontalPageMargin, {
		backgroundTransparency = 1,
		useAutomaticSizing = true,
		layoutOrder = p1.layoutOrder,
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
					Image = p1.thumbnail,
					Size = UDim2.new(0, 80, 0, 80)
				}),
				Names = reactModule.createElement(view, {
					LayoutOrder = 2,
					tag = "fill col size-full-0 auto-y align-y-center gap-small",
					Size = UDim2.new(1, 0, 0, 80)
				}, {
					CommunityName = if p1.name then reactModule.createElement(text, {
						LayoutOrder = 1,
						tag = "content-emphasis auto-xy text-heading-small text-wrap text-align-x-left",
						Text = p1.name
					}) else nil,
					OwnerName = if p1.ownerName then reactModule.createElement(text, {
						LayoutOrder = 2,
						tag = "content-default auto-xy text-body-medium text-wrap text-align-x-left",
						Text = var3.byOwner,
						onActivated = if fFlagEnablePressingCommunityOwnerInPeekViewModule then if fFlagEnablePressingCommunityOwnerInPeekViewModule then function()
							-- upvalues: p1 (ref), appPage (copy), enumsModule (copy), fFlagSignalsNavP3Dispatch (copy), var1 (copy), var2 (ref), navigateDown (copy)
							if p1.ownerUserId then
								local t = {
									name = appPage.ProfilePlatform,
									detail = p1.ownerUserId,
									extraProps = { profileType = enumsModule.ProfileTypes.User }
								}
								
								if fFlagSignalsNavP3Dispatch then
									var1.down(var1.fromLegacyPage(t))
									
									return
								end
								var2(navigateDown(t))
							end
						end else nil else nil
					}) else nil
				})
			}),
			Counts = reactModule.createElement(view, { LayoutOrder = 2, tag = "size-full-0 auto-xy" }, {
				MembersCount = reactModule.createElement(socialCountsItemModule, {
					layoutOrder = 1,
					text = reactModule.useMemo(function()
						-- upvalues: p1 (ref), var3 (ref)
						return if p1.hasSocialModules then var3.members elseif p1.membersCount == 1 then var3.follower else var3.followers
					end, { var3, p1.membersCount, p1.hasSocialModules }),
					count = abbreviateCount(p1.membersCount),
					onActivated = function() end
				})
			})
		})
	})
end