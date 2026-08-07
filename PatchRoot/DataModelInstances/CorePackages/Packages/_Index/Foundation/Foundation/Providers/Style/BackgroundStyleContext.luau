-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:42:27 2026 Pacific Standard Time.

local foundation = script:FindFirstAncestor("Foundation")
local reactModule = require(foundation.Parent.React)
local _ = require(foundation.Components.Types)
local useTokensModule = require(foundation.Providers.Style.useTokens)
local var3 = reactModule.createContext(nil)

function useBackgroundStyle() --[[ line: 11 ]]
	-- upvalues: reactModule (ref), var3 (ref), useTokensModule (ref)
	local var4 = reactModule.useContext(var3)
	
	return if var4 == nil then useTokensModule().Color.Surface.Surface_0 else var4
end

return {
	useBackgroundStyle = useBackgroundStyle,
	Provider = var3.Provider
}