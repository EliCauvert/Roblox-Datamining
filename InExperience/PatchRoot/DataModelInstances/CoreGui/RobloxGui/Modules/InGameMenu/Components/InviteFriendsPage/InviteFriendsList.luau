local corePackagesService = game:GetService("CorePackages")
local guiService = game:GetService("GuiService")
local inGameMenuDependenciesModule = require(corePackagesService.Packages.InGameMenuDependencies)
local roact = inGameMenuDependenciesModule.Roact
local roactRodux = inGameMenuDependenciesModule.RoactRodux
local t = inGameMenuDependenciesModule.t
local roactGamepadModule = require(corePackagesService.Packages.RoactGamepad)
local parent = script.Parent.Parent.Parent
local playerLabelV2Module = require(parent.Components.PlayerLabelV2)
local getFFlagIGMGamepadSelectionHistoryModule = require(parent.Flags.GetFFlagIGMGamepadSelectionHistory)
local dividerModule = require(parent.Components.Divider)
local sendInviteButtonModule = require(script.Parent.SendInviteButton)
local searchBoxModule = require(script.Parent.SearchBox)
local barOnTopScrollingFrameModule = require(parent.Components.BarOnTopScrollingFrame)
local playerSearchPredicateModule = require(parent.Utility.PlayerSearchPredicate)
local focusHandlerModule = require(parent.Components.Connection.FocusHandler)
local rootedConnectionModule = require(parent.Components.Connection.RootedConnection)
local constantsModule = require(parent.Resources.Constants)
local inviteStatus = constantsModule.InviteStatus
local inviteUserToPlaceIdModule = require(parent.Thunks.InviteUserToPlaceId)
local var15 = tostring(game.PlaceId)
local inviteFriendsList = roact.PureComponent:extend("InviteFriendsList")
inviteFriendsList.validateProps = t.strictInterface({
	friends = t.array(t.strictInterface({
		IsOnline = t.boolean,
		Id = t.integer,
		Username = t.string,
		DisplayName = t.string
	})),
	invitesState = t.table,
	shouldForgetPreviousSelection = getFFlagIGMGamepadSelectionHistoryModule() and t.optional(t.boolean) or nil,
	dispatchInviteUserToPlaceId = t.callback,
	canCaptureFocus = t.boolean,
	searchBoxRef = t.table
})

function inviteFriendsList.init(p0)
	-- upvalues: roactGamepadModule (ref)
	p0.playerRefs = roactGamepadModule.createRefCache()
	p0.state = { searchText = "" }
	p0.inviteAnimationInProgress = {}
end

function inviteFriendsList.renderListEntries(p1)
	-- upvalues: roact (ref), playerSearchPredicateModule (ref), playerLabelV2Module (ref), inviteStatus (ref), var15 (ref), sendInviteButtonModule (ref), dividerModule (ref)
	local friends = p1.props.friends
	local friendsCount = #friends
	local var18 = 1
	local t = {
		ListLayout = roact.createElement("UIListLayout", {
			SortOrder = Enum.SortOrder.LayoutOrder,
			HorizontalAlignment = Enum.HorizontalAlignment.Right
		})
	}
	local var20 = 0
	
	for i, v in pairs(friends) do
		local var21 = tostring(v.Id)
		local var22 = p1.props.invitesState[var21]
		local var23 = playerSearchPredicateModule(p1.state.searchText, v.Username, v.DisplayName)
		
		if var23 then
			var20 += 1
		end
		t["friend_" .. i] = roact.createElement(playerLabelV2Module, {
			username = v.Username,
			displayName = v.DisplayName,
			userId = v.Id,
			isOnline = v.IsOnline,
			isSelected = false,
			LayoutOrder = var18,
			Visible = var23,
			[roact.Ref] = p1.playerRefs[i],
			onActivated = function()
				-- upvalues: var22 (ref), inviteStatus (copy), p1 (ref), v (ref), var21 (ref), var15 (copy)
				if not (var22 == inviteStatus.Pending) and not (var22 == inviteStatus.Success) and not p1.inviteAnimationInProgress[v.Id] then
					p1.props.dispatchInviteUserToPlaceId(var21, var15)
				end
			end
		}, {
			InviteButton = roact.createElement(sendInviteButtonModule, {
				userInviteStatus = var22,
				onActivated = function()
					-- upvalues: p1 (ref), var21 (ref), var15 (copy)
					p1.props.dispatchInviteUserToPlaceId(var21, var15)
				end,
				animationBegun = function()
					-- upvalues: p1 (ref), v (ref)
					p1.inviteAnimationInProgress[v.Id] = true
				end,
				animationEnded = function()
					-- upvalues: p1 (ref), v (ref)
					p1.inviteAnimationInProgress[v.Id] = nil
				end
			})
		})
		var18 += 1
		
		if i < friendsCount then
			t["divider_" .. var18] = roact.createElement(dividerModule, {
				LayoutOrder = var18,
				Size = UDim2.new(1, -104, 0, 1),
				Visible = var23
			})
			var18 += 1
		end
	end
	return t, var20
