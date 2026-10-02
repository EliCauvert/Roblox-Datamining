local parent = script:FindFirstAncestor("AppChat").Parent
local foundationModule = require(parent.Foundation)
local reactModule = require(parent.React)
local useLocalization = require(parent.Localization).Hooks.useLocalization
local view = foundationModule.View
local text = foundationModule.Text
local useTokens = foundationModule.Hooks.useTokens

return function(p1)
	-- upvalues: useLocalization (ref), useTokens (ref), reactModule (ref), view (ref), text (ref)
	local var1 = useLocalization({ noChatFound = "Feature.Chat.Label.NoChatFound" })
	local var2 = useTokens()
	local uDim = UDim.new(0, var2.Padding.Large)
	
	return reactModule.createElement(view, {
		tag = "col align-x-center align-y-center gap-small size-full",
		padding = {
			top = UDim.new(0, (p1.topPadding or 0) + var2.Padding.Large),
			bottom = uDim,
			left = uDim,
			right = uDim
		}
	}, {
		SearchNoResultsMessage = reactModule.createElement(text, {
			tag = "size-full-0 auto-y text-body-large text-wrap text-align-x-center content-default",
			Text = var1.noChatFound
		})
	})
end