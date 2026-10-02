local constantsModule = require(script.Parent.Parent.Parent.App.Style.Constants)
local t = {}
local family = Font.fromEnum(Enum.Font.Cartoon).Family
local comicNeueFontFamily = constantsModule.ComicNeueFontFamily

local function _(p1)
	return `{p1.Family}|{p1.Weight.Value}|{p1.Style.Value}`
end

for i, v in Enum.Font:GetEnumItems() do
	if v ~= Enum.Font.Unknown then
		local ok, status = pcall(Font.fromEnum, v)
		
		if ok then
			t[`{status.Family}|{status.Weight.Value}|{status.Style.Value}`] = v
		end
	end
end
local function getBuilderSansFallback(p1)
	return if Enum.FontWeight.ExtraBold.Value <= p1.Value then Enum.Font.BuilderSansExtraBold elseif Enum.FontWeight.SemiBold.Value <= p1.Value then Enum.Font.BuilderSansBold elseif Enum.FontWeight.Medium.Value <= p1.Value then Enum.Font.BuilderSansMedium else Enum.Font.BuilderSans
end

local _ = function(p1)
	-- upvalues: comicNeueFontFamily (ref), family (ref)
	return if p1.Family == comicNeueFontFamily or p1.Family == family then Enum.Font.Cartoon else nil
end

return function(p1)
	-- upvalues: t (ref), comicNeueFontFamily (ref), family (ref), getBuilderSansFallback (ref)
	if typeof(p1) == "EnumItem" then
		if p1 == Enum.Font.Unknown then
			return nil, false
		end
		return p1, false
	else
		local family_1 = t[`{p1.Family}|{p1.Weight.Value}|{p1.Style.Value}`]
		
		if family_1 then
			return family_1, false
		end
		local var1 = if p1.Family == comicNeueFontFamily or p1.Family == family then Enum.Font.Cartoon else nil
		
		if var1 then
			return var1, true
		end
		return getBuilderSansFallback(p1.Weight), true
	end
end