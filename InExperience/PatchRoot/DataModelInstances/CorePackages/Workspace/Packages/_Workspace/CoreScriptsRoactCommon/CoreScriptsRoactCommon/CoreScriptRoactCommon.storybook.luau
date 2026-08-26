local coreScriptsRoactCommon = script:FindFirstAncestor("CoreScriptsRoactCommon")
local parent = coreScriptsRoactCommon.Parent
local reactModule = require(parent.React)
local reactRobloxModule = require(parent.ReactRoblox)
local localization = require(parent.InExperienceLocales).Localization
local localizationProvider = require(parent.Localization).LocalizationProvider
local foundationStorybookMiddlewareModule = require(script.Parent.FoundationStorybookMiddleware)
local var1 = localization.new("en-us")

local function _(p1)
	-- upvalues: reactModule (ref), localizationProvider (ref), var1 (ref)
	return function(p2)
		-- upvalues: reactModule (copy), localizationProvider (copy), var1 (copy), p1 (ref)
		return reactModule.createElement(localizationProvider, { localization = var1 }, { Child = reactModule.createElement(p1, p2) })
	end
end

return {
	name = coreScriptsRoactCommon.Name,
	storyRoot = coreScriptsRoactCommon,
	roact = reactModule,
	reactRoblox = reactRobloxModule,
	mapStory = function(p1)
		-- upvalues: foundationStorybookMiddlewareModule (ref), reactModule (ref), localizationProvider (ref), var1 (ref)
		return foundationStorybookMiddlewareModule(function(p2)
			-- upvalues: reactModule (copy), localizationProvider (copy), var1 (copy), p1 (ref)
			return reactModule.createElement(localizationProvider, { localization = var1 }, { Child = reactModule.createElement(p1, p2) })
		end)
	end
}