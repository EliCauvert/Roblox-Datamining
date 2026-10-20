local AccountUpgrade = script:FindFirstAncestor("AccountUpgrade")
local Parent = AccountUpgrade.Parent
local FoundationModule = require(Parent.Foundation)
local ReactModule = require(Parent.React)
local MockHttpResponse = require(Parent.Dev.UnitTestHelpers).mockHttpResponse
local PromiseModule = require(Parent.Promise)
local RoactNetworking = require(Parent.RoactServiceTags).RoactNetworking
local MockServicesFunction = require(Parent.Dev.AuthTestHelpers).TestHelpers.mockServices
local FoundationProvider = FoundationModule.FoundationProvider
local ColorMode = FoundationModule.Enums.ColorMode
local Device = FoundationModule.Enums.Device
local StatusCodes = require(Parent.Dev.Http).StatusCodes

local function validationEndpoint(p1)
	-- upvalues: PromiseModule (copy), MockHttpResponse (copy), StatusCodes (copy)
	return PromiseModule.resolve(MockHttpResponse.new(p1, { code = 0 }, 0, StatusCodes.OK))
end

local config = {
	Default = { themeName = "Dark", fontName = "Gotham" },
	Dark = { themeName = "Dark", fontName = "Gotham" },
	Light = { themeName = "Light", fontName = "Gotham" }
}
local config1 = {
	Default = ColorMode.Dark,
	Dark = ColorMode.Dark,
	Light = ColorMode.Light
}
local config2 = {
	Default = "Desktop",
	Desktop = "Desktop",
	Phone = "Phone",
	Tablet = "Tablet",
	Console = "Console"
}

return {
	name = "AccountUpgrade",
	roact = ReactModule,
	reactRoblox = require(Parent.ReactRoblox),
	mapStory = function(p1)
		-- upvalues: config (copy), config2 (copy), config1 (copy), MockServicesFunction (copy), ReactModule (copy), FoundationProvider (copy), Device (copy), RoactNetworking (copy), validationEndpoint (copy)
		return function(p2)
			-- upvalues: config (upval), config2 (upval), config1 (upval), MockServicesFunction (upval), ReactModule (upval), FoundationProvider (upval), Device (upval), p1 (copy), RoactNetworking (upval), validationEndpoint (upval)
			local Entry = p2 and config[p2.theme] or config.Default
			
			return MockServicesFunction({
				FoundationProvider = ReactModule.createElement(FoundationProvider, {
					colorMode = p2 and config1[p2.theme] or config1.Default,
					device = p2 and Device[p2.platform] or Device.Desktop,
					overlayGui = p2 and p2.focus
				}, { Story = ReactModule.createElement(p1, p2) })
			}, {
				includeStoreProvider = true,
				appStyle = {
					themeName = Entry.themeName,
					fontName = Entry.fontName,
					deviceType = p2 and config2[p2.platform] or "Desktop"
				},
				extraServices = { [RoactNetworking] = validationEndpoint }
			})
		end
	end,
	storyRoots = { AccountUpgrade }
}