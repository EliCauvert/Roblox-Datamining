local Parent = script:FindFirstAncestor("ProfilePlatform").Parent
local ReactModule = require(Parent.React)
local SignalsModule = require(Parent.Signals)
local CalculateItemWidthFunction = require(Parent.CollectionViews).calculateItemWidth
local AppPage = require(Parent.RobloxAppEnums).AppPage
local UseTokensFunction = require(Parent.Foundation).Hooks.useTokens
local GetSduiServiceDependenciesStoreFunction = require(Parent.SduiCoreSystem).getSduiServiceDependenciesStore

local function _(p1, p2, p3: number, p4, p5): number
	local v1 = p5 - p4
	
	if v1 <= 0 then
		return 0
	else
		local v2 = p1 - p2 - (p3 - 1) * p4 - p5
		
		return if v2 <= 0 then 0 else math.clamp(p3 * v1 / v2, 0, 0.5)
	end
end

return function(p1)
	-- upvalues: UseTokensFunction (copy), ReactModule (copy), CalculateItemWidthFunction (copy), SignalsModule (copy), AppPage (copy), GetSduiServiceDependenciesStoreFunction (copy)
	local UseTokensResult = UseTokensFunction()
	local Medium = UseTokensResult.Gap.Medium
	local Size1500 = UseTokensResult.Size.Size_1500
	local UseMemoResult = ReactModule.useMemo(function(): number
		-- upvalues: p1 (copy), Medium (copy), Size1500 (copy)
		local ContainerWidth = p1.containerWidth
		local SideMargin = p1.sideMargin
		local SizeDelta = Size1500 - Medium
		
		if SizeDelta <= 0 then
			return 0
		else
			local ContainerWidthDelta = ContainerWidth - SideMargin - Medium * 0 - Size1500
			
			return if ContainerWidthDelta <= 0 then 0 else math.clamp(SizeDelta * 1 / ContainerWidthDelta, 0, 0.5)
		end
	end, { p1.containerWidth, p1.sideMargin, Medium, Size1500 })
	local UseMemoResult1 = ReactModule.useMemo(function()
		-- upvalues: CalculateItemWidthFunction (upval), Medium (copy), p1 (copy), UseMemoResult (copy)
		return CalculateItemWidthFunction(1, Medium, p1.sideMargin, p1.containerWidth, UseMemoResult)
	end, { Medium, p1.sideMargin, p1.containerWidth, UseMemoResult })
	local UseMemoResult2, UseMemoResult2_1 = ReactModule.useMemo(function()
		-- upvalues: SignalsModule (upval), UseMemoResult (copy), Medium (copy), p1 (copy), UseMemoResult1 (copy)
		return SignalsModule.createSignal({
			numColumns = 1,
			verticalPadding = 0,
			fractionalItemAmount = UseMemoResult,
			columnGap = Medium,
			sideMargin = p1.sideMargin,
			itemWidth = UseMemoResult1
		})
	end, {})
	ReactModule.useEffect(function()
		-- upvalues: UseMemoResult2_1 (copy), UseMemoResult (copy), Medium (copy), p1 (copy), UseMemoResult1 (copy)
		UseMemoResult2_1({
			numColumns = 1,
			verticalPadding = 0,
			fractionalItemAmount = UseMemoResult,
			columnGap = Medium,
			sideMargin = p1.sideMargin,
			itemWidth = UseMemoResult1
		})
	end, {
		UseMemoResult,
		Medium,
		p1.sideMargin,
		UseMemoResult1,
		UseMemoResult2_1
	})
	local UseResult = ReactModule.useCallback(function(_)
		-- upvalues: SignalsModule (upval), UseMemoResult2 (copy)
		return SignalsModule.createComputed(function(p2)
			-- upvalues: UseMemoResult2 (upval)
			return UseMemoResult2(p2)
		end)
	end, { UseMemoResult2 })
	local ProfilePlatform = AppPage.ProfilePlatform
	
	return (ReactModule.useMemo(function()
		-- upvalues: GetSduiServiceDependenciesStoreFunction (upval), ProfilePlatform (copy), UseResult (copy)
		return {
			dependencies = GetSduiServiceDependenciesStoreFunction().getDependencies(ProfilePlatform),
			appPage = ProfilePlatform,
			getPageLayoutConfig = UseResult
		}
	end, { ProfilePlatform, UseResult }))
end