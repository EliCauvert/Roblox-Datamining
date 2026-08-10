local coreGuiService = game:GetService("CoreGui")
local fIntAXGuiObjectIsObscuredPaddingModule = require(script:FindFirstAncestor("BulkPurchaseApp").Flags.FIntAXGuiObjectIsObscuredPadding)

local function getGuiObjectIsObscuredAtPosition(p0, p1, p2) --[[ line: 5 ]]
	-- upvalues: coreGuiService (ref)
	for i, v in coreGuiService:GetGuiObjectsAtPosition(p1, p2) do
		if (not v:IsA("Frame") or v.Active ~= false or v.BackgroundTransparency ~= 1) and not v:IsDescendantOf(p0) then
			return v ~= p0
		end
	end
	return false
end

return function(p3) --[[ line: 21 | named "getGuiObjectIsObscured" ]]
	-- upvalues: getGuiObjectIsObscuredAtPosition (ref), fIntAXGuiObjectIsObscuredPaddingModule (ref)
	local absolutePosition = p3.AbsolutePosition
	local absoluteSize = p3.AbsoluteSize
	local var3 = absolutePosition + absoluteSize * 0.5
	local var4 = absolutePosition + absoluteSize
	local var5 = absolutePosition + Vector2.new(absoluteSize.X, 0)
	local var6 = absolutePosition + Vector2.new(0, absoluteSize.Y)
	local var7 = absolutePosition + absoluteSize * Vector2.new(math.random(1, 9) / 10, math.random(1, 9) / 10)
	
	return getGuiObjectIsObscuredAtPosition(p3, var3.X, var3.Y) or (getGuiObjectIsObscuredAtPosition(p3, absolutePosition.X + fIntAXGuiObjectIsObscuredPaddingModule, absolutePosition.Y + fIntAXGuiObjectIsObscuredPaddingModule) or (getGuiObjectIsObscuredAtPosition(p3, var6.X + fIntAXGuiObjectIsObscuredPaddingModule, var6.Y - fIntAXGuiObjectIsObscuredPaddingModule) or (getGuiObjectIsObscuredAtPosition(p3, var5.X - fIntAXGuiObjectIsObscuredPaddingModule, var5.Y + fIntAXGuiObjectIsObscuredPaddingModule) or (getGuiObjectIsObscuredAtPosition(p3, var4.X - fIntAXGuiObjectIsObscuredPaddingModule, var4.Y - fIntAXGuiObjectIsObscuredPaddingModule) or getGuiObjectIsObscuredAtPosition(p3, math.floor(var7.X), math.floor(var7.Y))))))
end