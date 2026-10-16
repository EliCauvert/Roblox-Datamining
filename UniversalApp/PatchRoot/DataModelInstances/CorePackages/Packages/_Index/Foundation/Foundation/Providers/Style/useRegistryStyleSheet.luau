local Foundation = script:FindFirstAncestor("Foundation")
local _ = require(Foundation.Enums.ColorMode)
local _ = require(Foundation.Enums.Device)
local ReactModule = require(Foundation.Parent.React)
local _ = require(Foundation.Enums.ThemeName)
local _ = require(Foundation.Providers.Style.Tokens)
local StyleSheetRegistryModule = require(Foundation.StyleSheet.StyleSheetRegistry)

return function(p1, p2, p3, p4, p5) --[[ Line: 16 | Named "useRegistryStyleSheet" ]]
	-- upvalues: ReactModule (copy), StyleSheetRegistryModule (copy)
	local UseRefResult = ReactModule.useRef({})
	local UseMemoResult = ReactModule.useMemo(function() --[[ Line: 26 ]]
		-- upvalues: StyleSheetRegistryModule (upval), p2 (copy), p3 (copy), p4 (copy), p5 (copy), p1 (copy)
		return StyleSheetRegistryModule.resolveStyleSheet(p2, p3, p4, p5, p1)
	end, {
		p1,
		p2,
		p3,
		p4,
		p5
	})
	local UseRefResult1 = ReactModule.useRef(UseMemoResult)
	UseRefResult1.current = UseMemoResult
	local UseResult = ReactModule.useCallback(function(List) --[[ Line: 32 ]]
		-- upvalues: UseRefResult (copy), StyleSheetRegistryModule (upval), UseRefResult1 (copy)
		for _, value in List do
			UseRefResult.current[value] = true
		end
		StyleSheetRegistryModule.addStyleTags(UseRefResult1.current, List)
	end, {})
	ReactModule.useLayoutEffect(function() --[[ Line: 39 ]]
		-- upvalues: UseRefResult (copy), StyleSheetRegistryModule (upval), UseMemoResult (copy)
		local List = {}
		
		for i in UseRefResult.current do
			table.insert(List, i)
		end
		StyleSheetRegistryModule.addStyleTags(UseMemoResult, List)
		StyleSheetRegistryModule.acquireStyleSheet(UseMemoResult)
		
		return function() --[[ Line: 48 ]]
			-- upvalues: StyleSheetRegistryModule (upval), UseMemoResult (upval)
			StyleSheetRegistryModule.releaseStyleSheet(UseMemoResult)
		end
	end, { UseMemoResult })
	
	return UseMemoResult, UseResult
end