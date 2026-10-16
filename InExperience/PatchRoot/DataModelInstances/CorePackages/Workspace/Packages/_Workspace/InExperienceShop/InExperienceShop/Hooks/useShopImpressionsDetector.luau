local InExperienceShop = script:FindFirstAncestor("InExperienceShop")
local Parent = InExperienceShop.Parent
local ReactModule = require(Parent.React)
local Signal = require(Parent.AppCommonLib).Signal
local FFlagEnableInExperienceShopUnifiedLoggingModule = require(InExperienceShop.Flags.FFlagEnableInExperienceShopUnifiedLogging)

local function OnLayoutChange() --[[ Line: 22 ]] end

return function(p1) --[[ Line: 24 | Named "useShopImpressionsDetector" ]]
	-- upvalues: FFlagEnableInExperienceShopUnifiedLoggingModule (copy), OnLayoutChange (copy), ReactModule (copy), Signal (copy), InExperienceShop (copy)
	if FFlagEnableInExperienceShopUnifiedLoggingModule then
		local UseMemoResult = ReactModule.useMemo(function() --[[ Line: 33 ]]
			-- upvalues: Signal (upval)
			return Signal.new()
		end, {})
		local UseRefResult = ReactModule.useRef(nil)
		ReactModule.useEffect(function() --[[ Line: 39 ]]
			-- upvalues: p1 (copy), UseMemoResult (copy)
			local ExternalScrollSignal = p1.externalScrollSignal
			
			if ExternalScrollSignal == nil then
				return function() --[[ Line: 42 ]] end
			else
				local Connection = ExternalScrollSignal:connect(function() --[[ Line: 45 ]]
					-- upvalues: UseMemoResult (upval)
					UseMemoResult:fire()
				end)
				
				return function() --[[ Line: 49 ]]
					-- upvalues: Connection (copy)
					Connection:disconnect()
				end
			end
		end, { p1.externalScrollSignal, UseMemoResult })
		local UseResult = ReactModule.useCallback(function() --[[ Line: 58 ]]
			-- upvalues: p1 (copy)
			return p1.isPageActive
		end, { p1.isPageActive })
		
		return {
			gridRef = UseRefResult,
			onLayoutChange = ReactModule.useCallback(function() --[[ Line: 54 ]]
				-- upvalues: UseMemoResult (copy)
				UseMemoResult:fire()
			end, { UseMemoResult }),
			impressionsDetector = ReactModule.useMemo(function() --[[ Line: 62 ]]
				-- upvalues: InExperienceShop (upval), ReactModule (upval), UseRefResult (copy), UseResult (copy), UseMemoResult (copy), p1 (copy)
				local AnalyticsModule = require(InExperienceShop.Analytics)
				
				return ReactModule.createElement(AnalyticsModule.ShopTagBasedImpressionsDetector, {
					parentRef = UseRefResult,
					pageFilter = UseResult,
					requestImpressionsSignal = UseMemoResult,
					extensions = {
						AnalyticsModule.InExperienceShopUnifiedImpressionsReporter(p1.pageType)
					}
				})
			end, { p1.pageType, UseResult, UseMemoResult })
		}
	else
		return {
			impressionsDetector = nil,
			gridRef = { current = nil },
			onLayoutChange = OnLayoutChange
		}
	end
end