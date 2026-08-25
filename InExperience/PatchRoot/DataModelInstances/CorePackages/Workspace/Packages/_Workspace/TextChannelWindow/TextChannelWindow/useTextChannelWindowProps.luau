local parent = script.Parent.Parent
local reactModule = require(parent.React)
local useEventConnection = require(parent.ReactUtils).useEventConnection
local fFlagExpChatTextChannelWindowFontOverrideModule = require(script.Parent.Flags.FFlagExpChatTextChannelWindowFontOverride)

local function _(p0)
	local target = p0.Target
	
	return if target and target:IsA("TextChannel") then target else nil
end

local _ = function(p1)
	-- upvalues: fFlagExpChatTextChannelWindowFontOverrideModule (ref)
	return if fFlagExpChatTextChannelWindowFontOverrideModule then if p1.UseDefaultFont then nil else p1.FontFace else nil
end

return function(value)
	-- upvalues: reactModule (ref), useEventConnection (ref), fFlagExpChatTextChannelWindowFontOverrideModule (ref)
	local var2, var3 = reactModule.useState(function()
		-- upvalues: value (ref)
		local target = value.Target
		
		return if target and target:IsA("TextChannel") then target else nil
	end)
	local var4, var5 = reactModule.useState(function()
		-- upvalues: value (ref)
		return value.BackgroundColor3
	end)
	local var6 = reactModule.useRef(var2)
	useEventConnection(value:GetPropertyChangedSignal("Target"), function()
		-- upvalues: value (ref), var6 (ref), var3 (ref)
		local target = value.Target
		local var11 = if target and target:IsA("TextChannel") then target else nil
		var6.current = var11
		var3(var11)
	end, { value })
	useEventConnection(value:GetPropertyChangedSignal("BackgroundColor3"), function()
		-- upvalues: var5 (ref), value (ref)
		var5(value.BackgroundColor3)
	end, { value })
	local var7 = nil
	
	if fFlagExpChatTextChannelWindowFontOverrideModule then
		local _ = nil
		local var8, var9 = reactModule.useState(function()
			-- upvalues: value (ref), fFlagExpChatTextChannelWindowFontOverrideModule (copy)
			return if fFlagExpChatTextChannelWindowFontOverrideModule then if value.UseDefaultFont then nil else value.FontFace else nil
		end)
		var7 = var8
		local var10 = var9
		useEventConnection(value:GetPropertyChangedSignal("FontFace"), function()
			-- upvalues: var10 (write), value (ref), fFlagExpChatTextChannelWindowFontOverrideModule (copy)
			var10(if not fFlagExpChatTextChannelWindowFontOverrideModule then nil elseif value.UseDefaultFont then nil else value.FontFace)
		end, { value })
		useEventConnection(value:GetPropertyChangedSignal("UseDefaultFont"), function()
			-- upvalues: var10 (write), value (ref), fFlagExpChatTextChannelWindowFontOverrideModule (copy)
			var10(if not fFlagExpChatTextChannelWindowFontOverrideModule then nil elseif value.UseDefaultFont then nil else value.FontFace)
		end, { value })
	end
	return {
		target = var2,
		backgroundColor = var4,
		fontOverride = var7
	}
end