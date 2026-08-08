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
local var10 = nil
local list = { roduxModule.thunkMiddleware }

local function close() --[[ line: 42 ]]
	-- upvalues: var10 (write)
	if var10 then
		var10()
		var10 = nil
	end
end

local function ThemedOverlay(p0) --[[ line: 49 ]]
	-- upvalues: useSelectedTheme (ref), reactModule (ref), roduxModule (ref), list (ref), roactRoduxModule (ref), styleProviderWithDefaultTheme (ref), localizationProvider (ref), localization (ref), localizationService (ref), selectionCursorProvider (ref), cursorProvider (ref), foundationProvider (ref), providerContainer (ref), robloxSubscriptionContainerModule (ref)
	local var14 = useSelectedTheme()
	local var15 = reactModule.useMemo(function() --[[ line: 52 ]]
		-- upvalues: roduxModule (copy), list (copy)
		return roduxModule.Store.new(roduxModule.combineReducers({}), nil, list)
	end, {})
	
	return reactModule.createElement(foundationProvider, { colorMode = if var14 == "light" then "Light" else "Dark" }, {
		Providers = reactModule.createElement(providerContainer, {
			providers = reactModule.useMemo(function() --[[ line: 56 ]]
				-- upvalues: roactRoduxModule (copy), var15 (ref), styleProviderWithDefaultTheme (copy), var14 (ref), localizationProvider (copy), localization (copy), localizationService (copy), selectionCursorProvider (copy), cursorProvider (copy)
				local t = {}
				table.insert(t, {
					class = roactRoduxModule.StoreProvider,
					props = { store = var15 }
				})
				table.insert(t, {
					class = styleProviderWithDefaultTheme,
					props = {
						withUiModeSupport = false,
						withDarkTheme = var14 ~= "light"
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
			end, { var14, var15 })
		}, {
			Sheet = reactModule.createElement(robloxSubscriptionContainerModule, {
				title = if p0.params then p0.params.title else nil,
				message = if p0.params then p0.params.message else nil,
				onClose = p0.onClose
			})
		})
	})
end

return {
	render = function(p1) --[[ line: 94 ]]
		-- upvalues: robloxSubscriptionStoreModule (ref), reactRobloxModule (ref), reactModule (ref), ThemedOverlay (ref), close (ref), var10 (write)
		local var17 = robloxSubscriptionStoreModule.get()
		var17.triggerUnmountUI()
		local robloxSubscriptionPurchaseOverlay = Instance.new("Folder")
		robloxSubscriptionPurchaseOverlay.Name = "RobloxSubscriptionPurchaseOverlay"
		robloxSubscriptionPurchaseOverlay.Parent = game:GetService("CoreGui")
		local var19 = reactRobloxModule.createRoot(robloxSubscriptionPurchaseOverlay)
		var19:render(reactModule.createElement(ThemedOverlay, { params = p1, onClose = close }))
		
		local function cleanup() --[[ line: 108 ]]
			-- upvalues: var19 (ref), robloxSubscriptionPurchaseOverlay (ref)
			var19:unmount()
			robloxSubscriptionPurchaseOverlay:Destroy()
		end
		
		var10 = cleanup
		var17.setOnUnmountUI(cleanup)
		
		return cleanup
	end,
	close = close
}