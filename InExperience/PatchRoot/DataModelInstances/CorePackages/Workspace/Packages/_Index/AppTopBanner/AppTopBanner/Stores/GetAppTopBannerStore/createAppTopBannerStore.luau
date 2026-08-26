local appTopBanner = script:FindFirstAncestor("AppTopBanner")
local parent = appTopBanner.Parent
local signalsModule = require(parent.Signals)
local signalsExperimentalModule = require(parent.SignalsExperimental)
local signalsUtilsModule = require(parent.SignalsUtils)
local appTopBannerTypeModule = require(appTopBanner.Enums.AppTopBannerType)
local constantsModule = require(appTopBanner.Constants)

local function defaultOnAppTopBannerClick() end

return function()
	-- upvalues: signalsUtilsModule (ref), appTopBannerTypeModule (ref), defaultOnAppTopBannerClick (ref), signalsModule (ref), signalsExperimentalModule (ref), constantsModule (ref)
	local var1, var2 = signalsUtilsModule.createSessionScopedSignal(true)
	local var3, var4 = signalsUtilsModule.createSessionScopedSignal(false)
	local var5, var6 = signalsUtilsModule.createSessionScopedSignal(appTopBannerTypeModule.None)
	local var7, var8 = signalsUtilsModule.createSessionScopedSignal(nil)
	local var9, var10 = signalsUtilsModule.createSessionScopedSignal(0)
	local var11, var12 = signalsUtilsModule.createSessionScopedSignal({ callback = defaultOnAppTopBannerClick }, function(p1, p2)
		return p1.callback == p2.callback
	end)
	
	local function _()
		-- upvalues: signalsExperimentalModule (copy), var4 (ref), var6 (ref), appTopBannerTypeModule (copy), var8 (ref), var10 (ref), var12 (ref), defaultOnAppTopBannerClick (copy)
		signalsExperimentalModule.batch(function()
			-- upvalues: var4 (copy), var6 (copy), appTopBannerTypeModule (copy), var8 (copy), var10 (copy), var12 (copy), defaultOnAppTopBannerClick (copy)
			var4(false)
			var6(appTopBannerTypeModule.None)
			var8(nil)
			var10(0)
			var12({ callback = defaultOnAppTopBannerClick })
		end)
	end
	
	return {
		getIsDisabled = var1,
		getExpanded = var3,
		getAppTopBannerType = var5,
		getAppTopBannerContentProps = var7,
		getAppTopBannerContentHeight = var9,
		getOnAppTopBannerClick = var11,
		getIsVisible = signalsModule.createComputed(function(p1)
			-- upvalues: var3 (ref), var1 (ref)
			return var3(p1) and not var1(p1)
		end),
		setAppTopBanner = function(value, p1, p2, p3, p4)
			-- upvalues: signalsExperimentalModule (copy), var4 (ref), var6 (ref), var8 (ref), var12 (ref), var10 (ref), constantsModule (copy), var3 (ref), appTopBannerTypeModule (copy), defaultOnAppTopBannerClick (copy)
			if value then
				signalsExperimentalModule.batch(function()
					-- upvalues: var4 (copy), value (ref), p1 (ref), var6 (copy), p2 (ref), var8 (copy), p3 (ref), var12 (copy), var10 (copy), p4 (ref), constantsModule (copy)
					var4(value)
					
					if p1 ~= nil then
						var6(p1)
					end
					if p2 ~= nil then
						var8(p2)
					end
					if p3 ~= nil then
						var12({ callback = p3 })
					end
					var10(p4 or constantsModule.CONTENT_HEIGHT)
				end)
				
				return
			elseif var3(false) ~= value then
				signalsExperimentalModule.batch(function()
					-- upvalues: var4 (copy), var6 (copy), appTopBannerTypeModule (copy), var8 (copy), var10 (copy), var12 (copy), defaultOnAppTopBannerClick (copy)
					var4(false)
					var6(appTopBannerTypeModule.None)
					var8(nil)
					var10(0)
					var12({ callback = defaultOnAppTopBannerClick })
				end)
			end
		end,
		disableAppTopBanner = function(p1)
			-- upvalues: var1 (ref), var2 (ref)
			if var1(false) ~= p1 then
				var2(p1)
			end
		end,
		reset = function()
			-- upvalues: signalsExperimentalModule (copy), var2 (ref), var4 (ref), var6 (ref), appTopBannerTypeModule (copy), var8 (ref), var10 (ref), var12 (ref), defaultOnAppTopBannerClick (copy)
			signalsExperimentalModule.batch(function()
				-- upvalues: var2 (copy), signalsExperimentalModule (copy), var4 (copy), var6 (copy), appTopBannerTypeModule (copy), var8 (copy), var10 (copy), var12 (copy), defaultOnAppTopBannerClick (copy)
				var2(true)
				signalsExperimentalModule.batch(function()
					-- upvalues: var4 (copy), var6 (copy), appTopBannerTypeModule (copy), var8 (copy), var10 (copy), var12 (copy), defaultOnAppTopBannerClick (copy)
					var4(false)
					var6(appTopBannerTypeModule.None)
					var8(nil)
					var10(0)
					var12({ callback = defaultOnAppTopBannerClick })
				end)
			end)
		end
	}
end