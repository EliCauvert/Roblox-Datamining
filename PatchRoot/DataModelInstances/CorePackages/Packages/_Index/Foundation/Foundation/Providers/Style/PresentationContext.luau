-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:42:27 2026 Pacific Standard Time.

local foundation = script:FindFirstAncestor("Foundation")
local reactModule = require(foundation.Parent.React)
local var2 = reactModule.createContext({
	isIconSize = false,
	colorNamespace = require(foundation.Enums.ColorNamespace).Color
})

return {
	Provider = var2.Provider,
	usePresentationContext = function() --[[ line: 19 ]]
		-- upvalues: reactModule (ref), var2 (ref)
		return reactModule.useContext(var2)
	end
}