local corePackagesService = game:GetService("CorePackages")
local guiService = game:GetService("GuiService")
local playersService = game:GetService("Players")
local inGameMenuDependenciesModule = require(corePackagesService.Packages.InGameMenuDependencies)
local roact = inGameMenuDependenciesModule.Roact
local t = inGameMenuDependenciesModule.t
local roactRodux = inGameMenuDependenciesModule.RoactRodux
local cryo = inGameMenuDependenciesModule.Cryo
local parent = script.Parent.Parent
local constantsModule = require(parent.Resources.Constants)
local promiseModule = require(parent.Utility.Promise)
local withLocalizationModule = require(parent.Localization.withLocalization)
local pageModule = require(parent.Components.Page)
local themedTextLabelModule = require(parent.Components.ThemedTextLabel)
local pageNavigationWatcherModule = require(parent.Components.PageNavigationWatcher)
local focusHandlerModule = require(parent.Components.Connection.FocusHandler)
local rootedConnectionModule = require(parent.Components.Connection.RootedConnection)
local inviteFriendsListModule = require(script.InviteFriendsList)
local addFriendsNowModule = require(script.AddFriendsNow)
local loadingFriendsErrorModule = require(script.LoadingFriendsError)
local getFFlagIGMGamepadSelectionHistoryModule = require(parent.Flags.GetFFlagIGMGamepadSelectionHistory)
local inviteFriendsPage = roact.PureComponent:extend("InviteFriendsPage")
inviteFriendsPage.validateProps = t.strictInterface({
	pageTitle = t.string,
	canCaptureFocus = t.optional(t.boolean),
	PlayersService = t.union(t.Instance, t.table),
	menuPage = if getFFlagIGMGamepadSelectionHistoryModule() then t.string else nil
})
inviteFriendsPage.defaultProps = { PlayersService = playersService }

function inviteFriendsPage.init(p1)
	-- upvalues: roact (ref)
	p1.backButtonRef = roact.createRef()
	p1.searchBoxRef = roact.createRef()
	p1.state = {
		loadingFriends = true,
		loadingFriendsError = false,
		friends = {}
	}
end

function inviteFriendsPage.renderLoadingPage(_)
	-- upvalues: withLocalizationModule (ref), roact (ref), themedTextLabelModule (ref)
	return withLocalizationModule({ loading = "CoreScripts.InGameMenu.InviteFriends.Loading" })(function(p1)
		-- upvalues: roact (copy), themedTextLabelModule (copy)
		return roact.createElement(themedTextLabelModule, {
			fontKey = "Header1",
			themeKey = "TextEmphasis",
			Size = UDim2.new(1, 0, 1, 0),
			Text = p1.loading
		})
	end)
end

function inviteFriendsPage.renderError(p1)
	-- upvalues: roact (ref), loadingFriendsErrorModule (ref)
	return roact.createElement(loadingFriendsErrorModule, {
		onRetry = function()
			-- upvalues: p1 (ref)
			p1:setState({ loadingFriends = true, loadingFriendsError = false })
			p1:loadFriends()
		end,
		canCaptureFocus = p1.props.canCaptureFocus
	})
end

function inviteFriendsPage.renderNoFriends(p1)
	-- upvalues: roact (ref), addFriendsNowModule (ref)
	return roact.createElement(addFriendsNowModule, { canCaptureFocus = p1.props.canCaptureFocus })
end

local function sortFriends(p1, p2)
	return if p1.IsOnline == p2.IsOnline then p1.Username:lower() < p2.Username:lower() else p1.IsOnline and not p2.IsOnline
end

function inviteFriendsPage.renderFriends(p1)
	-- upvalues: roact (ref), inviteFriendsListModule (ref)
	return roact.createElement(inviteFriendsListModule, {
		friends = p1.state.friends,
		canCaptureFocus = p1.props.canCaptureFocus,
		searchBoxRef = p1.searchBoxRef
	})
end

