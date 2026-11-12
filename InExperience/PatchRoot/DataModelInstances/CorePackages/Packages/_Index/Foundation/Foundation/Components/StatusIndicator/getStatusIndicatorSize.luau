local Foundation = script:FindFirstAncestor("Foundation")
local StatusIndicatorSizeModule = require(Foundation.Enums.StatusIndicatorSize)
local _ = require(Foundation.Providers.Style.Tokens)

return function(p1, Large, p2)
	-- upvalues: StatusIndicatorSizeModule (copy)
	return if Large == StatusIndicatorSizeModule.Large or Large == StatusIndicatorSizeModule.Pictogram then p1.Size.Size_500 elseif p2 then p1.Size.Size_400 elseif Large == StatusIndicatorSizeModule.Medium then p1.Size.Size_250 elseif Large == StatusIndicatorSizeModule.Small then p1.Size.Size_200 else p1.Size.Size_150
end