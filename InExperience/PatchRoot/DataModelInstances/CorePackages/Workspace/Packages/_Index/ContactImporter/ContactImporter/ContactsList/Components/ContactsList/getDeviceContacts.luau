local contactImporter = script:FindFirstAncestor("ContactImporter")
local dash = require(contactImporter.dependencies).Dash
local _ = require(contactImporter.Common.LocalTypes)
local t = {}

local var1 = function(p1)
	-- upvalues: t (ref)
	return p1.byDeviceContactId or t
end

local _ = function(p1)
	-- upvalues: t (ref), dash (ref)
	return function(p2)
		-- upvalues: p1 (ref), t (copy), dash (copy)
		local hasSentRequest = p1.hasSentRequest or t
		
		return dash.map(p2, function(p3)
			-- upvalues: dash (copy), hasSentRequest (ref)
			return dash.join(p3, { hasSentRequest = hasSentRequest[p3.id] })
		end)
	end
end

local var2 = function(p1)
	-- upvalues: dash (ref)
	return dash.map(p1, function(p2)
		-- upvalues: dash (copy)
		return dash.join(p2, {
			phoneNumber = tostring(p2.phoneNumbers[1]),
			phoneNumbers = dash.None
		})
	end)
end

local _ = function(p1)
	-- upvalues: dash (ref)
	return function(p2)
		-- upvalues: dash (copy), p1 (ref)
		local t = {}
		dash.forEach(p2, function(p3)
			-- upvalues: p1 (copy), t (ref), dash (copy)
			if not p1.deviceContactToRobloxContact or not p1.deviceContactToRobloxContact[p3.id] then
				t[p3.id] = dash.join(p3, {
					isMatchedContact = false,
					deviceContactId = p3.id,
					id = dash.None
				})
			end
		end)
		
		return t
	end
end

local var3 = function(p1)
	-- upvalues: dash (ref)
	return dash.values(p1)
end

local function _(p1)
	return string.gsub(p1, "^%s*(.*)$", "%1")
end

local var4 = function(p1)
	table.sort(p1, function(p2, p3)
		if p2.contactName and p3.contactName then
			local replaced = string.gsub(string.upper(p2.contactName), "^%s*(.*)$", "%1")
			local replaced_1 = string.gsub(string.upper(p3.contactName), "^%s*(.*)$", "%1")
			
			return if replaced and replaced_1 and replaced ~= replaced_1 then replaced < replaced_1 else p2.deviceContactId < p3.deviceContactId
		end
	end)
	
	return p1
end

return function(p1)
	-- upvalues: t (ref), dash (ref), var1 (ref), var2 (ref), var3 (ref), var4 (ref)
	p1 = p1 or t
	
	return dash.pipe(var1, function(p2)
		-- upvalues: p1 (ref), t (copy), dash (copy)
		local hasSentRequest = p1.hasSentRequest or t
		
		return dash.map(p2, function(p3)
			-- upvalues: dash (copy), hasSentRequest (ref)
			return dash.join(p3, { hasSentRequest = hasSentRequest[p3.id] })
		end)
	end, var2, function(p2)
		-- upvalues: dash (copy), p1 (ref)
		local t = {}
		dash.forEach(p2, function(p3)
			-- upvalues: p1 (copy), t (ref), dash (copy)
			if not p1.deviceContactToRobloxContact or not p1.deviceContactToRobloxContact[p3.id] then
				t[p3.id] = dash.join(p3, {
					isMatchedContact = false,
					deviceContactId = p3.id,
					id = dash.None
				})
			end
		end)
		
		return t
	end, var3, var4)(p1 or {})
end