end

function inviteFriendsList.render(p2)
	-- upvalues: roact (ref), searchBoxModule (ref), guiService (ref), barOnTopScrollingFrameModule (ref), getFFlagIGMGamepadSelectionHistoryModule (ref), rootedConnectionModule (ref), focusHandlerModule (ref)
	local var24, var25 = p2:renderListEntries()
	local frame = roact.createElement("Frame", { BackgroundTransparency = 1, Size = UDim2.new(1, 0, 1, 0) }, {
		SearchBox = roact.createElement(searchBoxModule, {
			Size = UDim2.new(1, -48, 0, 36),
			Position = UDim2.new(0.5, 0, 0, 8),
			AnchorPoint = Vector2.new(0.5, 0),
			searchUpdated = function(p3)
				-- upvalues: p2 (ref)
				p2:setState({ searchText = p3 })
			end,
			searchCleared = function()
				-- upvalues: p2 (ref), guiService (copy)
				p2:setState({ searchText = "" })
				
				if p2.props.canCaptureFocus then
					guiService.SelectedCoreObject = p2.props.searchBoxRef:getValue()
				end
			end,
			itemRef = p2.props.searchBoxRef
		}),
		List = roact.createElement(barOnTopScrollingFrameModule, {
			Position = UDim2.new(0, 0, 0, 64),
			Size = UDim2.new(1, 0, 1, -64),
			CanvasSize = UDim2.new(1, 0, 0, var25 * 72)
		}, var24)
	})
	local var27 = if getFFlagIGMGamepadSelectionHistoryModule() then p2.props.shouldForgetPreviousSelection else nil
	
	return roact.createElement(rootedConnectionModule, {
		render = function(p4)
			-- upvalues: roact (copy), focusHandlerModule (copy), p2 (ref), var27 (write), getFFlagIGMGamepadSelectionHistoryModule (copy), guiService (copy), frame (ref)
			return roact.createElement(focusHandlerModule, {
				isFocused = p2.props.canCaptureFocus and p4,
				shouldForgetPreviousSelection = var27,
				didFocus = if getFFlagIGMGamepadSelectionHistoryModule() then function(p5)
					-- upvalues: guiService (copy), p2 (copy)
					guiService.SelectedCoreObject = p5 or (p2:getFirstVisiblePlayerRef() or p2.props.searchBoxRef:getValue())
				end else function()
					-- upvalues: guiService (copy), p2 (copy)
					guiService.SelectedCoreObject = p2:getFirstVisiblePlayerRef() or p2.props.searchBoxRef:getValue()
				end
			}, { FriendsList = frame })
		end
	})
end

function inviteFriendsList.getFirstVisiblePlayerRef(p6)
	-- upvalues: playerSearchPredicateModule (ref)
	for i, v in pairs(p6.props.friends) do
		if playerSearchPredicateModule(p6.state.searchText, v.Username, v.DisplayName) then
			return p6.playerRefs[i]:getValue()
		end
	end
	return nil
end

return roactRodux.UNSTABLE_connect2(function(p7, _)
	-- upvalues: getFFlagIGMGamepadSelectionHistoryModule (ref), constantsModule (ref)
	local var28 = nil
	
	if getFFlagIGMGamepadSelectionHistoryModule() then
		var28 = if p7.menuPage ~= constantsModule.MainPagePageKey then p7.currentZone == 0 else true
	end
	return {
		invitesState = p7.invites,
		shouldForgetPreviousSelection = var28
	}
end, function(p8)
	-- upvalues: inviteUserToPlaceIdModule (ref)
	return {
		dispatchInviteUserToPlaceId = function(p9, p10)
			-- upvalues: p8 (ref), inviteUserToPlaceIdModule (copy)
			p8(inviteUserToPlaceIdModule(p9, p10))
		end
	}
end)(inviteFriendsList)