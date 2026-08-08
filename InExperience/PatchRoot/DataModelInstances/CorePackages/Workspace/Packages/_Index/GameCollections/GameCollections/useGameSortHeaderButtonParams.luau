local gameCollections = script:FindFirstAncestor("GameCollections")
local useNavigateToSeeAllModule = require(gameCollections.useNavigateToSeeAll)
local useNavigateToSortLinkWebViewModule = require(gameCollections.useNavigateToSortLinkWebView)
local parent = gameCollections.Parent
local reactModule = require(parent.React)
local useLocalization = require(parent.Localization).Hooks.useLocalization
local _ = require(parent.DiscoveryTypes)
local fFlagLuaAppHeaderButtonText = require(parent.SharedFlags).FFlagLuaAppHeaderButtonText

return function(p0, p1, p2, p3, p4, p5, p6, p7, p8, p9, p10) --[[ line: 15 | named "useGameSortHeaderButtonParams" ]]
	-- upvalues: useNavigateToSeeAllModule (ref), reactModule (ref), useNavigateToSortLinkWebViewModule (ref), useLocalization (ref), fFlagLuaAppHeaderButtonText (ref)
	local var4 = useNavigateToSeeAllModule(p1, p2, p3, p4, p5, p6)
	local var5 = useNavigateToSortLinkWebViewModule()
	local var6 = if p7 then reactModule.useCallback(function() --[[ line: 35 ]]
		-- upvalues: p1 (ref), p2 (ref), p7 (ref), var5 (ref), p6 (ref)
		local var7 = if p1 then if p2 then p1.topicId else p1.gameSetTypeId else nil
		
		if p7 then
			var5(p7, p6, if p1 then p1.displayName else "", var7)
		end
	end, {
		var5,
		p7,
		p6,
		p1,
		p2
	}) else reactModule.useCallback(function() --[[ line: 29 ]]
		-- upvalues: var4 (ref), p0 (ref)
		var4()
		p0()
	end, { var4, p0 })
	
	return var6, if fFlagLuaAppHeaderButtonText and p9 then p9 elseif p7 then useLocalization({ learnMore = "Feature.GameDetails.Label.LearnMore" }).learnMore else nil, reactModule.useCallback(function() --[[ line: 57 ]]
		-- upvalues: p10 (ref), p1 (ref), p8 (ref), p2 (ref), var5 (ref), p6 (ref), var6 (ref)
		if p10 then
			p10()
			
			return
		elseif p1 and p8 then
			var5(p8, p6, if p1 then p1.displayName else "", if p2 then p1.topicId else p1.gameSetTypeId)
			
			return
		end
		var6()
	end, {
		var5, p8, p6, p1, p2, var6, p10
	})
end