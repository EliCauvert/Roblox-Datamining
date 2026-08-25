local _ = require(script.Parent.Types)

return function(p0)
	return if p0 then if p0.status == "InGame" or p0.status == "InStudio" then p0.locationString elseif p0.status == "Online" then "Online" else "Offline" else ""
end