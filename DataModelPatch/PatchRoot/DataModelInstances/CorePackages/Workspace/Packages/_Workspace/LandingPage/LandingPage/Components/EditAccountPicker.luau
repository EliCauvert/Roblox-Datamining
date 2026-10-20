local LandingPage = script:FindFirstAncestor("LandingPage")
local Parent = LandingPage.Parent
local ReactModule = require(Parent.React)
local FoundationModule = require(Parent.Foundation)
local FullscreenPageWithSafeArea = require(Parent.AppBlox).FullscreenPageWithSafeArea
local UseStyleFunction = require(Parent.UIBlox).Core.Style.useStyle
local Enums = FoundationModule.Enums
local EditAccountPickerListModule = require(LandingPage.Components.EditAccountPickerList)
local UseLocalizationFunction = require(Parent.Localization).Hooks.useLocalization
local UseRoactServiceFunction = require(Parent.RobloxAppHooks).useRoactService
local RoactNetworking = require(Parent.RoactServiceTags).RoactNetworking
local RemoveAccountDialogModule = require(script.Parent.RemoveAccountDialog)
local AuthCommonModule = require(Parent.AuthCommon)
local UpdateLoginEntryDataFunction = AuthCommonModule.Utils.updateLoginEntryData
local User = AuthCommonModule.Thunks.User
local DeleteAccountFunction = require(Parent.AccountSwitching).DeleteAccount
local CryoModule = require(Parent.Cryo)
local _ = require(script.Parent.AccountCarouselAvatar)
local GetFFlagEnableAccountCarouselEventsFunction = require(Parent.SharedFlags).GetFFlagEnableAccountCarouselEvents
local AuthAnalyticsModule = require(Parent.AuthAnalytics)
local EventStreamConstants = AuthAnalyticsModule.EventStreamConstants
local AuthButtonClickFunction = AuthAnalyticsModule.Events.authButtonClick
local AuthPageloadFunction = AuthAnalyticsModule.Events.authPageload
local Sheet = FoundationModule.Sheet
local DialogSize = FoundationModule.Enums.DialogSize
local GetFFlagEnableManageAccountsRedesignFunction = require(Parent.SharedFlags).GetFFlagEnableManageAccountsRedesign
local GetFFlagEnableAccountSwitcherSignedOutAccountsFunction = require(Parent.SharedFlags).GetFFlagEnableAccountSwitcherSignedOutAccounts
local GetFFlagEnableLuaAccountPickerFunction = require(Parent.SharedFlags).GetFFlagEnableLuaAccountPicker
local GetFIntAccountPickerVariantOverrideFunction = require(Parent.SharedFlags).GetFIntAccountPickerVariantOverride
local RoactAppExperimentModule = require(Parent.RoactAppExperiment)
local AppBtidLayers = require(Parent.ExperimentLayers).AppBtidLayers
local AuthLocalStorageKeys = AuthCommonModule.Enums.AuthLocalStorageKeys
local AppStorageService = game:GetService("AppStorageService")

