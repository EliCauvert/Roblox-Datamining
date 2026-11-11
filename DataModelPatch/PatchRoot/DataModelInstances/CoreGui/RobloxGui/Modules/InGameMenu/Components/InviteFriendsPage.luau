local GuiService = game:GetService("GuiService")
local Players = game:GetService("Players")
local InGameMenuDependenciesModule = require(game:GetService("CorePackages").Packages.InGameMenuDependencies)
local Roact = InGameMenuDependenciesModule.Roact
local T = InGameMenuDependenciesModule.t
local RoactRodux = InGameMenuDependenciesModule.RoactRodux
local Cryo = InGameMenuDependenciesModule.Cryo
local Parent = script.Parent.Parent
local ConstantsModule = require(Parent.Resources.Constants)
local PromiseModule = require(Parent.Utility.Promise)
local WithLocalizationModule = require(Parent.Localization.withLocalization)
local PageModule = require(Parent.Components.Page)
local ThemedTextLabelModule = require(Parent.Components.ThemedTextLabel)
local PageNavigationWatcherModule = require(Parent.Components.PageNavigationWatcher)
local FocusHandlerModule = require(Parent.Components.Connection.FocusHandler)
local RootedConnectionModule = require(Parent.Components.Connection.RootedConnection)
local InviteFriendsListModule = require(script.InviteFriendsList)
local AddFriendsNowModule = require(script.AddFriendsNow)
local LoadingFriendsErrorModule = require(script.LoadingFriendsError)
local GetFFlagIGMGamepadSelectionHistoryModule = require(Parent.Flags.GetFFlagIGMGamepadSelectionHistory)
local InviteFriendsPage = Roact.PureComponent:extend("InviteFriendsPage")
InviteFriendsPage.validateProps = T.strictInterface({
	pageTitle = T.string,
	canCaptureFocus = T.optional(T.boolean),
	PlayersService = T.union(T.Instance, T.table),
	menuPage = GetFFlagIGMGamepadSelectionHistoryModule() and T.string or nil
})
InviteFriendsPage.defaultProps = { PlayersService = Players }

function InviteFriendsPage.init(p1)
	-- upvalues: Roact (copy)
	p1.backButtonRef = Roact.createRef()
	p1.searchBoxRef = Roact.createRef()
	p1.state = {
		loadingFriends = true,
		loadingFriendsError = false,
		friends = {}
	}
end

function InviteFriendsPage:renderLoadingPage()
	-- upvalues: WithLocalizationModule (copy), Roact (copy), ThemedTextLabelModule (copy)
	return WithLocalizationModule({ loading = "CoreScripts.InGameMenu.InviteFriends.Loading" })(function(p1)
		-- upvalues: Roact (upval), ThemedTextLabelModule (upval)
		return Roact.createElement(ThemedTextLabelModule, {
			fontKey = "Header1",
			themeKey = "TextEmphasis",
			Size = UDim2.new(1, 0, 1, 0),
			Text = p1.loading
		})
	end)
end

function InviteFriendsPage.renderError(p1)
	-- upvalues: Roact (copy), LoadingFriendsErrorModule (copy)
	return Roact.createElement(LoadingFriendsErrorModule, {
		onRetry = function()
			-- upvalues: p1 (copy)
			p1:setState({ loadingFriends = true, loadingFriendsError = false })
			p1:loadFriends()
		end,
		canCaptureFocus = p1.props.canCaptureFocus
	})
end

function InviteFriendsPage.renderNoFriends(p1)
	-- upvalues: Roact (copy), AddFriendsNowModule (copy)
	return Roact.createElement(AddFriendsNowModule, { canCaptureFocus = p1.props.canCaptureFocus })
end

local function sortFriends(p1, p2): boolean
	return if p1.IsOnline == p2.IsOnline then p1.Username:lower() < p2.Username:lower() else p1.IsOnline and not p2.IsOnline
end

function InviteFriendsPage.renderFriends(p1)
	-- upvalues: Roact (copy), InviteFriendsListModule (copy)
	return Roact.createElement(InviteFriendsListModule, {
		friends = p1.state.friends,
		canCaptureFocus = p1.props.canCaptureFocus,
		searchBoxRef = p1.searchBoxRef
	})
end

