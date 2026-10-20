local BuildExperience = script:FindFirstAncestor("BuildExperience")
local Parent = BuildExperience.Parent
local LocalizationService = game:GetService("LocalizationService")
local FoundationModule = require(Parent.Foundation)
local ReactModule = require(Parent.React)
local ReactRobloxModule = require(Parent.ReactRoblox)
local FoundationProvider = FoundationModule.FoundationProvider
local LocalizationProvider = require(Parent.Localization).LocalizationProvider
local Device = FoundationModule.Enums.Device
local ColorMode = FoundationModule.Enums.ColorMode
local Localization = require(Parent.RobloxAppLocales).Localization
local UseStyleSheetFunction = FoundationModule.Hooks.useStyleSheet
local config = { Light = ColorMode.Light, Dark = ColorMode.Dark }
local config1 = { Console = Device.Console, Desktop = Device.Desktop }

local function StyleLinkPortal(p1)
	-- upvalues: UseStyleSheetFunction (copy), ReactRobloxModule (copy), ReactModule (copy)
	return ReactRobloxModule.createPortal(ReactModule.createElement("StyleLink", { StyleSheet = UseStyleSheetFunction() }), p1.overlay)
end

return {
	name = BuildExperience.Name,
	roact = ReactModule,
	reactRoblox = ReactRobloxModule,
	mapStory = function(p1)
		-- upvalues: ReactModule (copy), Localization (copy), LocalizationService (copy), LocalizationProvider (copy), FoundationProvider (copy), config (copy), config1 (copy), StyleLinkPortal (copy)
		return function(p2)
			-- upvalues: ReactModule (upval), Localization (upval), LocalizationService (upval), LocalizationProvider (upval), FoundationProvider (upval), config (upval), config1 (upval), p1 (copy), StyleLinkPortal (upval)
			local UseRefResult = ReactModule.useRef(Instance.new("Frame"))
			
			if UseRefResult.current.Parent ~= p2.focus then
				UseRefResult.current.Parent = p2.focus
			end
			ReactModule.useLayoutEffect(function()
				-- upvalues: UseRefResult (copy)
				UseRefResult.current.Size = UDim2.fromScale(1, 1)
				UseRefResult.current.BackgroundTransparency = 1
			end, {})
			
			return ReactModule.createElement(LocalizationProvider, {
				localization = ReactModule.useMemo(function()
					-- upvalues: Localization (upval), LocalizationService (upval)
					return Localization.new(LocalizationService.RobloxLocaleId)
				end, {})
			}, {
				FoundationProvider = ReactModule.createElement(FoundationProvider, {
					colorMode = config[p2.theme],
					device = config1[p2.platform],
					preferences = p2.settings,
					overlayGui = UseRefResult.current
				}, {
					Story = ReactModule.createElement(p1, p2),
					StyleLink = ReactModule.createElement(StyleLinkPortal, { overlay = UseRefResult.current })
				})
			})
		end
	end,
	storyRoots = { BuildExperience }
}