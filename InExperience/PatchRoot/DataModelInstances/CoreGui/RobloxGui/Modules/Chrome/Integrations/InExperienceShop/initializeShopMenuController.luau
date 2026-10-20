return function(GuiService, p1)
	p1:connect(function(Open)
		-- upvalues: GuiService (copy)
		GuiService:SetMenuIsOpen(Open, "in_experience_shop")
	end)
end