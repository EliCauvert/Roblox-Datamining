local Foundation = script:FindFirstAncestor("Foundation")
local _ = require(Foundation.Enums.Device)
local ReactModule = require(Foundation.Parent.React)
local _ = require(Foundation.Enums.Theme)
local _ = require(Foundation.Providers.Style.Tokens)
local StyleSheetRegistryModule = require(Foundation.StyleSheet.StyleSheetRegistry)

return function(p1, p2, p3, p4)
	-- upvalues: ReactModule (copy), StyleSheetRegistryModule (copy)
	local UseRefResult = ReactModule.useRef({})
	local UseMemoResult = ReactModule.useMemo(function()
		-- upvalues: StyleSheetRegistryModule (upval), p1 (copy), p2 (copy), p3 (copy), p4 (copy)
		return StyleSheetRegistryModule.getStyleSheet(p1, p2, p3, p4)
	end, { p1, p2, p3, p4 })
	local UseRefResult1 = ReactModule.useRef(UseMemoResult)
	UseRefResult1.current = UseMemoResult
	local UseResult = ReactModule.useCallback(function(List)
		-- upvalues: UseRefResult (copy), StyleSheetRegistryModule (upval), UseRefResult1 (copy)
		for _, value in List do
			UseRefResult.current[value] = true
		end
		StyleSheetRegistryModule.addStyleTags(UseRefResult1.current, List)
	end, {})
	ReactModule.useLayoutEffect(function()
		-- upvalues: UseRefResult (copy), StyleSheetRegistryModule (upval), UseMemoResult (copy)
		local List = {}
		
		for i in UseRefResult.current do
			table.insert(List, i)
		end
		StyleSheetRegistryModule.addStyleTags(UseMemoResult, List)
	end, { UseMemoResult })
	
	return UseMemoResult, UseResult
end