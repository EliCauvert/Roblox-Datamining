local parent = script:FindFirstAncestor("ProfileQRCode").Parent
local reactModule = require(parent.React)
local foundationModule = require(parent.Foundation)
local radius = foundationModule.Enums.Radius
local skeleton = foundationModule.Skeleton

return function() --[[ line: 10 ]]
	-- upvalues: reactModule (ref), skeleton (ref), radius (ref)
	return reactModule.createElement(skeleton, { Size = UDim2.new(1, 0, 1, 0), radius = radius.None })
end