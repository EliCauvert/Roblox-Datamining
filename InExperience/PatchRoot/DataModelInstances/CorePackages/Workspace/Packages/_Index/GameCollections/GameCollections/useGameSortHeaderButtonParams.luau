local gameCollections = script:FindFirstAncestor("GameCollections")
local useNavigateToSeeAllModule = require(gameCollections.useNavigateToSeeAll)
local useNavigateToSortLinkWebViewModule = require(gameCollections.useNavigateToSortLinkWebView)
local parent = gameCollections.Parent
local reactModule = require(parent.React)
local useLocalization = require(parent.Localization).Hooks.useLocalization
local _ = require(parent.DiscoveryTypes)
local fFlagLuaAppHeaderButtonText = require(parent.SharedFlags).FFlagLuaAppHeaderButtonText

return function(p1, p2, p3, p4, p5, p6, p7, p8, p9, p10, p11)
	-- upvalues: useNavigateToSeeAllModule (ref), reactModule (ref), useNavigateToSortLinkWebViewModule (ref), useLocalization (ref), fFlagLuaAppHeaderButtonText (ref)
	local var1 = useNavigateToSeeAllModule(p2, p3, p4, p5, p6, p7)
	local var2 = useNavigateToSortLinkWebViewModule()
	local var3 = if p8 then reactModule.useCallback(function()
		-- upvalues: p2 (ref), p3 (ref), p8 (ref), var2 (ref), p7 (ref)
		local var4 = if p2 then if p3 then p2.topicId else p2.gameSetTypeId else nil
		
		if p8 then
			var2(p8, p7, if p2 then p2.displayName else "", var4)
		end
	end, {
		var2,
		p8,
		p7,
		p2,
		p3
	}) else reactModule.useCallback(function()
		-- upvalues: var1 (ref), p1 (ref)
		var1()
		p1()
	end, { var1, p1 })
	
	return var3, if fFlagLuaAppHeaderButtonText and p10 then p10 elseif p8 then useLocalization({ learnMore = "Feature.GameDetails.Label.LearnMore" }).learnMore else nil, reactModule.useCallback(function()
		-- upvalues: p11 (ref), p2 (ref), p9 (ref), p3 (ref), var2 (ref), p7 (ref), var3 (ref)
		if p11 then
			p11()
			
			return
		elseif p2 and p9 then
			var2(p9, p7, if p2 then p2.displayName else "", if p3 then p2.topicId else p2.gameSetTypeId)
			
			return
		end
		var3()
	end, {
		var2, p9, p7, p2, p3, var3, p11
	})
end