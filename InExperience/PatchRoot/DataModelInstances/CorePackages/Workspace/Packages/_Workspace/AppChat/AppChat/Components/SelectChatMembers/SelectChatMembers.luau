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

local function renderUserEntry(p1, p2, p3, p4, _)
	-- upvalues: reactModule (ref), foundationModule (ref), userCellWithCheckboxModule (ref)
	return reactModule.createElement(foundationModule.View, {
		tag = "size-full-0 auto-y",
		key = if p2 then "search_" .. p0 else p1
	}, {
		cellContent = reactModule.createElement(userCellWithCheckboxModule, { style = p4, userId = p1 }),
		debugId = p3.isDebugEnabled and reactModule.createElement(foundationModule.Text, {
			tag = "auto-xy position-bottom-right anchor-bottom-right",
			Text = p1
		}) or nil
	})
end

return reactModule.memo(function(p1)
	-- upvalues: useLocalization (ref), useStyle (ref), useTextSizeOffset (ref), useDebouncedUserSearchModule (ref), reactModule (ref), renderUserEntry (ref), foundationModule (ref), selectedMembersBarModule (ref), fFlagDebugAppChatEnableDomLocatorsModule (ref), domLocatorsModule (ref), paginatedChatMembersModule (ref)
	local var1 = useLocalization({ suggested = "Feature.Friends.Label.Suggested" })
	local var2 = useStyle()
	local var3 = useTextSizeOffset()
	local var4, var5, var6 = useDebouncedUserSearchModule(p1.conversation)
	local var7 = reactModule.useRef(nil)
	local var8 = var6 ~= ""
	
	return reactModule.createElement(foundationModule.View, { tag = "size-full col gap-small bg-surface-0" }, {
		TopSection = reactModule.createElement(foundationModule.View, {
			tag = "col size-full-0 auto-y gap-small padding-x-medium",
			LayoutOrder = 1
		}, {
			selectedMembersBar = p1.shouldShowSelectChatMembersBar and reactModule.createElement(selectedMembersBarModule, { LayoutOrder = 1 }) or nil,
			searchBar = reactModule.createElement(foundationModule.TextInput, {
				tag = "size-full-0 auto-y",
				LayoutOrder = 2,
				label = "",
				leadingIcon = "icons/actions/friend_sort/search_people",
				text = var6,
				width = UDim.new(1, 0),
				placeholder = p1.searchFriendsText,
				onChanged = var5,
				iconTrailing = if var8 then {
					name = foundationModule.Enums.IconName.CircleX,
					onActivated = reactModule.useCallback(function()
						-- upvalues: var5 (ref), var7 (ref)
						var5("")
						
						if var7 and var7.current then
							var7.current.focus()
						end
					end, { var5 })
				} else nil,
				textBoxRef = var7,
				testId = if fFlagDebugAppChatEnableDomLocatorsModule then domLocatorsModule.selectChatMembersSearchInput(var6) else nil
			})
		}),
		friendsList = reactModule.createElement(foundationModule.View, { LayoutOrder = 3, tag = "size-full-0 fill" }, {
			paginatedFriendsList = reactModule.createElement(paginatedChatMembersModule, {
				userIds = if var8 then var4 else p1.friendIds,
				renderItem = reactModule.useCallback(function(p2)
					-- upvalues: renderUserEntry (copy), var8 (ref), p1 (ref), var2 (ref), var3 (ref)
					return renderUserEntry(p2.item, var8, { isDebugEnabled = p1.isDebugEnabled }, var2, var3)
				end, { p1.isDebugEnabled, var8, var2, var3 }),
				fetchMoreFriends = if var8 then nil else p1.fetchMoreFriends,
				headerText = if var8 then nil else var1.suggested
			})
		})
	})
end)