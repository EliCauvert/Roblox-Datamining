local appChat = script:FindFirstAncestor("AppChat")
local parent = appChat.Parent
local reactModule = require(parent.React)
local foundationModule = require(parent.Foundation)
local UIBloxModule = require(parent.UIBlox)
local useStyle = UIBloxModule.Core.Style.useStyle
local useTextSizeOffset = UIBloxModule.Core.Style.useTextSizeOffset
local useLocalization = require(parent.Localization).Hooks.useLocalization
local useDebouncedUserSearchModule = require(script.Parent.Utils.useDebouncedUserSearch)
local userCellWithCheckboxModule = require(script.Parent.UserCellWithCheckbox)
local paginatedChatMembersModule = require(script.Parent.PaginatedChatMembers)
local selectedMembersBarModule = require(script.Parent.SelectedMembersBar)
local fFlagDebugAppChatEnableDomLocatorsModule = require(appChat.Flags.FFlagDebugAppChatEnableDomLocators)
local domLocatorsModule = require(appChat.Utils.DomLocators)

local function renderUserEntry(p0, p1, p2, p3, _) --[[ line: 32 ]]
	-- upvalues: reactModule (ref), foundationModule (ref), userCellWithCheckboxModule (ref)
	return reactModule.createElement(foundationModule.View, {
		tag = "size-full-0 auto-y",
		key = if p1 then "search_" .. p0 else p0
	}, {
		cellContent = reactModule.createElement(userCellWithCheckboxModule, { style = p3, userId = p0 }),
		debugId = p2.isDebugEnabled and reactModule.createElement(foundationModule.Text, {
			tag = "auto-xy position-bottom-right anchor-bottom-right",
			Text = p0
		}) or nil
	})
end

return reactModule.memo(function(p4) --[[ line: 58 | named "SelectChatMembers" ]]
	-- upvalues: useLocalization (ref), useStyle (ref), useTextSizeOffset (ref), useDebouncedUserSearchModule (ref), reactModule (ref), renderUserEntry (ref), foundationModule (ref), selectedMembersBarModule (ref), fFlagDebugAppChatEnableDomLocatorsModule (ref), domLocatorsModule (ref), paginatedChatMembersModule (ref)
	local var11 = useLocalization({ suggested = "Feature.Friends.Label.Suggested" })
	local var12 = useStyle()
	local var13 = useTextSizeOffset()
	local var14, var15, var16 = useDebouncedUserSearchModule(p4.conversation)
	local var17 = reactModule.useRef(nil)
	local var18 = var16 ~= ""
	
	return reactModule.createElement(foundationModule.View, { tag = "size-full col gap-small bg-surface-0" }, {
		TopSection = reactModule.createElement(foundationModule.View, {
			tag = "col size-full-0 auto-y gap-small padding-x-medium",
			LayoutOrder = 1
		}, {
			selectedMembersBar = p4.shouldShowSelectChatMembersBar and reactModule.createElement(selectedMembersBarModule, { LayoutOrder = 1 }) or nil,
			searchBar = reactModule.createElement(foundationModule.TextInput, {
				tag = "size-full-0 auto-y",
				LayoutOrder = 2,
				label = "",
				leadingIcon = "icons/actions/friend_sort/search_people",
				text = var16,
				width = UDim.new(1, 0),
				placeholder = p4.searchFriendsText,
				onChanged = var15,
				iconTrailing = if var18 then {
					name = foundationModule.Enums.IconName.CircleX,
					onActivated = reactModule.useCallback(function() --[[ line: 66 ]]
						-- upvalues: var15 (ref), var17 (ref)
						var15("")
						
						if var17 and var17.current then
							var17.current.focus()
						end
					end, { var15 })
				} else nil,
				textBoxRef = var17,
				testId = if fFlagDebugAppChatEnableDomLocatorsModule then domLocatorsModule.selectChatMembersSearchInput(var16) else nil
			})
		}),
		friendsList = reactModule.createElement(foundationModule.View, { LayoutOrder = 3, tag = "size-full-0 fill" }, {
			paginatedFriendsList = reactModule.createElement(paginatedChatMembersModule, {
				userIds = if var18 then var14 else p4.friendIds,
				renderItem = reactModule.useCallback(function(p5) --[[ line: 76 ]]
					-- upvalues: renderUserEntry (copy), var18 (ref), p4 (ref), var12 (ref), var13 (ref)
					return renderUserEntry(p5.item, var18, { isDebugEnabled = p4.isDebugEnabled }, var12, var13)
				end, { p4.isDebugEnabled, var18, var12, var13 }),
				fetchMoreFriends = if var18 then nil else p4.fetchMoreFriends,
				headerText = if var18 then nil else var11.suggested
			})
		})
	})
end)