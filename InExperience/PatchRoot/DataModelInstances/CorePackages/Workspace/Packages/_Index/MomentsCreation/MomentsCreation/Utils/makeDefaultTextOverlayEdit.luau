local momentsCreation = script:FindFirstAncestor("MomentsCreation")
local constantsModule = require(momentsCreation.Constants)
local _ = require(momentsCreation.Parent.MomentsTypes)

return function() --[[ line: 23 | named "makeDefaultTextOverlayEdit" ]]
	-- upvalues: constantsModule (ref)
	return {
		rotation = 0,
		scale = 1,
		text = "",
		zIndex = 1,
		position = UDim2.fromScale(0.5, 0.5),
		textOverlayStyle = {
			font = Enum.Font.BuilderSansMedium,
			fontColor = Color3.new(0, 0, 0),
			fontSize = constantsModule.TextOverlay.DefaultFontSize,
			textXAlignment = Enum.TextXAlignment.Center
		}
	}
end