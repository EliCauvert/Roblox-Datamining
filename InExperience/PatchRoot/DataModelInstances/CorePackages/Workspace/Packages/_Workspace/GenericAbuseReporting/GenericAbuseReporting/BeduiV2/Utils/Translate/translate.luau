local parent = script:FindFirstAncestor("GenericAbuseReporting").Parent
local foundationModule = require(parent.Foundation)
local sharedFlagsModule = require(parent.SharedFlags)
local getIconRichText = foundationModule.Utility.getIconRichText
local iconName = foundationModule.Enums.IconName
local fFlagUpdateTranslateInReportRevamp = sharedFlagsModule.FFlagUpdateTranslateInReportRevamp
local fFlagAbuseReportMenuV2 = sharedFlagsModule.FFlagAbuseReportMenuV2

local function mergeTranslationParams(p0, p1) --[[ line: 38 ]]
	if type(p0) == "string" then
		return p0
	end
	local t = {}
	
	if p0.params then
		for i, v in pairs(p0.params) do
			t[i] = v
		end
	end
	for i, v in pairs(p1) do
		t[i] = v
	end
	return {
		["$translate"] = p0["$translate"],
		params = t,
		wrappers = p0.wrappers
	}
end

local function getWrappedText(p2, p3, p4) --[[ line: 66 ]]
	-- upvalues: fFlagAbuseReportMenuV2 (ref), getIconRichText (ref), iconName (ref)
	local text = "{" .. p2.type .. "Start}"
	local text_1 = "{" .. p2.type .. "End}"
	
	if p2.type == "link" then
		if p3:find(text) == nil or p3:find(text_1) == nil then
			return p3, nil
		end
		return if fFlagAbuseReportMenuV2 then string.gsub(p3, `{text}(.-){text_1}`, "%1 " .. getIconRichText(iconName.ArrowUpRightFromSquare)) else p3:gsub(`{text}(.-){text_1}`, string.format("<font color=\"rgb(%d, %d, %d)\">%s</font>", math.floor(p4.R * 255), math.floor(p4.G * 255), math.floor(p4.B * 255), "%1")), p2
	elseif p2.type == "strong" then
		return string.gsub(string.gsub(p3, text, "<b>"), text_1, "</b>"), nil
	end
	warn("Unknown wrapper type: " .. tostring(p2.type))
	
	return p3, nil
end

local var4 = nil

local function resolveParams(p5, p6) --[[ line: 100 ]]
	-- upvalues: var4 (write)
	if p6 == nil then
		return nil
	end
	local t = {}
	
	for i, v in pairs(p6) do
		if type(v) == "string" then
			t[i] = v
		else
			t[i] = var4(p5, v)
		end
	end
	return t
end

return {
	mergeTranslationParams = mergeTranslationParams,
	translateIntoString = function(p7, p8) --[[ line: 181 ]]
		-- upvalues: fFlagUpdateTranslateInReportRevamp (ref), resolveParams (ref)
		if p8 == nil then
			return ""
		elseif type(p8) == "string" then
			return p8
		end
		local var10 = p8["$translate"]
		local params = p8.params
		local var11 = if fFlagUpdateTranslateInReportRevamp then resolveParams(p7, params) else nil
		local var12 = p7[var10] or var10
		
		if fFlagUpdateTranslateInReportRevamp and var11 ~= nil then
			var12 = var12:gsub("{(.-)}", var11)
		elseif params ~= nil then
			var12 = var12:gsub("{(.-)}", params)
		end
		return var12:gsub("{%w+Start}(.-)({%w+End})", "%1"):gsub("{%w+Start}", ""):gsub("{%w+End}", "")
	end,
	translateIntoRichTextString = function(p9, p10, p11) --[[ line: 125 ]]
		-- upvalues: fFlagUpdateTranslateInReportRevamp (ref), resolveParams (ref), getWrappedText (ref)
		if p10 == nil then
			return "", nil
		elseif type(p10) == "string" then
			return p10, nil
		elseif type(p10) ~= "table" then
			return tostring(p10), nil
		end
		local var13 = p10["$translate"]
		
		if not var13 or type(var13) ~= "string" then
			return "", nil
		end
		local params = p10.params
		local var14 = if fFlagUpdateTranslateInReportRevamp then resolveParams(p9, params) else nil
		local var15 = p9[var13] or var13
		local var16 = nil
		
		if fFlagUpdateTranslateInReportRevamp and var14 ~= nil then
			var15 = var15:gsub("{(.-)}", var14)
		elseif params ~= nil then
			var15 = var15:gsub("{(.-)}", params)
		end
		if p10.wrappers then
			for i, v in pairs(p10.wrappers) do
				local _ = nil
				local var17, var18 = getWrappedText(v, var15, p11)
				var15 = var17
				local var19 = var18
				
				if var19 ~= nil and var16 == nil then
					var16 = var19
				end
			end
		end
		return var15, var16
	end
}