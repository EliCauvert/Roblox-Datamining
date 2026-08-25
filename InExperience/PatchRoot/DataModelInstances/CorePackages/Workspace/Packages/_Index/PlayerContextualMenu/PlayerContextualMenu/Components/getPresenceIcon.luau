local images = require(script:FindFirstAncestor("PlayerContextualMenu").Parent.UIBlox).App.ImageSet.Images
local _ = require(script.Parent.Types)

return function(p0, p1)
	-- upvalues: images (ref)
	if p0 then
		if p0.status == "InGame" then
			return images["icons/menu/games_small"], p1.iconEmphasis
		elseif p0.status == "Online" or p0.status == "InStudio" then
			return images["component_assets/circle_16"], p1.onlinePresence
		end
	end
	return nil, nil
end