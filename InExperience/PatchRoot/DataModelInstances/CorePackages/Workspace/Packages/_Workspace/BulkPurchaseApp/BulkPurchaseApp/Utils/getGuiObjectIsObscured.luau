local coreGuiService = game:GetService("CoreGui")
local bulkPurchaseApp = script:FindFirstAncestor("BulkPurchaseApp")
local fFlagAXMakeBulkPurchaseBlueModule = require(bulkPurchaseApp.Flags.FFlagAXMakeBulkPurchaseBlue)
local fIntAXGuiObjectIsObscuredPaddingModule = require(bulkPurchaseApp.Flags.FIntAXGuiObjectIsObscuredPadding)

local function getGuiObjectIsObscuredAtPosition(p0, p1, p2) --[[ line: 6 ]]
	-- upvalues: coreGuiService (ref)
	for i, v in coreGuiService:GetGuiObjectsAtPosition(p1, p2) do
		if (not v:IsA("Frame") or v.Active ~= false or v.BackgroundTransparency ~= 1) and not v:IsDescendantOf(p0) then
			return v ~= p0
		end
	end
	return false
end

return function(p3) --[[ line: 22 | named "getGuiObjectIsObscured" ]]
	-- upvalues: fFlagAXMakeBulkPurchaseBlueModule (ref), getGuiObjectIsObscuredAtPosition (ref), fIntAXGuiObjectIsObscuredPaddingModule (ref)
	local absolutePosition = p3.AbsolutePosition
	local absoluteSize = p3.AbsoluteSize
	local var5 = absolutePosition + absoluteSize * 0.5
	local var6 = absolutePosition + absoluteSize
	local var7 = absolutePosition + Vector2.new(absoluteSize.X, 0)
	local var8 = absolutePosition + Vector2.new(0, absoluteSize.Y)
	local var9 = absolutePosition + absoluteSize * Vector2.new(math.random(1, 9) / 10, math.random(1, 9) / 10)
	
	return if fFlagAXMakeBulkPurchaseBlueModule then getGuiObjectIsObscuredAtPosition(p3, var5.X, var5.Y) or (getGuiObjectIsObscuredAtPosition(p3, absolutePosition.X + fIntAXGuiObjectIsObscuredPaddingModule, absolutePosition.Y + fIntAXGuiObjectIsObscuredPaddingModule) or (getGuiObjectIsObscuredAtPosition(p3, var8.X + fIntAXGuiObjectIsObscuredPaddingModule, var8.Y - fIntAXGuiObjectIsObscuredPaddingModule) or (getGuiObjectIsObscuredAtPosition(p3, var7.X - fIntAXGuiObjectIsObscuredPaddingModule, var7.Y + fIntAXGuiObjectIsObscuredPaddingModule) or (getGuiObjectIsObscuredAtPosition(p3, var6.X - fIntAXGuiObjectIsObscuredPaddingModule, var6.Y - fIntAXGuiObjectIsObscuredPaddingModule) or getGuiObjectIsObscuredAtPosition(p3, math.floor(var9.X), math.floor(var9.Y)))))) else getGuiObjectIsObscuredAtPosition(p3, var5.X, var5.Y) or (getGuiObjectIsObscuredAtPosition(p3, absolutePosition.X + 1, absolutePosition.Y + 1) or (getGuiObjectIsObscuredAtPosition(p3, var8.X + 1, var8.Y - 1) or (getGuiObjectIsObscuredAtPosition(p3, var7.X - 1, var7.Y + 1) or (getGuiObjectIsObscuredAtPosition(p3, var6.X - 1, var6.Y - 1) or getGuiObjectIsObscuredAtPosition(p3, math.floor(var9.X), math.floor(var9.Y))))))
end