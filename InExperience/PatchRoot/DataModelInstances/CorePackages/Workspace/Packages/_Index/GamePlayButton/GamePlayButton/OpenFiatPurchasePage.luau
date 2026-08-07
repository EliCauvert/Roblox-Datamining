local parent = script:FindFirstAncestor("GamePlayButton").Parent
local appPage = require(parent.RobloxAppEnums).AppPage
local navigateDown = require(parent.NavigationRodux).Thunks.NavigateDown
local fFlagSignalsNavP3Dispatch = require(parent.SharedFlags).FFlagSignalsNavP3Dispatch
local var0 = if fFlagSignalsNavP3Dispatch then require(parent.RobloxAppNavigation).NavigationCommands else nil

return function(p0, p1) --[[ line: 12 | named "openFiatPurchasePage" ]]
	-- upvalues: appPage (ref), fFlagSignalsNavP3Dispatch (ref), var0 (ref), navigateDown (ref)
	return function(p2) --[[ line: 13 ]]
		-- upvalues: appPage (copy), p0 (ref), p1 (ref), fFlagSignalsNavP3Dispatch (copy), var0 (copy), navigateDown (copy)
		local t = {
			name = appPage.GenericWebPage,
			detail = p0,
			extraProps = {
				titleKey = "Feature.PaidAccessPurchases.Webview.Title.Checkout",
				onClose = p1
			}
		}
		
		if fFlagSignalsNavP3Dispatch then
			var0.down(var0.fromLegacyPage(t))
			
			return
		end
		p2:dispatch(navigateDown(t))
	end
end