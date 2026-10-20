local RobloxSubscriptionPurchaseApp = script:FindFirstAncestor("RobloxSubscriptionPurchaseApp")
local Parent = RobloxSubscriptionPurchaseApp.Parent
local LocalizationService = game:GetService("LocalizationService")
local ReactModule = require(Parent.React)
local ReactRobloxModule = require(Parent.ReactRoblox)
local RoactRoduxModule = require(Parent.RoactRodux)
local RoduxModule = require(Parent.Rodux)
local UseSelectedThemeFunction = require(Parent.RoactUtils).Hooks.useSelectedTheme
local StyleProviderWithDefaultTheme = require(Parent.Style).StyleProviderWithDefaultTheme
local FoundationProvider = require(Parent.Foundation).FoundationProvider
local UIBloxModule = require(Parent.UIBlox)
local SelectionCursorProvider = UIBloxModule.App.SelectionImage.SelectionCursorProvider
local CursorProvider = UIBloxModule.App.SelectionCursor.CursorProvider
local Localization = require(Parent.AppLocales).Localization
local LocalizationProvider = require(Parent.Localization).LocalizationProvider
local ProviderContainer = require(Parent.RoactUtils).Components.ProviderContainer
local RobloxSubscriptionContainerModule = require(RobloxSubscriptionPurchaseApp.Components.RobloxSubscriptionContainer)
local RobloxSubscriptionStoreModule = require(RobloxSubscriptionPurchaseApp.Store.RobloxSubscriptionStore)
local Callback: (() -> ())? = nil
local list = { RoduxModule.thunkMiddleware }

local function close()
	-- upvalues: Callback (ref)
	if Callback then
		Callback()
		Callback = nil
	end
end

local function ThemedOverlay(p1)
	-- upvalues: UseSelectedThemeFunction (copy), ReactModule (copy), RoduxModule (copy), list (copy), RoactRoduxModule (copy), StyleProviderWithDefaultTheme (copy), LocalizationProvider (copy), Localization (copy), LocalizationService (copy), SelectionCursorProvider (copy), CursorProvider (copy), FoundationProvider (copy), ProviderContainer (copy), RobloxSubscriptionContainerModule (copy)
	local UseSelectedThemeResult = UseSelectedThemeFunction()
	local UseMemoResult = ReactModule.useMemo(function()
		-- upvalues: RoduxModule (upval), list (upval)
		return RoduxModule.Store.new(RoduxModule.combineReducers({}), nil, list)
	end, {})
	
	return ReactModule.createElement(FoundationProvider, {
		colorMode = if UseSelectedThemeResult == "light" then "Light" else "Dark"
	}, {
		Providers = ReactModule.createElement(ProviderContainer, {
			providers = ReactModule.useMemo(function()
				-- upvalues: RoactRoduxModule (upval), UseMemoResult (copy), StyleProviderWithDefaultTheme (upval), UseSelectedThemeResult (copy), LocalizationProvider (upval), Localization (upval), LocalizationService (upval), SelectionCursorProvider (upval), CursorProvider (upval)
				local List = {}
				table.insert(List, {
					class = RoactRoduxModule.StoreProvider,
					props = { store = UseMemoResult }
				})
				table.insert(List, {
					class = StyleProviderWithDefaultTheme,
					props = {
						withUiModeSupport = false,
						withDarkTheme = UseSelectedThemeResult ~= "light"
					}
				})
				table.insert(List, {
					class = LocalizationProvider,
					props = {
						localization = Localization.new(LocalizationService.RobloxLocaleId)
					}
				})
				table.insert(List, { class = SelectionCursorProvider, props = {} })
				table.insert(List, { class = CursorProvider, props = {} })
				
				return List
			end, { UseSelectedThemeResult, UseMemoResult })
		}, {
			Sheet = ReactModule.createElement(RobloxSubscriptionContainerModule, {
				title = p1.params and p1.params.title or nil,
				message = p1.params and p1.params.message or nil,
				onClose = p1.onClose
			})
		})
	})
end

return {
	render = function(Params)
		-- upvalues: RobloxSubscriptionStoreModule (copy), ReactRobloxModule (copy), ReactModule (copy), ThemedOverlay (copy), close (copy), Callback (ref)
		local GetResult = RobloxSubscriptionStoreModule.get()
		GetResult.triggerUnmountUI()
		local RobloxSubscriptionPurchaseOverlay = Instance.new("Folder")
		RobloxSubscriptionPurchaseOverlay.Name = "RobloxSubscriptionPurchaseOverlay"
		RobloxSubscriptionPurchaseOverlay.Parent = game:GetService("CoreGui")
		local Root = ReactRobloxModule.createRoot(RobloxSubscriptionPurchaseOverlay)
		Root:render(ReactModule.createElement(ThemedOverlay, { params = Params, onClose = close }))
		
		local function cleanup()
			-- upvalues: Root (copy), RobloxSubscriptionPurchaseOverlay (copy)
			Root:unmount()
			RobloxSubscriptionPurchaseOverlay:Destroy()
		end
		
		Callback = cleanup
		GetResult.setOnUnmountUI(cleanup)
		
		return cleanup
	end,
	close = close
}