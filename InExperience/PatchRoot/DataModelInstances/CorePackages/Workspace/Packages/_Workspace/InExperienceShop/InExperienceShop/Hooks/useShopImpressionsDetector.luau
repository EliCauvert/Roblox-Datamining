local inExperienceShop = script:FindFirstAncestor("InExperienceShop")
local parent = inExperienceShop.Parent
local reactModule = require(parent.React)
local signal = require(parent.AppCommonLib).Signal
local fFlagEnableInExperienceShopUnifiedLoggingModule = require(inExperienceShop.Flags.FFlagEnableInExperienceShopUnifiedLogging)

local var3 = function() end

return function(p0)
	-- upvalues: fFlagEnableInExperienceShopUnifiedLoggingModule (ref), var3 (ref), reactModule (ref), signal (ref), inExperienceShop (ref)
	if fFlagEnableInExperienceShopUnifiedLoggingModule then
		local var4 = reactModule.useMemo(function()
			-- upvalues: signal (copy)
			return signal.new()
		end, {})
		local var5 = reactModule.useRef(nil)
		reactModule.useEffect(function()
			-- upvalues: p0 (ref), var4 (ref)
			local externalScrollSignal = p0.externalScrollSignal
			
			if externalScrollSignal == nil then
				return function() end
			end
			local var7 = externalScrollSignal:connect(function()
				-- upvalues: var4 (copy)
				var4:fire()
			end)
			
			return function()
				-- upvalues: var7 (ref)
				var7:disconnect()
			end
		end, { p0.externalScrollSignal, var4 })
		local var6 = reactModule.useCallback(function()
			-- upvalues: p0 (ref)
			return p0.isPageActive
		end, { p0.isPageActive })
		
		return {
			gridRef = var5,
			onLayoutChange = reactModule.useCallback(function()
				-- upvalues: var4 (ref)
				var4:fire()
			end, { var4 }),
			impressionsDetector = reactModule.useMemo(function()
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