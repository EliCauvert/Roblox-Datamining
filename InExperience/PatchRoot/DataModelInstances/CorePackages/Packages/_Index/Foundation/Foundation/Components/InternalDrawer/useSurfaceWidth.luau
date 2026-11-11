local Foundation = script:FindFirstAncestor("Foundation")
local UseScreenSizeModule = require(Foundation.Components.Sheet.useScreenSize)
local UseTokensModule = require(Foundation.Providers.Style.useTokens)

return function(p1: number, p2: number, p3)
	-- upvalues: UseTokensModule (copy), UseScreenSizeModule (copy)
	local Smallest = math.min(p1, (math.max(UseScreenSizeModule().X - UseTokensModule().Size.Size_1200 - p2, 0)))
	
	return Smallest, Smallest + p2 + (p3 or 0)
end