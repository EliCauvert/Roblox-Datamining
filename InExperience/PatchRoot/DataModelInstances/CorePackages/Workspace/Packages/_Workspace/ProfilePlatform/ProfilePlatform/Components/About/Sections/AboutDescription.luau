local profilePlatform = script:FindFirstAncestor("ProfilePlatform")
local parent = profilePlatform.Parent
local reactModule = require(parent.React)
local textKeysModule = require(profilePlatform.Common.TextKeys)
local localizationModule = require(parent.Localization)
local foundationModule = require(parent.Foundation)
local view = foundationModule.View
local text = foundationModule.Text
local useLocalization = localizationModule.Hooks.useLocalization
local fFlagProfileAboutDetailsUseSheet = require(parent.SharedFlags).FFlagProfileAboutDetailsUseSheet

return function(p0) --[[ line: 19 | named "AboutDescription" ]]
	-- upvalues: useLocalization (ref), textKeysModule (ref), reactModule (ref), view (ref), fFlagProfileAboutDetailsUseSheet (ref), text (ref)
	local var5 = useLocalization({
		about = textKeysModule.About,
		aboutHeading = { textKeysModule.AboutDetailsHeading, name = p0.name },
		noBioYet = textKeysModule.NoBioYet
	})
	local description = p0.description
	
	if description == nil or description == "" then
		description = var5.noBioYet
	end
	return reactModule.createElement(view, {
		tag = "col size-full-0 auto-y gap-small align-x-left",
		LayoutOrder = p0.layoutOrder
	}, {
		AboutTitle = if not fFlagProfileAboutDetailsUseSheet then reactModule.createElement(text, {
			LayoutOrder = 1,
			tag = "size-full-0 auto-y text-heading-small text-align-x-left",
			Text = if p0.name then var5.aboutHeading else var5.about
		}) else nil,
		AboutDescription = reactModule.createElement(text, {
			LayoutOrder = 2,
			tag = "size-full-0 auto-y text-body-medium text-wrap text-align-x-left",
			Text = description
		})
	})
end