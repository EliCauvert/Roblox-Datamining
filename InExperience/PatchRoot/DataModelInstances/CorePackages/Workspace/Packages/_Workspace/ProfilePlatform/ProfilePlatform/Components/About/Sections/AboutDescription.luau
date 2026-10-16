local ProfilePlatform = script:FindFirstAncestor("ProfilePlatform")
local Parent = ProfilePlatform.Parent
local ReactModule = require(Parent.React)
local TextKeysModule = require(ProfilePlatform.Common.TextKeys)
local FoundationModule = require(Parent.Foundation)
local View = FoundationModule.View
local Text = FoundationModule.Text
local UseLocalizationFunction = require(Parent.Localization).Hooks.useLocalization
local FFlagProfileAboutDetailsUseSheet = require(Parent.SharedFlags).FFlagProfileAboutDetailsUseSheet

return function(p1) --[[ Line: 19 | Named "AboutDescription" ]]
	-- upvalues: UseLocalizationFunction (copy), TextKeysModule (copy), ReactModule (copy), View (copy), FFlagProfileAboutDetailsUseSheet (copy), Text (copy)
	local UseLocalizationResult = UseLocalizationFunction({
		about = TextKeysModule.About,
		aboutHeading = { TextKeysModule.AboutDetailsHeading, name = p1.name },
		noBioYet = TextKeysModule.NoBioYet
	})
	local Description = p1.description
	
	if Description == nil or Description == "" then
		Description = UseLocalizationResult.noBioYet
	end
	return ReactModule.createElement(View, {
		tag = "col size-full-0 auto-y gap-small align-x-left",
		LayoutOrder = p1.layoutOrder
	}, {
		AboutTitle = if FFlagProfileAboutDetailsUseSheet then nil else ReactModule.createElement(Text, {
			LayoutOrder = 1,
			tag = "size-full-0 auto-y text-heading-small text-align-x-left",
			Text = if p1.name then UseLocalizationResult.aboutHeading else UseLocalizationResult.about
		}),
		AboutDescription = ReactModule.createElement(Text, {
			LayoutOrder = 2,
			tag = "size-full-0 auto-y text-body-medium text-wrap text-align-x-left",
			Text = Description
		})
	})
end