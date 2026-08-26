local foundation = script:FindFirstAncestor("Foundation")
local _ = require(foundation.Components.Types)
local iconSizeModule = require(foundation.Enums.IconSize)
local useTokensModule = require(foundation.Providers.Style.useTokens)

local function _(p1)
	return if typeof(p1) ~= "number" then typeof(p1) == "table" and typeof(p1:getValue()) == "number" else true
end

return function(p1, p2, p3)
	-- upvalues: useTokensModule (ref), iconSizeModule (ref)
	local var1
	local var2 = useTokensModule()
	local var3 = if p2 then {
		[iconSizeModule.XSmall] = if p3 then var2.Size.Size_400 else var2.Size.Size_300,
		[iconSizeModule.Small] = if p3 then var2.Size.Size_500 else var2.Size.Size_400,
		[iconSizeModule.Medium] = if p3 then var2.Size.Size_600 else var2.Size.Size_500,
		[iconSizeModule.Large] = if p3 then var2.Size.Size_700 else var2.Size.Size_600,
		[iconSizeModule.XLarge] = if p3 then var2.Size.Size_800 else var2.Size.Size_700,
		[iconSizeModule.XXLarge] = if p3 then var2.Size.Size_900 else var2.Size.Size_800
	} else {
		[iconSizeModule.XSmall] = var2.Size.Size_200,
		[iconSizeModule.Small] = var2.Size.Size_400,
		[iconSizeModule.Medium] = var2.Size.Size_900,
		[iconSizeModule.Large] = var2.Size.Size_1200,
		[iconSizeModule.XLarge] = var2.Size.Size_2400,
		[iconSizeModule.XXLarge] = 24 * var2.Size.Size_200
	}
	local var4 = nil
	
	if p2 then
		var1 = if typeof(p1) ~= "number" then typeof(p1) == "table" and typeof(p1:getValue()) == "number" else true
		
		if var1 then
			var4 = p1
		else
			var1 = if typeof(p1) ~= "number" then typeof(p1) == "table" and typeof(p1:getValue()) == "number" else true
			
			if not var1 then
				var4 = var3[p1]
			end
		end
		if var4 == nil then
			error("Invalid icon size: " .. tostring(p1))
		end
		return if typeof(var4) == "table" then var4:map(function(p4)
			return UDim2.fromOffset(p4, p4)
		end) else UDim2.fromOffset(var4, var4)
	end
end