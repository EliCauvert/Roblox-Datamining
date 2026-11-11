local Schools = script:FindFirstAncestor("Schools")
local Parent = Schools.Parent
local ReactModule = require(Parent.React)
local UseSignalStateFunction = require(Parent.SignalsReact).useSignalState
local UseLocalizationFunction = require(Parent.Localization).Hooks.useLocalization
local ConstantsModule = require(Schools.Common.Constants)
local _ = require(Schools.Common.Enums)
local TextKeysModule = require(Schools.Common.TextKeys)
local SchoolsPageModule = require(Schools.Components.Common.SchoolsPage)
local SchoolEntryStatusModule = require(Schools.Store.SchoolEntryStatus)
local SchoolWaitlistModule = require(script.Parent.SchoolWaitlist)

return function(p1)
	-- upvalues: UseLocalizationFunction (copy), TextKeysModule (copy), UseSignalStateFunction (copy), SchoolEntryStatusModule (copy), ReactModule (copy), SchoolsPageModule (copy), ConstantsModule (copy), SchoolWaitlistModule (copy)
	local Navigation = p1.navigation
	
	return ReactModule.createElement(SchoolsPageModule, {
		fillContent = true,
		testId = "schools-waitlist-page",
		title = UseLocalizationFunction({ headerTitle = TextKeysModule.WaitlistHeaderTitle }).headerTitle,
		onBack = ReactModule.useCallback(function()
			-- upvalues: Navigation (copy)
			Navigation.pop()
		end, { Navigation }),
		maxContentWidth = ConstantsModule.Waitlist.MAX_CONTENT_WIDTH
	}, {
		Content = ReactModule.createElement(SchoolWaitlistModule, {
			schoolName = "UCLA",
			remainingCount = 8,
			variant = UseSignalStateFunction(SchoolEntryStatusModule.getVariantSignal()),
			onShare = ReactModule.useCallback(function() end, {})
		})
	})
end