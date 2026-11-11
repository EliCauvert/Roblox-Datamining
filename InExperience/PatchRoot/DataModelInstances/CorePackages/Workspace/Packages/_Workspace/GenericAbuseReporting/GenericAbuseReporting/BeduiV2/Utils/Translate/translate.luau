local GenericAbuseReporting = script:FindFirstAncestor("GenericAbuseReporting")
local Parent = GenericAbuseReporting.Parent
local FoundationModule = require(Parent.Foundation)
local GetIconRichTextFunction = FoundationModule.Utility.getIconRichText
local IconName = FoundationModule.Enums.IconName
local FFlagAbuseReportTranslateColorWrapperModule = require(GenericAbuseReporting.Flags.FFlagAbuseReportTranslateColorWrapper)
local FFlagUpdateTranslateInReportRevamp = require(Parent.SharedFlags).FFlagUpdateTranslateInReportRevamp

local function getWrappedText(p1, Text: string)
	-- upvalues: GetIconRichTextFunction (copy), IconName (copy)
	local Text1 = "{" .. p1.type .. "Start}"
	local Text2 = "{" .. p1.type .. "End}"
	
	if p1.type == "link" then
		if Text:find(Text1) == nil or Text:find(Text2) == nil then
			return Text, nil
		else
			return string.gsub(Text, `{Text1}(.-){Text2}`, "%1 " .. GetIconRichTextFunction(IconName.ArrowUpRightFromSquare)), p1
		end
	elseif p1.type == "strong" then
		return string.gsub(string.gsub(Text, Text1, "<b>"), Text2, "</b>"), nil
	else
		warn("Unknown wrapper type: " .. tostring(p1.type))
		
		return Text, nil
	end
end

local function getWrappedTextByKey(Text: string, p1, Text1: string, p2, p3)
	-- upvalues: GetIconRichTextFunction (copy), IconName (copy)
	local Replaced = string.gsub(Text, "%p", "%%%0")
	local Text2 = "{" .. Replaced .. "Start}"
	local Text3 = "{" .. Replaced .. "End}"
	
	if p1.type == "link" then
		if Text1:find(Text2) == nil or Text1:find(Text3) == nil then
			return Text1, nil
		end
		local Text4 = (if p3 then "<u>%1</u>" else "%1") .. " " .. GetIconRichTextFunction(IconName.ArrowUpRightFromSquare)
		
		if p1.variant == "link" and p2 then
			Text4 = `<font color="{p4}">{Text4}</font>`
		end
		return string.gsub(Text1, `{Text2}(.-){Text3}`, Text4), p1
	elseif p1.type == "strong" then
		return string.gsub(string.gsub(Text1, Text2, "<b>"), Text3, "</b>"), nil
	else
		return Text1, nil
	end
end

local W: string = if FFlagAbuseReportTranslateColorWrapperModule then "[%w_%.%-]+" else "%w+"
local Text = "{" .. W .. "Start}"
local Text1 = "{" .. W .. "End}"

local function _(Text2: string)
	-- upvalues: Text (copy), Text1 (copy)
	return (Text2:gsub(Text .. "(.-)(" .. Text1 .. ")", "%1"):gsub(Text, ""):gsub(Text1, ""))
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
	-- upvalues: FFlagUpdateTranslateInReportRevamp (copy), resolveParams (copy), Text (copy), Text1 (copy)
	if p3 == nil then
		return ""
	end
	if type(p3) == "string" then
		return p3
	end
	local Translate = p3["$translate"]
	local Params = p3.params
	local ResolveParamsResult = if FFlagUpdateTranslateInReportRevamp then resolveParams(p2, Params) else nil
	local Text2 = p2[Translate] or Translate
	
	if FFlagUpdateTranslateInReportRevamp and ResolveParamsResult ~= nil then
		Text2 = Text2:gsub("{(.-)}", ResolveParamsResult)
	elseif Params ~= nil then
		Text2 = Text2:gsub("{(.-)}", Params)
	end
	return (Text2:gsub(Text .. "(.-)(" .. Text1 .. ")", "%1"):gsub(Text, ""):gsub(Text1, ""))
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
	translateIntoRichTextString = function(p3, p4, p5, p6)
		-- upvalues: FFlagUpdateTranslateInReportRevamp (copy), resolveParams (copy), FFlagAbuseReportTranslateColorWrapperModule (copy), getWrappedTextByKey (copy), Text (copy), Text1 (copy), getWrappedText (copy)
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
		local Text2 = p3[Translate] or Translate
		local v1 = nil
		
		if FFlagUpdateTranslateInReportRevamp and ResolveParamsResult ~= nil then
			Text2 = Text2:gsub("{(.-)}", ResolveParamsResult)
		elseif Params ~= nil then
			Text2 = Text2:gsub("{(.-)}", Params)
		end
		if FFlagAbuseReportTranslateColorWrapperModule then
			if p4.wrappers then
				for i, wrapper in pairs(p4.wrappers) do
					local WrappedTextByKey2
					Text2, WrappedTextByKey2 = getWrappedTextByKey(i, wrapper, Text2, p5, p6)
					
					if WrappedTextByKey2 ~= nil and v1 == nil then
						v1 = WrappedTextByKey2
					end
				end
			end
			Text2 = Text2:gsub(Text .. "(.-)(" .. Text1 .. ")", "%1"):gsub(Text, ""):gsub(Text1, "")
			
			return Text2, v1
		else
			if p4.wrappers then
				for _, wrapper1 in pairs(p4.wrappers) do
					local WrappedText2
					Text2, WrappedText2 = getWrappedText(wrapper1, Text2)
					
					if WrappedText2 ~= nil and v1 == nil then
						v1 = WrappedText2
					end
				end
			end
			return Text2, v1
		end
	end
}