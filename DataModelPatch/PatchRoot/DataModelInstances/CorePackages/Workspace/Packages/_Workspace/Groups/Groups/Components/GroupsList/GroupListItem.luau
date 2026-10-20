local Groups = script:FindFirstAncestor("Groups")
local Parent = Groups.Parent
local ReactModule = require(Parent.React)
local FoundationModule = require(Parent.Foundation)
local LocalizationModule = require(Parent.Localization)
local UseLocalizationFunction = LocalizationModule.Hooks.useLocalization
local UseAbbreviatedNumberLocalizationFunction = LocalizationModule.Hooks.useAbbreviatedNumberLocalization
local VerifiedBadgesModule = require(Parent.VerifiedBadges)
local UserLibModule = require(Parent.UserLib)
local Constants = UserLibModule.Utils.Constants
local GetRbxthumbWithTypeSizeAndOptionsFunction = UserLibModule.Utils.getRbxthumbWithTypeSizeAndOptions
local View = FoundationModule.View
local Text = FoundationModule.Text
local Image = FoundationModule.Image
local Chip = FoundationModule.Chip
local ChipSize = FoundationModule.Enums.ChipSize
local EmojiWrapper = VerifiedBadgesModule.EmojiWrapper
local TextKeysModule = require(Groups.Common.TextKeys)
local _ = require(Groups.Common.Types)
local UseMembersFollowersLabelModule = require(Groups.Hooks.useMembersFollowersLabel)
local UseGroupsWrapperContextModule = require(Groups.Contexts.useGroupsWrapperContext)

return ReactModule.memo(function(p1)
	-- upvalues: UseGroupsWrapperContextModule (copy), UseAbbreviatedNumberLocalizationFunction (copy), UseMembersFollowersLabelModule (copy), UseLocalizationFunction (copy), TextKeysModule (copy), ReactModule (copy), GetRbxthumbWithTypeSizeAndOptionsFunction (copy), Constants (copy), Chip (copy), ChipSize (copy), View (copy), Image (copy), EmojiWrapper (copy), VerifiedBadgesModule (copy), Text (copy)
	local UseGroupsWrapperContextModuleResult = UseGroupsWrapperContextModule()
	local Group = p1.group
	
	if Group then
		local MemberCount = Group.memberCount or 0
		local UseMembersFollowersLabelModuleResult = UseMembersFollowersLabelModule({
			capitalize = false,
			hasSocialModules = Group.hasSocialModules or false,
			count = MemberCount,
			truncatedCount = UseAbbreviatedNumberLocalizationFunction(if MemberCount > 0 then MemberCount else nil)
		})
		local UseLocalizationResult = UseLocalizationFunction({ owned = TextKeysModule.LabelOwned })
		local Id = Group.id
		local UseMembersFollowersLabelModuleResult1 = if p1.showMemberCount and Group.memberCount ~= nil then UseMembersFollowersLabelModuleResult else nil
		
		return ReactModule.createElement(View, {
			tag = "row size-full-0 auto-y gap-large align-y-center padding-small radius-medium",
			Size = UDim2.new(1, 0, 0, 0),
			AutomaticSize = Enum.AutomaticSize.Y,
			LayoutOrder = p1.layoutOrder,
			onActivated = ReactModule.useCallback(function()
				-- upvalues: Id (copy), UseGroupsWrapperContextModuleResult (copy)
				if Id then
					UseGroupsWrapperContextModuleResult.navigateTo.groupDetails(Id)
				end
			end, {
				UseGroupsWrapperContextModuleResult.navigateTo.groupDetails,
				Id
			})
		}, {
			Thumbnail = ReactModule.createElement(Image, {
				LayoutOrder = 1,
				tag = "radius-medium bg-surface-100",
				Image = ReactModule.useMemo(function()
					-- upvalues: Group (copy), GetRbxthumbWithTypeSizeAndOptionsFunction (upval), Id (copy), Constants (upval)
					return if Group.thumbnail and Group.thumbnail ~= "" then Group.thumbnail else GetRbxthumbWithTypeSizeAndOptionsFunction(tostring(Id), Constants.RbxthumbTypes.GroupIcon, 150)
				end, { Id, Group.thumbnail }),
				Size = UDim2.fromOffset(38, 38)
			}),
			Details = ReactModule.createElement(View, { LayoutOrder = 2, tag = "col size-full-0 auto-y fill" }, {
				NameRow = ReactModule.createElement(View, {
					tag = "row auto-y size-full-0 align-y-center",
					LayoutOrder = 1
				}, {
					Name = if Group.groupHasVerifiedBadge then ReactModule.createElement(EmojiWrapper, {
						layoutOrder = 1,
						emoji = VerifiedBadgesModule.emoji.verified
					}, {
						NameText = ReactModule.createElement(Text, {
							tag = "auto-xy text-align-x-left content-default text-title-medium text-no-wrap text-truncate-end padding-right-small",
							Text = Group.name or ""
						})
					}) else ReactModule.createElement(Text, {
						tag = "auto-xy text-align-x-left content-default text-title-medium text-no-wrap text-truncate-end",
						LayoutOrder = 1,
						Text = Group.name or ""
					})
				}),
				Meta = UseMembersFollowersLabelModuleResult1 and ReactModule.createElement(Text, {
					tag = "auto-xy text-align-x-left content-muted text-no-wrap text-truncate-end text-body-medium",
					LayoutOrder = 2,
					Text = UseMembersFollowersLabelModuleResult1
				}) or nil
			}),
			RoleChip = ReactModule.useMemo(function()
				-- upvalues: p1 (copy), Group (copy), ReactModule (upval), Chip (upval), UseLocalizationResult (copy), ChipSize (upval)
				if not p1.showRank then
					return nil
				elseif Group.isOwner then
					return ReactModule.createElement(Chip, {
						LayoutOrder = 3,
						isChecked = true,
						text = UseLocalizationResult.owned,
						size = ChipSize.Small,
						onActivated = function() end
					})
				else
					local Name = if Group.role and Group.role.name and Group.role.name ~= "" then Group.role.name else nil
					
					return if Name then ReactModule.createElement(Chip, {
						LayoutOrder = 3,
						text = Name,
						size = ChipSize.Small,
						onActivated = function() end
					}) else nil
				end
			end, {
				p1.showRank,
				Group.isOwner,
				Group.role,
				UseLocalizationResult.owned
			})
		})
	else
		return nil
	end
end)