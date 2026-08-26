local performFetch = require(game:GetService("CorePackages").Workspace.Packages.Http).PerformFetch
local parent = script.Parent.Parent
local getExperienceSourceLanguageModule = require(parent.Network.GetExperienceSourceLanguage)
local setSourceLanguageNameModule = require(parent.Actions.SetSourceLanguageName)

return function()
	-- upvalues: performFetch (ref), getExperienceSourceLanguageModule (ref), setSourceLanguageNameModule (ref)
	return performFetch.Single("GetExperienceSourceLanguage", function(p1)
		-- upvalues: getExperienceSourceLanguageModule (copy), setSourceLanguageNameModule (copy)
		return getExperienceSourceLanguageModule():andThen(function(p2)
			-- upvalues: p1 (ref), setSourceLanguageNameModule (copy)
			p1:dispatch(setSourceLanguageNameModule(p2))
		end)
	end)
end