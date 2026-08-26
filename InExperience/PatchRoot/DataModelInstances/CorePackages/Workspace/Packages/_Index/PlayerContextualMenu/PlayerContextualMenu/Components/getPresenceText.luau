local _ = require(script.Parent.Types)

return function(p1)
	return if p1 then if p1.status == "InGame" or p1.status == "InStudio" then p1.locationString elseif p1.status == "Online" then "Online" else "Offline" else ""
end