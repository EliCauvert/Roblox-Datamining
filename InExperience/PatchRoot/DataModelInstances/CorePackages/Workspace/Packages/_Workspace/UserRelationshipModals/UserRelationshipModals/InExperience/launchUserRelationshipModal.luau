local CoreGui = game:GetService("CoreGui")
local LocalizationService = game:GetService("LocalizationService")
local UserRelationshipModals = script:FindFirstAncestor("UserRelationshipModals")
local Parent = UserRelationshipModals.Parent
local Provider = require(Parent.FocusNavigationUtils).FocusNavigableSurfaceRegistry.Provider
local FoundationModule = require(Parent.Foundation)
local FoundationProvider = FoundationModule.FoundationProvider
local LocalizationProvider = require(Parent.Localization).LocalizationProvider
local Localization = require(Parent.InExperienceLocales).Localization
local ReactModule = require(Parent.React)
local ReactFocusNavigationModule = require(Parent.ReactFocusNavigation)
local ReactRobloxModule = require(Parent.ReactRoblox)
local RoduxModule = require(Parent.Rodux)
local RoactRoduxModule = require(Parent.RoactRodux)
local InstallReducerModule = require(UserRelationshipModals.Rodux.installReducer)
local RODUXKEYModule = require(UserRelationshipModals.Rodux.RODUX_KEY)

local function createRoduxStore() --[[ Line: 23 ]]
	-- upvalues: RoduxModule (copy), RODUXKEYModule (copy), InstallReducerModule (copy)
	return RoduxModule.Store.new(RoduxModule.combineReducers({ [RODUXKEYModule] = InstallReducerModule() }), nil, { RoduxModule.thunkMiddleware })
end

return function(p1, Tbl) --[[ Line: 33 ]]
	-- upvalues: CoreGui (copy), ReactFocusNavigationModule (copy), ReactModule (copy), LocalizationProvider (copy), Localization (copy), LocalizationService (copy), FoundationProvider (copy), FoundationModule (copy), Provider (copy), RoactRoduxModule (copy), createRoduxStore (copy), ReactRobloxModule (copy)
	if not CoreGui:FindFirstChild("UserRelationshipModal") then
		local UserRelationshipModal = Instance.new("Folder")
		UserRelationshipModal.Name = "UserRelationshipModal"
		UserRelationshipModal.Parent = CoreGui
		local UserRelationshipModalOverlay = Instance.new("ScreenGui")
		UserRelationshipModalOverlay.Parent = UserRelationshipModal
		UserRelationshipModalOverlay.Name = "UserRelationshipModalOverlay"
		UserRelationshipModalOverlay.DisplayOrder = -1
		UserRelationshipModalOverlay.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
		UserRelationshipModalOverlay.Enabled = true
		UserRelationshipModalOverlay.ScreenInsets = Enum.ScreenInsets.CoreUISafeInsets
		UserRelationshipModalOverlay.SafeAreaCompatibility = Enum.SafeAreaCompatibility.None
		UserRelationshipModalOverlay.ClipToDeviceSafeArea = false
		local Copy = table.clone(Tbl)
		
		function Copy.onClose() --[[ Line: 52 ]]
			-- upvalues: UserRelationshipModal (copy)
			UserRelationshipModal:Destroy()
		end
		
		ReactRobloxModule.createRoot(UserRelationshipModalOverlay):render((ReactModule.createElement(LocalizationProvider, {
			localization = Localization.new(LocalizationService.RobloxLocaleId)
		}, {
			FoundationProvider = ReactModule.createElement(FoundationProvider, {
				colorMode = FoundationModule.Enums.ColorMode.Dark,
				overlayGui = UserRelationshipModalOverlay
			}, {
				FocusNavigationProvider = ReactModule.createElement(ReactFocusNavigationModule.FocusNavigationContext.Provider, {
					value = ReactFocusNavigationModule.FocusNavigationService.new(ReactFocusNavigationModule.EngineInterface.CoreGui)
				}, {
					FocusNavigationRegistryProvider = ReactModule.createElement(Provider, nil, {
						StoreProvider = ReactModule.createElement(RoactRoduxModule.StoreProvider, { store = createRoduxStore() }, {
							UserRelationshipModal = ReactModule.createElement(p1, Copy, {})
						})
					})
				})
			})
		})))
		
		return
	end
end