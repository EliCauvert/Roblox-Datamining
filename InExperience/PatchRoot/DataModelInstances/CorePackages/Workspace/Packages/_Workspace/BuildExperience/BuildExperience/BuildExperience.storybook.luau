local buildExperience = script:FindFirstAncestor("BuildExperience")
local parent = buildExperience.Parent
local localizationService = game:GetService("LocalizationService")
local foundationModule = require(parent.Foundation)
local localizationModule = require(parent.Localization)
local reactModule = require(parent.React)
local reactRobloxModule = require(parent.ReactRoblox)
local robloxAppLocalesModule = require(parent.RobloxAppLocales)
local foundationProvider = foundationModule.FoundationProvider
local localizationProvider = localizationModule.LocalizationProvider
local device = foundationModule.Enums.Device
local colorMode = foundationModule.Enums.ColorMode
local localization = robloxAppLocalesModule.Localization
local useStyleSheet = foundationModule.Hooks.useStyleSheet
local t = { Light = colorMode.Light, Dark = colorMode.Dark }
local t_1 = { Console = device.Console, Desktop = device.Desktop }

local function StyleLinkPortal(p0) --[[ line: 29 ]]
	-- upvalues: useStyleSheet (ref), reactRobloxModule (ref), reactModule (ref)
	return reactRobloxModule.createPortal(reactModule.createElement("StyleLink", { StyleSheet = useStyleSheet() }), p0.overlay)
end

return {
	name = buildExperience.Name,
	roact = reactModule,
	reactRoblox = reactRobloxModule,
	mapStory = function(p1) --[[ line: 39 ]]
		-- upvalues: reactModule (ref), localization (ref), localizationService (ref), localizationProvider (ref), foundationProvider (ref), t (ref), t_1 (ref), StyleLinkPortal (ref)
		return function(p2) --[[ line: 40 ]]
			-- upvalues: reactModule (copy), localization (copy), localizationService (copy), localizationProvider (copy), foundationProvider (copy), t (copy), t_1 (copy), p1 (ref), StyleLinkPortal (copy)
			local var10 = reactModule.useRef(Instance.new("Frame"))
			
			if var10.current.Parent ~= p2.focus then
				var10.current.Parent = p2.focus
			end
			reactModule.useLayoutEffect(function() --[[ line: 46 ]]
				-- upvalues: var10 (ref)
				var10.current.Size = UDim2.fromScale(1, 1)
				var10.current.BackgroundTransparency = 1
			end, {})
			
			return reactModule.createElement(localizationProvider, {
				localization = reactModule.useMemo(function() --[[ line: 51 ]]
					-- upvalues: localization (copy), localizationService (copy)
					return localization.new(localizationService.RobloxLocaleId)
				end, {})
			}, {
				FoundationProvider = reactModule.createElement(foundationProvider, {
					colorMode = t[p2.theme],
					device = t_1[p2.platform],
					preferences = p2.settings,
					overlayGui = var10.current
				}, {
					Story = reactModule.createElement(p1, p2),
					StyleLink = reactModule.createElement(StyleLinkPortal, { overlay = var10.current })
				})
			})
		end
	end,
	storyRoots = { buildExperience }
}