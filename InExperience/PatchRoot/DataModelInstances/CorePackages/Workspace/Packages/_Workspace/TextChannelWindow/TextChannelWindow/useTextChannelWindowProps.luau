local Parent = script.Parent.Parent
local ReactModule = require(Parent.React)
local UseEventConnectionFunction = require(Parent.ReactUtils).useEventConnection
local FFlagExpChatTextChannelWindowFontOverrideModule = require(script.Parent.Flags.FFlagExpChatTextChannelWindowFontOverride)

local function _(Mouse) --[[ Line: 23 | Named "resolveTarget" ]]
	local Target = Mouse.Target
	
	return if Target and Target:IsA("TextChannel") then Target else nil
end

local _ = function(Label) --[[ Line: 33 | Named "resolveFontOverride" ]]
	-- upvalues: FFlagExpChatTextChannelWindowFontOverrideModule (copy)
	return if FFlagExpChatTextChannelWindowFontOverrideModule then if Label.UseDefaultFont then nil else Label.FontFace else nil
end

return function(Label) --[[ Line: 43 | Named "useTextChannelWindowProps" ]]
	-- upvalues: ReactModule (copy), UseEventConnectionFunction (copy), FFlagExpChatTextChannelWindowFontOverrideModule (copy)
	local UseStateResult, UseStateResult2 = ReactModule.useState(function() --[[ Line: 44 ]]
		-- upvalues: Label (copy)
		local Target = Label.Target
		
		return if Target and Target:IsA("TextChannel") then Target else nil
	end)
	local UseStateResult1, UseStateResult2_1 = ReactModule.useState(function() --[[ Line: 48 ]]
		-- upvalues: Label (copy)
		return Label.BackgroundColor3
	end)
	local UseRefResult = ReactModule.useRef(UseStateResult)
	UseEventConnectionFunction(Label:GetPropertyChangedSignal("Target"), function() --[[ Line: 54 ]]
		-- upvalues: Label (copy), UseRefResult (copy), UseStateResult2 (copy)
		local Target = Label.Target
		local Target1 = if Target and Target:IsA("TextChannel") then Target else nil
		UseRefResult.current = Target1
		UseStateResult2(Target1)
	end, { Label })
	UseEventConnectionFunction(Label:GetPropertyChangedSignal("BackgroundColor3"), function() --[[ Line: 61 ]]
		-- upvalues: UseStateResult2_1 (copy), Label (copy)
		UseStateResult2_1(Label.BackgroundColor3)
	end, { Label })
	local FontOverride = nil
	
	if FFlagExpChatTextChannelWindowFontOverrideModule then
		local UseStateResult2_2 = nil
		FontOverride, UseStateResult2_2 = ReactModule.useState(function() --[[ Line: 69 ]]
			-- upvalues: Label (copy), FFlagExpChatTextChannelWindowFontOverrideModule (upval)
			return if FFlagExpChatTextChannelWindowFontOverrideModule then if Label.UseDefaultFont then nil else Label.FontFace else nil
		end)
		UseEventConnectionFunction(Label:GetPropertyChangedSignal("FontFace"), function() --[[ Line: 74 ]]
			-- upvalues: UseStateResult2_2 (ref), Label (copy), FFlagExpChatTextChannelWindowFontOverrideModule (upval)
			UseStateResult2_2(if FFlagExpChatTextChannelWindowFontOverrideModule then if Label.UseDefaultFont then nil else Label.FontFace else nil)
		end, { Label })
		UseEventConnectionFunction(Label:GetPropertyChangedSignal("UseDefaultFont"), function() --[[ Line: 79 ]]
			-- upvalues: UseStateResult2_2 (ref), Label (copy), FFlagExpChatTextChannelWindowFontOverrideModule (upval)
			UseStateResult2_2(if FFlagExpChatTextChannelWindowFontOverrideModule then if Label.UseDefaultFont then nil else Label.FontFace else nil)
		end, { Label })
	end
	return {
		target = UseStateResult,
		backgroundColor = UseStateResult1,
		fontOverride = FontOverride
	}
end