function inviteFriendsPage.render(p1)
	-- upvalues: roact (ref), pageNavigationWatcherModule (ref), rootedConnectionModule (ref), focusHandlerModule (ref), getFFlagIGMGamepadSelectionHistoryModule (ref), guiService (ref), pageModule (ref)
	local state = p1.state
	local t = {
		Watcher = roact.createElement(pageNavigationWatcherModule, {
			desiredPage = "InviteFriends",
			onNavigateTo = function()
				-- upvalues: p1 (ref)
				p1:loadFriends()
			end
		})
	}
	
	if state.loadingFriends then
		t.Loading = p1:renderLoadingPage()
	elseif state.loadingFriendsError then
		t.ErrorLoading = p1:renderError()
	elseif #state.friends == 0 then
		t.NoFriends = p1:renderNoFriends()
	else
		t.FriendsList = p1:renderFriends()
	end
	return roact.createElement(rootedConnectionModule, {
		render = function(p2)
			-- upvalues: roact (copy), focusHandlerModule (copy), getFFlagIGMGamepadSelectionHistoryModule (copy), p1 (ref), state (ref), guiService (copy), pageModule (copy), t (ref)
			local var1
			local createElement = roact.createElement
			local t_1 = {}
			
			if getFFlagIGMGamepadSelectionHistoryModule() then
				var1 = if p1.props.menuPage == "InviteFriends" then nil else true
			end
			t_1.shouldForgetPreviousSelection = var1
			t_1.isFocused = p1.props.canCaptureFocus and (state.loadingFriends and p2)
			
			function t_1.didFocus()
				-- upvalues: guiService (copy), p1 (copy)
				guiService.SelectedCoreObject = p1.backButtonRef:getValue()
			end
			
			return createElement(focusHandlerModule, t_1, {
				Page = roact.createElement(pageModule, {
					pageTitle = p1.props.pageTitle,
					buttonRef = p1.backButtonRef,
					NextSelectionDown = p1.searchBoxRef
				}, t)
			})
		end
	})
end

function inviteFriendsPage.didMount(p1)
	p1.mounted = true
	p1:loadFriends()
end

function inviteFriendsPage.loadFriends(p1)
	-- upvalues: promiseModule (ref), cryo (ref), sortFriends (ref)
	promiseModule.new(function(p2, p3)
		-- upvalues: p1 (ref), cryo (copy), sortFriends (copy)
		coroutine.wrap(function()
			-- upvalues: p1 (copy), p3 (ref), cryo (copy), sortFriends (copy), p2 (ref)
			local localPlayer = p1.props.PlayersService.LocalPlayer
			local ok, status = pcall(function()
				-- upvalues: p1 (copy), localPlayer (ref)
				return p1.props.PlayersService:GetFriendsAsync(localPlayer.UserId)
			end)
			
			if not ok then
				p3("Error loading friends")
				
				return
			end
			local t = {}
			while true do
				for i, v in ipairs(status:GetCurrentPage()) do
					t[#t + 1] = {
						itemRef = nil,
						IsOnline = v.IsOnline,
						Id = v.Id,
						Username = v.Username,
						DisplayName = v.DisplayName
					}
				end
				if status.IsFinished then break end
				if pcall(function()
					-- upvalues: status (ref)
					status:AdvanceToNextPageAsync()
				end) then continue end
				p3("Error loading friends")
			end
			p2(cryo.List.sort(t, sortFriends))
		end)()
	end):andThen(function(p4)
		-- upvalues: p1 (ref)
		if p1.mounted then
			p1:setState({ loadingFriends = false, friends = p4 })
		end
	end):catch(function()
		-- upvalues: p1 (ref)
		if p1.mounted then
			p1:setState({ loadingFriends = false, loadingFriendsError = true })
		end
	end)
end

function inviteFriendsPage.willUnmount(p4)
	p4.mounted = false
end

return roactRodux.connect(function(p4, _)
	-- upvalues: constantsModule (ref), getFFlagIGMGamepadSelectionHistoryModule (ref)
	return {
		canCaptureFocus = p4.menuPage == "InviteFriends" and (p4.isMenuOpen and (p4.displayOptions.inputType == constantsModule.InputType.Gamepad and (not p4.respawn.dialogOpen and p4.currentZone == 1))),
		menuPage = if getFFlagIGMGamepadSelectionHistoryModule() then p4.menuPage else nil
	}
end)(inviteFriendsPage)