local guiService = game:GetService("GuiService")
local t = {}
local var1 = nil
local var2 = nil

function t.setActive(value, p1)
	-- upvalues: var1 (write), var2 (write)
	var1 = value
	var2 = p1
end

function t.getActiveNotifId()
	-- upvalues: var1 (write)
	return var1
end

function t.getActiveSquadId()
	-- upvalues: var2 (write)
	return var2
end

function t.clearActive(p1)
	-- upvalues: var1 (write), var2 (write)
	if p1 == nil or var1 == p1 then
		var1 = nil
		var2 = nil
	end
end

function t.dismissNotification(p1)
	-- upvalues: guiService (ref), t (ref)
	if p1 == nil then
		return
	end
	pcall(function()
		-- upvalues: guiService (copy), p1 (ref)
		guiService:DismissNotification(p1)
	end)
	t.clearActive(p1)
end

return t