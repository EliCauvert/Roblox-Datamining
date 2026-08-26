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
local var1 = tostring(game.PlaceId)
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

function inviteFriendsList.init(p1)
	-- upvalues: roactGamepadModule (ref)
	p1.playerRefs = roactGamepadModule.createRefCache()
	p1.state = { searchText = "" }
	p1.inviteAnimationInProgress = {}
end

function inviteFriendsList.renderListEntries(p1)
	-- upvalues: roact (ref), playerSearchPredicateModule (ref), playerLabelV2Module (ref), inviteStatus (ref), var1 (ref), sendInviteButtonModule (ref), dividerModule (ref)
	local friends = p1.props.friends
	local friendsCount = #friends
	local var2 = 1
	local t = {
		ListLayout = roact.createElement("UIListLayout", {
			SortOrder = Enum.SortOrder.LayoutOrder,
			HorizontalAlignment = Enum.HorizontalAlignment.Right
		})
	}
	local var3 = 0
	
	for i, v in pairs(friends) do
		local var4 = tostring(v.Id)
		local var5 = p1.props.invitesState[var4]
		local var6 = playerSearchPredicateModule(p1.state.searchText, v.Username, v.DisplayName)
		
		if var6 then
			var3 += 1
		end
		t["friend_" .. i] = roact.createElement(playerLabelV2Module, {
			username = v.Username,
			displayName = v.DisplayName,
			userId = v.Id,
			isOnline = v.IsOnline,
			isSelected = false,
			LayoutOrder = var2,
			Visible = var6,
			[roact.Ref] = p1.playerRefs[i],
			onActivated = function()
				-- upvalues: var5 (ref), inviteStatus (copy), p1 (ref), v (ref), var4 (ref), var1 (copy)
				if not (var5 == inviteStatus.Pending) and not (var5 == inviteStatus.Success) and not p1.inviteAnimationInProgress[v.Id] then
					p1.props.dispatchInviteUserToPlaceId(var4, var1)
				end
			end
		}, {
			InviteButton = roact.createElement(sendInviteButtonModule, {
				userInviteStatus = var5,
				onActivated = function()
					-- upvalues: p1 (ref), var4 (ref), var1 (copy)
					p1.props.dispatchInviteUserToPlaceId(var4, var1)
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
		var2 += 1
		
		if i < friendsCount then
			t["divider_" .. var18] = roact.createElement(dividerModule, {
				LayoutOrder = var2,
				Size = UDim2.new(1, -104, 0, 1),
				Visible = var6
			})
			var2 += 1
		end
	end
	return t, var3
end

function inviteFriendsList.render(p2)
	-- upvalues: roact (ref), searchBoxModule (ref), guiService (ref), barOnTopScrollingFrameModule (ref), getFFlagIGMGamepadSelectionHistoryModule (ref), rootedConnectionModule (ref), focusHandlerModule (ref)
	local var7, var8 = p2:renderListEntries()
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
			CanvasSize = UDim2.new(1, 0, 0, var8 * 72)
		}, var7)
	})
	local var9 = if getFFlagIGMGamepadSelectionHistoryModule() then p2.props.shouldForgetPreviousSelection else nil
	
	return roact.createElement(rootedConnectionModule, {
		render = function(p3)
			-- upvalues: roact (copy), focusHandlerModule (copy), p2 (ref), var9 (write), getFFlagIGMGamepadSelectionHistoryModule (copy), guiService (copy), frame (ref)
			return roact.createElement(focusHandlerModule, {
				isFocused = p2.props.canCaptureFocus and p3,
				shouldForgetPreviousSelection = var9,
				didFocus = if getFFlagIGMGamepadSelectionHistoryModule() then function(p4)
					-- upvalues: guiService (copy), p2 (copy)
					guiService.SelectedCoreObject = p4 or (p2:getFirstVisiblePlayerRef() or p2.props.searchBoxRef:getValue())
				end else function()
					-- upvalues: guiService (copy), p2 (copy)
					guiService.SelectedCoreObject = p2:getFirstVisiblePlayerRef() or p2.props.searchBoxRef:getValue()
				end
			}, { FriendsList = frame })
		end
	})
end

function inviteFriendsList.getFirstVisiblePlayerRef(p2)
	-- upvalues: playerSearchPredicateModule (ref)
	for i, v in pairs(p2.props.friends) do
		if playerSearchPredicateModule(p2.state.searchText, v.Username, v.DisplayName) then
			return p2.playerRefs[i]:getValue()
		end
	end
	return nil
end

return roactRodux.UNSTABLE_connect2(function(p3, _)
	-- upvalues: getFFlagIGMGamepadSelectionHistoryModule (ref), constantsModule (ref)
	local var7 = nil
	
	if getFFlagIGMGamepadSelectionHistoryModule() then
		var7 = if p3.menuPage ~= constantsModule.MainPagePageKey then p3.currentZone == 0 else true
	end
	return {
		invitesState = p3.invites,
		shouldForgetPreviousSelection = var7
	}
end, function(p3)
	-- upvalues: inviteUserToPlaceIdModule (ref)
	return {
		dispatchInviteUserToPlaceId = function(p4, p5)
			-- upvalues: p3 (ref), inviteUserToPlaceIdModule (copy)
			p3(inviteUserToPlaceIdModule(p4, p5))
		end
	}
end)(inviteFriendsList)