local Images = require(script:FindFirstAncestor("PlayerContextualMenu").Parent.UIBlox).App.ImageSet.Images
local _ = require(script.Parent.Types)

return function(p1, p2) --[[ Line: 9 | Named "getPresenceIcon" ]]
	-- upvalues: Images (copy)
	if p1 then
		if p1.status == "InGame" then
			return Images["icons/menu/games_small"], p2.iconEmphasis
		elseif p1.status == "Online" or p1.status == "InStudio" then
			return Images["component_assets/circle_16"], p2.onlinePresence
		end
	end
	return nil, nil
end