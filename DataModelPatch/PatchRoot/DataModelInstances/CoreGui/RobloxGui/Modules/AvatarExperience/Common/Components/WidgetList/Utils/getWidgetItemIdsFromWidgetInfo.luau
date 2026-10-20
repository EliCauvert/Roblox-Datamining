local _ = require(game:GetService("CorePackages").Workspace.Packages.AvatarExperienceCatalog)

return function(p1, p2)
	local MoveResult = {}
	
	if p1 and p1.content then
		for _, value in p1.content do
			if value.id then
				table.insert(MoveResult, value.id)
			end
		end
	end
	if p2 < #MoveResult then
		MoveResult = table.move(MoveResult, 1, p2, 1, {})
	end
	return MoveResult
end