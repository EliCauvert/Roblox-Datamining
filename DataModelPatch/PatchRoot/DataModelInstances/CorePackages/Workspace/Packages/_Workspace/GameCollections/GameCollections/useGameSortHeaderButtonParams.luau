local GameCollections = script:FindFirstAncestor("GameCollections")
local UseNavigateToSeeAllModule = require(GameCollections.useNavigateToSeeAll)
local UseNavigateToSortLinkWebViewModule = require(GameCollections.useNavigateToSortLinkWebView)
local Parent = GameCollections.Parent
local ReactModule = require(Parent.React)
local UseLocalizationFunction = require(Parent.Localization).Hooks.useLocalization
local _ = require(Parent.DiscoveryTypes)
local FFlagLuaAppHeaderButtonText = require(Parent.SharedFlags).FFlagLuaAppHeaderButtonText
local FFlagLuaAppGameCarouselAmpUpsellAction = require(Parent.SharedFlags).FFlagLuaAppGameCarouselAmpUpsellAction

return function(Callback1, p1, p2, p3, p4, p5, p6, p7, p8, p9, Callback2)
	-- upvalues: UseNavigateToSeeAllModule (copy), ReactModule (copy), UseNavigateToSortLinkWebViewModule (copy), UseLocalizationFunction (copy), FFlagLuaAppHeaderButtonText (copy), FFlagLuaAppGameCarouselAmpUpsellAction (copy)
	local UseNavigateToSeeAllModuleResult = UseNavigateToSeeAllModule(p1, p2, p3, p4, p5, p6)
	local UseResult = ReactModule.useCallback(function()
		-- upvalues: UseNavigateToSeeAllModuleResult (copy), Callback1 (copy)
		UseNavigateToSeeAllModuleResult()
		Callback1()
	end, { UseNavigateToSeeAllModuleResult, Callback1 })
	local UseNavigateToSortLinkWebViewModuleResult = UseNavigateToSortLinkWebViewModule()
	local UseResult1 = ReactModule.useCallback(function()
		-- upvalues: p1 (copy), p2 (copy), p7 (copy), UseNavigateToSortLinkWebViewModuleResult (copy), p6 (copy)
		local TopicId = if p1 then if p2 then p1.topicId else p1.gameSetTypeId else nil
		
		if p7 then
			UseNavigateToSortLinkWebViewModuleResult(p7, p6, p1 and p1.displayName or "", TopicId)
		end
	end, {
		UseNavigateToSortLinkWebViewModuleResult,
		p7,
		p6,
		p1,
		p2
	})
	local Callback = if p7 then UseResult1 else UseResult
	local UseLocalizationResult = UseLocalizationFunction({ learnMore = "Feature.GameDetails.Label.LearnMore" })
	
	return Callback, if FFlagLuaAppHeaderButtonText and p9 then p9 elseif p7 then UseLocalizationResult.learnMore else nil, (ReactModule.useCallback(function()
		-- upvalues: FFlagLuaAppGameCarouselAmpUpsellAction (upval), Callback2 (copy), p1 (copy), p8 (copy), p2 (copy), UseNavigateToSortLinkWebViewModuleResult (copy), p6 (copy), Callback (copy)
		if FFlagLuaAppGameCarouselAmpUpsellAction and Callback2 then
			Callback2()
			
			return
		end
		if p1 and p8 then
			UseNavigateToSortLinkWebViewModuleResult(p8, p6, p1 and p1.displayName or "", if p2 then p1.topicId else p1.gameSetTypeId)
			
			return
		else
			Callback()
		end
	end, {
		UseNavigateToSortLinkWebViewModuleResult, p8, p6, p1, p2, Callback,
		if FFlagLuaAppGameCarouselAmpUpsellAction then Callback2 else nil
	}))
end