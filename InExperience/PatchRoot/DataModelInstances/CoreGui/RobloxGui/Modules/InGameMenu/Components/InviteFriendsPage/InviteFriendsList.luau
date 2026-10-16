local CorePackages = game:GetService("CorePackages")
local GuiService = game:GetService("GuiService")
local InGameMenuDependenciesModule = require(CorePackages.Packages.InGameMenuDependencies)
local Roact = InGameMenuDependenciesModule.Roact
local RoactRodux = InGameMenuDependenciesModule.RoactRodux
local T = InGameMenuDependenciesModule.t
local RoactGamepadModule = require(CorePackages.Packages.RoactGamepad)
local Parent = script.Parent.Parent.Parent
local PlayerLabelV2Module = require(Parent.Components.PlayerLabelV2)
local GetFFlagIGMGamepadSelectionHistoryModule = require(Parent.Flags.GetFFlagIGMGamepadSelectionHistory)
local DividerModule = require(Parent.Components.Divider)
local SendInviteButtonModule = require(script.Parent.SendInviteButton)
local SearchBoxModule = require(script.Parent.SearchBox)
local BarOnTopScrollingFrameModule = require(Parent.Components.BarOnTopScrollingFrame)
local PlayerSearchPredicateModule = require(Parent.Utility.PlayerSearchPredicate)
local FocusHandlerModule = require(Parent.Components.Connection.FocusHandler)
local RootedConnectionModule = require(Parent.Components.Connection.RootedConnection)
local ConstantsModule = require(Parent.Resources.Constants)
local InviteStatus = ConstantsModule.InviteStatus
local InviteUserToPlaceIdModule = require(Parent.Thunks.InviteUserToPlaceId)
local Text = tostring(game.PlaceId)
local InviteFriendsList = Roact.PureComponent:extend("InviteFriendsList")
InviteFriendsList.validateProps = T.strictInterface({
	friends = T.array(T.strictInterface({
		IsOnline = T.boolean,
		Id = T.integer,
		Username = T.string,
		DisplayName = T.string
	})),
	invitesState = T.table,
	shouldForgetPreviousSelection = GetFFlagIGMGamepadSelectionHistoryModule() and T.optional(T.boolean) or nil,
	dispatchInviteUserToPlaceId = T.callback,
	canCaptureFocus = T.boolean,
	searchBoxRef = T.table
})

function InviteFriendsList.init(p1) --[[ Line: 54 ]]
	-- upvalues: RoactGamepadModule (copy)
	p1.playerRefs = RoactGamepadModule.createRefCache()
	p1.state = { searchText = "" }
	p1.inviteAnimationInProgress = {}
end

function InviteFriendsList.renderListEntries(p1) --[[ Line: 63 ]]
	-- upvalues: Roact (copy), PlayerSearchPredicateModule (copy), PlayerLabelV2Module (copy), InviteStatus (copy), Text (copy), SendInviteButtonModule (copy), DividerModule (copy)
	local Friends = p1.props.friends
	local CountFriends = #Friends
	local LayoutOrder = 1
	local Count = 0
	local Elements = {
		ListLayout = Roact.createElement("UIListLayout", {
			SortOrder = Enum.SortOrder.LayoutOrder,
			HorizontalAlignment = Enum.HorizontalAlignment.Right
		})
	}
	
	for i, friend in pairs(Friends) do
		local Text1 = tostring(friend.Id)
		local InvitesStateEntry = p1.props.invitesState[Text1]
		local PlayerSearchPredicateModuleResult = PlayerSearchPredicateModule(p1.state.searchText, friend.Username, friend.DisplayName)
		
		if PlayerSearchPredicateModuleResult then
			Count += 1
		end
		Elements["friend_" .. i] = Roact.createElement(PlayerLabelV2Module, {
			username = friend.Username,
			displayName = friend.DisplayName,
			userId = friend.Id,
			isOnline = friend.IsOnline,
			isSelected = false,
			LayoutOrder = LayoutOrder,
			Visible = PlayerSearchPredicateModuleResult,
			[Roact.Ref] = p1.playerRefs[i],
			onActivated = function() --[[ Line: 96 ]]
				-- upvalues: InvitesStateEntry (copy), InviteStatus (upval), p1 (copy), friend (copy), Text1 (copy), Text (upval)
				local IsInvitesStateEntryMatch = InvitesStateEntry == InviteStatus.Success
				local InviteAnimationInProgressEntry = p1.inviteAnimationInProgress[friend.Id]
				
				if InvitesStateEntry ~= InviteStatus.Pending and not IsInvitesStateEntryMatch and not InviteAnimationInProgressEntry then
					p1.props.dispatchInviteUserToPlaceId(Text1, Text)
				end
			end
		}, {
			InviteButton = Roact.createElement(SendInviteButtonModule, {
				userInviteStatus = InvitesStateEntry,
				onActivated = function() --[[ Line: 107 ]]
					-- upvalues: p1 (copy), Text1 (copy), Text (upval)
					p1.props.dispatchInviteUserToPlaceId(Text1, Text)
				end,
				animationBegun = function() --[[ Line: 110 ]]
					-- upvalues: p1 (copy), friend (copy)
					p1.inviteAnimationInProgress[friend.Id] = true
				end,
				animationEnded = function() --[[ Line: 113 ]]
					-- upvalues: p1 (copy), friend (copy)
					p1.inviteAnimationInProgress[friend.Id] = nil
				end
			})
		})
		LayoutOrder += 1
		
		if i < CountFriends then
			Elements["divider_" .. LayoutOrder] = Roact.createElement(DividerModule, {
				LayoutOrder = LayoutOrder,
				Size = UDim2.new(1, -104, 0, 1),
				Visible = PlayerSearchPredicateModuleResult
			})
			LayoutOrder += 1
		end
	end
	return Elements, Count
