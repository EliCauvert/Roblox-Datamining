local Cryo = require(game:GetService("CorePackages").Packages.InGameMenuDependencies).Cryo
local Parent = script.Parent.Parent
local PagesModule = require(Parent.Components.Pages)
local NavigateBackModule = require(Parent.Actions.NavigateBack)
local SetCurrentPageModule = require(Parent.Actions.SetCurrentPage)

return function(p1, p2)
	-- upvalues: PagesModule (copy), NavigateBackModule (copy), Cryo (copy), SetCurrentPageModule (copy)
	local PagesByKeyEntry = PagesModule.pagesByKey[p1.menuPage]
	
	if p2.type == NavigateBackModule.name then
		if p1.respawn.dialogOpen then
			return Cryo.Dictionary.join(p1, {
				respawn = Cryo.Dictionary.join(p1.respawn, { dialogOpen = false })
			})
		end
		if p1.report.dialogOpen then
			return Cryo.Dictionary.join(p1, {
				report = Cryo.Dictionary.join(p1.report, { dialogOpen = false })
			})
		end
		if p1.menuPage then
			local ParentPage = PagesByKeyEntry.parentPage
			
			if ParentPage ~= nil then
				return Cryo.Dictionary.join(p1, { menuPage = ParentPage })
			end
		end
	elseif p2.type == SetCurrentPageModule.name then
		return Cryo.Dictionary.join(p1, { currentlyOpenBubble = Cryo.None })
	end
	return p1
end