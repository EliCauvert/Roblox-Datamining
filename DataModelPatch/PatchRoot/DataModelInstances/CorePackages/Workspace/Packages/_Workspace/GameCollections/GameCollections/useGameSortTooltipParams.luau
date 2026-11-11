local Parent = script:FindFirstAncestor("GameCollections").Parent
local ReactModule = require(Parent.React)
local UseDispatchFunction = require(Parent.RoactUtils).Hooks.RoactRodux.useDispatch
local UseLocalizationFunction = require(Parent.Localization).Hooks.useLocalization
local CloseCentralOverlayFunction = require(Parent.CentralOverlay).Thunks.CloseCentralOverlay
local ResponsiveModule = require(Parent.Responsive)
local UsePreferredInputFunction = ResponsiveModule.usePreferredInput
local GameTopicIds = require(Parent.DiscoveryTypes).GameTopicIds
local OpenInfoPeekViewFunction = require(Parent.DiscoveryRouting).OpenInfoPeekView
local OpenCloseOnlyInteractiveAlertFunction = require(Parent.DiscoveryRouting).OpenCloseOnlyInteractiveAlert

local function _(p1, p2): boolean
	-- upvalues: GameTopicIds (copy)
	if p2 then
		if p1 and p1.topicId == GameTopicIds.Sponsored then
			return true
		end
	elseif p1 and p1.gameSetTypeId == "27" then
		return true
	end
	return false
end

return function(p1, p2, p3)
	-- upvalues: UseDispatchFunction (copy), UseLocalizationFunction (copy), UsePreferredInputFunction (copy), GameTopicIds (copy), ReactModule (copy), ResponsiveModule (copy), OpenInfoPeekViewFunction (copy), OpenCloseOnlyInteractiveAlertFunction (copy), CloseCentralOverlayFunction (copy)
	local UseDispatchResult = UseDispatchFunction()
	local UseLocalizationResult = UseLocalizationFunction({
		SponsoredDisclosure = "CoreScripts.Ads.Label.SponsoredAdsDisclosureStatic",
		SponsoredTitle = "CoreScripts.Ads.Label.SponsoredAds"
	})
	local UsePreferredInputResult = UsePreferredInputFunction()
	local SponsoredDisclosure = UseLocalizationResult.SponsoredDisclosure
	local SponsoredTitle = UseLocalizationResult.SponsoredTitle
	local Flag = nil
	repeat
		if p2 then
			if p1 and p1.topicId == GameTopicIds.Sponsored then
				Flag = true
				break
			end
		elseif p1 and p1.gameSetTypeId == "27" then
			Flag = true
			break
		end
		Flag = false
	until true
	local SponsoredDisclosure1 = if Flag and p3 == nil then SponsoredDisclosure else p3
	local SponsoredTitle1 = if Flag then SponsoredTitle else p1 and p1.displayName or ""
	
	return ReactModule.useCallback(function()
		-- upvalues: UsePreferredInputResult (copy), ResponsiveModule (upval), UseDispatchResult (copy), OpenInfoPeekViewFunction (upval), SponsoredTitle1 (copy), SponsoredDisclosure1 (copy), OpenCloseOnlyInteractiveAlertFunction (upval), CloseCentralOverlayFunction (upval)
		if UsePreferredInputResult == ResponsiveModule.Input.Touch then
			UseDispatchResult(OpenInfoPeekViewFunction(SponsoredTitle1, SponsoredDisclosure1))
			
			return
		else
			UseDispatchResult(OpenCloseOnlyInteractiveAlertFunction(SponsoredTitle1, SponsoredDisclosure1, function()
				-- upvalues: UseDispatchResult (upval), CloseCentralOverlayFunction (upval)
				return UseDispatchResult(CloseCentralOverlayFunction())
			end))
		end
	end, {
		SponsoredTitle1,
		SponsoredDisclosure1,
		UsePreferredInputResult
	}), SponsoredDisclosure1
end