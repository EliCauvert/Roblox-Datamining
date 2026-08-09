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

local function _(p0, p1) --[[ line: 15 | named "isSponsoredSort" ]]
	-- upvalues: gameTopicIds (ref)
	if p1 then
		if p0 and p0.topicId == gameTopicIds.Sponsored then
			return true
		end
	else
		return p0 and p0.gameSetTypeId == "27"
	end
end

return function(p2, p3, p4) --[[ line: 31 | named "useGameSortTooltipParams" ]]
	-- upvalues: useDispatch (ref), useLocalization (ref), usePreferredInput (ref), gameTopicIds (ref), reactModule (ref), responsiveModule (ref), openInfoPeekView (ref), openCloseOnlyInteractiveAlert (ref), closeCentralOverlay (ref)
	local isNot27
	local var2 = useDispatch()
	local var3 = useLocalization({
		SponsoredDisclosure = "CoreScripts.Ads.Label.SponsoredAdsDisclosureStatic",
		SponsoredTitle = "CoreScripts.Ads.Label.SponsoredAds"
	})
	local var4 = usePreferredInput()
	local sponsoredDisclosure = var3.SponsoredDisclosure
	local sponsoredTitle = var3.SponsoredTitle
	
	if p3 then
		if p2 and p2.topicId == gameTopicIds.Sponsored then
			isNot27 = true
		end
	elseif p2 then
		isNot27 = p2.gameSetTypeId ~= "27"
	end
	local var6 = if isNot27 and p4 == nil then sponsoredDisclosure else p4
	local var7 = if isNot27 then sponsoredTitle elseif p2 then p2.displayName else ""
	
	return reactModule.useCallback(function() --[[ line: 44 ]]
		-- upvalues: var4 (ref), responsiveModule (copy), var2 (ref), openInfoPeekView (copy), var7 (ref), var6 (ref), openCloseOnlyInteractiveAlert (copy), closeCentralOverlay (copy)
		if var4 == responsiveModule.Input.Touch then
			var2(openInfoPeekView(var7, var6))
			
			return
		end
		var2(openCloseOnlyInteractiveAlert(var7, var6, function() --[[ line: 48 ]]
			-- upvalues: var2 (copy), closeCentralOverlay (copy)
			return var2(closeCentralOverlay())
		end))
	end, { var7, var6, var4 }), var6
end