return function(GuiService, p1) --[[ Line: 19 | Named "initializeShopMenuController" ]]
	p1:connect(function(Open) --[[ Line: 20 ]]
		-- upvalues: GuiService (copy)
		GuiService:SetMenuIsOpen(Open, "in_experience_shop")
	end)
end