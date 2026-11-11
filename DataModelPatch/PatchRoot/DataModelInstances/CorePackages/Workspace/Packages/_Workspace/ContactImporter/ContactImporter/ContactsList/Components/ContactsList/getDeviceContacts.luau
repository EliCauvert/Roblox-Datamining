local ContactImporter = script:FindFirstAncestor("ContactImporter")
local Dash = require(ContactImporter.dependencies).Dash
local _ = require(ContactImporter.Common.LocalTypes)
local t = {}

local function v4(p1)
	-- upvalues: t (copy)
	return p1.byDeviceContactId or t
end

local function _(p1)
	-- upvalues: t (copy), Dash (copy)
	return function(p2)
		-- upvalues: p1 (copy), t (upval), Dash (upval)
		local HasSentRequest = p1.hasSentRequest or t
		
		return Dash.map(p2, function(p3)
			-- upvalues: Dash (upval), HasSentRequest (copy)
			return Dash.join(p3, { hasSentRequest = HasSentRequest[p3.id] })
		end)
	end
end

local function v6(p1)
	-- upvalues: Dash (copy)
	return Dash.map(p1, function(p2)
		-- upvalues: Dash (upval)
		return Dash.join(p2, {
			phoneNumber = tostring(p2.phoneNumbers[1]),
			phoneNumbers = Dash.None
		})
	end)
end

local _ = function(p1)
	-- upvalues: Dash (copy)
	return function(p2)
		-- upvalues: Dash (upval), p1 (copy)
		local JoinResults = {}
		Dash.forEach(p2, function(p3)
			-- upvalues: p1 (upval), JoinResults (copy), Dash (upval)
			if not p1.deviceContactToRobloxContact or not p1.deviceContactToRobloxContact[p3.id] then
				JoinResults[p3.id] = Dash.join(p3, {
					isMatchedContact = false,
					deviceContactId = p3.id,
					id = Dash.None
				})
			end
		end)
		
		return JoinResults
	end
end

local function v8(p1)
	-- upvalues: Dash (copy)
	return Dash.values(p1)
end

local _ = function(Text: string): string
	return string.gsub(Text, "^%s*(.*)$", "%1")
end

local function v10(List)
	table.sort(List, function(A, B): boolean
		if A.contactName and B.contactName then
			local Replaced = string.gsub(string.upper(A.contactName), "^%s*(.*)$", "%1")
			local Replaced1 = string.gsub(string.upper(B.contactName), "^%s*(.*)$", "%1")
			
			if Replaced and Replaced1 and Replaced ~= Replaced1 then
				return Replaced < Replaced1
			end
		end
		return A.deviceContactId < B.deviceContactId
	end)
	
	return List
end

return function(p1)
	-- upvalues: t (copy), Dash (copy), v4 (copy), v6 (copy), v8 (copy), v10 (copy)
	local P12 = p1 or t
	
	return Dash.pipe(v4, function(p2)
		-- upvalues: P12 (copy), t (upval), Dash (upval)
		local HasSentRequest = P12.hasSentRequest or t
		
		return Dash.map(p2, function(p3)
			-- upvalues: Dash (upval), HasSentRequest (copy)
			return Dash.join(p3, { hasSentRequest = HasSentRequest[p3.id] })
		end)
	end, v6, function(p2)
		-- upvalues: Dash (upval), P12 (copy)
		local JoinResults = {}
		Dash.forEach(p2, function(p3)
			-- upvalues: P12 (upval), JoinResults (copy), Dash (upval)
			if not P12.deviceContactToRobloxContact or not P12.deviceContactToRobloxContact[p3.id] then
				JoinResults[p3.id] = Dash.join(p3, {
					isMatchedContact = false,
					deviceContactId = p3.id,
					id = Dash.None
				})
			end
		end)
		
		return JoinResults
	end, v8, v10)(P12 or {})
end