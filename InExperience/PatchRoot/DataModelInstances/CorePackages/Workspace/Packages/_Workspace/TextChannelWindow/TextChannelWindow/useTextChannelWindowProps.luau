local parent = script.Parent.Parent
local reactModule = require(parent.React)
local useEventConnection = require(parent.ReactUtils).useEventConnection
local fFlagExpChatTextChannelWindowFontOverrideModule = require(script.Parent.Flags.FFlagExpChatTextChannelWindowFontOverride)

local function _(p1)
	local target = p1.Target
	
	return if target and target:IsA("TextChannel") then target else nil
end

local _ = function(p1)
	-- upvalues: fFlagExpChatTextChannelWindowFontOverrideModule (ref)
	return if fFlagExpChatTextChannelWindowFontOverrideModule then if p1.UseDefaultFont then nil else p1.FontFace else nil
end

return function(value)
	-- upvalues: reactModule (ref), useEventConnection (ref), fFlagExpChatTextChannelWindowFontOverrideModule (ref)
	local var1, var2 = reactModule.useState(function()
		-- upvalues: value (ref)
		local target = value.Target
		
		return if target and target:IsA("TextChannel") then target else nil
	end)
	local var3, var4 = reactModule.useState(function()
		-- upvalues: value (ref)
		return value.BackgroundColor3
	end)
	local var5 = reactModule.useRef(var1)
	useEventConnection(value:GetPropertyChangedSignal("Target"), function()
		-- upvalues: value (ref), var5 (ref), var2 (ref)
		local target = value.Target
		local var6 = if target and target:IsA("TextChannel") then target else nil
		var5.current = var6
		var2(var6)
	end, { value })
	useEventConnection(value:GetPropertyChangedSignal("BackgroundColor3"), function()
		-- upvalues: var4 (ref), value (ref)
		var4(value.BackgroundColor3)
	end, { value })
	local var6 = nil
	
	if fFlagExpChatTextChannelWindowFontOverrideModule then
		local _ = nil
		local var7, var8 = reactModule.useState(function()
			-- upvalues: value (ref), fFlagExpChatTextChannelWindowFontOverrideModule (copy)
			return if fFlagExpChatTextChannelWindowFontOverrideModule then if value.UseDefaultFont then nil else value.FontFace else nil
		end)
		var6 = var7
		local var9 = var8
		useEventConnection(value:GetPropertyChangedSignal("FontFace"), function()
			-- upvalues: var9 (write), value (ref), fFlagExpChatTextChannelWindowFontOverrideModule (copy)
			var9(if not fFlagExpChatTextChannelWindowFontOverrideModule then nil elseif value.UseDefaultFont then nil else value.FontFace)
		end, { value })
		useEventConnection(value:GetPropertyChangedSignal("UseDefaultFont"), function()
			-- upvalues: var9 (write), value (ref), fFlagExpChatTextChannelWindowFontOverrideModule (copy)
			var9(if not fFlagExpChatTextChannelWindowFontOverrideModule then nil elseif value.UseDefaultFont then nil else value.FontFace)
		end, { value })
	end
	return {
		target = var1,
		backgroundColor = var3,
		fontOverride = var6
	}
end