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
	-- upvalues: config (copy)
	return if Frame.Visible and Frame.BackgroundTransparency ~= 1 then config[Frame.ClassName] else false
end

return isElementContentful