local SduiSharedUtilities = script:FindFirstAncestor("SduiSharedUtilities")
local FFlagLuaAppEnableSduiHomePage = require(SduiSharedUtilities.Parent.SharedFlags).FFlagLuaAppEnableSduiHomePage
local _ = require(SduiSharedUtilities.SduiIntegrationTypes)

local function _(p1): boolean
	return typeof(p1) == "table" and #p1 > 0
end

local _ = function(p1, List)
	for i, value in List do
		p1[i] = value
	end
end

local _ = function(List, List1)
	for _, value in List1 do
		table.insert(List, value)
	end
end

local function mergeInto(p2, List3, Callback, List)
	-- upvalues: FFlagLuaAppEnableSduiHomePage (copy), mergeInto (copy)
	for i, value in List3 do
		if typeof(value) ~= "table" then
			p2[i] = value
			continue
		end
		table.insert(List, (tostring(i)))
		local CallbackResult = if Callback then Callback(List, value, p2[i]) else nil
		
		if FFlagLuaAppEnableSduiHomePage and CallbackResult == "preserve" then
			table.remove(List)
		else
			if CallbackResult == "replace" then
				p2[i] = value
			elseif CallbackResult == "merge" then
				if p2[i] == nil then
					p2[i] = value
				else
					local v1 = p2[i]
					
					for i1, value1 in value do
						v1[i1] = value1
					end
				end
			elseif CallbackResult == "append" then
				if p2[i] == nil then
					p2[i] = value
				elseif typeof(value) == "table" and #value > 0 then
					local List1 = p2[i]
					
					for _, value2 in value do
						table.insert(List1, value2)
					end
				else
					local v2 = p2[i]
					
					for i2, value3 in value do
						v2[i2] = value3
					end
				end
			else
				if p2[i] == nil then
					p2[i] = {}
				end
				if typeof(value) == "table" and #value > 0 then
					local List2 = p2[i]
					
					for _, value4 in value do
						table.insert(List2, value4)
					end
				else
					mergeInto(p2[i], value, Callback, List)
				end
			end
			table.remove(List)
			continue
		end
	end
end

return {
	merge = function(Tbl, p3, p4)
		-- upvalues: mergeInto (copy)
		local Copy = table.clone(Tbl)
		mergeInto(Copy, p3, p4, {})
		
		return Copy
	end
}