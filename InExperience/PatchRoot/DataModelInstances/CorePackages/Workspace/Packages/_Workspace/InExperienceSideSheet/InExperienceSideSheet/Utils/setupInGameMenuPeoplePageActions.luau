local RegisterInGameMenuPeoplePageActionsModule = require(script:FindFirstAncestor("InExperienceSideSheet").Utils.registerInGameMenuPeoplePageActions)

return function(p1) --[[ Line: 23 ]]
	-- upvalues: RegisterInGameMenuPeoplePageActionsModule (copy)
	RegisterInGameMenuPeoplePageActionsModule.registerOpenPeoplePage(function() --[[ Line: 24 ]]
		-- upvalues: p1 (copy)
		local PlayersPage = p1.PlayersPage
		
		if PlayersPage == nil then return end
		if p1:GetVisibility() then
			p1:SwitchToPage(PlayersPage, true, 1)
			
			return
		else
			p1:SetVisibility(true, false, PlayersPage)
		end
	end)
	RegisterInGameMenuPeoplePageActionsModule.registerClosePeoplePage(function() --[[ Line: 37 ]]
		-- upvalues: p1 (copy)
		local PlayersPage = p1.PlayersPage
		local Pages = p1.Pages
		
		if p1:GetVisibility() and PlayersPage ~= nil and Pages ~= nil and Pages.CurrentPage == PlayersPage then
			p1:SetVisibility(false)
		end
	end)
end