return function(p1)
	-- upvalues: ReactModule (copy), UseRoactServiceFunction (copy), RoactNetworking (copy), UseLocalizationFunction (copy), User (copy), RoactAppExperimentModule (copy), AppBtidLayers (copy), GetFIntAccountPickerVariantOverrideFunction (copy), GetFFlagEnableLuaAccountPickerFunction (copy), GetFFlagEnableAccountSwitcherSignedOutAccountsFunction (copy), GetFFlagEnableAccountCarouselEventsFunction (copy), AuthButtonClickFunction (copy), EventStreamConstants (copy), UpdateLoginEntryDataFunction (copy), CryoModule (copy), AppStorageService (copy), AuthLocalStorageKeys (copy), DeleteAccountFunction (copy), AuthPageloadFunction (copy), GetFFlagEnableManageAccountsRedesignFunction (copy), UseStyleFunction (copy), FullscreenPageWithSafeArea (copy), RemoveAccountDialogModule (copy), FoundationModule (copy), Enums (copy), EditAccountPickerListModule (copy), Sheet (copy), DialogSize (copy)
	local UseStateResult, UseStateResult2 = ReactModule.useState(p1.accounts)
	local UseStateResult1, UseStateResult2_1 = ReactModule.useState(nil)
	local UseRoactServiceResult = UseRoactServiceFunction(RoactNetworking)
	local UseLocalizationResult = UseLocalizationFunction({
		EditAccounts = "Authentication.AccountPicker.Label.ManageAccounts"
	})
	local FromLocalStorageResult = User.fromLocalStorage()
	local v1 = false
	
	if FromLocalStorageResult.userId ~= nil then
		local UseBrowserTrackerExperimentResult = RoactAppExperimentModule.useBrowserTrackerExperiment({ AppBtidLayers.LandingLayer }, function(p2)
			-- upvalues: AppBtidLayers (upval), GetFIntAccountPickerVariantOverrideFunction (upval)
			local v2 = p2[AppBtidLayers.LandingLayer] or {}
			
			return {
				accountPickerVariantEnabled = v2.accountPickerVariantEnabled and tonumber(v2.accountPickerVariantEnabled) or GetFIntAccountPickerVariantOverrideFunction()
			}
		end)
		local IsNotAccountPickerVariantEnabledMatch: boolean = UseBrowserTrackerExperimentResult.accountPickerVariantEnabled ~= nil and UseBrowserTrackerExperimentResult.accountPickerVariantEnabled ~= 0
		v1 = GetFFlagEnableLuaAccountPickerFunction() and IsNotAccountPickerVariantEnabledMatch
	end
	local EnableSignedOutAccounts = GetFFlagEnableAccountSwitcherSignedOutAccountsFunction() and p1.enableSignedOutAccounts
	
	local function _(): boolean
		-- upvalues: UseStateResult1 (copy), FromLocalStorageResult (copy)
		return UseStateResult1 ~= nil and tostring(FromLocalStorageResult.userId) == UseStateResult1.user_id
	end
	
	local function v33(): boolean
		-- upvalues: EnableSignedOutAccounts (copy), UseStateResult1 (copy), FromLocalStorageResult (copy), UseStateResult (copy)
		if not EnableSignedOutAccounts then
			return false
		end
		if UseStateResult1 == nil or (UseStateResult1 == nil or tostring(FromLocalStorageResult.userId) ~= UseStateResult1.user_id) then
			return false
		end
		for _, value in ipairs(UseStateResult) do
			if value.user_id ~= UseStateResult1.user_id and value.has_valid_session then
				return false
			end
		end
		return true
	end
	
	local function OnRemove()
		-- upvalues: UseStateResult1 (copy), GetFFlagEnableAccountCarouselEventsFunction (upval), AuthButtonClickFunction (upval), EventStreamConstants (upval), UpdateLoginEntryDataFunction (upval), CryoModule (upval), UseStateResult (copy), UseStateResult2 (copy), p1 (copy), UseStateResult2_1 (copy), FromLocalStorageResult (copy), AppStorageService (upval), AuthLocalStorageKeys (upval), v1 (ref), v33 (copy), EnableSignedOutAccounts (copy), DeleteAccountFunction (upval), UseRoactServiceResult (copy)
		if UseStateResult1 == nil then return end
		if GetFFlagEnableAccountCarouselEventsFunction() then
			AuthButtonClickFunction(EventStreamConstants.Context.AccountPickerManageAccountsScreen, EventStreamConstants.Button.AccountPickerDeleteAccount, UseStateResult1.user_id, nil)
		end
		if UseStateResult1.has_valid_session then
			if UseStateResult1 ~= nil and tostring(FromLocalStorageResult.userId) == UseStateResult1.user_id then
				if p1.logout then
					p1.logout()
				end
				AppStorageService:SetItem(AuthLocalStorageKeys.CredentialValue, "")
				AppStorageService:Flush()
				local v2 = not v1 and v33()
				
				if EnableSignedOutAccounts then
					for _, value in ipairs(UseStateResult) do
						if v2 or value.user_id == UseStateResult1.user_id then
							UpdateLoginEntryDataFunction(value.user_id, { showInAccountPicker = false })
						end
					end
					return
				end
			else
				DeleteAccountFunction(UseRoactServiceResult, {
					username = UseStateResult1.username,
					user_id = UseStateResult1.user_id,
					display_name = UseStateResult1.display_name
				}):andThen(function(_)
					-- upvalues: CryoModule (upval), UseStateResult (upval), UseStateResult1 (upval), UseStateResult2 (upval), p1 (upval), UseStateResult2_1 (upval), UpdateLoginEntryDataFunction (upval)
					local FilterResult = CryoModule.List.filter(UseStateResult, function(p2): boolean
						-- upvalues: UseStateResult1 (upval)
						return p2.user_id ~= UseStateResult1.user_id
					end)
					UseStateResult2(FilterResult)
					
					if p1.onAccountsUpdated then
						p1.onAccountsUpdated(FilterResult)
					end
					UseStateResult2_1(nil)
					UpdateLoginEntryDataFunction(UseStateResult1.user_id, { showInAccountPicker = false })
				end):catch(function(Err)
					warn(Err)
				end)
			end
			return
		else
			UpdateLoginEntryDataFunction(UseStateResult1.user_id, { showInAccountPicker = false })
			local FilterResult = CryoModule.List.filter(UseStateResult, function(p2): boolean
				-- upvalues: UseStateResult1 (upval)
				return p2.user_id ~= UseStateResult1.user_id
			end)
			UseStateResult2(FilterResult)
			
			if p1.onAccountsUpdated then
				p1.onAccountsUpdated(FilterResult)
			end
			UseStateResult2_1(nil)
		end
	end
	
	local function OnClose()
		-- upvalues: GetFFlagEnableAccountCarouselEventsFunction (upval), AuthButtonClickFunction (upval), EventStreamConstants (upval), UseStateResult2_1 (copy)
		if GetFFlagEnableAccountCarouselEventsFunction() then
			AuthButtonClickFunction(EventStreamConstants.Context.AccountPickerManageAccountsScreen, EventStreamConstants.Button.AccountPickerManageAccountsClosed, nil, nil)
		end
		UseStateResult2_1(nil)
	end
	
	ReactModule.useEffect(function()
		-- upvalues: GetFFlagEnableAccountCarouselEventsFunction (upval), AuthPageloadFunction (upval), EventStreamConstants (upval)
		if GetFFlagEnableAccountCarouselEventsFunction() then
			AuthPageloadFunction(EventStreamConstants.Context.AccountPickerManageAccountsScreen)
		end
	end, {})
	
	if GetFFlagEnableManageAccountsRedesignFunction() and EnableSignedOutAccounts then
		return ReactModule.createElement(ReactModule.Fragment, nil, {
			Sheet = ReactModule.createElement(Sheet.Root, {
				preferCenterSheet = true,
				size = DialogSize.Medium,
				onClose = p1.onClose,
				snapPoints = { 1 }
			}, {
				Header = ReactModule.createElement(Sheet.Header, {
					tag = "row size-full-0 auto-y items-center padding-x-small padding-bottom-large padding-top-medium",
					hasCloseAffordance = true
				}, {
					Title = ReactModule.createElement(FoundationModule.Text, {
						LayoutOrder = 1,
						tag = "fill auto-xy text-heading-small content-emphasis padding-x-small text-align-x-left",
						Text = UseLocalizationResult.EditAccounts
					})
				}),
				Content = ReactModule.createElement(Sheet.Content, nil, {
					EditAccountPickerList = ReactModule.createElement(EditAccountPickerListModule, {
						onClose = p1.onClose,
						accounts = UseStateResult,
						setRemoveAccount = UseStateResult2_1,
						enableSignedOutAccounts = p1.enableSignedOutAccounts
					})
				})
			}),
			RemoveAccountDialog = UseStateResult1 and ReactModule.createElement(RemoveAccountDialogModule, {
				hideAllAccounts = not v1 and v33(),
				isCurrentUser = UseStateResult1 ~= nil and tostring(FromLocalStorageResult.userId) == UseStateResult1.user_id,
				onRemove = OnRemove,
				onClose = OnClose
			}) or nil
		})
	else
		local UseStyleResult = UseStyleFunction()
		ReactModule.useEffect(function()
			-- upvalues: GetFFlagEnableAccountCarouselEventsFunction (upval), AuthPageloadFunction (upval), EventStreamConstants (upval)
			if GetFFlagEnableAccountCarouselEventsFunction() then
				AuthPageloadFunction(EventStreamConstants.Context.AccountPickerManageAccountsScreen)
			end
		end, {})
		
		return ReactModule.createElement(FullscreenPageWithSafeArea, {
			includeStatusBar = true,
			BackgroundColor3 = UseStyleResult.Theme.BackgroundDefault.Color
		}, {
			RemoveAccountDialog = UseStateResult1 and ReactModule.createElement(RemoveAccountDialogModule, {
				hideAllAccounts = false,
				isCurrentUser = UseStateResult1 ~= nil and tostring(FromLocalStorageResult.userId) == UseStateResult1.user_id,
				onRemove = OnRemove,
				onClose = OnClose
			}) or nil,
			OuterContainer = ReactModule.createElement(FoundationModule.View, {
				tag = "col auto-xy size-full-0",
				Size = UDim2.new(1, 0, 1, 0)
			}, {
				TopBar = ReactModule.createElement(FoundationModule.View, {
					tag = "row size-full-0 auto-y items-center padding-x-small padding-bottom-large padding-top-medium"
				}, {
					CloseButtonContainer = ReactModule.createElement(FoundationModule.View, {
						LayoutOrder = 0,
						tag = "col size-0 auto-xy padding-x-small",
						onActivated = p1.onClose
					}, {
						CloseButton = ReactModule.createElement(FoundationModule.Icon, {
							tag = "auto-xy",
							name = Enums.IconName.X,
							size = Enums.IconSize.Large
						})
					}),
					Title = ReactModule.createElement(FoundationModule.Text, {
						LayoutOrder = 1,
						tag = "fill auto-xy text-heading-small content-emphasis padding-right-small",
						Text = UseLocalizationResult.EditAccounts
					}),
					SpaceContainer = ReactModule.createElement(FoundationModule.View, {
						LayoutOrder = 2,
						tag = "col size-0 auto-xy padding-x-small"
					}, {
						Space = ReactModule.createElement(FoundationModule.Icon, {
							tag = "col size-0 auto-xy",
							Visible = false,
							name = Enums.IconName.X,
							size = Enums.IconSize.Large
						})
					})
				}),
				EditAccountPickerList = ReactModule.createElement(EditAccountPickerListModule, {
					onClose = p1.onClose,
					accounts = UseStateResult,
					setRemoveAccount = UseStateResult2_1,
					enableSignedOutAccounts = p1.enableSignedOutAccounts
				})
			})
		})
	end
end