local guiService = game:GetService("GuiService")
local t = {}
local var2 = nil
local var3 = nil

function t.setActive(value, p0) --[[ line: 7 ]]
	-- upvalues: var2 (write), var3 (write)
	var2 = value
	var3 = p0
end

function t.getActiveNotifId() --[[ line: 12 ]]
	-- upvalues: var2 (write)
	return var2
end

function t.getActiveSquadId() --[[ line: 16 ]]
	-- upvalues: var3 (write)
	return var3
end

function t.clearActive(p1) --[[ line: 20 ]]
	-- upvalues: var2 (write), var3 (write)
	if p1 == nil or var2 == p1 then
		var2 = nil
		var3 = nil
	end
end

function t.dismissNotification(p2) --[[ line: 27 ]]
	-- upvalues: guiService (ref), t (ref)
	if p2 == nil then
		return
	end
	pcall(function() --[[ line: 31 ]]
		-- upvalues: guiService (copy), p2 (ref)
		guiService:DismissNotification(p2)
	end)
	t.clearActive(p2)
end

return t