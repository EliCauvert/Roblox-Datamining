local Foundation = script:FindFirstAncestor("Foundation")
local ReactModule = require(Foundation.Parent.React)
local _ = require(Foundation.Components.Types)
local UseTokensModule = require(Foundation.Providers.Style.useTokens)
local Context = ReactModule.createContext(nil)

function useBackgroundStyle()
	-- upvalues: ReactModule (copy), Context (copy), UseTokensModule (copy)
	local UseContextResult = ReactModule.useContext(Context)
	local UseTokensModuleResult = UseTokensModule()
	
	return if UseContextResult == nil then UseTokensModuleResult.Color.Surface.Surface_0 else UseContextResult
end

return {
	useBackgroundStyle = useBackgroundStyle,
	Provider = Context.Provider
}