local cryo = require(game:GetService("CorePackages").Packages.InGameMenuDependencies).Cryo
local parent = script.Parent.Parent
local pagesModule = require(parent.Components.Pages)
local navigateBackModule = require(parent.Actions.NavigateBack)
local setCurrentPageModule = require(parent.Actions.SetCurrentPage)

return function(p0, p1)
	-- upvalues: pagesModule (ref), navigateBackModule (ref), cryo (ref), setCurrentPageModule (ref)
	local menuPage = pagesModule.pagesByKey[p0.menuPage]
	
	if p1.type == navigateBackModule.name then
		if p0.respawn.dialogOpen then
			return cryo.Dictionary.join(p0, {
				respawn = cryo.Dictionary.join(p0.respawn, { dialogOpen = false })
			})
		elseif p0.report.dialogOpen then
			return cryo.Dictionary.join(p0, {
				report = cryo.Dictionary.join(p0.report, { dialogOpen = false })
			})
		elseif p0.menuPage then
			local parentPage = menuPage.parentPage
			
			if parentPage == nil then
			else
				return cryo.Dictionary.join(p0, { menuPage = parentPage })
			end
		end
	else
		return if p1.type == setCurrentPageModule.name then cryo.Dictionary.join(p0, { currentlyOpenBubble = cryo.None }) else p0
	end
end