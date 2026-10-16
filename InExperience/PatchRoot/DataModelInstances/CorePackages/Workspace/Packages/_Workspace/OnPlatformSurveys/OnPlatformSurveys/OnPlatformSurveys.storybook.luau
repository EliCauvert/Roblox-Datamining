local OnPlatformSurveys = script:FindFirstAncestor("OnPlatformSurveys")
local Parent = OnPlatformSurveys.Parent
local ReactModule = require(Parent.React)
local FoundationModule = require(Parent.Foundation)
local FoundationProvider = FoundationModule.FoundationProvider
local ColorMode = FoundationModule.Enums.ColorMode
local Device = FoundationModule.Enums.Device
local MockProvidersModule = require(OnPlatformSurveys.MockProviders)
local config = { Dark = ColorMode.Dark, Light = ColorMode.Light }

local function _(Tbl, List) --[[ Line: 26 | Named "union" ]]
	local Copy = table.clone(Tbl)
	
	if List then
		for i, value in List do
			Copy[i] = value
		end
	end
	return Copy
end

return {
	roact = ReactModule,
	reactRoblox = require(Parent.Dev.ReactRoblox),
	mapStory = function(p1) --[[ Line: 39 ]]
		-- upvalues: ReactModule (copy), MockProvidersModule (copy), FoundationProvider (copy), config (copy), ColorMode (copy), Device (copy)
		return function(Tbl) --[[ Line: 40 ]]
			-- upvalues: ReactModule (upval), MockProvidersModule (upval), FoundationProvider (upval), config (upval), ColorMode (upval), Device (upval), p1 (copy)
			local Props = Tbl.definition and Tbl.definition.props or {}
			local Copy = table.clone(Tbl)
			
			if Props then
				for i, prop in Props do
					Copy[i] = prop
				end
			end
			return ReactModule.createElement(MockProvidersModule, {}, {
				FoundationProvider = ReactModule.createElement(FoundationProvider, {
					colorMode = config[Tbl.theme] or ColorMode.Dark,
					device = Device[Tbl.platform] or Device.Phone,
					preferences = Tbl.settings,
					overlayGui = Tbl.focus
				}, { story = ReactModule.createElement(p1, Copy) })
			})
		end
	end,
	storyRoots = { OnPlatformSurveys }
}