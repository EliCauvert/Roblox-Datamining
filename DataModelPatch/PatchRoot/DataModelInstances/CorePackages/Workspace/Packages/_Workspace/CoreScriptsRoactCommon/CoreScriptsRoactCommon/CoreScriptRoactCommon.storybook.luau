local CoreScriptsRoactCommon = script:FindFirstAncestor("CoreScriptsRoactCommon")
local Parent = CoreScriptsRoactCommon.Parent
local ReactModule = require(Parent.React)
local LocalizationProvider = require(Parent.Localization).LocalizationProvider
local FoundationStorybookMiddlewareModule = require(script.Parent.FoundationStorybookMiddleware)
local EnUs = require(Parent.InExperienceLocales).Localization.new("en-us")

local function _(p1)
	-- upvalues: ReactModule (copy), LocalizationProvider (copy), EnUs (copy)
	return function(p2)
		-- upvalues: ReactModule (upval), LocalizationProvider (upval), EnUs (upval), p1 (copy)
		return ReactModule.createElement(LocalizationProvider, { localization = EnUs }, { Child = ReactModule.createElement(p1, p2) })
	end
end

return {
	name = CoreScriptsRoactCommon.Name,
	storyRoot = CoreScriptsRoactCommon,
	roact = ReactModule,
	reactRoblox = require(Parent.ReactRoblox),
	mapStory = function(p1)
		-- upvalues: FoundationStorybookMiddlewareModule (copy), ReactModule (copy), LocalizationProvider (copy), EnUs (copy)
		return FoundationStorybookMiddlewareModule(function(p2)
			-- upvalues: ReactModule (upval), LocalizationProvider (upval), EnUs (upval), p1 (copy)
			return ReactModule.createElement(LocalizationProvider, { localization = EnUs }, { Child = ReactModule.createElement(p1, p2) })
		end)
	end
}