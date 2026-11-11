local CorePackages = game:GetService("CorePackages")
local Modules = game:GetService("CoreGui").RobloxGui.Modules
local AppPageModule = require(Modules.LuaApp.AppPage)
local LoginStatusModule = require(Modules.LuaApp.Enum.LoginStatus)
local GetAccountsListModule = require(Modules.LuaApp.Thunks.Authentication.AccountSwitcher.GetAccountsList)
local UserModule = require(Modules.LuaApp.Thunks.Authentication.User)
local FFlagEnableLuaAccountSwitchModule = require(Modules.LuaApp.Flags.FFlagEnableLuaAccountSwitch)
local OpenAccountSelectorModule = require(Modules.LuaApp.Thunks.Authentication.OpenAccountSelector)
local GetFFlagEnableAccountSwitcherFoundationDesignFunction = require(CorePackages.Workspace.Packages.SharedFlags).GetFFlagEnableAccountSwitcherFoundationDesign
local GetFFlagEnableAccountSwitcherSignedOutAccountsFunction = require(CorePackages.Workspace.Packages.SharedFlags).GetFFlagEnableAccountSwitcherSignedOutAccounts
local SharedFlagsModule = require(CorePackages.Workspace.Packages.SharedFlags)
local FFlagEnableLuaLoginRevamp = SharedFlagsModule.FFlagEnableLuaLoginRevamp
local FFlagEnableLoginV1ForcedUsernameOverride = SharedFlagsModule.FFlagEnableLoginV1ForcedUsernameOverride
local FFlagEnableLoginV2ForcedUsernameOverride = SharedFlagsModule.FFlagEnableLoginV2ForcedUsernameOverride
local GetFFlagEnableAccountSwitcherAddWithMaxSignedOutFunction = SharedFlagsModule.GetFFlagEnableAccountSwitcherAddWithMaxSignedOut
local GetFIntAccountSwitcherAccountLimitFunction = require(CorePackages.Workspace.Packages.SharedFlags).GetFIntAccountSwitcherAccountLimit
local GetAccountsListWithSignedOutAccountsFunction = require(CorePackages.Workspace.Packages.AccountSwitching).GetAccountsListWithSignedOutAccounts
local NavigateDownModule = require(Modules.LuaApp.Thunks.NavigateDown)
local FFlagSignalsNavP3Dispatch = SharedFlagsModule.FFlagSignalsNavP3Dispatch
local NavigationCommands = if FFlagSignalsNavP3Dispatch then require(CorePackages.Workspace.Packages.RobloxAppNavigation).NavigationCommands else nil
local EventStreamConstantsModule = require(Modules.LuaApp.EventStreamConstants)
local ConstantsModule = require(Modules.LuaApp.Constants)
local ReactModule = require(CorePackages.Packages.React)
local AddAccountRow = require(CorePackages.Workspace.Packages.AccountSelector).AddAccountRow
local MaxAccountsReachedText = require(CorePackages.Workspace.Packages.AccountSelector).MaxAccountsReachedText
local CloseCentralOverlayModule = require(script.Parent.Parent.CloseCentralOverlay)
local FlyoutSidePanelIXP = require(CorePackages.Workspace.Packages.SharedExperimentDefinition).FlyoutSidePanelIXP
local OpenAccountSwitchingErrorOverlayModule = require(script.Parent.OpenAccountSwitchingErrorOverlay)
local UseNavigationFunction = require(CorePackages.Workspace.Packages.Navigation).useNavigation
local SwitchToAccountModule = require(script.Parent.AccountSwitcher.SwitchToAccount)
local AppStorageUtilitiesModule = require(script.Parent.AppStorageUtilities)
local LogoutModule = require(script.Parent.Logout)
local GuiService = game:GetService("GuiService")
local LuaLogoutReasonNamesModule = require(Modules.LuaApp.Analytics.Events.Auth.luaLogoutReasonNames)

