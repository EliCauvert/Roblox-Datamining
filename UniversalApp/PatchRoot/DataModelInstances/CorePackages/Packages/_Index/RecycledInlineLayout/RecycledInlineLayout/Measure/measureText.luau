local MarkdownCoreModule = require(script:FindFirstAncestor("RecycledInlineLayout").Parent.MarkdownCore)
local TextService = game:GetService("TextService")
local Tbl = {}
local Count = 0

local function _(p1): string
	return if p1 == nil then "" else `{p1.Family}|{p1.Weight.Value}|{p1.Style.Value}`
end

local function approximate(Text: string, Y, p1): Vector2
	if p1 then
		Text = string.gsub(string.gsub(Text, "<[^>]*>", ""), "&#?%w+;", "x")
	end
	return Vector2.new((utf8.len(Text) or #Text) * Y * 0.5, Y)
end

local function measure(Text, p1, Size, Enabled)
	-- upvalues: MarkdownCoreModule (copy), approximate (copy), TextService (copy)
	if MarkdownCoreModule.Utils.isCli() then
		return approximate(Text, Size, Enabled)
	end
	local GetTextBoundsParams = Instance.new("GetTextBoundsParams")
	GetTextBoundsParams.Text = Text
	GetTextBoundsParams.Size = Size
	GetTextBoundsParams.RichText = Enabled == true
	
	if p1 ~= nil then
		GetTextBoundsParams.Font = p1
	end
	local Success, Result = pcall(TextService.GetTextBoundsAsync, TextService, GetTextBoundsParams)
	
	if Success then
		return Result
	else
		GetTextBoundsParams.RichText = false
		
		return TextService:GetTextBoundsAsync(GetTextBoundsParams)
	end
end

return function(p1, p2, Size, p3)
	-- upvalues: Tbl (copy), Count (ref), measure (copy)
	if typeof(p2) == "EnumItem" then
		p2 = Font.fromEnum(p2)
	end
	local Text: string = `{Size}|{if p3 then 1 else 0}|{if p2 == nil then "" else `{p2.Family}|{p2.Weight.Value}|{p2.Style.Value}`}|{p1}`
	local Entry = Tbl[Text]
	
	if Entry then
		return Entry
	end
	if Count >= 4096 then
		table.clear(Tbl)
		Count = 0
	end
	local MeasureResult = measure(p1, p2, Size, p3)
	Tbl[Text] = MeasureResult
	Count += 1
	
	return MeasureResult
end