local foundation = script:FindFirstAncestor("Foundation")
local _ = require(foundation.Enums.ColorNamespace)
local reactModule = require(foundation.Parent.React)
local useTokensModule = require(foundation.Providers.Style.useTokens)

return reactModule.memo(reactModule.forwardRef(function(p0, p1)
	-- upvalues: useTokensModule (ref), reactModule (ref)
	local var3 = useTokensModule()
	local colorNamespace = p0.colorNamespace
	
	return reactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		BorderSizePixel = 0,
		Position = UDim2.fromOffset(-p0.offset, -p0.offset),
		Size = UDim2.new(1, p0.offset * 2, 1, p0.offset * 2),
		ref = p1
	}, {
		UICorner = reactModule.createElement("UICorner", { CornerRadius = p0.cornerRadius }),
		UIStroke = reactModule.createElement("UIStroke", {
			Color = var3[colorNamespace].Selection.Start.Color3,
			Transparency = var3[colorNamespace].Selection.Start.Transparency,
			Thickness = p0.borderWidth
		}, {})
	})
end))