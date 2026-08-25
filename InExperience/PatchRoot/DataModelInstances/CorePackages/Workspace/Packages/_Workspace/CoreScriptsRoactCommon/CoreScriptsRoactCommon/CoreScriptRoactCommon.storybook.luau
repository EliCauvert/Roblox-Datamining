local coreScriptsRoactCommon = script:FindFirstAncestor("CoreScriptsRoactCommon")
local parent = coreScriptsRoactCommon.Parent
local reactModule = require(parent.React)
local reactRobloxModule = require(parent.ReactRoblox)
local localization = require(parent.InExperienceLocales).Localization
local localizationProvider = require(parent.Localization).LocalizationProvider
local foundationStorybookMiddlewareModule = require(script.Parent.FoundationStorybookMiddleware)
local var4 = localization.new("en-us")

local function _(p0)
	-- upvalues: reactModule (ref), localizationProvider (ref), var4 (ref)
	return function(p1)
		-- upvalues: reactModule (copy), localizationProvider (copy), var4 (copy), p0 (ref)
		return reactModule.createElement(localizationProvider, { localization = var4 }, { Child = reactModule.createElement(p0, p1) })
	end
end

return {
	name = coreScriptsRoactCommon.Name,
	storyRoot = coreScriptsRoactCommon,
	roact = reactModule,
	reactRoblox = reactRobloxModule,
	mapStory = function(p2)
		-- upvalues: foundationStorybookMiddlewareModule (ref), reactModule (ref), localizationProvider (ref), var4 (ref)
		return foundationStorybookMiddlewareModule(function(p3)
			-- upvalues: reactModule (copy), localizationProvider (copy), var4 (copy), p2 (ref)
			return reactModule.createElement(localizationProvider, { localization = var4 }, { Child = reactModule.createElement(p2, p3) })
		end)
	end
}