local contactImporter = script:FindFirstAncestor("ContactImporter")
local dash = require(contactImporter.dependencies).Dash
local _ = require(contactImporter.Common.LocalTypes)
local t = {}

local var2 = function(p0)
	-- upvalues: t (ref)
	return p0.byDeviceContactId or t
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

local var3 = function(p4)
	-- upvalues: dash (ref)
	return dash.map(p4, function(p5)
		-- upvalues: dash (copy)
		return dash.join(p5, {
			phoneNumber = tostring(p5.phoneNumbers[1]),
			phoneNumbers = dash.None
		})
	end)
end

local _ = function(p6)
	-- upvalues: dash (ref)
	return function(p7)
		-- upvalues: dash (copy), p6 (ref)
		local t = {}
		dash.forEach(p7, function(p8)
			-- upvalues: p6 (copy), t (ref), dash (copy)
			if not p6.deviceContactToRobloxContact or not p6.deviceContactToRobloxContact[p8.id] then
				t[p8.id] = dash.join(p8, {
					isMatchedContact = false,
					deviceContactId = p8.id,
					id = dash.None
				})
			end
		end)
		
		return t
	end
end

local var4 = function(p9)
	-- upvalues: dash (ref)
	return dash.values(p9)
end

local function _(p10)
	return string.gsub(p10, "^%s*(.*)$", "%1")
end

local var5 = function(p11)
	table.sort(p11, function(p12, p13)
		if p12.contactName and p13.contactName then
			local replaced = string.gsub(string.upper(p12.contactName), "^%s*(.*)$", "%1")
			local replaced_1 = string.gsub(string.upper(p13.contactName), "^%s*(.*)$", "%1")
			
			return if replaced and replaced_1 and replaced ~= replaced_1 then replaced < replaced_1 else p12.deviceContactId < p13.deviceContactId
		end
	end)
	
	return p11
end

return function(p14)
	-- upvalues: t (ref), dash (ref), var2 (ref), var3 (ref), var4 (ref), var5 (ref)
	p14 = p14 or t
	
	return dash.pipe(var2, function(p15)
		-- upvalues: p14 (ref), t (copy), dash (copy)
		local hasSentRequest = p14.hasSentRequest or t
		
		return dash.map(p15, function(p16)
			-- upvalues: dash (copy), hasSentRequest (ref)
			return dash.join(p16, { hasSentRequest = hasSentRequest[p16.id] })
		end)
	end, var3, function(p17)
		-- upvalues: dash (copy), p14 (ref)
		local t = {}
		dash.forEach(p17, function(p18)
			-- upvalues: p14 (copy), t (ref), dash (copy)
			if not p14.deviceContactToRobloxContact or not p14.deviceContactToRobloxContact[p18.id] then
				t[p18.id] = dash.join(p18, {
					isMatchedContact = false,
					deviceContactId = p18.id,
					id = dash.None
				})
			end
		end)
		
		return t
	end, var4, var5)(p14 or {})
end