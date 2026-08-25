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

local function _(p1, p2)
	-- upvalues: dashModule (ref)
	return `<{p2.name}{dashModule.reduce(p2.attributes, function(p1, p2, p3)
		local var1 = if string.find(p2, "\"") then "'" else "\""
		
		return `{p1} {p3}={var1}{p2}{var1}`
	end, "")}>{p1}</{p2.name}>`
end

local _ = function(p1, p2)
	-- upvalues: escape (ref), dashModule (ref)
	return dashModule.reduce(p2, function(p1, p2)
		-- upvalues: dashModule (copy)
		return `<{p2.name}{dashModule.reduce(p2.attributes, function(p1, p2, p3)
			local var1 = if string.find(p2, "\"") then "'" else "\""
			
			return `{p1} {p3}={var1}{p2}{var1}`
		end, "")}>{p1}</{p2.name}>`
	end, escape.escapeRichFormatting(p1))
end

local t_1 = {}
t_1.__index = t_1
t_1.__type = inlineElementTypeModule

function t_1.new(p1, p2, p3)
	-- upvalues: t_1 (ref), dashModule (ref), textSplitByModule (ref), escape (ref)
	local tbl = setmetatable({}, t_1)
	tbl.props = p2
	tbl.mapProps = p3 or dashModule.identity
	tbl.Element = p1
	tbl.canForceSplit = tbl.splitBy ~= textSplitByModule.Symbol
	tbl.splitBy = if tbl.props.SplitBy then tbl.props.SplitBy else textSplitByModule.Word
	tbl.hasRichText = tbl.props.EngineTags ~= nil and next(tbl.props.EngineTags) ~= nil
	
	if tbl.hasRichText and tbl.props.Text then
		tbl.props = dashModule.assign(tbl.props, { Text = escape.unescapeRichFormatting(tbl.props.Text) })
	end
	return tbl
end

function t_1:_clone(p1)
	-- upvalues: t_1 (ref)
	return t_1.new(self.Element, p1 or self.props, self.mapProps)
end

local textService = game:GetService("TextService")

if isCli() then
	local t_2 = {}
	t_2.__index = t_2
	textService = setmetatable({}, t_2)
	
	function t_2.GetTextBoundsAsync(_)
		return { X = 100 }
	end
end
function t_1:getWidth()
	return self:_getWidth(self.props.Text)
end

function t_1:_getWidth(p1)
	-- upvalues: getFontFaceModule (ref), escape (ref), dashModule (ref), textService (write), t (ref)
	local getTextBoundsParams = Instance.new("GetTextBoundsParams")
	getTextBoundsParams.Font = getFontFaceModule(self.props.fontStyle)
	getTextBoundsParams.Size = self.props.fontStyle.FontSize
	getTextBoundsParams.Text = p1
	
	if self.hasRichText then
		getTextBoundsParams.Text = dashModule.reduce(self.props.EngineTags, function(p1, p2)
			-- upvalues: dashModule (copy)
			return `<{p2.name}{dashModule.reduce(p2.attributes, function(p1, p2, p3)
				local var1 = if string.find(p2, "\"") then "'" else "\""
				
				return `{p1} {p3}={var1}{p2}{var1}`
			end, "")}>{p1}</{p2.name}>`
		end, escape.escapeRichFormatting(p1))
		getTextBoundsParams.RichText = true
	end
	local ok, status = pcall(function()
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

function t_1:split(p1, p2)
	-- upvalues: splitTextModule (ref), textSplitByModule (ref), join (ref)
	local var1, var2 = splitTextModule(if self.canForceSplit and p2 then textSplitByModule.Symbol else self.splitBy, function(p1)
		-- upvalues: self (ref)
		return self:_getWidth(p1)
	end, self.props.Text, p1)
	local props = self:_clone(join(self.props, { Text = var1 }))
	
	if var2 then
		return props, self:_clone(join(self.props, { Text = var2:gsub("^%s*", "") }))
	end
	return props, nil
end

function t_1:render(p1, p2)
	-- upvalues: escape (ref), dashModule (ref), reactModule (ref), join (ref)
	return reactModule.createElement(self.Element, self.mapProps(join(self.props, {
		id = p1,
		Text = if self.hasRichText and self.props.Text and self.props.EngineTags then dashModule.reduce(self.props.EngineTags, function(p1, p2)
			-- upvalues: dashModule (copy)
			return `<{p2.name}{dashModule.reduce(p2.attributes, function(p1, p2, p3)
				local var1 = if string.find(p2, "\"") then "'" else "\""
				
				return `{p1} {p3}={var1}{p2}{var1}`
			end, "")}>{p1}</{p2.name}>`
		end, escape.escapeRichFormatting(self.props.Text)) else self.props.Text,
		RichText = self.hasRichText,
		AutomaticSize = Enum.AutomaticSize.XY,
		LayoutOrder = p2,
		key = tostring(p2),
		EngineTags = dashModule.None
	})))
end

return t_1