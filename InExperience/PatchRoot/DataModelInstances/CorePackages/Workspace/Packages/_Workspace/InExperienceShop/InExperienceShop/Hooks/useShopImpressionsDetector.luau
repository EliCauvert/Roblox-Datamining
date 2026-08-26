local inExperienceShop = script:FindFirstAncestor("InExperienceShop")
local parent = inExperienceShop.Parent
local reactModule = require(parent.React)
local signal = require(parent.AppCommonLib).Signal
local fFlagEnableInExperienceShopUnifiedLoggingModule = require(inExperienceShop.Flags.FFlagEnableInExperienceShopUnifiedLogging)

local var1 = function() end

return function(p1)
	-- upvalues: fFlagEnableInExperienceShopUnifiedLoggingModule (ref), var1 (ref), reactModule (ref), signal (ref), inExperienceShop (ref)
	if fFlagEnableInExperienceShopUnifiedLoggingModule then
		local var2 = reactModule.useMemo(function()
			-- upvalues: signal (copy)
			return signal.new()
		end, {})
		local var3 = reactModule.useRef(nil)
		reactModule.useEffect(function()
			-- upvalues: p1 (ref), var2 (ref)
			local externalScrollSignal = p1.externalScrollSignal
			
			if externalScrollSignal == nil then
				return function() end
			end
			local var4 = externalScrollSignal:connect(function()
				-- upvalues: var2 (copy)
				var2:fire()
			end)
			
			return function()
				-- upvalues: var4 (ref)
				var4:disconnect()
			end
		end, { p1.externalScrollSignal, var2 })
		local var4 = reactModule.useCallback(function()
			-- upvalues: p1 (ref)
			return p1.isPageActive
		end, { p1.isPageActive })
		
		return {
			gridRef = var3,
			onLayoutChange = reactModule.useCallback(function()
				-- upvalues: var2 (ref)
				var2:fire()
			end, { var2 }),
			impressionsDetector = reactModule.useMemo(function()
				-- upvalues: inExperienceShop (copy), reactModule (copy), var3 (ref), var4 (ref), var2 (ref), p1 (ref)
				local analyticsModule = require(inExperienceShop.Analytics)
				
				return reactModule.createElement(analyticsModule.ShopTagBasedImpressionsDetector, {
					parentRef = var3,
					pageFilter = var4,
					requestImpressionsSignal = var2,
					extensions = {
						analyticsModule.InExperienceShopUnifiedImpressionsReporter(p1.pageType)
					}
				})
			end, { p1.pageType, var4, var2 })
		}
	end
	return {
		impressionsDetector = nil,
		gridRef = { current = nil },
		onLayoutChange = var1
	}
end