function InviteFriendsPage.render(p1)
	-- upvalues: Roact (copy), PageNavigationWatcherModule (copy), RootedConnectionModule (copy), FocusHandlerModule (copy), GetFFlagIGMGamepadSelectionHistoryModule (copy), GuiService (copy), PageModule (copy)
	local State = p1.state
	local config = {
		Watcher = Roact.createElement(PageNavigationWatcherModule, {
			desiredPage = "InviteFriends",
			onNavigateTo = function()
				-- upvalues: p1 (copy)
				p1:loadFriends()
			end
		})
	}
	
	if State.loadingFriends then
		config.Loading = p1:renderLoadingPage()
	elseif State.loadingFriendsError then
		config.ErrorLoading = p1:renderError()
	elseif #State.friends == 0 then
		config.NoFriends = p1:renderNoFriends()
	else
		config.FriendsList = p1:renderFriends()
	end
	return Roact.createElement(RootedConnectionModule, {
		render = function(p2)
			-- upvalues: Roact (upval), FocusHandlerModule (upval), GetFFlagIGMGamepadSelectionHistoryModule (upval), p1 (copy), State (copy), GuiService (upval), PageModule (upval), config (copy)
			return Roact.createElement(FocusHandlerModule, {
				shouldForgetPreviousSelection = GetFFlagIGMGamepadSelectionHistoryModule() and p1.props.menuPage ~= "InviteFriends" or nil,
				isFocused = p1.props.canCaptureFocus and (State.loadingFriends and p2),
				didFocus = function()
					-- upvalues: GuiService (upval), p1 (upval)
					GuiService.SelectedCoreObject = p1.backButtonRef:getValue()
				end
			}, {
				Page = Roact.createElement(PageModule, {
					pageTitle = p1.props.pageTitle,
					buttonRef = p1.backButtonRef,
					NextSelectionDown = p1.searchBoxRef
				}, config)
			})
		end
	})
end

function InviteFriendsPage.didMount(p1)
	p1.mounted = true
	p1:loadFriends()
end

function InviteFriendsPage.loadFriends(p1)
	-- upvalues: PromiseModule (copy), Cryo (copy), sortFriends (copy)
	PromiseModule.new(function(Callback1, Callback)
		-- upvalues: p1 (copy), Cryo (upval), sortFriends (upval)
		coroutine.wrap(function()
			-- upvalues: p1 (upval), Callback (copy), Cryo (upval), sortFriends (upval), Callback1 (copy)
			local LocalPlayer = p1.props.PlayersService.LocalPlayer
			local Success, Result = pcall(function()
				-- upvalues: p1 (upval), LocalPlayer (copy)
				return p1.props.PlayersService:GetFriendsAsync(LocalPlayer.UserId)
			end)
			
			if not Success then
				Callback("Error loading friends")
				
				return
			end
			local t = {}
			while true do
				for _, Player in ipairs(Result:GetCurrentPage()) do
					t[#t + 1] = {
						itemRef = nil,
						IsOnline = Player.IsOnline,
						Id = Player.Id,
						Username = Player.Username,
						DisplayName = Player.DisplayName
					}
				end
				if Result.IsFinished then break end
				if pcall(function()
					-- upvalues: Result (copy)
					Result:AdvanceToNextPageAsync()
				end) then continue end
			end
			Callback1((Cryo.List.sort(t, sortFriends)))
		end)()
	end):andThen(function(Result)
		-- upvalues: p1 (copy)
		if p1.mounted then
			p1:setState({ loadingFriends = false, friends = Result })
		end
	end):catch(function()
		-- upvalues: p1 (copy)
		if p1.mounted then
			p1:setState({ loadingFriends = false, loadingFriendsError = true })
		end
	end)
end

function InviteFriendsPage.willUnmount(p2)
	p2.mounted = false
end

return RoactRodux.connect(function(p2, _)
	-- upvalues: ConstantsModule (copy), GetFFlagIGMGamepadSelectionHistoryModule (copy)
	return {
		canCaptureFocus = p2.menuPage == "InviteFriends" and (p2.isMenuOpen and (p2.displayOptions.inputType == ConstantsModule.InputType.Gamepad and (not p2.respawn.dialogOpen and p2.currentZone == 1))),
		menuPage = GetFFlagIGMGamepadSelectionHistoryModule() and p2.menuPage or nil
	}
end)(InviteFriendsPage)