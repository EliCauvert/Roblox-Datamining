local Parent = script.Parent.Parent
local UseStyleFunction = require(Parent.Parent.UIBlox).Core.Style.useStyle
local FFlagIncreaseAppNavbarWidthModule = require(Parent.Flags.FFlagIncreaseAppNavbarWidth)

return function()
	-- upvalues: UseStyleFunction (copy), FFlagIncreaseAppNavbarWidthModule (copy)
	local Tokens = UseStyleFunction().Tokens
	
	return if FFlagIncreaseAppNavbarWidthModule then Tokens.Size.Size_1800 else Tokens.Size.Size_1600
end