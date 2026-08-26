local foundation = script:FindFirstAncestor("Foundation")
local _ = require(foundation.Enums.ColorNamespace)
local reactModule = require(foundation.Parent.React)
local useTokensModule = require(foundation.Providers.Style.useTokens)

return reactModule.memo(reactModule.forwardRef(function(p1, p2)
	-- upvalues: useTokensModule (ref), reactModule (ref)
	local var1 = useTokensModule()
	local colorNamespace = p1.colorNamespace
	
	return reactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		BorderSizePixel = 0,
		Position = UDim2.fromOffset(-p1.offset, -p1.offset),
		Size = UDim2.new(1, p1.offset * 2, 1, p1.offset * 2),
		ref = p2
	}, {
		UICorner = reactModule.createElement("UICorner", { CornerRadius = p1.cornerRadius }),
		UIStroke = reactModule.createElement("UIStroke", {
			Color = var1[colorNamespace].Selection.Start.Color3,
			Transparency = var1[colorNamespace].Selection.Start.Transparency,
			Thickness = p1.borderWidth
		}, {})
	})
end))