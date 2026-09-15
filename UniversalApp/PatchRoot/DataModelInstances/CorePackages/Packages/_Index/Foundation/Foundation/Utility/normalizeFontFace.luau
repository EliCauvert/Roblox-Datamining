local foundation = script:FindFirstAncestor("Foundation")
local reactIsModule = require(foundation.Parent.ReactIs)
local _ = require(foundation.Components.Types)

return function(p1)
	-- upvalues: reactIsModule (ref)
	return if typeof(p1) == "table" then if reactIsModule.isBinding(p1) then p1 else Font.new(p1.Family, p1.Weight, p1.Style) elseif typeof(p1) == "EnumItem" then if p1 == Enum.Font.Unknown then nil else Font.fromEnum(p1) else p1
end