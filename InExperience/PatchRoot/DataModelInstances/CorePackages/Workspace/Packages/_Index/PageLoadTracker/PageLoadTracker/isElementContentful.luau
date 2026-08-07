local removeDeprecatedGuiObjectApisIsElementContentful = game:DefineFastFlag("RemoveDeprecatedGuiObjectApisIsElementContentful", false)
local t = {
	ImageLabel = true,
	ImageButton = true,
	TextLabel = true,
	TextBox = true,
	TextButton = true,
	VideoFrame = true,
	ViewportFrame = true
}

function isElementContentful(p0) --[[ line: 14 ]]
	-- upvalues: removeDeprecatedGuiObjectApisIsElementContentful (ref), t (ref)
	if removeDeprecatedGuiObjectApisIsElementContentful then
		if p0.Visible and p0.BackgroundTransparency ~= 1 then
		else
			return false
		end
	else
		return if p0.Visible and p0.Transparency ~= 1 then t[p0.ClassName] else false
	end
end

return isElementContentful