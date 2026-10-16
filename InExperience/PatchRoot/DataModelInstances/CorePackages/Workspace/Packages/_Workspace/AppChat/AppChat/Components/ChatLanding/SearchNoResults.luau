local Parent = script:FindFirstAncestor("AppChat").Parent
local FoundationModule = require(Parent.Foundation)
local ReactModule = require(Parent.React)
local UseLocalizationFunction = require(Parent.Localization).Hooks.useLocalization
local View = FoundationModule.View
local Text = FoundationModule.Text
local UseTokensFunction = FoundationModule.Hooks.useTokens

return function(p1) --[[ Line: 19 | Named "SearchNoResults" ]]
	-- upvalues: UseLocalizationFunction (copy), UseTokensFunction (copy), ReactModule (copy), View (copy), Text (copy)
	local UseLocalizationResult = UseLocalizationFunction({ noChatFound = "Feature.Chat.Label.NoChatFound" })
	local UseTokensResult = UseTokensFunction()
	local _UDim = UDim.new(0, UseTokensResult.Padding.Large)
	
	return ReactModule.createElement(View, {
		tag = "col align-x-center align-y-center gap-small size-full",
		padding = {
			top = UDim.new(0, (p1.topPadding or 0) + UseTokensResult.Padding.Large),
			bottom = _UDim,
			left = _UDim,
			right = _UDim
		}
	}, {
		SearchNoResultsMessage = ReactModule.createElement(Text, {
			tag = "size-full-0 auto-y text-body-large text-wrap text-align-x-center content-default",
			Text = UseLocalizationResult.noChatFound
		})
	})
end