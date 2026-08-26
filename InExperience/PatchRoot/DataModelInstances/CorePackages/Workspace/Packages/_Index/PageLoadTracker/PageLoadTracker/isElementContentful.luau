local t = {
	ImageLabel = true,
	ImageButton = true,
	TextLabel = true,
	TextBox = true,
	TextButton = true,
	VideoFrame = true,
	ViewportFrame = true
}

function isElementContentful(p1)
	-- upvalues: t (ref)
	return if p1.Visible and p1.BackgroundTransparency ~= 1 then t[p1.ClassName] else false
end

return isElementContentful