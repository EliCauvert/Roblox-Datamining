local performFetch = require(game:GetService("CorePackages").Workspace.Packages.Http).PerformFetch
local parent = script.Parent.Parent
local getExperienceSourceLanguageModule = require(parent.Network.GetExperienceSourceLanguage)
local setSourceLanguageNameModule = require(parent.Actions.SetSourceLanguageName)

return function()
	-- upvalues: performFetch (ref), getExperienceSourceLanguageModule (ref), setSourceLanguageNameModule (ref)
	return performFetch.Single("GetExperienceSourceLanguage", function(p0)
		-- upvalues: getExperienceSourceLanguageModule (copy), setSourceLanguageNameModule (copy)
		return getExperienceSourceLanguageModule():andThen(function(p1)
			-- upvalues: p0 (ref), setSourceLanguageNameModule (copy)
			p0:dispatch(setSourceLanguageNameModule(p1))
		end)
	end)
end