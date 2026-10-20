local Unknowns = {}
local Family = Font.fromEnum(Enum.Font.Cartoon).Family
local ComicNeueFontFamily = require(script.Parent.Parent.Parent.App.Style.Constants).ComicNeueFontFamily

local function _(p1): string
	return `{p1.Family}|{p1.Weight.Value}|{p1.Style.Value}`
end

for _, enumItem in Enum.Font:GetEnumItems() do
	if enumItem ~= Enum.Font.Unknown then
		local Success, Result = pcall(Font.fromEnum, enumItem)
		
		if Success then
			Unknowns[`{Result.Family}|{Result.Weight.Value}|{Result.Style.Value}`] = enumItem
		end
	end
end
local function getBuilderSansFallback(Weight)
	return if Enum.FontWeight.ExtraBold.Value <= Weight.Value then Enum.Font.BuilderSansExtraBold elseif Enum.FontWeight.SemiBold.Value <= Weight.Value then Enum.Font.BuilderSansBold elseif Enum.FontWeight.Medium.Value <= Weight.Value then Enum.Font.BuilderSansMedium else Enum.Font.BuilderSans
end

local _ = function(p1)
	-- upvalues: ComicNeueFontFamily (copy), Family (copy)
	return if p1.Family == ComicNeueFontFamily or p1.Family == Family then Enum.Font.Cartoon else nil
end

return function(Unknown)
	-- upvalues: Unknowns (copy), ComicNeueFontFamily (copy), Family (copy), getBuilderSansFallback (copy)
	if typeof(Unknown) ~= "EnumItem" then
		local Unknown1 = Unknowns[`{Unknown.Family}|{Unknown.Weight.Value}|{Unknown.Style.Value}`]
		
		if Unknown1 then
			return Unknown1, false
		end
		local Cartoon = if Unknown.Family == ComicNeueFontFamily or Unknown.Family == Family then Enum.Font.Cartoon else nil
		
		if Cartoon then
			return Cartoon, true
		else
			return getBuilderSansFallback(Unknown.Weight), true
		end
	elseif Unknown == Enum.Font.Unknown then
		return nil, false
	else
		return Unknown, false
	end
end