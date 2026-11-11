local Parent = script:FindFirstAncestor("Components").Parent
local Parent1 = Parent.Parent
local ReactModule = require(Parent1.React)
local DashModule = require(Parent1.Dash)
local IsCliFunction = require(Parent1.MarkdownCore).Utils.isCli
local TextSplitByModule = require(Parent.Enums.TextSplitBy)
local SplitTextModule = require(Parent.Utils.SplitText)
local _ = require(Parent.Types)
local Escape = require(Parent1.MarkdownCore).Utils.Escape
local GetFontFaceModule = require(Parent.Utils.getFontFace)
local JoinFunction = DashModule.join
local t = {}

local function _(p1, p2): string
	-- upvalues: DashModule (copy)
	return `<{p2.name}{DashModule.reduce(p2.attributes, function(p3, Text: string, p4): string
		local v1: string = if string.find(Text, "\"") then "'" else "\""
		
		return `{p3} {p4}={v1}{Text}{v1}`
	end, "")}>{p1}</{p2.name}>`
end

local _ = function(p1, p2)
	-- upvalues: Escape (copy), DashModule (copy)
	return (DashModule.reduce(p2, function(p3, p4): string
		-- upvalues: DashModule (upval)
		return `<{p4.name}{DashModule.reduce(p4.attributes, function(p5, Text: string, p6): string
			local v1: string = if string.find(Text, "\"") then "'" else "\""
			
			return `{p5} {p6}={v1}{Text}{v1}`
		end, "")}>{p3}</{p4.name}>`
	end, (Escape.escapeRichFormatting(p1))))
end

local BaseTextElementModule = {}
BaseTextElementModule.__index = BaseTextElementModule
BaseTextElementModule.__type = require(Parent.Utils.InlineElementType)

function BaseTextElementModule.new(Element, Props, MapProps)
	-- upvalues: BaseTextElementModule (copy), DashModule (copy), TextSplitByModule (copy), Escape (copy)
	local self = setmetatable({}, BaseTextElementModule)
	self.props = Props
	self.mapProps = MapProps or DashModule.identity
	self.Element = Element
	self.canForceSplit = self.splitBy ~= TextSplitByModule.Symbol
	self.splitBy = if self.props.SplitBy then self.props.SplitBy else TextSplitByModule.Word
	self.hasRichText = self.props.EngineTags ~= nil and next(self.props.EngineTags) ~= nil
	
	if self.hasRichText and self.props.Text then
		self.props = DashModule.assign(self.props, { Text = Escape.unescapeRichFormatting(self.props.Text) })
	end
	return self
end

function BaseTextElementModule:_clone(p1)
	-- upvalues: BaseTextElementModule (copy)
	return BaseTextElementModule.new(self.Element, p1 or self.props, self.mapProps)
end

local TextService = game:GetService("TextService")

if IsCliFunction() then
	local Module = {}
	Module.__index = Module
	TextService = setmetatable({}, Module)
	
	function Module:GetTextBoundsAsync()
		return { X = 100 }
	end
end
function BaseTextElementModule:getWidth()
	return self:_getWidth(self.props.Text)
end

function BaseTextElementModule:_getWidth(Text)
	-- upvalues: GetFontFaceModule (copy), Escape (copy), DashModule (copy), TextService (ref), t (copy)
	local GetTextBoundsParams = Instance.new("GetTextBoundsParams")
	GetTextBoundsParams.Font = GetFontFaceModule(self.props.fontStyle)
	GetTextBoundsParams.Size = self.props.fontStyle.FontSize
	GetTextBoundsParams.Text = Text
	
	if self.hasRichText then
		GetTextBoundsParams.Text = DashModule.reduce(self.props.EngineTags, function(p1, p2): string
			-- upvalues: DashModule (upval)
			return `<{p2.name}{DashModule.reduce(p2.attributes, function(p3, Text: string, p4): string
				local v1: string = if string.find(Text, "\"") then "'" else "\""
				
				return `{p3} {p4}={v1}{Text}{v1}`
			end, "")}>{p1}</{p2.name}>`
		end, (Escape.escapeRichFormatting(Text)))
		GetTextBoundsParams.RichText = true
	end
	local Success, Result = pcall(function()
		-- upvalues: TextService (upval), GetTextBoundsParams (copy)
		return TextService:GetTextBoundsAsync(GetTextBoundsParams).X
	end)
	
	if Success then
		return Result
	end
	if not t[GetTextBoundsParams.Text] then
		t[GetTextBoundsParams.Text] = true
		warn(`Failed to get width for the {GetTextBoundsParams.Text} in BaseTextElement`)
	end
	GetTextBoundsParams.RichText = false
	
	return TextService:GetTextBoundsAsync(GetTextBoundsParams).X
end

function BaseTextElementModule:split(p1, p2)
	-- upvalues: SplitTextModule (copy), TextSplitByModule (copy), JoinFunction (copy)
	local SplitTextModuleResult, SplitTextModuleResult2 = SplitTextModule(if self.canForceSplit and p2 then TextSplitByModule.Symbol else self.splitBy, function(p3)
		-- upvalues: self (copy)
		return self:_getWidth(p3)
	end, self.props.Text, p1)
	local CloneResult = self:_clone(JoinFunction(self.props, { Text = SplitTextModuleResult }))
	
	if SplitTextModuleResult2 then
		return CloneResult, (self:_clone(JoinFunction(self.props, { Text = SplitTextModuleResult2:gsub("^%s*", "") })))
	else
		return CloneResult, nil
	end
end

function BaseTextElementModule:render(Id, LayoutOrder)
	-- upvalues: Escape (copy), DashModule (copy), ReactModule (copy), JoinFunction (copy)
	return ReactModule.createElement(self.Element, self.mapProps(JoinFunction(self.props, {
		id = Id,
		Text = if self.hasRichText and self.props.Text and self.props.EngineTags then DashModule.reduce(self.props.EngineTags, function(p1, p2): string
			-- upvalues: DashModule (upval)
			return `<{p2.name}{DashModule.reduce(p2.attributes, function(p3, Text: string, p4): string
				local v1: string = if string.find(Text, "\"") then "'" else "\""
				
				return `{p3} {p4}={v1}{Text}{v1}`
			end, "")}>{p1}</{p2.name}>`
		end, (Escape.escapeRichFormatting(self.props.Text))) else self.props.Text,
		RichText = self.hasRichText,
		AutomaticSize = Enum.AutomaticSize.XY,
		LayoutOrder = LayoutOrder,
		key = tostring(LayoutOrder),
		EngineTags = DashModule.None
	})))
end

return BaseTextElementModule