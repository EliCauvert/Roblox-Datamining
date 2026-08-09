local foundation = script:FindFirstAncestor("Foundation")
local inputSizeModule = require(foundation.Enums.InputSize)
local _ = require(foundation.Providers.Style.Tokens)

return function(p0, p1, p2) --[[ line: 9 | named "getAvatarSize" ]]
	-- upvalues: inputSizeModule (ref)
	return if p2 then ({
		[inputSizeModule.XSmall] = p0.Size.Size_300,
		[inputSizeModule.Small] = p0.Size.Size_400,
		[inputSizeModule.Medium] = p0.Size.Size_500,
		[inputSizeModule.Large] = p0.Size.Size_600
	})[p1] else ({
		[inputSizeModule.XSmall] = p0.Size.Size_600,
		[inputSizeModule.Small] = p0.Size.Size_800,
		[inputSizeModule.Medium] = p0.Size.Size_1000,
		[inputSizeModule.Large] = p0.Size.Size_1200
	})[p1]
end