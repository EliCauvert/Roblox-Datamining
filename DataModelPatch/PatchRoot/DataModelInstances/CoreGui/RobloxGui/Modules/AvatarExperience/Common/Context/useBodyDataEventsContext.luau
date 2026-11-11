local ReactModule = require(game:GetService("CorePackages").Packages.React)
local BodyDataEventsContextModule = require(script.Parent.BodyDataEventsContext)

return function()
	-- upvalues: ReactModule (copy), BodyDataEventsContextModule (copy)
	return ReactModule.useContext(BodyDataEventsContextModule)
end