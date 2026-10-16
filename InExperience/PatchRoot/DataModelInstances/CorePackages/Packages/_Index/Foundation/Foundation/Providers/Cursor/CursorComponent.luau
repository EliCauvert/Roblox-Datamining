local Foundation = script:FindFirstAncestor("Foundation")
local _ = require(Foundation.Enums.ColorNamespace)
local ReactModule = require(Foundation.Parent.React)
local UseTokensModule = require(Foundation.Providers.Style.useTokens)

return ReactModule.memo((ReactModule.forwardRef(function(p1, Ref) --[[ Line: 19 ]]
	-- upvalues: UseTokensModule (copy), ReactModule (copy)
	local UseTokensModuleResult = UseTokensModule()
	local ColorNamespace = p1.colorNamespace
	
	return ReactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		BorderSizePixel = 0,
		Position = UDim2.fromOffset(-p1.offset, -p1.offset),
		Size = UDim2.new(1, p1.offset * 2, 1, p1.offset * 2),
		ref = Ref
	}, {
		UICorner = ReactModule.createElement("UICorner", { CornerRadius = p1.cornerRadius }),
		UIStroke = ReactModule.createElement("UIStroke", {
			Color = UseTokensModuleResult[ColorNamespace].Selection.Start.Color3,
			Transparency = UseTokensModuleResult[ColorNamespace].Selection.Start.Transparency,
			Thickness = p1.borderWidth
		}, {})
	})
end)))