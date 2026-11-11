local RemoveDeprecatedGuiObjectApisIsElementContentful = game:DefineFastFlag("RemoveDeprecatedGuiObjectApisIsElementContentful", false)
local config = {
	ImageLabel = true,
	ImageButton = true,
	TextLabel = true,
	TextBox = true,
	TextButton = true,
	VideoFrame = true,
	ViewportFrame = true
}

function isElementContentful(Frame)
	-- upvalues: RemoveDeprecatedGuiObjectApisIsElementContentful (copy), config (copy)
	if RemoveDeprecatedGuiObjectApisIsElementContentful then
		if not Frame.Visible or Frame.BackgroundTransparency == 1 then
			return false
		end
	elseif not Frame.Visible or Frame.Transparency == 1 then
		return false
	end
	return config[Frame.ClassName]
end

return isElementContentful