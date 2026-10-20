local Foundation = script:FindFirstAncestor("Foundation")
local ReactIsModule = require(Foundation.Parent.ReactIs)
local _ = require(Foundation.Components.Types)

return function(Unknown)
	-- upvalues: ReactIsModule (copy)
	return if typeof(Unknown) == "table" then if ReactIsModule.isBinding(Unknown) then Unknown else Font.new(Unknown.Family, Unknown.Weight, Unknown.Style) elseif typeof(Unknown) == "EnumItem" then if Unknown == Enum.Font.Unknown then nil else Font.fromEnum(Unknown) else Unknown
end