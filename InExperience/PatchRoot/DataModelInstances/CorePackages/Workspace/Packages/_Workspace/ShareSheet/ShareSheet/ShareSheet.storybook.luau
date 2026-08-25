local shareSheet = script:FindFirstAncestor("ShareSheet")
local parent = shareSheet.Parent
local localizationService = game:GetService("LocalizationService")
local reactModule = require(parent.React)
local reactRobloxModule = require(parent.ReactRoblox)
local foundationModule = require(parent.Foundation)
local localizationProvider = require(parent.Localization).LocalizationProvider
local localization = require(parent.RobloxAppLocales).Localization
local foundationProvider = foundationModule.FoundationProvider
local colorMode = foundationModule.Enums.ColorMode
local device = foundationModule.Enums.Device
local t = { Dark = colorMode.Dark, Light = colorMode.Light }
local useStyleSheet = foundationModule.Hooks.useStyleSheet

local function StyleLinkPortal(p0)
	-- upvalues: useStyleSheet (ref), reactRobloxModule (ref), reactModule (ref)
	return reactRobloxModule.createPortal(reactModule.createElement("StyleLink", { StyleSheet = useStyleSheet() }), p0.overlay)
end

return {
	name = "ShareSheet",
	roact = reactModule,
	reactRoblox = reactRobloxModule,
	mapStory = function(p1)
		-- upvalues: reactModule (ref), localization (ref), localizationService (ref), localizationProvider (ref), foundationProvider (ref), t (ref), colorMode (ref), device (ref), StyleLinkPortal (ref)
		return function(p2)
			-- upvalues: reactModule (copy), localization (copy), localizationService (copy), localizationProvider (copy), foundationProvider (copy), t (copy), colorMode (copy), device (copy), p1 (ref), StyleLinkPortal (copy)
			local var7 = reactModule.useRef(Instance.new("Frame"))
			
			if var7.current.Parent ~= p2.focus then
				var7.current.Parent = p2.focus
			end
			reactModule.useLayoutEffect(function()
				-- upvalues: var7 (ref)
				var7.current.Size = UDim2.fromScale(1, 1)
				var7.current.BackgroundTransparency = 1
			end, {})
			
			return reactModule.createElement(localizationProvider, {
				localization = reactModule.useMemo(function()
					-- upvalues: localization (copy), localizationService (copy)
					return localization.new(localizationService.RobloxLocaleId)
				end, {})
			}, {
				reactModule.createElement(foundationProvider, {
					colorMode = t[p2.theme] or colorMode.Dark,
					device = device[p2.platform] or device.Phone,
					preferences = p2.settings,
					scale = p2.settings and p2.settings.scale,
					overlayGui = var7.current
				}, {
					Story = reactModule.createElement(p1, p2),
					StyleLink = reactModule.createElement(StyleLinkPortal, { overlay = var7.current })
				})
			})
		end
	end,
	storyRoot = shareSheet
}