local function v28(IsMaxAccountsReached, Origin, _)
	-- upvalues: FlyoutSidePanelIXP (copy), EventStreamConstantsModule (copy), ReactModule (copy), MaxAccountsReachedText (copy), UseNavigationFunction (copy), AddAccountRow (copy), AppPageModule (copy)
	if FlyoutSidePanelIXP.isFlyoutSidePanelEnabled() then
		if Origin ~= EventStreamConstantsModule.Origin.MoreMenu and Origin ~= EventStreamConstantsModule.Origin.FlyoutSidePanel then
			return nil
		end
	elseif Origin ~= "moreMenu" then
		return nil
	end
	if IsMaxAccountsReached then
		return ReactModule.createElement(MaxAccountsReachedText)
	else
		local UseNavigationResult = UseNavigationFunction()
		
		return ReactModule.createElement(AddAccountRow, {
			origin = Origin,
			context = EventStreamConstantsModule.Context.AccountSwitcher,
			onRowClicked = function()
				-- upvalues: UseNavigationResult (copy), AppPageModule (upval), Origin (copy)
				UseNavigationResult.replace(AppPageModule.AccountSwitchingAddAccountPeekView, { extraProps = { origin = Origin } })
			end
		})
	end
end

return function(_, p1, Origin, p2, p3, p4, p5, EnableSignedOutAccounts, p6)
	-- upvalues: FFlagEnableLuaAccountSwitchModule (copy), LoginStatusModule (copy), CloseCentralOverlayModule (copy), GetFFlagEnableAccountSwitcherSignedOutAccountsFunction (copy), GetAccountsListWithSignedOutAccountsFunction (copy), UserModule (copy), GetAccountsListModule (copy), OpenAccountSwitchingErrorOverlayModule (copy), GetFFlagEnableAccountSwitcherFoundationDesignFunction (copy), ConstantsModule (copy), EventStreamConstantsModule (copy), GetFFlagEnableAccountSwitcherAddWithMaxSignedOutFunction (copy), GetFIntAccountSwitcherAccountLimitFunction (copy), LogoutModule (copy), GuiService (copy), LuaLogoutReasonNamesModule (copy), FFlagEnableLuaLoginRevamp (copy), AppPageModule (copy), FFlagEnableLoginV2ForcedUsernameOverride (copy), FFlagSignalsNavP3Dispatch (copy), NavigationCommands (copy), NavigateDownModule (copy), FFlagEnableLoginV1ForcedUsernameOverride (copy), AppStorageUtilitiesModule (copy), SwitchToAccountModule (copy), v28 (copy), OpenAccountSelectorModule (copy)
	return function(p7)
		-- upvalues: FFlagEnableLuaAccountSwitchModule (upval), LoginStatusModule (upval), CloseCentralOverlayModule (upval), GetFFlagEnableAccountSwitcherSignedOutAccountsFunction (upval), EnableSignedOutAccounts (copy), GetAccountsListWithSignedOutAccountsFunction (upval), p1 (copy), UserModule (upval), GetAccountsListModule (upval), OpenAccountSwitchingErrorOverlayModule (upval), GetFFlagEnableAccountSwitcherFoundationDesignFunction (upval), ConstantsModule (upval), p2 (copy), EventStreamConstantsModule (upval), GetFFlagEnableAccountSwitcherAddWithMaxSignedOutFunction (upval), GetFIntAccountSwitcherAccountLimitFunction (upval), Origin (copy), LogoutModule (upval), GuiService (upval), LuaLogoutReasonNamesModule (upval), FFlagEnableLuaLoginRevamp (upval), p6 (copy), AppPageModule (upval), FFlagEnableLoginV2ForcedUsernameOverride (upval), FFlagSignalsNavP3Dispatch (upval), NavigationCommands (upval), NavigateDownModule (upval), FFlagEnableLoginV1ForcedUsernameOverride (upval), AppStorageUtilitiesModule (upval), SwitchToAccountModule (upval), p3 (copy), p4 (copy), v28 (upval), OpenAccountSelectorModule (upval), p5 (copy)
		if FFlagEnableLuaAccountSwitchModule then
			local IsStatusMatch = p7:getState().AuthenticationStatus.status == LoginStatusModule.LOGGED_IN
			
			local function OnClose()
				-- upvalues: p7 (copy), CloseCentralOverlayModule (upval)
				p7:dispatch(CloseCentralOverlayModule())
			end
			
			local EnableSignedOutAccounts1 = GetFFlagEnableAccountSwitcherSignedOutAccountsFunction() and EnableSignedOutAccounts
			
			return (if EnableSignedOutAccounts1 then GetAccountsListWithSignedOutAccountsFunction(p1, {
				filterUnauthenticatedSessionsForAccountPicker = true,
				useAccountSwitcherSignedOutAccountsLimit = true,
				isAuthenticated = IsStatusMatch
			}):andThen(function(Result)
				-- upvalues: UserModule (upval)
				return {
					active_user_id = tostring(UserModule.fromLocalStorage().userId),
					logged_in_users_metadata = Result
				}
			end) else GetAccountsListModule(p1, IsStatusMatch)):andThen(function(Result): number
				-- upvalues: IsStatusMatch (copy), p7 (copy), OpenAccountSwitchingErrorOverlayModule (upval), GetFFlagEnableAccountSwitcherFoundationDesignFunction (upval), OnClose (copy), ConstantsModule (upval), EnableSignedOutAccounts1 (copy), UserModule (upval), p2 (upval), EventStreamConstantsModule (upval), GetFFlagEnableAccountSwitcherAddWithMaxSignedOutFunction (upval), GetFIntAccountSwitcherAccountLimitFunction (upval), Origin (upval), EnableSignedOutAccounts (upval), LogoutModule (upval), p1 (upval), GuiService (upval), LuaLogoutReasonNamesModule (upval), CloseCentralOverlayModule (upval), FFlagEnableLuaLoginRevamp (upval), p6 (upval), AppPageModule (upval), FFlagEnableLoginV2ForcedUsernameOverride (upval), FFlagSignalsNavP3Dispatch (upval), NavigationCommands (upval), NavigateDownModule (upval), FFlagEnableLoginV1ForcedUsernameOverride (upval), AppStorageUtilitiesModule (upval), SwitchToAccountModule (upval), p3 (upval), p4 (upval), v28 (upval), OpenAccountSelectorModule (upval), p5 (upval)
				local LoggedInUsersMetadata = Result.logged_in_users_metadata
				
				if #LoggedInUsersMetadata == 0 then
					if IsStatusMatch == true then
						p7:dispatch(OpenAccountSwitchingErrorOverlayModule(if GetFFlagEnableAccountSwitcherFoundationDesignFunction() then "Authentication.AccountSwitch.Header.CantSwitchAccountsSentenceCase" else "Authentication.AccountSwitch.Header.CantSwitchAccounts", "Authentication.AccountSwitch.Description.PleaseTryAgainLater", "CommonUI.Messages.Action.OK", "", OnClose, nil, ConstantsModule.Auth.AccountSwitcherUnavailableError))
					end
					return 0
				else
					local Count = 0
					
					if EnableSignedOutAccounts1 then
						for _, value in ipairs(LoggedInUsersMetadata) do
							if value.has_valid_session then
								Count += 1
							end
						end
					else
						Count = #LoggedInUsersMetadata
					end
					local ActiveUserId = Result.active_user_id
					local Text = tostring(UserModule.fromLocalStorage().userId)
					
					if p2 ~= nil and ActiveUserId ~= nil and ActiveUserId ~= "" and ActiveUserId ~= Text then
						p2.reportAuthClientError(EventStreamConstantsModule.Context.AccountSwitcherMismatch, ActiveUserId .. "," .. Text)
					end
					local IsFIntAccountSwitcherAccountLimitBelow = GetFIntAccountSwitcherAccountLimitFunction() <= (if GetFFlagEnableAccountSwitcherAddWithMaxSignedOutFunction() then Count else #LoggedInUsersMetadata)
					local List = {}
					
					for _, value1 in LoggedInUsersMetadata do
						local IsUserIdMatch = value1.user_id == ActiveUserId
						table.insert(List, {
							id = value1.user_id,
							name = value1.username,
							displayName = value1.display_name,
							iconKey = if IsUserIdMatch then "icons/status/success_large" else nil,
							isUnselectable = IsUserIdMatch,
							hasValidSession = not EnableSignedOutAccounts1 or value1.has_valid_session
						})
					end
					table.sort(List, function(A, B): boolean
						-- upvalues: Result (copy)
						return A.id == Result.active_user_id or A.hasValidSession and not B.hasValidSession
					end)
					local config = {
						titleTextKey = "Authentication.AccountSwitch.Heading.SwitchAccount",
						origin = Origin,
						context = EventStreamConstantsModule.Context.AccountSwitcher,
						users = List,
						actionRows = {},
						isMaxAccountsReached = IsFIntAccountSwitcherAccountLimitBelow,
						enableSignedOutAccounts = EnableSignedOutAccounts,
						logout = function()
							-- upvalues: p7 (upval), LogoutModule (upval), p1 (upval), GuiService (upval), LuaLogoutReasonNamesModule (upval)
							p7:dispatch(LogoutModule(p1, GuiService, LuaLogoutReasonNamesModule.ManageAccountsRemoveCurrentUser, nil))
						end,
						onAccountSelection = function(Id)
							-- upvalues: List (copy), EnableSignedOutAccounts1 (upval), p7 (upval), CloseCentralOverlayModule (upval), FFlagEnableLuaLoginRevamp (upval), p6 (upval), AppPageModule (upval), FFlagEnableLoginV2ForcedUsernameOverride (upval), FFlagSignalsNavP3Dispatch (upval), NavigationCommands (upval), NavigateDownModule (upval), FFlagEnableLoginV1ForcedUsernameOverride (upval), AppStorageUtilitiesModule (upval), SwitchToAccountModule (upval), p1 (upval), p3 (upval), p4 (upval), p2 (upval)
							local v1 = nil
							
							for _, value in ipairs(List) do
								if value.id == Id then
									v1 = value
									break
								end
							end
							if not EnableSignedOutAccounts1 or not v1 or v1.hasValidSession then
								AppStorageUtilitiesModule.setAccountSwitchTargetUsername(v1.name)
								AppStorageUtilitiesModule.flush()
								p7:dispatch(SwitchToAccountModule(p1, Id, p3, p4, p2))
								
								return
							end
							p7:dispatch(CloseCentralOverlayModule())
							
							if FFlagEnableLuaLoginRevamp and p6 then
								local config = {
									name = AppPageModule.LoginV2,
									extraProps = {
										forcedUsernameOverride = if FFlagEnableLoginV2ForcedUsernameOverride then v1.name else nil
									}
								}
								
								if FFlagSignalsNavP3Dispatch then
									NavigationCommands.down(NavigationCommands.fromLegacyPage(config))
									
									return
								else
									p7:dispatch(NavigateDownModule(config))
									
									return
								end
							else
								local config1 = {
									name = AppPageModule.Login,
									extraProps = {
										forcedUsernameOverride = if FFlagEnableLoginV1ForcedUsernameOverride then v1.name else nil
									}
								}
								
								if FFlagSignalsNavP3Dispatch then
									NavigationCommands.down(NavigationCommands.fromLegacyPage(config1))
									
									return
								else
									p7:dispatch(NavigateDownModule(config1))
								end
							end
						end,
						onClose = OnClose,
						onAccountSelectionAbandoned = function() end,
						renderFooterComponent = function()
							-- upvalues: v28 (upval), IsFIntAccountSwitcherAccountLimitBelow (copy), Origin (upval), p7 (upval)
							return v28(IsFIntAccountSwitcherAccountLimitBelow, Origin, p7)
						end
					}
					
					if Count > 0 then
						p7:dispatch(OpenAccountSelectorModule(config, true, GetFFlagEnableAccountSwitcherFoundationDesignFunction() and p5))
					end
					return Count
				end
			end):catch(function(_)
				-- upvalues: p7 (copy), OpenAccountSwitchingErrorOverlayModule (upval), GetFFlagEnableAccountSwitcherFoundationDesignFunction (upval), OnClose (copy), ConstantsModule (upval)
				p7:dispatch(OpenAccountSwitchingErrorOverlayModule(if GetFFlagEnableAccountSwitcherFoundationDesignFunction() then "Authentication.AccountSwitch.Header.CantSwitchAccountsSentenceCase" else "Authentication.AccountSwitch.Header.CantSwitchAccounts", "Authentication.AccountSwitch.Description.PleaseTryAgainLater", "CommonUI.Messages.Action.OK", "", OnClose, nil, ConstantsModule.Auth.AccountSwitcherUnavailableError))
			end)
		else
			return nil
		end
	end
end