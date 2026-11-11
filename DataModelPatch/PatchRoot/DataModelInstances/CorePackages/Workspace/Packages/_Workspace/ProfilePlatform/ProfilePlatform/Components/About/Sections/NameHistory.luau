local ProfilePlatform = script:FindFirstAncestor("ProfilePlatform")
local Parent = ProfilePlatform.Parent
local ReactModule = require(Parent.React)
local FoundationModule = require(Parent.Foundation)
local TextKeysModule = require(ProfilePlatform.Common.TextKeys)
local Text = FoundationModule.Text
local View = FoundationModule.View
local UseLocalizationFunction = require(Parent.Localization).Hooks.useLocalization

return function(p1)
	-- upvalues: UseLocalizationFunction (copy), TextKeysModule (copy), ReactModule (copy), View (copy), Text (copy)
	local UseLocalizationResult = UseLocalizationFunction({
		previousNames = TextKeysModule.PreviousNames,
		noPreviousName = TextKeysModule.NoPreviousName
	})
	
	return ReactModule.createElement(View, {
		tag = "col size-full-0 auto-y gap-small align-x-left",
		LayoutOrder = p1.layoutOrder
	}, {
		Title = ReactModule.createElement(Text, {
			LayoutOrder = 1,
			tag = "auto-y size-full-0 text-align-x-left text-heading-small",
			Text = UseLocalizationResult.previousNames
		}),
		Content = ReactModule.createElement(Text, {
			LayoutOrder = 2,
			tag = "auto-y size-full-0 text-align-x-left text-body-medium text-wrap",
			RichText = true,
			Text = if p1.nameHistory and #p1.nameHistory ~= 0 then table.concat(p1.nameHistory, ", ") else UseLocalizationResult.noPreviousName
		})
	})
end