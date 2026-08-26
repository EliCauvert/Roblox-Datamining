local robloxSubscriptionPurchaseApp = script:FindFirstAncestor("RobloxSubscriptionPurchaseApp")
local parent = robloxSubscriptionPurchaseApp.Parent
local localizationService = game:GetService("LocalizationService")
local reactModule = require(parent.React)
local reactRobloxModule = require(parent.ReactRoblox)
local styleModule = require(parent.Style)
local roactRoduxModule = require(parent.RoactRodux)
local roduxModule = require(parent.Rodux)
local useSelectedTheme = require(parent.RoactUtils).Hooks.useSelectedTheme
local styleProviderWithDefaultTheme = styleModule.StyleProviderWithDefaultTheme
local foundationProvider = require(parent.Foundation).FoundationProvider
local UIBloxModule = require(parent.UIBlox)
local selectionCursorProvider = UIBloxModule.App.SelectionImage.SelectionCursorProvider
local cursorProvider = UIBloxModule.App.SelectionCursor.CursorProvider
local localization = require(parent.AppLocales).Localization
local localizationProvider = require(parent.Localization).LocalizationProvider
local providerContainer = require(parent.RoactUtils).Components.ProviderContainer
local robloxSubscriptionContainerModule = require(robloxSubscriptionPurchaseApp.Components.RobloxSubscriptionContainer)
local robloxSubscriptionStoreModule = require(robloxSubscriptionPurchaseApp.Store.RobloxSubscriptionStore)
local var1 = nil
local list = { roduxModule.thunkMiddleware }

local function close()
	-- upvalues: var1 (write)
	if var1 then
		var1()
		var1 = nil
	end
end

local function ThemedOverlay(p1)
	-- upvalues: useSelectedTheme (ref), reactModule (ref), roduxModule (ref), list (ref), roactRoduxModule (ref), styleProviderWithDefaultTheme (ref), localizationProvider (ref), localization (ref), localizationService (ref), selectionCursorProvider (ref), cursorProvider (ref), foundationProvider (ref), providerContainer (ref), robloxSubscriptionContainerModule (ref)
	local var2 = useSelectedTheme()
	local var3 = reactModule.useMemo(function()
		-- upvalues: roduxModule (copy), list (copy)
		return roduxModule.Store.new(roduxModule.combineReducers({}), nil, list)
	end, {})
	
	return reactModule.createElement(foundationProvider, { colorMode = if var2 == "light" then "Light" else "Dark" }, {
		Providers = reactModule.createElement(providerContainer, {
			providers = reactModule.useMemo(function()
				-- upvalues: roactRoduxModule (copy), var3 (ref), styleProviderWithDefaultTheme (copy), var2 (ref), localizationProvider (copy), localization (copy), localizationService (copy), selectionCursorProvider (copy), cursorProvider (copy)
				local t = {}
				table.insert(t, {
					class = roactRoduxModule.StoreProvider,
					props = { store = var3 }
				})
				table.insert(t, {
					class = styleProviderWithDefaultTheme,
					props = {
						withUiModeSupport = false,
						withDarkTheme = var2 ~= "light"
					}
				})
				table.insert(t, {
					class = localizationProvider,
					props = {
						localization = localization.new(localizationService.RobloxLocaleId)
					}
				})
				table.insert(t, { class = selectionCursorProvider, props = {} })
				table.insert(t, { class = cursorProvider, props = {} })
				
				return t
			end, { var2, var3 })
		}, {
			Sheet = reactModule.createElement(robloxSubscriptionContainerModule, {
				title = if p1.params then p1.params.title else nil,
				message = if p1.params then p1.params.message else nil,
				onClose = p1.onClose
			})
		})
	})
end

return {
	render = function(p1)
		-- upvalues: robloxSubscriptionStoreModule (ref), reactRobloxModule (ref), reactModule (ref), ThemedOverlay (ref), close (ref), var1 (write)
		local var2 = robloxSubscriptionStoreModule.get()
		var2.triggerUnmountUI()
		local robloxSubscriptionPurchaseOverlay = Instance.new("Folder")
		robloxSubscriptionPurchaseOverlay.Name = "RobloxSubscriptionPurchaseOverlay"
		robloxSubscriptionPurchaseOverlay.Parent = game:GetService("CoreGui")
		local var3 = reactRobloxModule.createRoot(robloxSubscriptionPurchaseOverlay)
		var3:render(reactModule.createElement(ThemedOverlay, { params = p1, onClose = close }))
		
		local function cleanup()
			-- upvalues: var3 (ref), robloxSubscriptionPurchaseOverlay (ref)
			var3:unmount()
			robloxSubscriptionPurchaseOverlay:Destroy()
		end
		
		var1 = cleanup
		var2.setOnUnmountUI(cleanup)
		
		return cleanup
	end,
	close = close
}