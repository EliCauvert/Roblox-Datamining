local coreGuiService = game:GetService("CoreGui")
local fIntAXGuiObjectIsObscuredPaddingModule = require(script:FindFirstAncestor("BulkPurchaseApp").Flags.FIntAXGuiObjectIsObscuredPadding)

local function getGuiObjectIsObscuredAtPosition(p1, p2, p3)
	-- upvalues: coreGuiService (ref)
	for i, v in coreGuiService:GetGuiObjectsAtPosition(p2, p3) do
		if (not v:IsA("Frame") or v.Active ~= false or v.BackgroundTransparency ~= 1) and not v:IsDescendantOf(p1) then
			return v ~= p1
		end
	end
	return false
end

return function(p4)
	-- upvalues: getGuiObjectIsObscuredAtPosition (ref), fIntAXGuiObjectIsObscuredPaddingModule (ref)
	local absolutePosition = p4.AbsolutePosition
	local absoluteSize = p4.AbsoluteSize
	local var1 = absolutePosition + absoluteSize * 0.5
	local var2 = absolutePosition + absoluteSize
	local var3 = absolutePosition + Vector2.new(absoluteSize.X, 0)
	local var4 = absolutePosition + Vector2.new(0, absoluteSize.Y)
	local var5 = absolutePosition + absoluteSize * Vector2.new(math.random(1, 9) / 10, math.random(1, 9) / 10)
	
	return getGuiObjectIsObscuredAtPosition(p4, var1.X, var1.Y) or (getGuiObjectIsObscuredAtPosition(p4, absolutePosition.X + fIntAXGuiObjectIsObscuredPaddingModule, absolutePosition.Y + fIntAXGuiObjectIsObscuredPaddingModule) or (getGuiObjectIsObscuredAtPosition(p4, var4.X + fIntAXGuiObjectIsObscuredPaddingModule, var4.Y - fIntAXGuiObjectIsObscuredPaddingModule) or (getGuiObjectIsObscuredAtPosition(p4, var3.X - fIntAXGuiObjectIsObscuredPaddingModule, var3.Y + fIntAXGuiObjectIsObscuredPaddingModule) or (getGuiObjectIsObscuredAtPosition(p4, var2.X - fIntAXGuiObjectIsObscuredPaddingModule, var2.Y - fIntAXGuiObjectIsObscuredPaddingModule) or getGuiObjectIsObscuredAtPosition(p4, math.floor(var5.X), math.floor(var5.Y))))))
end