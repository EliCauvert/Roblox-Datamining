local ShareSheet = script:FindFirstAncestor("ShareSheet")
local Parent = ShareSheet.Parent
local LocalizationService = game:GetService("LocalizationService")
local ReactModule = require(Parent.React)
local ReactRobloxModule = require(Parent.ReactRoblox)
local FoundationModule = require(Parent.Foundation)
local LocalizationProvider = require(Parent.Localization).LocalizationProvider
local Localization = require(Parent.RobloxAppLocales).Localization
local FoundationProvider = FoundationModule.FoundationProvider
local ColorMode = FoundationModule.Enums.ColorMode
local Device = FoundationModule.Enums.Device
local config = { Dark = ColorMode.Dark, Light = ColorMode.Light }
local UseStyleSheetFunction = FoundationModule.Hooks.useStyleSheet

local function StyleLinkPortal(p1) --[[ Line: 26 ]]
	-- upvalues: UseStyleSheetFunction (copy), ReactRobloxModule (copy), ReactModule (copy)
	return ReactRobloxModule.createPortal(ReactModule.createElement("StyleLink", { StyleSheet = UseStyleSheetFunction() }), p1.overlay)
end

return {
	name = "ShareSheet",
	roact = ReactModule,
	reactRoblox = ReactRobloxModule,
	mapStory = function(p1) --[[ Line: 36 ]]
		-- upvalues: ReactModule (copy), Localization (copy), LocalizationService (copy), LocalizationProvider (copy), FoundationProvider (copy), config (copy), ColorMode (copy), Device (copy), StyleLinkPortal (copy)
		return function(p2) --[[ Line: 37 ]]
			-- upvalues: ReactModule (upval), Localization (upval), LocalizationService (upval), LocalizationProvider (upval), FoundationProvider (upval), config (upval), ColorMode (upval), Device (upval), p1 (copy), StyleLinkPortal (upval)
			local UseRefResult = ReactModule.useRef(Instance.new("Frame"))
			
			if UseRefResult.current.Parent ~= p2.focus then
				UseRefResult.current.Parent = p2.focus
			end
			ReactModule.useLayoutEffect(function() --[[ Line: 43 ]]
				-- upvalues: UseRefResult (copy)
				UseRefResult.current.Size = UDim2.fromScale(1, 1)
				UseRefResult.current.BackgroundTransparency = 1
			end, {})
			
			return ReactModule.createElement(LocalizationProvider, {
				localization = ReactModule.useMemo(function() --[[ Line: 48 ]]
					-- upvalues: Localization (upval), LocalizationService (upval)
					return Localization.new(LocalizationService.RobloxLocaleId)
				end, {})
			}, {
				ReactModule.createElement(FoundationProvider, {
					colorMode = config[p2.theme] or ColorMode.Dark,
					device = Device[p2.platform] or Device.Phone,
					preferences = p2.settings,
					scale = p2.settings and p2.settings.scale,
					overlayGui = UseRefResult.current
				}, {
					Story = ReactModule.createElement(p1, p2),
					StyleLink = ReactModule.createElement(StyleLinkPortal, { overlay = UseRefResult.current })
				})
			})
		end
	end,
	storyRoot = ShareSheet
}