end

function InviteFriendsList.render(p2) --[[ Line: 135 ]]
	-- upvalues: Roact (copy), SearchBoxModule (copy), GuiService (copy), BarOnTopScrollingFrameModule (copy), GetFFlagIGMGamepadSelectionHistoryModule (copy), RootedConnectionModule (copy), FocusHandlerModule (copy)
	local RenderListEntriesResult, RenderListEntriesResult2 = p2:renderListEntries()
	local Frame = Roact.createElement("Frame", { BackgroundTransparency = 1, Size = UDim2.new(1, 0, 1, 0) }, {
		SearchBox = Roact.createElement(SearchBoxModule, {
			Size = UDim2.new(1, -48, 0, 36),
			Position = UDim2.new(0.5, 0, 0, 8),
			AnchorPoint = Vector2.new(0.5, 0),
			searchUpdated = function(SearchText) --[[ Line: 148 ]]
				-- upvalues: p2 (copy)
				p2:setState({ searchText = SearchText })
			end,
			searchCleared = function() --[[ Line: 153 ]]
				-- upvalues: p2 (copy), GuiService (upval)
				p2:setState({ searchText = "" })
				
				if p2.props.canCaptureFocus then
					GuiService.SelectedCoreObject = p2.props.searchBoxRef:getValue()
				end
			end,
			itemRef = p2.props.searchBoxRef
		}),
		List = Roact.createElement(BarOnTopScrollingFrameModule, {
			Position = UDim2.new(0, 0, 0, 64),
			Size = UDim2.new(1, 0, 1, -64),
			CanvasSize = UDim2.new(1, 0, 0, RenderListEntriesResult2 * 72)
		}, RenderListEntriesResult)
	})
	local ShouldForgetPreviousSelection = if GetFFlagIGMGamepadSelectionHistoryModule() then p2.props.shouldForgetPreviousSelection else nil
	
	return Roact.createElement(RootedConnectionModule, {
		render = function(p3) --[[ Line: 177 ]]
			-- upvalues: Roact (upval), FocusHandlerModule (upval), p2 (copy), ShouldForgetPreviousSelection (ref), GetFFlagIGMGamepadSelectionHistoryModule (upval), GuiService (upval), Frame (copy)
			return Roact.createElement(FocusHandlerModule, {
				isFocused = p2.props.canCaptureFocus and p3,
				shouldForgetPreviousSelection = ShouldForgetPreviousSelection,
				didFocus = GetFFlagIGMGamepadSelectionHistoryModule() and function(p4) --[[ Line: 181 ]]
					-- upvalues: GuiService (upval), p2 (upval)
					GuiService.SelectedCoreObject = p4 or (p2:getFirstVisiblePlayerRef() or p2.props.searchBoxRef:getValue())
				end or function() --[[ Line: 185 ]]
					-- upvalues: GuiService (upval), p2 (upval)
					GuiService.SelectedCoreObject = p2:getFirstVisiblePlayerRef() or p2.props.searchBoxRef:getValue()
				end
			}, { FriendsList = Frame })
		end
	})
end

function InviteFriendsList.getFirstVisiblePlayerRef(p2) --[[ Line: 196 ]]
	-- upvalues: PlayerSearchPredicateModule (copy)
	for i, friend in pairs(p2.props.friends) do
		if PlayerSearchPredicateModule(p2.state.searchText, friend.Username, friend.DisplayName) then
			return p2.playerRefs[i]:getValue()
		end
	end
	return nil
end

return RoactRodux.UNSTABLE_connect2(function(p3, _) --[[ Line: 207 ]]
	-- upvalues: GetFFlagIGMGamepadSelectionHistoryModule (copy), ConstantsModule (copy)
	return {
		invitesState = p3.invites,
		shouldForgetPreviousSelection = if GetFFlagIGMGamepadSelectionHistoryModule() then p3.menuPage == ConstantsModule.MainPagePageKey or p3.currentZone == 0 else nil
	}
end, function(Callback) --[[ Line: 217 ]]
	-- upvalues: InviteUserToPlaceIdModule (copy)
	return {
		dispatchInviteUserToPlaceId = function(p3, p4) --[[ Line: 219 ]]
			-- upvalues: Callback (copy), InviteUserToPlaceIdModule (upval)
			Callback(InviteUserToPlaceIdModule(p3, p4))
		end
	}
end)(InviteFriendsList)