local images = require(script:FindFirstAncestor("PlayerContextualMenu").Parent.UIBlox).App.ImageSet.Images
local _ = require(script.Parent.Types)

return function(p1, p2)
	-- upvalues: images (ref)
	if p1 then
		if p1.status == "InGame" then
			return images["icons/menu/games_small"], p2.iconEmphasis
		elseif p1.status == "Online" or p1.status == "InStudio" then
			return images["component_assets/circle_16"], p2.onlinePresence
		end
	end
	return nil, nil
end