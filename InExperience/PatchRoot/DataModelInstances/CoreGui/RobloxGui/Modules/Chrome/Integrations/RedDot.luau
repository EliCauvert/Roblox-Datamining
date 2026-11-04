local ReactModule = require(game:GetService("CorePackages").Packages.React)
local GetStyleTokensModule = require(script.Parent.Parent.ChromeShared.Utility.GetStyleTokens)
local _Color3 = Color3.new(0.918, 0.2, 0.137)

return function(p1)
	-- upvalues: ReactModule (copy), GetStyleTokensModule (copy), _Color3 (copy)
	local UseMemoResult = ReactModule.useMemo(function()
		-- upvalues: GetStyleTokensModule (upval)
		return GetStyleTokensModule().Size.Size_100
	end, {})
	
	return ReactModule.createElement("Frame", {
		Name = p1.name or "RedDot",
		AnchorPoint = Vector2.new(0.5, 0.5),
		Position = p1.position,
		Size = UDim2.fromOffset(UseMemoResult, UseMemoResult),
		BackgroundColor3 = _Color3,
		Visible = p1.visible
	}, {
		UICorner = ReactModule.createElement("UICorner", { CornerRadius = UDim.new(1, 0) })
	})
end