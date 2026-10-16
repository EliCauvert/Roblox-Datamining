local accountUpgrade = script:FindFirstAncestor("AccountUpgrade")
local parent = accountUpgrade.Parent
local foundationModule = require(parent.Foundation)
local reactModule = require(parent.React)
local reactRobloxModule = require(parent.ReactRoblox)
local httpModule = require(parent.Dev.Http)
local mockHttpResponse = require(parent.Dev.UnitTestHelpers).mockHttpResponse
local promiseModule = require(parent.Dev.Promise)
local roactNetworking = require(parent.RoactServiceTags).RoactNetworking
local mockServices = require(parent.Dev.AuthTestHelpers).TestHelpers.mockServices
local foundationProvider = foundationModule.FoundationProvider
local colorMode = foundationModule.Enums.ColorMode
local device = foundationModule.Enums.Device
local statusCodes = httpModule.StatusCodes

local function validationEndpoint(p1)
	-- upvalues: promiseModule (ref), mockHttpResponse (ref), statusCodes (ref)
	return promiseModule.resolve(mockHttpResponse.new(p1, { code = 0 }, 0, statusCodes.OK))
end

local t = {
	Default = { themeName = "Dark", fontName = "Gotham" },
	Dark = { themeName = "Dark", fontName = "Gotham" },
	Light = { themeName = "Light", fontName = "Gotham" }
}
local t_1 = {
	Default = colorMode.Dark,
	Dark = colorMode.Dark,
	Light = colorMode.Light
}
local t_2 = {
	Default = "Desktop",
	Desktop = "Desktop",
	Phone = "Phone",
	Tablet = "Tablet",
	Console = "Console"
}

return {
	name = "AccountUpgrade",
	roact = reactModule,
	reactRoblox = reactRobloxModule,
	mapStory = function(p1)
		-- upvalues: t (ref), t_2 (ref), t_1 (ref), mockServices (ref), reactModule (ref), foundationProvider (ref), device (ref), roactNetworking (ref), validationEndpoint (ref)
		return function(p2)
			-- upvalues: t (copy), t_2 (copy), t_1 (copy), mockServices (copy), reactModule (copy), foundationProvider (copy), device (copy), p1 (ref), roactNetworking (copy), validationEndpoint (copy)
			local var1 = if p2 then t[p2.theme] else t.Default
			
			return mockServices({
				FoundationProvider = reactModule.createElement(foundationProvider, {
					colorMode = if p2 then t_1[p2.theme] else t_1.Default,
					device = if p2 then device[p2.platform] else device.Desktop,
					overlayGui = p2 and p2.focus
				}, { Story = reactModule.createElement(p1, p2) })
			}, {
				includeStoreProvider = true,
				appStyle = {
					themeName = var1.themeName,
					fontName = var1.fontName,
					deviceType = if p2 then t_2[p2.platform] else "Desktop"
				},
				extraServices = { [roactNetworking] = validationEndpoint }
			})
		end
	end,
	storyRoots = { accountUpgrade }
}