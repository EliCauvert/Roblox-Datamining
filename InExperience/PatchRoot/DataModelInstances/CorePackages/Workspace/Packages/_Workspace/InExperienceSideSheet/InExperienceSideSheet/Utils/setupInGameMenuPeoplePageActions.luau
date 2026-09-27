local registerInGameMenuPeoplePageActionsModule = require(script:FindFirstAncestor("InExperienceSideSheet").Utils.registerInGameMenuPeoplePageActions)

return function(p1)
	-- upvalues: registerInGameMenuPeoplePageActionsModule (ref)
	registerInGameMenuPeoplePageActionsModule.registerOpenPeoplePage(function()
		-- upvalues: p1 (ref)
		local playersPage = p1.PlayersPage
		
		if playersPage == nil then return end
		if p1:GetVisibility() then
			p1:SwitchToPage(playersPage, true, 1)
			
			return
		end
		p1:SetVisibility(true, false, playersPage)
	end)
	registerInGameMenuPeoplePageActionsModule.registerClosePeoplePage(function()
		-- upvalues: p1 (ref)
		local playersPage = p1.PlayersPage
		local pages = p1.Pages
		
		if p1:GetVisibility() and playersPage ~= nil and (pages ~= nil and pages.CurrentPage == playersPage) then
			p1:SetVisibility(false)
		end
	end)
end