local parent = script:FindFirstAncestor("ProfilePlatform").Parent
local reactModule = require(parent.React)
local signalsModule = require(parent.Signals)
local foundationModule = require(parent.Foundation)
local sduiCoreSystemModule = require(parent.SduiCoreSystem)
local calculateItemWidth = require(parent.CollectionViews).calculateItemWidth
local appPage = require(parent.RobloxAppEnums).AppPage
local useTokens = foundationModule.Hooks.useTokens
local getSduiServiceDependenciesStore = sduiCoreSystemModule.getSduiServiceDependenciesStore

local function _(p1, p2, p3, p4, p5)
	local var1 = p5 - p4
	
	if var1 <= 0 then
		return 0
	end
	local var2 = p1 - p2 - (p3 - 1) * p4 - p5
	
	return if var2 <= 0 then 0 else math.clamp(p3 * var1 / var2, 0, 0.5)
end

return function(p1)
	-- upvalues: useTokens (ref), reactModule (ref), calculateItemWidth (ref), signalsModule (ref), appPage (ref), getSduiServiceDependenciesStore (ref)
	local var1 = useTokens()
	local medium = var1.Gap.Medium
	local size1500 = var1.Size.Size_1500
	local var2 = reactModule.useMemo(function()
		-- upvalues: p1 (ref), medium (ref), size1500 (ref)
		local containerWidth = p1.containerWidth
		local sideMargin = p1.sideMargin
		local var3 = size1500 - medium
		
		if var3 <= 0 then
			return 0
		end
		local var4 = containerWidth - sideMargin - medium * 0 - size1500
		
		return if var4 <= 0 then 0 else math.clamp(var3 * 1 / var4, 0, 0.5)
	end, { p1.containerWidth, p1.sideMargin, medium, size1500 })
	local var3 = reactModule.useMemo(function()
		-- upvalues: calculateItemWidth (copy), medium (ref), p1 (ref), var2 (ref)
		return calculateItemWidth(1, medium, p1.sideMargin, p1.containerWidth, var2)
	end, { medium, p1.sideMargin, p1.containerWidth, var2 })
	local var4, var5 = reactModule.useMemo(function()
		-- upvalues: signalsModule (copy), var2 (ref), medium (ref), p1 (ref), var3 (ref)
		return signalsModule.createSignal({
			numColumns = 1,
			verticalPadding = 0,
			fractionalItemAmount = var2,
			columnGap = medium,
			sideMargin = p1.sideMargin,
			itemWidth = var3
		})
	end, {})
	reactModule.useEffect(function()
		-- upvalues: var5 (ref), var2 (ref), medium (ref), p1 (ref), var3 (ref)
		var5({
			numColumns = 1,
			verticalPadding = 0,
			fractionalItemAmount = var2,
			columnGap = medium,
			sideMargin = p1.sideMargin,
			itemWidth = var3
		})
	end, {
		var2,
		medium,
		p1.sideMargin,
		var3,
		var5
	})
	local var6 = reactModule.useCallback(function(_)
		-- upvalues: signalsModule (copy), var4 (ref)
		return signalsModule.createComputed(function(p2)
			-- upvalues: var4 (copy)
			return var4(p2)
		end)
	end, { var4 })
	local profilePlatform = appPage.ProfilePlatform
	
	return reactModule.useMemo(function()
		-- upvalues: getSduiServiceDependenciesStore (copy), profilePlatform (ref), var6 (ref)
		return {
			dependencies = getSduiServiceDependenciesStore().getDependencies(profilePlatform),
			appPage = profilePlatform,
			getPageLayoutConfig = var6
		}
	end, { profilePlatform, var6 })
end