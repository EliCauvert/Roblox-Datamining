local httpService = game:GetService("HttpService")
local _ = require(script.Parent.chatTypes)

local function decodeReference(p1)
	return if typeof(p1) == "table" and typeof(p1.path) == "string" and (p1.path ~= "" and #p1.path <= 4096) and (typeof(p1.displayName) == "string" and p1.displayName ~= "" and #p1.displayName <= 512) and ((p1.className == nil or typeof(p1.className) == "string") and (typeof(p1.className) ~= "string" or #p1.className <= 256)) then {
		path = p1.path,
		displayName = p1.displayName,
		className = p1.className
	} else nil
end

return {
	encodeReferences = function(p1)
		-- upvalues: httpService (ref)
		return "<system_reminder>" .. string.gsub(httpService:JSONEncode({
			kind = "roblox.build.selected_instance_attachments",
			version = 1,
			items = p1
		}), "<", "\\u003c") .. "</system_reminder>"
	end,
	decodeSystemReminders = function(a)
		-- upvalues: httpService (ref), decodeReference (ref)
		local t = {}
		local t_1 = {}
		local var1 = 0
		
		if typeof(a) ~= "table" then
			return t
		end
		for i, v in a do
			var1 += 1
			
			if var1 > 32 or #t >= 100 then break end
			if typeof(v) == "string" and #v <= 131072 then
				local ok, status = pcall(httpService.JSONDecode, httpService, v)
				
				if ok and typeof(status) == "table" and (status.kind == "roblox.build.selected_instance_attachments" and status.version == 1) and typeof(status.items) == "table" then
					for i_1, v_1 in status.items do
						if #t >= 100 then break end
						local var2 = decodeReference(v_1)
						
						if var2 ~= nil and not t_1[var2.path] then
							t_1[var2.path] = true
							table.insert(t, var2)
						end
					end
				end
			end
		end
		return t
	end
}