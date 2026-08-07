-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:42:40 2026 Pacific Standard Time.

local parent = script:FindFirstAncestor("Components").Parent
local parent_1 = parent.Parent
local reactModule = require(parent_1.React)
local dashModule = require(parent_1.Dash)
local isCli = require(parent_1.MarkdownCore).Utils.isCli
local textSplitByModule = require(parent.Enums.TextSplitBy)
local splitTextModule = require(parent.Utils.SplitText)
local _ = require(parent.Types)
local escape = require(parent_1.MarkdownCore).Utils.Escape
local inlineElementTypeModule = require(parent.Utils.InlineElementType)
local getFontFaceModule = require(parent.Utils.getFontFace)
local join = dashModule.join
local t = {}

local function _(p0, p1) --[[ line: 61 | named "formatTextWithEngineTag" ]]
	-- upvalues: dashModule (ref)
	return `<{p1.name}{dashModule.reduce(p1.attributes, function(p2, p3, p4) --[[ line: 62 ]]
		local var10 = if string.find(p3, "\"") then "'" else "\""
		
		return `{p2} {p4}={var10}{p3}{var10}`
	end, "")}>{p0}</{p1.name}>`
end

local _ = function(p5, p6) --[[ line: 70 | named "getRichText" ]]
	-- upvalues: escape (ref), dashModule (ref)
	return dashModule.reduce(p6, function(p7, p8) --[[ line: 72 ]]
		-- upvalues: dashModule (copy)
		return `<{p8.name}{dashModule.reduce(p8.attributes, function(p9, p10, p11) --[[ line: 62 ]]
			local var10 = if string.find(p10, "\"") then "'" else "\""
			
			return `{p9} {p11}={var10}{p10}{var10}`
		end, "")}>{p7}</{p8.name}>`
	end, escape.escapeRichFormatting(p5))
end

local t_1 = {}
t_1.__index = t_1
t_1.__type = inlineElementTypeModule

function t_1.new(p12, p13, p14) --[[ line: 82 ]]
	-- upvalues: t_1 (ref), dashModule (ref), textSplitByModule (ref), escape (ref)
	local tbl = setmetatable({}, t_1)
	tbl.props = p13
	tbl.mapProps = p14 or dashModule.identity
	tbl.Element = p12
	tbl.canForceSplit = tbl.splitBy ~= textSplitByModule.Symbol
	tbl.splitBy = if tbl.props.SplitBy then tbl.props.SplitBy else textSplitByModule.Word
	tbl.hasRichText = tbl.props.EngineTags ~= nil and next(tbl.props.EngineTags) ~= nil
	
	if tbl.hasRichText and tbl.props.Text then
		tbl.props = dashModule.assign(tbl.props, { Text = escape.unescapeRichFormatting(tbl.props.Text) })
	end
	return tbl
end

function t_1:_clone(p15) --[[ line: 116 ]]
	-- upvalues: t_1 (ref)
	return t_1.new(self.Element, p15 or self.props, self.mapProps)
end

local textService = game:GetService("TextService")

if isCli() then
	local t_2 = {}
	t_2.__index = t_2
	textService = setmetatable({}, t_2)
	
	function t_2.GetTextBoundsAsync(_) --[[ line: 127 ]]
		return { X = 100 }
	end
end
function t_1:getWidth() --[[ line: 132 ]]
	return self:_getWidth(self.props.Text)
end

function t_1:_getWidth(p16) --[[ line: 136 ]]
	-- upvalues: getFontFaceModule (ref), escape (ref), dashModule (ref), textService (write), t (ref)
	local getTextBoundsParams = Instance.new("GetTextBoundsParams")
	getTextBoundsParams.Font = getFontFaceModule(self.props.fontStyle)
	getTextBoundsParams.Size = self.props.fontStyle.FontSize
	getTextBoundsParams.Text = p16
	
	if self.hasRichText then
		getTextBoundsParams.Text = dashModule.reduce(self.props.EngineTags, function(p17, p18) --[[ line: 72 ]]
			-- upvalues: dashModule (copy)
			return `<{p18.name}{dashModule.reduce(p18.attributes, function(p19, p20, p21) --[[ line: 62 ]]
				local var10 = if string.find(p20, "\"") then "'" else "\""
				
				return `{p19} {p21}={var10}{p20}{var10}`
			end, "")}>{p17}</{p18.name}>`
		end, escape.escapeRichFormatting(p16))
		getTextBoundsParams.RichText = true
	end
	local ok, status = pcall(function() --[[ line: 148 ]]
		-- upvalues: textService (copy), getTextBoundsParams (ref)
		return textService:GetTextBoundsAsync(getTextBoundsParams).X
	end)
	
	if ok then
		return status
	elseif not t[getTextBoundsParams.Text] then
		t[getTextBoundsParams.Text] = true
		warn(`Failed to get width for the {getTextBoundsParams.Text} in BaseTextElement`)
	end
	getTextBoundsParams.RichText = false
	
	return textService:GetTextBoundsAsync(getTextBoundsParams).X
end

function t_1:split(p22, p23) --[[ line: 166 ]]
	-- upvalues: splitTextModule (ref), textSplitByModule (ref), join (ref)
	local var13, var14 = splitTextModule(if self.canForceSplit and p23 then textSplitByModule.Symbol else self.splitBy, function(p24) --[[ line: 168 ]]
		-- upvalues: self (ref)
		return self:_getWidth(p24)
	end, self.props.Text, p22)
	local props = self:_clone(join(self.props, { Text = var13 }))
	
	if var14 then
		return props, self:_clone(join(self.props, { Text = var14:gsub("^%s*", "") }))
	end
	return props, nil
end

function t_1:render(p25, p26) --[[ line: 179 ]]
	-- upvalues: escape (ref), dashModule (ref), reactModule (ref), join (ref)
	return reactModule.createElement(self.Element, self.mapProps(join(self.props, {
		id = p25,
		Text = if self.hasRichText and self.props.Text and self.props.EngineTags then dashModule.reduce(self.props.EngineTags, function(p27, p28) --[[ line: 72 ]]
			-- upvalues: dashModule (copy)
			return `<{p28.name}{dashModule.reduce(p28.attributes, function(p29, p30, p31) --[[ line: 62 ]]
				local var10 = if string.find(p30, "\"") then "'" else "\""
				
				return `{p29} {p31}={var10}{p30}{var10}`
			end, "")}>{p27}</{p28.name}>`
		end, escape.escapeRichFormatting(self.props.Text)) else self.props.Text,
		RichText = self.hasRichText,
		AutomaticSize = Enum.AutomaticSize.XY,
		LayoutOrder = p26,
		key = tostring(p26),
		EngineTags = dashModule.None
	})))
end

return t_1