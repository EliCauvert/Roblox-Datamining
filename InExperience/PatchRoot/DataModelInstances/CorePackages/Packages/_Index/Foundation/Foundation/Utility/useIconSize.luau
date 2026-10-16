local Foundation = script:FindFirstAncestor("Foundation")
local _ = require(Foundation.Components.Types)
local IconSizeModule = require(Foundation.Enums.IconSize)
local UseTokensModule = require(Foundation.Providers.Style.useTokens)

local function _(p1): boolean --[[ Line: 11 | Named "isNumber" ]]
	return typeof(p1) == "number" or typeof(p1) == "table" and typeof(p1:getValue()) == "number"
end

return function(p1, p2, p3) --[[ Line: 15 | Named "useIconSize" ]]
	-- upvalues: UseTokensModule (copy), IconSizeModule (copy)
	local UseTokensModuleResult = UseTokensModule()
	local Config = if p2 then {
		[IconSizeModule.XSmall] = if p3 then UseTokensModuleResult.Size.Size_400 else UseTokensModuleResult.Size.Size_300,
		[IconSizeModule.Small] = if p3 then UseTokensModuleResult.Size.Size_500 else UseTokensModuleResult.Size.Size_400,
		[IconSizeModule.Medium] = if p3 then UseTokensModuleResult.Size.Size_600 else UseTokensModuleResult.Size.Size_500,
		[IconSizeModule.Large] = if p3 then UseTokensModuleResult.Size.Size_700 else UseTokensModuleResult.Size.Size_600,
		[IconSizeModule.XLarge] = if p3 then UseTokensModuleResult.Size.Size_800 else UseTokensModuleResult.Size.Size_700,
		[IconSizeModule.XXLarge] = if p3 then UseTokensModuleResult.Size.Size_900 else UseTokensModuleResult.Size.Size_800
	} else {
		[IconSizeModule.XSmall] = UseTokensModuleResult.Size.Size_200,
		[IconSizeModule.Small] = UseTokensModuleResult.Size.Size_400,
		[IconSizeModule.Medium] = UseTokensModuleResult.Size.Size_900,
		[IconSizeModule.Large] = UseTokensModuleResult.Size.Size_1200,
		[IconSizeModule.XLarge] = UseTokensModuleResult.Size.Size_2400,
		[IconSizeModule.XXLarge] = 24 * UseTokensModuleResult.Size.Size_200
	}
	local XOffset = nil
	
	if p2 and (typeof(p1) == "number" or typeof(p1) == "table" and typeof(p1:getValue()) == "number") then
		XOffset = p1
	elseif typeof(p1) ~= "number" and (typeof(p1) ~= "table" or typeof(p1:getValue()) ~= "number") then
		XOffset = Config[p1]
	end
	if XOffset == nil then
		error("Invalid icon size: " .. tostring(p1))
	end
	return if typeof(XOffset) == "table" then XOffset:map(function(XOffset): UDim2 --[[ Line: 52 ]]
		return UDim2.fromOffset(XOffset, XOffset)
	end) else UDim2.fromOffset(XOffset, XOffset)
end