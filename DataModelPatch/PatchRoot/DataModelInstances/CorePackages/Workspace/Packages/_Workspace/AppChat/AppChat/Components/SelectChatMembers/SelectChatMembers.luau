local AppChat = script:FindFirstAncestor("AppChat")
local Parent = AppChat.Parent
local ReactModule = require(Parent.React)
local FoundationModule = require(Parent.Foundation)
local UIBloxModule = require(Parent.UIBlox)
local UseStyleFunction = UIBloxModule.Core.Style.useStyle
local UseTextSizeOffsetFunction = UIBloxModule.Core.Style.useTextSizeOffset
local UseLocalizationFunction = require(Parent.Localization).Hooks.useLocalization
local UseDebouncedUserSearchModule = require(script.Parent.Utils.useDebouncedUserSearch)
local UserCellWithCheckboxModule = require(script.Parent.UserCellWithCheckbox)
local PaginatedChatMembersModule = require(script.Parent.PaginatedChatMembers)
local SelectedMembersBarModule = require(script.Parent.SelectedMembersBar)
local FFlagDebugAppChatEnableDomLocatorsModule = require(AppChat.Flags.FFlagDebugAppChatEnableDomLocators)
local DomLocatorsModule = require(AppChat.Utils.DomLocators)

local function renderUserEntry(Text, p1, p2, Style, _)
	-- upvalues: ReactModule (copy), FoundationModule (copy), UserCellWithCheckboxModule (copy)
	return ReactModule.createElement(FoundationModule.View, {
		tag = "size-full-0 auto-y",
		key = if p1 then "search_" .. Text else Text
	}, {
		cellContent = ReactModule.createElement(UserCellWithCheckboxModule, { style = Style, userId = Text }),
		debugId = p2.isDebugEnabled and ReactModule.createElement(FoundationModule.Text, {
			tag = "auto-xy position-bottom-right anchor-bottom-right",
			Text = Text
		}) or nil
	})
end

return ReactModule.memo(function(p1)
	-- upvalues: UseLocalizationFunction (copy), UseStyleFunction (copy), UseTextSizeOffsetFunction (copy), UseDebouncedUserSearchModule (copy), ReactModule (copy), renderUserEntry (copy), FoundationModule (copy), SelectedMembersBarModule (copy), FFlagDebugAppChatEnableDomLocatorsModule (copy), DomLocatorsModule (copy), PaginatedChatMembersModule (copy)
	local UseLocalizationResult = UseLocalizationFunction({ suggested = "Feature.Friends.Label.Suggested" })
	local UseStyleResult = UseStyleFunction()
	local UseTextSizeOffsetResult = UseTextSizeOffsetFunction()
	local UseDebouncedUserSearchModuleResult, UseDebouncedUserSearchModuleResult2, UseDebouncedUserSearchModuleResult3 = UseDebouncedUserSearchModule(p1.conversation)
	local UseRefResult = ReactModule.useRef(nil)
	local UseResult = ReactModule.useCallback(function()
		-- upvalues: UseDebouncedUserSearchModuleResult2 (copy), UseRefResult (copy)
		UseDebouncedUserSearchModuleResult2("")
		
		if UseRefResult and UseRefResult.current then
			UseRefResult.current.focus()
		end
	end, { UseDebouncedUserSearchModuleResult2 })
	local IsNotUseDebouncedUserSearchModuleResultMatch = UseDebouncedUserSearchModuleResult3 ~= ""
	
	return ReactModule.createElement(FoundationModule.View, { tag = "size-full col gap-small bg-surface-0" }, {
		TopSection = ReactModule.createElement(FoundationModule.View, {
			tag = "col size-full-0 auto-y gap-small padding-x-medium",
			LayoutOrder = 1
		}, {
			selectedMembersBar = p1.shouldShowSelectChatMembersBar and ReactModule.createElement(SelectedMembersBarModule, { LayoutOrder = 1 }) or nil,
			searchBar = ReactModule.createElement(FoundationModule.TextInput, {
				tag = "size-full-0 auto-y",
				LayoutOrder = 2,
				label = "",
				leadingIcon = "icons/actions/friend_sort/search_people",
				text = UseDebouncedUserSearchModuleResult3,
				width = UDim.new(1, 0),
				placeholder = p1.searchFriendsText,
				onChanged = UseDebouncedUserSearchModuleResult2,
				iconTrailing = if IsNotUseDebouncedUserSearchModuleResultMatch then {
					name = FoundationModule.Enums.IconName.CircleX,
					onActivated = UseResult
				} else nil,
				textBoxRef = UseRefResult,
				testId = if FFlagDebugAppChatEnableDomLocatorsModule then DomLocatorsModule.selectChatMembersSearchInput(UseDebouncedUserSearchModuleResult3) else nil
			})
		}),
		friendsList = ReactModule.createElement(FoundationModule.View, { LayoutOrder = 3, tag = "size-full-0 fill" }, {
			paginatedFriendsList = ReactModule.createElement(PaginatedChatMembersModule, {
				userIds = if IsNotUseDebouncedUserSearchModuleResultMatch then UseDebouncedUserSearchModuleResult else p1.friendIds,
				renderItem = ReactModule.useCallback(function(p2)
					-- upvalues: renderUserEntry (upval), IsNotUseDebouncedUserSearchModuleResultMatch (copy), p1 (copy), UseStyleResult (copy), UseTextSizeOffsetResult (copy)
					return renderUserEntry(p2.item, IsNotUseDebouncedUserSearchModuleResultMatch, { isDebugEnabled = p1.isDebugEnabled }, UseStyleResult, UseTextSizeOffsetResult)
				end, {
					p1.isDebugEnabled,
					IsNotUseDebouncedUserSearchModuleResultMatch,
					UseStyleResult,
					UseTextSizeOffsetResult
				}),
				fetchMoreFriends = if IsNotUseDebouncedUserSearchModuleResultMatch then nil else p1.fetchMoreFriends,
				headerText = if IsNotUseDebouncedUserSearchModuleResultMatch then nil else UseLocalizationResult.suggested
			})
		})
	})
end)