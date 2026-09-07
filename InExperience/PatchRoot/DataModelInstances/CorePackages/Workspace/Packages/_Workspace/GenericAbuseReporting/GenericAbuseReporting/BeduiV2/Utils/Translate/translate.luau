local parent = script:FindFirstAncestor("GenericAbuseReporting").Parent
local foundationModule = require(parent.Foundation)
local sharedFlagsModule = require(parent.SharedFlags)
local getIconRichText = foundationModule.Utility.getIconRichText
local iconName = foundationModule.Enums.IconName
local fFlagUpdateTranslateInReportRevamp = sharedFlagsModule.FFlagUpdateTranslateInReportRevamp
local fFlagAbuseReportMenuV2 = sharedFlagsModule.FFlagAbuseReportMenuV2

local function mergeTranslationParams(p1, p2)
	if type(p1) == "string" then
		return p1
	end
	local t = {}
	
	if p1.params then
		for i, v in pairs(p1.params) do
			t[i] = v
		end
	end
	for i, v in pairs(p2) do
		t[i] = v
	end
	return {
		["$translate"] = p1["$translate"],
		params = t,
		wrappers = p1.wrappers
	}
end

local function getWrappedText(p3, p4, p5)
	-- upvalues: fFlagAbuseReportMenuV2 (ref), getIconRichText (ref), iconName (ref)
	local text = "{" .. p2.type .. "Start}"
	local text_1 = "{" .. p2.type .. "End}"
	
	if p3.type == "link" then
		if p4:find(text) == nil or p4:find(text_1) == nil then
			return p4, nil
		end
		return if fFlagAbuseReportMenuV2 then string.gsub(p4, `{text}(.-){text_1}`, "%1 " .. getIconRichText(iconName.ArrowUpRightFromSquare)) else p4:gsub(`{text}(.-){text_1}`, string.format("<font color=\"rgb(%d, %d, %d)\">%s</font>", math.floor(p5.R * 255), math.floor(p5.G * 255), math.floor(p5.B * 255), "%1")), p3
	elseif p3.type == "strong" then
		return string.gsub(string.gsub(p4, text, "<b>"), text_1, "</b>"), nil
	end
	warn("Unknown wrapper type: " .. tostring(p3.type))
	
	return p4, nil
end

local var1 = nil

local function resolveParams(p3, p4)
	-- upvalues: var1 (write)
	if p4 == nil then
		return nil
	end
	local t = {}
	
	for i, v in pairs(p4) do
		if type(v) == "string" then
			t[i] = v
		else
			t[i] = var1(p3, v)
		end
	end
	return t
end

return {
	mergeTranslationParams = mergeTranslationParams,
	translateIntoString = function(p5, p6)
		-- upvalues: fFlagUpdateTranslateInReportRevamp (ref), resolveParams (ref)
		if p6 == nil then
			return ""
		elseif type(p6) == "string" then
			return p6
		end
		local var2 = p6["$translate"]
		local params = p6.params
		local var3 = if fFlagUpdateTranslateInReportRevamp then resolveParams(p5, params) else nil
		local var4 = p5[var2] or var2
		
		if fFlagUpdateTranslateInReportRevamp and var3 ~= nil then
			var4 = var4:gsub("{(.-)}", var3)
		elseif params ~= nil then
			var4 = var4:gsub("{(.-)}", params)
		end
		return var4:gsub("{%w+Start}(.-)({%w+End})", "%1"):gsub("{%w+Start}", ""):gsub("{%w+End}", "")
	end,
	translateIntoRichTextString = function(p5, p6, p7)
		-- upvalues: fFlagUpdateTranslateInReportRevamp (ref), resolveParams (ref), getWrappedText (ref)
		if p6 == nil then
			return "", nil
		elseif type(p6) == "string" then
			return p6, nil
		elseif type(p6) ~= "table" then
			return tostring(p6), nil
		end
		local var2 = p6["$translate"]
		
		if not var2 or type(var2) ~= "string" then
			return "", nil
		end
		local params = p6.params
		local var3 = if fFlagUpdateTranslateInReportRevamp then resolveParams(p5, params) else nil
		local var4 = p5[var2] or var2
		local var5 = nil
		
		if fFlagUpdateTranslateInReportRevamp and var3 ~= nil then
			var4 = var4:gsub("{(.-)}", var3)
		elseif params ~= nil then
			var4 = var4:gsub("{(.-)}", params)
		end
		if p6.wrappers then
			for i, v in pairs(p6.wrappers) do
				local _ = nil
				local var6, var7 = getWrappedText(v, var4, p7)
				var4 = var6
				local var8 = var7
				
				if var8 ~= nil and var5 == nil then
					var5 = var8
				end
			end
		end
		return var4, var5
	end
}