local parent = script:FindFirstAncestor("ProfilePlatform").Parent
local reactModule = require(parent.React)
local signalsModule = require(parent.Signals)
local foundationModule = require(parent.Foundation)
local sduiCoreSystemModule = require(parent.SduiCoreSystem)
local calculateItemWidth = require(parent.CollectionViews).calculateItemWidth
local appPage = require(parent.RobloxAppEnums).AppPage
local useTokens = foundationModule.Hooks.useTokens
local getSduiServiceDependenciesStore = sduiCoreSystemModule.getSduiServiceDependenciesStore

local function _(p0, p1, p2, p3, p4) --[[ line: 24 | named "computePeekFraction" ]]
	local var4 = p4 - p3
	
	if var4 <= 0 then
		return 0
	end
	local var5 = p0 - p1 - (p2 - 1) * p3 - p4
	
	return if var5 <= 0 then 0 else math.clamp(p2 * var4 / var5, 0, 0.5)
end

return function(p5) --[[ line: 50 | named "useProfileCompletionSduiContext" ]]
	-- upvalues: useTokens (ref), reactModule (ref), calculateItemWidth (ref), signalsModule (ref), appPage (ref), getSduiServiceDependenciesStore (ref)
	local var6 = useTokens()
	local medium = var6.Gap.Medium
	local size1500 = var6.Size.Size_1500
	local var7 = reactModule.useMemo(function() --[[ line: 55 ]]
		-- upvalues: p5 (ref), medium (ref), size1500 (ref)
		local containerWidth = p5.containerWidth
		local sideMargin = p5.sideMargin
		local var12 = size1500 - medium
		
		if var12 <= 0 then
			return 0
		end
		local var13 = containerWidth - sideMargin - medium * 0 - size1500
		
		return if var13 <= 0 then 0 else math.clamp(var12 * 1 / var13, 0, 0.5)
	end, { p5.containerWidth, p5.sideMargin, medium, size1500 })
	local var8 = reactModule.useMemo(function() --[[ line: 59 ]]
		-- upvalues: calculateItemWidth (copy), medium (ref), p5 (ref), var7 (ref)
		return calculateItemWidth(1, medium, p5.sideMargin, p5.containerWidth, var7)
	end, { medium, p5.sideMargin, p5.containerWidth, var7 })
	local var9, var10 = reactModule.useMemo(function() --[[ line: 63 ]]
		-- upvalues: signalsModule (copy), var7 (ref), medium (ref), p5 (ref), var8 (ref)
		return signalsModule.createSignal({
			numColumns = 1,
			verticalPadding = 0,
			fractionalItemAmount = var7,
			columnGap = medium,
			sideMargin = p5.sideMargin,
			itemWidth = var8
		})
	end, {})
	reactModule.useEffect(function() --[[ line: 74 ]]
		-- upvalues: var10 (ref), var7 (ref), medium (ref), p5 (ref), var8 (ref)
		var10({
			numColumns = 1,
			verticalPadding = 0,
			fractionalItemAmount = var7,
			columnGap = medium,
			sideMargin = p5.sideMargin,
			itemWidth = var8
		})
	end, {
		var7,
		medium,
		p5.sideMargin,
		var8,
		var10
	})
	local var11 = reactModule.useCallback(function(_) --[[ line: 85 ]]
		-- upvalues: signalsModule (copy), var9 (ref)
		return signalsModule.createComputed(function(p6) --[[ line: 86 ]]
			-- upvalues: var9 (copy)
			return var9(p6)
		end)
	end, { var9 })
	local profilePlatform = appPage.ProfilePlatform
	
	return reactModule.useMemo(function() --[[ line: 92 ]]
		-- upvalues: getSduiServiceDependenciesStore (copy), profilePlatform (ref), var11 (ref)
		return {
			dependencies = getSduiServiceDependenciesStore().getDependencies(profilePlatform),
			appPage = profilePlatform,
			getPageLayoutConfig = var11
		}
	end, { profilePlatform, var11 })
end