local ChatUIPrimitives = script:FindFirstAncestor("ChatUIPrimitives")
local Parent = ChatUIPrimitives.Parent
local ReactModule = require(Parent.React)
local FoundationModule = require(Parent.Foundation)
local FFlagExpChatIdentityDisplayColorModule = require(ChatUIPrimitives.Flags.FFlagExpChatIdentityDisplayColor)
local _ = require(script.Parent.Parent.Types)

return function(p1)
	-- upvalues: FoundationModule (copy), ReactModule (copy), FFlagExpChatIdentityDisplayColorModule (copy)
	local Default = FoundationModule.Hooks.useTokens().Color.Content.Default
	local UseMemoResult = ReactModule.useMemo(function()
		-- upvalues: p1 (copy), Default (copy)
		return p1:map(function(p2)
			-- upvalues: Default (upval)
			return if p2 and p2.displayColor then {
				Color3 = p2.displayColor,
				Transparency = Default.Transparency
			} else Default
		end)
	end, { p1, Default })
	
	return if FFlagExpChatIdentityDisplayColorModule then UseMemoResult else nil
end