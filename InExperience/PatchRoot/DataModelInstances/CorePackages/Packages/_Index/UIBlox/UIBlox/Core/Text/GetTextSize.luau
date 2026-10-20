local TextService = game:GetService("TextService")
local Parent = script.Parent.Parent.Parent
local FoundationModule = require(Parent.Parent.Foundation)
local NormalizeFontFaceFunction = FoundationModule.Utility.normalizeFontFace
local FoundationFontFaceMigration = FoundationModule.Utility.Flags.FoundationFontFaceMigration
local LoggerModule = require(Parent.Logger)
local GetLegacyFontModule = require(script.Parent.GetLegacyFont)
local _Vector2 = Vector2.new(2, 2)

return function(Text, Size, p1, Vector, p2)
	-- upvalues: FoundationFontFaceMigration (copy), GetLegacyFontModule (copy), TextService (copy), NormalizeFontFaceFunction (copy), _Vector2 (copy), LoggerModule (copy)
	local Success, Result, Result3 = pcall(function()
		-- upvalues: FoundationFontFaceMigration (upval), p2 (copy), GetLegacyFontModule (upval), p1 (copy), Vector (copy), TextService (upval), Text (copy), Size (copy), NormalizeFontFaceFunction (upval)
		if not FoundationFontFaceMigration or p2 then
			local GetTextBoundsParams = Instance.new("GetTextBoundsParams")
			GetTextBoundsParams.Font = if FoundationFontFaceMigration then NormalizeFontFaceFunction(p1) else Font.fromEnum(p1)
			GetTextBoundsParams.Size = Size
			GetTextBoundsParams.Text = Text
			GetTextBoundsParams.Width = Vector.X
			GetTextBoundsParams.RichText = p2 or false
			
			return TextService:GetTextBoundsAsync(GetTextBoundsParams), false
		end
		local LegacyFontModule, LegacyFontModule2 = GetLegacyFontModule(p1)
		
		if LegacyFontModule == nil then
			return nil, LegacyFontModule2
		end
		local IsLegacyFontModuleMatch: boolean = LegacyFontModule2 and LegacyFontModule == Enum.Font.Cartoon
		local X = Vector.X
		
		if X > 0 and X < 1e999 then
			if IsLegacyFontModuleMatch then
				X /= 1.01
			end
		else
			X = 1e999
		end
		return TextService:GetTextSize(Text, Size, LegacyFontModule, (Vector2.new(X, 1e999))), IsLegacyFontModuleMatch
	end)
	
	if Success and Result then
		local _Vector2_1 = Vector2.new(Result.X, (math.min(Result.Y, Vector.Y)))
		
		if Result3 then
			local Ceiled = math.ceil(_Vector2_1.X * 1.01)
			
			if Vector.X > 0 and Vector.X < 1e999 then
				Ceiled = math.min(Ceiled, Vector.X)
			end
			_Vector2_1 = Vector2.new(Ceiled, _Vector2_1.Y)
		end
		return _Vector2_1 + _Vector2
	elseif Success then
		LoggerModule:warning("Font cannot be measured, falling back to frame size")
		
		return Vector
	else
		LoggerModule:warning(`Text measurement failed, falling back to frame size. Error: {Result}`)
		
		return Vector
	end
end