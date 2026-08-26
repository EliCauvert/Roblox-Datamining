local profilePlatform = script:FindFirstAncestor("ProfilePlatform")
local parent = profilePlatform.Parent
local reactModule = require(parent.React)
local foundationModule = require(parent.Foundation)
local localizationModule = require(parent.Localization)
local textKeysModule = require(profilePlatform.Common.TextKeys)
local text = foundationModule.Text
local view = foundationModule.View
local useLocalization = localizationModule.Hooks.useLocalization

return function(p1)
	-- upvalues: useLocalization (ref), textKeysModule (ref), reactModule (ref), view (ref), text (ref)
	local var1 = useLocalization({
		previousNames = textKeysModule.PreviousNames,
		noPreviousName = textKeysModule.NoPreviousName
	})
	local _ = ""
	
	return reactModule.createElement(view, {
		tag = "col size-full-0 auto-y gap-small align-x-left",
		LayoutOrder = p1.layoutOrder
	}, {
		Title = reactModule.createElement(text, {
			LayoutOrder = 1,
			tag = "auto-y size-full-0 text-align-x-left text-heading-small",
			Text = var1.previousNames
		}),
		Content = reactModule.createElement(text, {
			LayoutOrder = 2,
			tag = "auto-y size-full-0 text-align-x-left text-body-medium text-wrap",
			RichText = true,
			Text = if p1.nameHistory and #p1.nameHistory ~= 0 then table.concat(p1.nameHistory, ", ") else var1.noPreviousName
		})
	})
end