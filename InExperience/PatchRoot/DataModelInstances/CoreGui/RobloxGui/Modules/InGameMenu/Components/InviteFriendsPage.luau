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

function inviteFriendsPage.init(p0)
	-- upvalues: roact (ref)
	p0.backButtonRef = roact.createRef()
	p0.searchBoxRef = roact.createRef()
	p0.state = {
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

function inviteFriendsPage.renderError(p2)
	-- upvalues: roact (ref), loadingFriendsErrorModule (ref)
	return roact.createElement(loadingFriendsErrorModule, {
		onRetry = function()
			-- upvalues: p2 (ref)
			p2:setState({ loadingFriends = true, loadingFriendsError = false })
			p2:loadFriends()
		end,
		canCaptureFocus = p2.props.canCaptureFocus
	})
end

function inviteFriendsPage.renderNoFriends(p3)
	-- upvalues: roact (ref), addFriendsNowModule (ref)
	return roact.createElement(addFriendsNowModule, { canCaptureFocus = p3.props.canCaptureFocus })
end

local function sortFriends(p4, p5)
	return if p4.IsOnline == p5.IsOnline then p4.Username:lower() < p5.Username:lower() else p4.IsOnline and not p5.IsOnline
end

function inviteFriendsPage.renderFriends(p6)
	-- upvalues: roact (ref), inviteFriendsListModule (ref)
	return roact.createElement(inviteFriendsListModule, {
		friends = p6.state.friends,
		canCaptureFocus = p6.props.canCaptureFocus,
		searchBoxRef = p6.searchBoxRef
	})
end

function inviteFriendsPage.render(p7)
	-- upvalues: roact (ref), pageNavigationWatcherModule (ref), rootedConnectionModule (ref), focusHandlerModule (ref), getFFlagIGMGamepadSelectionHistoryModule (ref), guiService (ref), pageModule (ref)
	local state = p7.state
	local t = {
		Watcher = roact.createElement(pageNavigationWatcherModule, {
			desiredPage = "InviteFriends",
			onNavigateTo = function()
				-- upvalues: p7 (ref)
				p7:loadFriends()
			end
		})
	}
	
	if state.loadingFriends then
		t.Loading = p7:renderLoadingPage()
	elseif state.loadingFriendsError then
		t.ErrorLoading = p7:renderError()
	elseif #state.friends == 0 then
		t.NoFriends = p7:renderNoFriends()
	else
		t.FriendsList = p7:renderFriends()
	end
	return roact.createElement(rootedConnectionModule, {
		render = function(p8)
			-- upvalues: roact (copy), focusHandlerModule (copy), getFFlagIGMGamepadSelectionHistoryModule (copy), p7 (ref), state (ref), guiService (copy), pageModule (copy), t (ref)
			local var20
			local createElement = roact.createElement
			local t_1 = {}
			
			if getFFlagIGMGamepadSelectionHistoryModule() then
				var20 = if p7.props.menuPage == "InviteFriends" then nil else true
			end
			t_1.shouldForgetPreviousSelection = var20
			t_1.isFocused = p7.props.canCaptureFocus and (state.loadingFriends and p8)
			
			function t_1.didFocus()
				-- upvalues: guiService (copy), p7 (copy)
				guiService.SelectedCoreObject = p7.backButtonRef:getValue()
			end
			
			return createElement(focusHandlerModule, t_1, {
				Page = roact.createElement(pageModule, {
					pageTitle = p7.props.pageTitle,
					buttonRef = p7.backButtonRef,
					NextSelectionDown = p7.searchBoxRef
				}, t)
			})
		end
	})
end

function inviteFriendsPage.didMount(p9)
	p9.mounted = true
	p9:loadFriends()
end

function inviteFriendsPage.loadFriends(p10)
	-- upvalues: promiseModule (ref), cryo (ref), sortFriends (ref)
	promiseModule.new(function(p12, p13)
		-- upvalues: p10 (ref), cryo (copy), sortFriends (copy)
		coroutine.wrap(function()
			-- upvalues: p10 (copy), p13 (ref), cryo (copy), sortFriends (copy), p12 (ref)
			local localPlayer = p10.props.PlayersService.LocalPlayer
			local ok, status = pcall(function()
				-- upvalues: p10 (copy), localPlayer (ref)
				return p10.props.PlayersService:GetFriendsAsync(localPlayer.UserId)
			end)
			
			if not ok then
				p13("Error loading friends")
				
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
				p13("Error loading friends")
			end
			p12(cryo.List.sort(t, sortFriends))
		end)()
	end):andThen(function(p11)
		-- upvalues: p10 (ref)
		if p10.mounted then
			p10:setState({ loadingFriends = false, friends = p11 })
		end
	end):catch(function()
		-- upvalues: p10 (ref)
		if p10.mounted then
			p10:setState({ loadingFriends = false, loadingFriendsError = true })
		end
	end)
end

function inviteFriendsPage.willUnmount(p14)
	p14.mounted = false
end

return roactRodux.connect(function(p15, _)
	-- upvalues: constantsModule (ref), getFFlagIGMGamepadSelectionHistoryModule (ref)
	return {
		canCaptureFocus = p15.menuPage == "InviteFriends" and (p15.isMenuOpen and (p15.displayOptions.inputType == constantsModule.InputType.Gamepad and (not p15.respawn.dialogOpen and p15.currentZone == 1))),
		menuPage = if getFFlagIGMGamepadSelectionHistoryModule() then p15.menuPage else nil
	}
end)(inviteFriendsPage)