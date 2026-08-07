local groups = script:FindFirstAncestor("Groups")
local parent = groups.Parent
local reactModule = require(parent.React)
local foundationModule = require(parent.Foundation)
local localizationModule = require(parent.Localization)
local useLocalization = localizationModule.Hooks.useLocalization
local useAbbreviatedNumberLocalization = localizationModule.Hooks.useAbbreviatedNumberLocalization
local verifiedBadgesModule = require(parent.VerifiedBadges)
local userLibModule = require(parent.UserLib)
local constants = userLibModule.Utils.Constants
local getRbxthumbWithTypeSizeAndOptions = userLibModule.Utils.getRbxthumbWithTypeSizeAndOptions
local view = foundationModule.View
local text = foundationModule.Text
local image = foundationModule.Image
local chip = foundationModule.Chip
local chipSize = foundationModule.Enums.ChipSize
local emojiWrapper = verifiedBadgesModule.EmojiWrapper
local textKeysModule = require(groups.Common.TextKeys)
local _ = require(groups.Common.Types)
local useMembersFollowersLabelModule = require(groups.Hooks.useMembersFollowersLabel)
local useGroupsWrapperContextModule = require(groups.Contexts.useGroupsWrapperContext)

return reactModule.memo(function(p0) --[[ line: 38 | named "GroupListItem" ]]
	-- upvalues: useGroupsWrapperContextModule (ref), useAbbreviatedNumberLocalization (ref), useMembersFollowersLabelModule (ref), useLocalization (ref), textKeysModule (ref), reactModule (ref), getRbxthumbWithTypeSizeAndOptions (ref), constants (ref), chip (ref), chipSize (ref), view (ref), image (ref), emojiWrapper (ref), verifiedBadgesModule (ref), text (ref)
	local var9 = useGroupsWrapperContextModule()
	local group = p0.group
	
	if not group then
		return nil
	end
	local memberCount = group.memberCount or 0
	local var11 = useMembersFollowersLabelModule({
		capitalize = false,
		hasSocialModules = group.hasSocialModules or false,
		count = memberCount,
		truncatedCount = useAbbreviatedNumberLocalization(if memberCount > 0 then memberCount else nil)
	})
	local var12 = useLocalization({ owned = textKeysModule.LabelOwned })
	local id = group.id
	local var13 = if p0.showMemberCount and group.memberCount ~= nil then var11 else nil
	
	return reactModule.createElement(view, {
		tag = "row size-full-0 auto-y gap-large align-y-center padding-small radius-medium",
		Size = UDim2.new(1, 0, 0, 0),
		AutomaticSize = Enum.AutomaticSize.Y,
		LayoutOrder = p0.layoutOrder,
		onActivated = reactModule.useCallback(function() --[[ line: 73 ]]
			-- upvalues: id (ref), var9 (ref)
			if id then
				var9.navigateTo.groupDetails(id)
			end
		end, { var9.navigateTo.groupDetails, id })
	}, {
		Thumbnail = reactModule.createElement(image, {
			LayoutOrder = 1,
			tag = "radius-medium bg-surface-100",
			Image = reactModule.useMemo(function() --[[ line: 62 ]]
				-- upvalues: group (ref), getRbxthumbWithTypeSizeAndOptions (copy), id (ref), constants (copy)
				return if group.thumbnail and group.thumbnail ~= "" then group.thumbnail else getRbxthumbWithTypeSizeAndOptions(tostring(id), constants.RbxthumbTypes.GroupIcon, 150)
			end, { id, group.thumbnail }),
			Size = UDim2.fromOffset(38, 38)
		}),
		Details = reactModule.createElement(view, { LayoutOrder = 2, tag = "col size-full-0 auto-y fill" }, {
			NameRow = reactModule.createElement(view, {
				tag = "row auto-y size-full-0 align-y-center",
				LayoutOrder = 1
			}, {
				Name = if group.groupHasVerifiedBadge then reactModule.createElement(emojiWrapper, {
					layoutOrder = 1,
					emoji = verifiedBadgesModule.emoji.verified
				}, {
					NameText = reactModule.createElement(text, {
						tag = "auto-xy text-align-x-left content-default text-title-medium text-no-wrap text-truncate-end padding-right-small",
						Text = group.name or ""
					})
				}) else reactModule.createElement(text, {
					tag = "auto-xy text-align-x-left content-default text-title-medium text-no-wrap text-truncate-end",
					LayoutOrder = 1,
					Text = group.name or ""
				})
			}),
			Meta = var13 and reactModule.createElement(text, {
				tag = "auto-xy text-align-x-left content-muted text-no-wrap text-truncate-end text-body-medium",
				LayoutOrder = 2,
				Text = var13
			}) or nil
		}),
		RoleChip = reactModule.useMemo(function() --[[ line: 81 ]]
			-- upvalues: p0 (ref), group (ref), reactModule (copy), chip (copy), var12 (ref), chipSize (copy)
			if not p0.showRank then
				return nil
			elseif group.isOwner then
				return reactModule.createElement(chip, {
					LayoutOrder = 3,
					isChecked = true,
					text = var12.owned,
					size = chipSize.Small,
					onActivated = function() --[[ line: 92 ]] end
				})
			end
			local var14 = if group.role and group.role.name and group.role.name ~= "" then group.role.name else nil
			
			return if var14 then reactModule.createElement(chip, {
				LayoutOrder = 3,
				text = var14,
				size = chipSize.Small,
				onActivated = function() --[[ line: 101 ]] end
			}) else nil
		end, { p0.showRank, group.isOwner, group.role, var12.owned })
	})
end)