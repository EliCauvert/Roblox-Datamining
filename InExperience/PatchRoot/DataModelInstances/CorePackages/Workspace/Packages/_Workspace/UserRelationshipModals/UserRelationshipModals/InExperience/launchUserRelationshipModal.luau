local coreGuiService = game:GetService("CoreGui")
local localizationService = game:GetService("LocalizationService")
local userRelationshipModals = script:FindFirstAncestor("UserRelationshipModals")
local parent = userRelationshipModals.Parent
local provider = require(parent.FocusNavigationUtils).FocusNavigableSurfaceRegistry.Provider
local foundationModule = require(parent.Foundation)
local foundationProvider = foundationModule.FoundationProvider
local localizationProvider = require(parent.Localization).LocalizationProvider
local localization = require(parent.InExperienceLocales).Localization
local reactModule = require(parent.React)
local reactFocusNavigationModule = require(parent.ReactFocusNavigation)
local reactRobloxModule = require(parent.ReactRoblox)
local roduxModule = require(parent.Rodux)
local roactRoduxModule = require(parent.RoactRodux)
local installReducerModule = require(userRelationshipModals.Rodux.installReducer)
local RODUX_KEYModule = require(userRelationshipModals.Rodux.RODUX_KEY)

local function createRoduxStore()
	-- upvalues: roduxModule (ref), RODUX_KEYModule (ref), installReducerModule (ref)
	return roduxModule.Store.new(roduxModule.combineReducers({ [RODUX_KEYModule] = installReducerModule() }), nil, { roduxModule.thunkMiddleware })
end

return function(p0, p1)
	-- upvalues: coreGuiService (ref), reactFocusNavigationModule (ref), reactModule (ref), localizationProvider (ref), localization (ref), localizationService (ref), foundationProvider (ref), foundationModule (ref), provider (ref), roactRoduxModule (ref), createRoduxStore (ref), reactRobloxModule (ref)
	if coreGuiService:FindFirstChild("UserRelationshipModal") then
		return
	end
	local userRelationshipModal = Instance.new("Folder")
	userRelationshipModal.Name = "UserRelationshipModal"
	userRelationshipModal.Parent = coreGuiService
	local userRelationshipModalOverlay = Instance.new("ScreenGui")
	userRelationshipModalOverlay.Parent = userRelationshipModal
	userRelationshipModalOverlay.Name = "UserRelationshipModalOverlay"
	userRelationshipModalOverlay.DisplayOrder = -1
	userRelationshipModalOverlay.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
	userRelationshipModalOverlay.Enabled = true
	userRelationshipModalOverlay.ScreenInsets = Enum.ScreenInsets.CoreUISafeInsets
	userRelationshipModalOverlay.SafeAreaCompatibility = Enum.SafeAreaCompatibility.None
	userRelationshipModalOverlay.ClipToDeviceSafeArea = false
	local cloned = table.clone(p1)
	
	function cloned.onClose()
		-- upvalues: userRelationshipModal (ref)
		userRelationshipModal:Destroy()
	end
	
	reactRobloxModule.createRoot(userRelationshipModalOverlay):render(reactModule.createElement(localizationProvider, {
		localization = localization.new(localizationService.RobloxLocaleId)
	}, {
		FoundationProvider = reactModule.createElement(foundationProvider, {
			colorMode = foundationModule.Enums.ColorMode.Dark,
			overlayGui = userRelationshipModalOverlay
		}, {
			FocusNavigationProvider = reactModule.createElement(reactFocusNavigationModule.FocusNavigationContext.Provider, {
				value = reactFocusNavigationModule.FocusNavigationService.new(reactFocusNavigationModule.EngineInterface.CoreGui)
			}, {
				FocusNavigationRegistryProvider = reactModule.createElement(provider, nil, {
					StoreProvider = reactModule.createElement(roactRoduxModule.StoreProvider, { store = createRoduxStore() }, {
						UserRelationshipModal = reactModule.createElement(p0, cloned, {})
					})
				})
			})
		})
	}))
end