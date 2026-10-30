return function(Frame)
	local Success, Result = pcall(function()
		-- upvalues: Frame (copy)
		return Frame:GetStyled("BackgroundTransparency")
	end)
	
	return if Success and type(Result) == "number" then Result else Frame.BackgroundTransparency
end