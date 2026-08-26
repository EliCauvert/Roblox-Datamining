local cryo = require(game:GetService("CorePackages").Packages.InGameMenuDependencies).Cryo
local parent = script.Parent.Parent
local pagesModule = require(parent.Components.Pages)
local navigateBackModule = require(parent.Actions.NavigateBack)
local setCurrentPageModule = require(parent.Actions.SetCurrentPage)

return function(p1, p2)
	-- upvalues: pagesModule (ref), navigateBackModule (ref), cryo (ref), setCurrentPageModule (ref)
	local menuPage = pagesModule.pagesByKey[p1.menuPage]
	
	if p2.type == navigateBackModule.name then
		if p1.respawn.dialogOpen then
			return cryo.Dictionary.join(p1, {
				respawn = cryo.Dictionary.join(p1.respawn, { dialogOpen = false })
			})
		elseif p1.report.dialogOpen then
			return cryo.Dictionary.join(p1, {
				report = cryo.Dictionary.join(p1.report, { dialogOpen = false })
			})
		elseif p1.menuPage then
			local parentPage = menuPage.parentPage
			
			if parentPage == nil then
			else
				return cryo.Dictionary.join(p1, { menuPage = parentPage })
			end
		end
	else
		return if p2.type == setCurrentPageModule.name then cryo.Dictionary.join(p1, { currentlyOpenBubble = cryo.None }) else p1
	end
end