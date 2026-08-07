local inExperienceShop = script:FindFirstAncestor("InExperienceShop")
local parent = inExperienceShop.Parent
local reactModule = require(parent.React)
local signal = require(parent.AppCommonLib).Signal
local fFlagEnableInExperienceShopUnifiedLoggingModule = require(inExperienceShop.Flags.FFlagEnableInExperienceShopUnifiedLogging)

local var3 = function() --[[ line: 22 ]] end

return function(p0) --[[ line: 24 | named "useShopImpressionsDetector" ]]
	-- upvalues: fFlagEnableInExperienceShopUnifiedLoggingModule (ref), var3 (ref), reactModule (ref), signal (ref), inExperienceShop (ref)
	if fFlagEnableInExperienceShopUnifiedLoggingModule then
		local var4 = reactModule.useMemo(function() --[[ line: 33 ]]
			-- upvalues: signal (copy)
			return signal.new()
		end, {})
		local var5 = reactModule.useRef(nil)
		reactModule.useEffect(function() --[[ line: 39 ]]
			-- upvalues: p0 (ref), var4 (ref)
			local externalScrollSignal = p0.externalScrollSignal
			
			if externalScrollSignal == nil then
				return function() --[[ line: 42 ]] end
			end
			local var7 = externalScrollSignal:connect(function() --[[ line: 45 ]]
				-- upvalues: var4 (copy)
				var4:fire()
			end)
			
			return function() --[[ line: 49 ]]
				-- upvalues: var7 (ref)
				var7:disconnect()
			end
		end, { p0.externalScrollSignal, var4 })
		local var6 = reactModule.useCallback(function() --[[ line: 58 ]]
			-- upvalues: p0 (ref)
			return p0.isPageActive
		end, { p0.isPageActive })
		
		return {
			gridRef = var5,
			onLayoutChange = reactModule.useCallback(function() --[[ line: 54 ]]
				-- upvalues: var4 (ref)
				var4:fire()
			end, { var4 }),
			impressionsDetector = reactModule.useMemo(function() --[[ line: 62 ]]
				-- upvalues: inExperienceShop (copy), reactModule (copy), var5 (ref), var6 (ref), var4 (ref), p0 (ref)
				local analyticsModule = require(inExperienceShop.Analytics)
				
				return reactModule.createElement(analyticsModule.ShopTagBasedImpressionsDetector, {
					parentRef = var5,
					pageFilter = var6,
					requestImpressionsSignal = var4,
					extensions = {
						analyticsModule.InExperienceShopUnifiedImpressionsReporter(p0.pageType)
					}
				})
			end, { p0.pageType, var6, var4 })
		}
	end
	return {
		impressionsDetector = nil,
		gridRef = { current = nil },
		onLayoutChange = var3
	}
end