local DependenciesModule = require(script:FindFirstAncestor("SocialTab").dependencies)
local UIBlox = DependenciesModule.UIBlox
local BuilderIcons = DependenciesModule.BuilderIcons
local Migration = BuilderIcons.Migration

return function(p1)
	-- upvalues: UIBlox (copy), Migration (copy), BuilderIcons (copy)
	local Image = UIBlox.App.ImageSet.Images[p1]
	
	if Migration.uiblox[p1] or Migration.luaApps[p1] then
		local UibloxEntry = Migration.uiblox[p1] or Migration.luaApps[p1]
		
		return {
			Image = nil,
			ImageRectSize = nil,
			ImageRectOffset = nil,
			Text = UibloxEntry.name,
			FontFace = BuilderIcons.Font[UibloxEntry.variant]
		}
	else
		return {
			Text = nil,
			FontFace = nil,
			Image = Image.Image,
			ImageRectSize = Image.ImageRectSize,
			ImageRectOffset = Image.ImageRectOffset
		}
	end
end