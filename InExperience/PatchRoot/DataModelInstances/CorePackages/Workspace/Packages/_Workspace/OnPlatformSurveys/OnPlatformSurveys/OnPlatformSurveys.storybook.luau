local onPlatformSurveys = script:FindFirstAncestor("OnPlatformSurveys")
local parent = onPlatformSurveys.Parent
local reactModule = require(parent.React)
local reactRobloxModule = require(parent.Dev.ReactRoblox)
local foundationModule = require(parent.Foundation)
local foundationProvider = foundationModule.FoundationProvider
local colorMode = foundationModule.Enums.ColorMode
local device = foundationModule.Enums.Device
local mockProvidersModule = require(onPlatformSurveys.MockProviders)
local t = { Dark = colorMode.Dark, Light = colorMode.Light }

local function _(p0, p1)
	local cloned = table.clone(p0)
	
	if p1 then
		for i, v in p1 do
			cloned[i] = v
		end
	end
	return cloned
end

return {
	roact = reactModule,
	reactRoblox = reactRobloxModule,
	mapStory = function(p2)
		-- upvalues: reactModule (ref), mockProvidersModule (ref), foundationProvider (ref), t (ref), colorMode (ref), device (ref)
		return function(p3)
			-- upvalues: reactModule (copy), mockProvidersModule (copy), foundationProvider (copy), t (copy), colorMode (copy), device (copy), p2 (ref)
			local var7 = if p3.definition then p3.definition.props else {}
			local cloned = table.clone(p3)
			
			if var7 then
				for i, v in var7 do
					cloned[i] = v
				end
			end
			return reactModule.createElement(mockProvidersModule, {}, {
				FoundationProvider = reactModule.createElement(foundationProvider, {
					colorMode = t[p3.theme] or colorMode.Dark,
					device = device[p3.platform] or device.Phone,
					preferences = p3.settings,
					overlayGui = p3.focus
				}, { story = reactModule.createElement(p2, cloned) })
			})
		end
	end,
	storyRoots = { onPlatformSurveys }
}