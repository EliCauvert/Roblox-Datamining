local MomentsCreation = script:FindFirstAncestor("MomentsCreation")
local ConstantsModule = require(MomentsCreation.Constants)
local _ = require(MomentsCreation.Parent.MomentsTypes)

return function() --[[ Line: 23 | Named "makeDefaultTextOverlayEdit" ]]
	-- upvalues: ConstantsModule (copy)
	return {
		rotation = 0,
		scale = 1,
		text = "",
		zIndex = 1,
		position = UDim2.fromScale(0.5, 0.5),
		textOverlayStyle = {
			font = Enum.Font.BuilderSansMedium,
			fontColor = Color3.new(0, 0, 0),
			fontSize = ConstantsModule.TextOverlay.DefaultFontSize,
			textXAlignment = Enum.TextXAlignment.Center
		}
	}
end