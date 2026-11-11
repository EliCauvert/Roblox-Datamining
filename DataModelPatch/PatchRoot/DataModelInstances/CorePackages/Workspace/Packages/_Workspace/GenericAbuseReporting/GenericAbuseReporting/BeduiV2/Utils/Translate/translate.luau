local Parent = script:FindFirstAncestor("GenericAbuseReporting").Parent
local FoundationModule = require(Parent.Foundation)
local SharedFlagsModule = require(Parent.SharedFlags)
local GetIconRichTextFunction = FoundationModule.Utility.getIconRichText
local IconName = FoundationModule.Enums.IconName
local FFlagUpdateTranslateInReportRevamp = SharedFlagsModule.FFlagUpdateTranslateInReportRevamp
local FFlagAbuseReportMenuV2 = SharedFlagsModule.FFlagAbuseReportMenuV2

local function getWrappedText(p1, Text: string, p2)
	-- upvalues: FFlagAbuseReportMenuV2 (copy), GetIconRichTextFunction (copy), IconName (copy)
	local Text1 = "{" .. p1.type .. "Start}"
	local Text2 = "{" .. p1.type .. "End}"
	
	if p1.type == "link" then
		if Text:find(Text1) == nil or Text:find(Text2) == nil then
			return Text, nil
		else
			return if FFlagAbuseReportMenuV2 then string.gsub(Text, `{Text1}(.-){Text2}`, "%1 " .. GetIconRichTextFunction(IconName.ArrowUpRightFromSquare)) else Text:gsub(`{Text1}(.-){Text2}`, string.format("<font color=\"rgb(%d, %d, %d)\">%s</font>", math.floor(p2.R * 255), math.floor(p2.G * 255), math.floor(p2.B * 255), "%1")), p1
		end
	elseif p1.type == "strong" then
		return string.gsub(string.gsub(Text, Text1, "<b>"), Text2, "</b>"), nil
	else
		warn("Unknown wrapper type: " .. tostring(p1.type))
		
		return Text, nil
	end
end

local Callback = nil

local function resolveParams(p1, Params)
	-- upvalues: Callback (ref)
	if Params == nil then
		return nil
	end
	local t = {}
	
	for i, param in pairs(Params) do
		if type(param) == "string" then
			t[i] = param
		else
			t[i] = Callback(p1, param)
		end
	end
	return t
end

Callback = function(p2, p3)
	-- upvalues: FFlagUpdateTranslateInReportRevamp (copy), resolveParams (copy)
	if p3 == nil then
		return ""
	end
	if type(p3) == "string" then
		return p3
	end
	local Translate = p3["$translate"]
	local Params = p3.params
	local ResolveParamsResult = if FFlagUpdateTranslateInReportRevamp then resolveParams(p2, Params) else nil
	local Text = p2[Translate] or Translate
	
	if FFlagUpdateTranslateInReportRevamp and ResolveParamsResult ~= nil then
		Text = Text:gsub("{(.-)}", ResolveParamsResult)
	elseif Params ~= nil then
		Text = Text:gsub("{(.-)}", Params)
	end
	return (Text:gsub("{%w+Start}(.-)({%w+End})", "%1"):gsub("{%w+Start}", ""):gsub("{%w+End}", ""))
end

return {
	mergeTranslationParams = function(p2, List)
		if type(p2) == "string" then
			return p2
		end
		local Params = {}
		
		if p2.params then
			for i, param in pairs(p2.params) do
				Params[i] = param
			end
		end
		for i1, value in pairs(List) do
			Params[i1] = value
		end
		return {
			["$translate"] = p2["$translate"],
			params = Params,
			wrappers = p2.wrappers
		}
	end,
	translateIntoString = Callback,
	translateIntoRichTextString = function(p3, p4, p5)
		-- upvalues: FFlagUpdateTranslateInReportRevamp (copy), resolveParams (copy), getWrappedText (copy)
		if p4 == nil then
			return "", nil
		end
		if type(p4) == "string" then
			return p4, nil
		end
		if type(p4) ~= "table" then
			return tostring(p4), nil
		end
		local Translate = p4["$translate"]
		
		if not Translate or type(Translate) ~= "string" then
			return "", nil
		end
		local Params = p4.params
		local ResolveParamsResult = if FFlagUpdateTranslateInReportRevamp then resolveParams(p3, Params) else nil
		local Text = p3[Translate] or Translate
		local v1 = nil
		
		if FFlagUpdateTranslateInReportRevamp and ResolveParamsResult ~= nil then
			Text = Text:gsub("{(.-)}", ResolveParamsResult)
		elseif Params ~= nil then
			Text = Text:gsub("{(.-)}", Params)
		end
		if p4.wrappers then
			for _, wrapper in pairs(p4.wrappers) do
				local WrappedText2
				Text, WrappedText2 = getWrappedText(wrapper, Text, p5)
				
				if WrappedText2 ~= nil and v1 == nil then
					v1 = WrappedText2
				end
			end
		end
		return Text, v1
	end
}