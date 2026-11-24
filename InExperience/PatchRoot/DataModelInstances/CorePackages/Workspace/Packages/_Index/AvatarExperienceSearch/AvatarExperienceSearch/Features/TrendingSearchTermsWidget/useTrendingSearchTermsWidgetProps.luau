local HttpService = game:GetService("HttpService")
local Parent = script:FindFirstAncestor("AvatarExperienceSearch").Parent
local ReactModule = require(Parent.React)
local _ = require(Parent.Foundation)
local AvatarExperienceAnalyticsModule = require(Parent.AvatarExperienceAnalytics)
local AvatarExperienceNavigationModule = require(Parent.AvatarExperienceNavigation)
local AvatarExperienceFlagsModule = require(Parent.AvatarExperienceFlags)
local SendUnifiedEventLogFunction = AvatarExperienceAnalyticsModule.sendUnifiedEventLog
local UnifiedEventLogEnums = AvatarExperienceAnalyticsModule.UnifiedEventLogEnums
local UnifiedLoggingSurface = AvatarExperienceNavigationModule.Enums.UnifiedLoggingSurface
local FFlagAXSearchTrendingChipLogging = AvatarExperienceFlagsModule.FFlagAXSearchTrendingChipLogging
local UseTrendingSearchQueriesModule = require(script.Parent.useTrendingSearchQueries)

return function(p1)
	-- upvalues: UseTrendingSearchQueriesModule (copy), FFlagAXSearchTrendingChipLogging (copy), ReactModule (copy), SendUnifiedEventLogFunction (copy), UnifiedEventLogEnums (copy), UnifiedLoggingSurface (copy), HttpService (copy)
	local UseTrendingSearchQueriesModuleResult = UseTrendingSearchQueriesModule()
	
	if FFlagAXSearchTrendingChipLogging then
		ReactModule.useEffect(function()
			-- upvalues: UseTrendingSearchQueriesModuleResult (copy), SendUnifiedEventLogFunction (upval), UnifiedEventLogEnums (upval), UnifiedLoggingSurface (upval), HttpService (upval)
			for i, Keyword in UseTrendingSearchQueriesModuleResult do
				SendUnifiedEventLogFunction({
					elementName = "TRENDING_SEARCH_CHIP",
					action = UnifiedEventLogEnums.MarketplaceUnifiedAction.UI_ELEMENT_IMPRESSION,
					surface = UnifiedLoggingSurface.SEARCH_LANDING_PAGE,
					elementMetadata = HttpService:JSONEncode({ keyword = Keyword, rank = tostring(i) })
				})
			end
		end, { UseTrendingSearchQueriesModuleResult })
	end
	local UseMemoResult = nil
	if FFlagAXSearchTrendingChipLogging then
		local UseResult = ReactModule.useCallback(function(Keyword, p2)
			-- upvalues: SendUnifiedEventLogFunction (upval), UnifiedEventLogEnums (upval), UnifiedLoggingSurface (upval), HttpService (upval), p1 (copy)
			SendUnifiedEventLogFunction({
				elementName = "TRENDING_SEARCH_CHIP",
				action = UnifiedEventLogEnums.MarketplaceUnifiedAction.UI_ELEMENT_CLICK,
				surface = UnifiedLoggingSurface.SEARCH_LANDING_PAGE,
				elementMetadata = HttpService:JSONEncode({ keyword = Keyword, rank = tostring(p2) })
			})
			p1.onSubmitSearch(Keyword)
		end, { p1.onSubmitSearch })
		UseMemoResult = ReactModule.useMemo(function()
			-- upvalues: UseTrendingSearchQueriesModuleResult (copy), UseResult (copy)
			local t = {}
			
			for i, Text in UseTrendingSearchQueriesModuleResult do
				t[i] = {
					text = Text,
					onActivated = function()
						-- upvalues: UseResult (upval), Text (copy), i (copy)
						UseResult(Text, i)
					end
				}
			end
			return t
		end, { UseTrendingSearchQueriesModuleResult, UseResult })
	else
		UseMemoResult = ReactModule.useMemo(function()
			-- upvalues: UseTrendingSearchQueriesModuleResult (copy), p1 (copy)
			local t = {}
			
			for i, Text in UseTrendingSearchQueriesModuleResult do
				t[i] = {
					text = Text,
					onActivated = function()
						-- upvalues: p1 (upval), Text (copy)
						p1.onSubmitSearch(Text)
					end
				}
			end
			return t
		end, { UseTrendingSearchQueriesModuleResult, p1.onSubmitSearch })
	end
	return { chips = UseMemoResult }
end