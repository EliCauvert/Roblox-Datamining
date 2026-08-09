local t = {
	ImageLabel = true,
	ImageButton = true,
	TextLabel = true,
	TextBox = true,
	TextButton = true,
	VideoFrame = true,
	ViewportFrame = true
}

function isElementContentful(p0) --[[ line: 11 ]]
	-- upvalues: t (ref)
	return if p0.Visible and p0.Transparency ~= 1 then t[p0.ClassName] else false
end

return isElementContentful