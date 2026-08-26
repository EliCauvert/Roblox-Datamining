local foundation = script:FindFirstAncestor("Foundation")
local reactModule = require(foundation.Parent.React)
local _ = require(foundation.Components.Types)
local useTokensModule = require(foundation.Providers.Style.useTokens)
local var1 = reactModule.createContext(nil)

function useBackgroundStyle()
	-- upvalues: reactModule (ref), var1 (ref), useTokensModule (ref)
	local var2 = reactModule.useContext(var1)
	
	return if var2 == nil then useTokensModule().Color.Surface.Surface_0 else var2
end

return {
	useBackgroundStyle = useBackgroundStyle,
	Provider = var1.Provider
}