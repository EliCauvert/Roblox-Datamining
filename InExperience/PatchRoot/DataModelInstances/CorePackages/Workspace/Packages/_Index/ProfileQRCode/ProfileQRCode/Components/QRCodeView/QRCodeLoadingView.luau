local Parent = script:FindFirstAncestor("ProfileQRCode").Parent
local ReactModule = require(Parent.React)
local FoundationModule = require(Parent.Foundation)
local Radius = FoundationModule.Enums.Radius
local Skeleton = FoundationModule.Skeleton

return function() --[[ Line: 10 ]]
	-- upvalues: ReactModule (copy), Skeleton (copy), Radius (copy)
	return ReactModule.createElement(Skeleton, { Size = UDim2.new(1, 0, 1, 0), radius = Radius.None })
end