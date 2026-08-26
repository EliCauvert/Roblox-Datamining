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

return reactModule.memo(function(p1)
	-- upvalues: useGroupsWrapperContextModule (ref), useAbbreviatedNumberLocalization (ref), useMembersFollowersLabelModule (ref), useLocalization (ref), textKeysModule (ref), reactModule (ref), getRbxthumbWithTypeSizeAndOptions (ref), constants (ref), chip (ref), chipSize (ref), view (ref), image (ref), emojiWrapper (ref), verifiedBadgesModule (ref), text (ref)
	local var1 = useGroupsWrapperContextModule()
	local group = p1.group
	
	if not group then
		return nil
	end
	local memberCount = group.memberCount or 0
	local var2 = useMembersFollowersLabelModule({
		capitalize = false,
		hasSocialModules = group.hasSocialModules or false,
		count = memberCount,
		truncatedCount = useAbbreviatedNumberLocalization(if memberCount > 0 then memberCount else nil)
	})
	local var3 = useLocalization({ owned = textKeysModule.LabelOwned })
	local id = group.id
	local var4 = if p1.showMemberCount and group.memberCount ~= nil then var2 else nil
	
	return reactModule.createElement(view, {
		tag = "row size-full-0 auto-y gap-large align-y-center padding-small radius-medium",
		Size = UDim2.new(1, 0, 0, 0),
		AutomaticSize = Enum.AutomaticSize.Y,
		LayoutOrder = p1.layoutOrder,
		onActivated = reactModule.useCallback(function()
			-- upvalues: id (ref), var1 (ref)
			if id then
				var1.navigateTo.groupDetails(id)
			end
		end, { var1.navigateTo.groupDetails, id })
	}, {
		Thumbnail = reactModule.createElement(image, {
			LayoutOrder = 1,
			tag = "radius-medium bg-surface-100",
			Image = reactModule.useMemo(function()
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
			Meta = var4 and reactModule.createElement(text, {
				tag = "auto-xy text-align-x-left content-muted text-no-wrap text-truncate-end text-body-medium",
				LayoutOrder = 2,
				Text = var4
			}) or nil
		}),
		RoleChip = reactModule.useMemo(function()
			-- upvalues: p1 (ref), group (ref), reactModule (copy), chip (copy), var3 (ref), chipSize (copy)
			if not p1.showRank then
				return nil
			elseif group.isOwner then
				return reactModule.createElement(chip, {
					LayoutOrder = 3,
					isChecked = true,
					text = var3.owned,
					size = chipSize.Small,
					onActivated = function() end
				})
			end
			local var5 = if group.role and group.role.name and group.role.name ~= "" then group.role.name else nil
			
			return if var5 then reactModule.createElement(chip, {
				LayoutOrder = 3,
				text = var5,
				size = chipSize.Small,
				onActivated = function() end
			}) else nil
		end, { p1.showRank, group.isOwner, group.role, var3.owned })
	})
end)