local PerformFetch = require(game:GetService("CorePackages").Workspace.Packages.Http).PerformFetch
local Parent = script.Parent.Parent
local GetExperienceSourceLanguageModule = require(Parent.Network.GetExperienceSourceLanguage)
local SetSourceLanguageNameModule = require(Parent.Actions.SetSourceLanguageName)

return function()
	-- upvalues: PerformFetch (copy), GetExperienceSourceLanguageModule (copy), SetSourceLanguageNameModule (copy)
	return PerformFetch.Single("GetExperienceSourceLanguage", function(p1)
		-- upvalues: GetExperienceSourceLanguageModule (upval), SetSourceLanguageNameModule (upval)
		return GetExperienceSourceLanguageModule():andThen(function(Result)
			-- upvalues: p1 (copy), SetSourceLanguageNameModule (upval)
			p1:dispatch(SetSourceLanguageNameModule(Result))
		end)
	end)
end