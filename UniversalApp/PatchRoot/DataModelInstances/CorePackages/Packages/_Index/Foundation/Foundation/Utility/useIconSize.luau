local foundation = script:FindFirstAncestor("Foundation")
local _ = require(foundation.Components.Types)
local iconSizeModule = require(foundation.Enums.IconSize)
local useTokensModule = require(foundation.Providers.Style.useTokens)

local function _(p0) --[[ line: 11 | named "isNumber" ]]
	return if typeof(p0) ~= "number" then typeof(p0) == "table" and typeof(p0:getValue()) == "number" else true
end

return function(p1, p2, p3) --[[ line: 15 | named "useIconSize" ]]
	-- upvalues: useTokensModule (ref), iconSizeModule (ref)
	local var6
	local var3 = useTokensModule()
	local var4 = if p2 then {
		[iconSizeModule.XSmall] = if p3 then var3.Size.Size_400 else var3.Size.Size_300,
		[iconSizeModule.Small] = if p3 then var3.Size.Size_500 else var3.Size.Size_400,
		[iconSizeModule.Medium] = if p3 then var3.Size.Size_600 else var3.Size.Size_500,
		[iconSizeModule.Large] = if p3 then var3.Size.Size_700 else var3.Size.Size_600,
		[iconSizeModule.XLarge] = if p3 then var3.Size.Size_800 else var3.Size.Size_700,
		[iconSizeModule.XXLarge] = if p3 then var3.Size.Size_900 else var3.Size.Size_800
	} else {
		[iconSizeModule.XSmall] = var3.Size.Size_200,
		[iconSizeModule.Small] = var3.Size.Size_400,
		[iconSizeModule.Medium] = var3.Size.Size_900,
		[iconSizeModule.Large] = var3.Size.Size_1200,
		[iconSizeModule.XLarge] = var3.Size.Size_2400,
		[iconSizeModule.XXLarge] = 24 * var3.Size.Size_200
	}
	local var5 = nil
	
	if p2 then
		var6 = if typeof(p1) ~= "number" then typeof(p1) == "table" and typeof(p1:getValue()) == "number" else true
		
		if var6 then
			var5 = p1
		else
			var6 = if typeof(p1) ~= "number" then typeof(p1) == "table" and typeof(p1:getValue()) == "number" else true
			
			if not var6 then
				var5 = var4[p1]
			end
		end
		if var5 == nil then
			error("Invalid icon size: " .. tostring(p1))
		end
		return if typeof(var5) == "table" then var5:map(function(p4) --[[ line: 52 ]]
			return UDim2.fromOffset(p4, p4)
		end) else UDim2.fromOffset(var5, var5)
	end
end