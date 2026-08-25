local foundation = script:FindFirstAncestor("Foundation")
local reactModule = require(foundation.Parent.React)
local _ = require(foundation.Components.Types)
local useTokensModule = require(foundation.Providers.Style.useTokens)
local var3 = reactModule.createContext(nil)

function useBackgroundStyle()
	-- upvalues: reactModule (ref), var3 (ref), useTokensModule (ref)
	local var4 = reactModule.useContext(var3)
	
	return if var4 == nil then useTokensModule().Color.Surface.Surface_0 else var4
end

return {
	useBackgroundStyle = useBackgroundStyle,
	Provider = var3.Provider
}