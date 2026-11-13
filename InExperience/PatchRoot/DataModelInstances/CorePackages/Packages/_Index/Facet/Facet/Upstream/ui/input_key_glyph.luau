local _ = require("./types")
local _ = require("../vendor/compose/core")
local config = {
	Return = "Enter",
	KeypadEnter = "Enter",
	Escape = "Esc",
	Space = "Space",
	Backspace = "Delete",
	Tab = "Tab",
	LeftShift = "Shift",
	RightShift = "Shift",
	LeftControl = "Ctrl",
	RightControl = "Ctrl",
	LeftAlt = "Alt",
	RightAlt = "Alt"
}

return function(p1, KeyCode)
	-- upvalues: config (copy)
	local Host = p1.Host
	local Compose = p1.Compose
	local ReadFunction = p1.read
	local ReadFunction1 = p1.read
	local ReadFunction2 = p1.read
	local TypesUDim2 = p1.types.UDim2
	local TypesEnum = p1.types.Enum
	local TenFootResult = p1.tenFoot()
	
	return function(p2, p3, p4)
		-- upvalues: p1 (copy), Compose (copy), ReadFunction (copy), ReadFunction1 (copy), Host (copy), TypesUDim2 (copy), TypesEnum (copy), TenFootResult (copy), ReadFunction2 (copy), KeyCode (copy), config (upval)
		local UserInputService = p1.config.services.UserInputService
		local FormulaResult = Compose.formula(function(p5)
			-- upvalues: ReadFunction (upval), p4 (copy), ReadFunction1 (upval), UserInputService (copy)
			local ReadResult = ReadFunction(p4.image, p5)
			
			if ReadResult and ReadResult.SourceType and ReadResult.SourceType.Name ~= "None" then
				return ReadResult
			end
			local ReadResult1 = ReadFunction1(p4.key, p5)
			
			if ReadResult1 and UserInputService and UserInputService.GetImageForKeyCode then
				local Success, Result = pcall(UserInputService.GetImageForKeyCode, UserInputService, ReadResult1)
				
				if Success and type(Result) == "string" and Result ~= "" then
					return Result
				end
			end
			return nil
		end)
		
		return Host.Frame(p2)({
			Size = TypesUDim2.fromOffset(0, 0),
			AutomaticSize = TypesEnum.AutomaticSize.XY,
			BackgroundTransparency = 1,
			Compose.keyed({
				from = function(Callback)
					-- upvalues: FormulaResult (copy)
					local CallbackResult = Callback(FormulaResult)
					
					return {
						if CallbackResult == nil then "text" elseif type(CallbackResult) == "string" then "Image" else "ImageContent"
					}
				end,
				render = function(_, _, p5)
					-- upvalues: p1 (upval), p3 (copy), TenFootResult (upval), TypesUDim2 (upval), FormulaResult (copy), Host (upval), ReadFunction2 (upval), p4 (copy), UserInputService (copy), ReadFunction1 (upval), KeyCode (upval), config (upval), TypesEnum (upval)
					if p5 == "text" then
						return p1.text({
							Name = "Key",
							Text = function(p6)
								-- upvalues: ReadFunction2 (upval), p4 (upval), UserInputService (upval), ReadFunction1 (upval), KeyCode (upval), config (upval)
								local ReadResult = ReadFunction2(p4.name, p6)
								
								if ReadResult and ReadResult ~= "" then
									return ReadResult
								end
								local List = {}
								
								for _, value in {
									ReadFunction1(p4.primary, p6),
									ReadFunction1(p4.secondary, p6),
									ReadFunction1(p4.key, p6)
								} do
									if value and value ~= KeyCode then
										local v1 = true
										local Entry = config[value.Name] or ""
										
										if Entry == "" and UserInputService and UserInputService.GetStringForKeyCode then
											v1, Entry = pcall(function()
												-- upvalues: UserInputService (copy), value (copy)
												return UserInputService:GetStringForKeyCode(value)
											end)
										end
										local Text = if v1 and type(Entry) == "string" then Entry else ""
										
										if string.match(Text, "^%s*$") then
											Text = config[value.Name] or value.Name
										end
										table.insert(List, Text)
									end
								end
								return table.concat(List, "+")
							end,
							AutomaticSize = TypesEnum.AutomaticSize.XY
						}, nil, "caption")
					end
					local config1 = {
						Name = "Glyph",
						BackgroundTransparency = 1,
						Size = function(p6)
							-- upvalues: p1 (upval), p3 (upval), TenFootResult (upval), TypesUDim2 (upval)
							local IconSize = p1.controlSize(p3, "iconSize", p6)
							
							if TenFootResult(p6) then
								IconSize = math.max(IconSize, p1.metric("typography.control.size", p6))
							end
							return TypesUDim2.fromOffset(IconSize, IconSize)
						end
					}
					
					if p5 == "Image" then
						function config1.Image(Callback)
							-- upvalues: FormulaResult (upval)
							local CallbackResult = Callback(FormulaResult)
							assert(type(CallbackResult) == "string")
							
							return CallbackResult
						end
						
						return p1.styled(Host.ImageLabel(config1), "shortcut-glyph")
					else
						function config1.ImageContent(Callback)
							-- upvalues: FormulaResult (upval)
							local CallbackResult = Callback(FormulaResult)
							assert(typeof(CallbackResult) == "Content")
							
							return CallbackResult
						end
						
						return p1.styled(Host.ImageLabel(config1), "shortcut-glyph")
					end
				end
			})
		})
	end
end