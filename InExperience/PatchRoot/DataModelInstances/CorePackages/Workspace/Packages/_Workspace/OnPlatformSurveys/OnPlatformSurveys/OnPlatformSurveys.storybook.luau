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

local function _(p1, p2)
	local cloned = table.clone(p1)
	
	if p2 then
		for i, v in p2 do
			cloned[i] = v
		end
	end
	return cloned
end

return {
	roact = reactModule,
	reactRoblox = reactRobloxModule,
	mapStory = function(p3)
		-- upvalues: reactModule (ref), mockProvidersModule (ref), foundationProvider (ref), t (ref), colorMode (ref), device (ref)
		return function(p4)
			-- upvalues: reactModule (copy), mockProvidersModule (copy), foundationProvider (copy), t (copy), colorMode (copy), device (copy), p3 (ref)
			local var1 = if p4.definition then p4.definition.props else {}
			local cloned = table.clone(p4)
			
			if var1 then
				for i, v in var1 do
					cloned[i] = v
				end
			end
			return reactModule.createElement(mockProvidersModule, {}, {
				FoundationProvider = reactModule.createElement(foundationProvider, {
					colorMode = t[p4.theme] or colorMode.Dark,
					device = device[p4.platform] or device.Phone,
					preferences = p4.settings,
					overlayGui = p4.focus
				}, { story = reactModule.createElement(p3, cloned) })
			})
		end
	end,
	storyRoots = { onPlatformSurveys }
}