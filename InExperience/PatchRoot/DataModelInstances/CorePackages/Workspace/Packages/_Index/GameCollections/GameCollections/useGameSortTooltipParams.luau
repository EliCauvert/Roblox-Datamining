local parent = script:FindFirstAncestor("GameCollections").Parent
local reactModule = require(parent.React)
local useDispatch = require(parent.RoactUtils).Hooks.RoactRodux.useDispatch
local useLocalization = require(parent.Localization).Hooks.useLocalization
local closeCentralOverlay = require(parent.CentralOverlay).Thunks.CloseCentralOverlay
local responsiveModule = require(parent.Responsive)
local usePreferredInput = responsiveModule.usePreferredInput
local gameTopicIds = require(parent.DiscoveryTypes).GameTopicIds
local openInfoPeekView = require(parent.DiscoveryRouting).OpenInfoPeekView
local openCloseOnlyInteractiveAlert = require(parent.DiscoveryRouting).OpenCloseOnlyInteractiveAlert

local function _(p1, p2)
	-- upvalues: gameTopicIds (ref)
	if p2 then
		if p1 and p1.topicId == gameTopicIds.Sponsored then
			return true
		end
	else
		return p1 and p1.gameSetTypeId == "27"
	end
end

return function(p1, p2, p3)
	-- upvalues: useDispatch (ref), useLocalization (ref), usePreferredInput (ref), gameTopicIds (ref), reactModule (ref), responsiveModule (ref), openInfoPeekView (ref), openCloseOnlyInteractiveAlert (ref), closeCentralOverlay (ref)
	local isNot27
	local var1 = useDispatch()
	local var2 = useLocalization({
		SponsoredDisclosure = "CoreScripts.Ads.Label.SponsoredAdsDisclosureStatic",
		SponsoredTitle = "CoreScripts.Ads.Label.SponsoredAds"
	})
	local var3 = usePreferredInput()
	local sponsoredDisclosure = var2.SponsoredDisclosure
	local sponsoredTitle = var2.SponsoredTitle
	
	if p2 then
		if p1 and p1.topicId == gameTopicIds.Sponsored then
			isNot27 = true
		end
	elseif p1 then
		isNot27 = p1.gameSetTypeId ~= "27"
	end
	local var4 = if isNot27 and p3 == nil then sponsoredDisclosure else p3
	local var5 = if isNot27 then sponsoredTitle elseif p1 then p1.displayName else ""
	
	return reactModule.useCallback(function()
		-- upvalues: var3 (ref), responsiveModule (copy), var1 (ref), openInfoPeekView (copy), var5 (ref), var4 (ref), openCloseOnlyInteractiveAlert (copy), closeCentralOverlay (copy)
		if var3 == responsiveModule.Input.Touch then
			var1(openInfoPeekView(var5, var4))
			
			return
		end
		var1(openCloseOnlyInteractiveAlert(var5, var4, function()
			-- upvalues: var1 (copy), closeCentralOverlay (copy)
			return var1(closeCentralOverlay())
		end))
	end, { var5, var4, var3 }), var4
end