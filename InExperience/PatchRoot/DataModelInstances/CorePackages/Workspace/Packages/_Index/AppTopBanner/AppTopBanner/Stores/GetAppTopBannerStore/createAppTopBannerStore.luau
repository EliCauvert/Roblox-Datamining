local appTopBanner = script:FindFirstAncestor("AppTopBanner")
local parent = appTopBanner.Parent
local signalsModule = require(parent.Signals)
local signalsExperimentalModule = require(parent.SignalsExperimental)
local signalsUtilsModule = require(parent.SignalsUtils)
local appTopBannerTypeModule = require(appTopBanner.Enums.AppTopBannerType)
local constantsModule = require(appTopBanner.Constants)

local function defaultOnAppTopBannerClick() --[[ line: 15 ]] end

return function() --[[ line: 17 ]]
	-- upvalues: signalsUtilsModule (ref), appTopBannerTypeModule (ref), defaultOnAppTopBannerClick (ref), signalsModule (ref), signalsExperimentalModule (ref), constantsModule (ref)
	local var7, var8 = signalsUtilsModule.createSessionScopedSignal(true)
	local var9, var10 = signalsUtilsModule.createSessionScopedSignal(false)
	local var11, var12 = signalsUtilsModule.createSessionScopedSignal(appTopBannerTypeModule.None)
	local var13, var14 = signalsUtilsModule.createSessionScopedSignal(nil)
	local var15, var16 = signalsUtilsModule.createSessionScopedSignal(0)
	local var17, var18 = signalsUtilsModule.createSessionScopedSignal({ callback = defaultOnAppTopBannerClick }, function(p0, p1) --[[ line: 38 ]]
		return p0.callback == p1.callback
	end)
	
	local function _() --[[ line: 46 | named "collapseToDefaults" ]]
		-- upvalues: signalsExperimentalModule (copy), var10 (ref), var12 (ref), appTopBannerTypeModule (copy), var14 (ref), var16 (ref), var18 (ref), defaultOnAppTopBannerClick (copy)
		signalsExperimentalModule.batch(function() --[[ line: 47 ]]
			-- upvalues: var10 (copy), var12 (copy), appTopBannerTypeModule (copy), var14 (copy), var16 (copy), var18 (copy), defaultOnAppTopBannerClick (copy)
			var10(false)
			var12(appTopBannerTypeModule.None)
			var14(nil)
			var16(0)
			var18({ callback = defaultOnAppTopBannerClick })
		end)
	end
	
	return {
		getIsDisabled = var7,
		getExpanded = var9,
		getAppTopBannerType = var11,
		getAppTopBannerContentProps = var13,
		getAppTopBannerContentHeight = var15,
		getOnAppTopBannerClick = var17,
		getIsVisible = signalsModule.createComputed(function(p2) --[[ line: 42 ]]
			-- upvalues: var9 (ref), var7 (ref)
			return var9(p2) and not var7(p2)
		end),
		setAppTopBanner = function(value, p3, p4, p5, p6) --[[ line: 56 ]]
			-- upvalues: signalsExperimentalModule (copy), var10 (ref), var12 (ref), var14 (ref), var18 (ref), var16 (ref), constantsModule (copy), var9 (ref), appTopBannerTypeModule (copy), defaultOnAppTopBannerClick (copy)
			if value then
				signalsExperimentalModule.batch(function() --[[ line: 64 ]]
					-- upvalues: var10 (copy), value (ref), p3 (ref), var12 (copy), p4 (ref), var14 (copy), p5 (ref), var18 (copy), var16 (copy), p6 (ref), constantsModule (copy)
					var10(value)
					
					if p3 ~= nil then
						var12(p3)
					end
					if p4 ~= nil then
						var14(p4)
					end
					if p5 ~= nil then
						var18({ callback = p5 })
					end
					var16(p6 or constantsModule.CONTENT_HEIGHT)
				end)
				
				return
			elseif var9(false) ~= value then
				signalsExperimentalModule.batch(function() --[[ line: 47 ]]
					-- upvalues: var10 (copy), var12 (copy), appTopBannerTypeModule (copy), var14 (copy), var16 (copy), var18 (copy), defaultOnAppTopBannerClick (copy)
					var10(false)
					var12(appTopBannerTypeModule.None)
					var14(nil)
					var16(0)
					var18({ callback = defaultOnAppTopBannerClick })
				end)
			end
		end,
		disableAppTopBanner = function(p7) --[[ line: 82 ]]
			-- upvalues: var7 (ref), var8 (ref)
			if var7(false) ~= p7 then
				var8(p7)
			end
		end,
		reset = function() --[[ line: 88 ]]
			-- upvalues: signalsExperimentalModule (copy), var8 (ref), var10 (ref), var12 (ref), appTopBannerTypeModule (copy), var14 (ref), var16 (ref), var18 (ref), defaultOnAppTopBannerClick (copy)
			signalsExperimentalModule.batch(function() --[[ line: 89 ]]
				-- upvalues: var8 (copy), signalsExperimentalModule (copy), var10 (copy), var12 (copy), appTopBannerTypeModule (copy), var14 (copy), var16 (copy), var18 (copy), defaultOnAppTopBannerClick (copy)
				var8(true)
				signalsExperimentalModule.batch(function() --[[ line: 47 ]]
					-- upvalues: var10 (copy), var12 (copy), appTopBannerTypeModule (copy), var14 (copy), var16 (copy), var18 (copy), defaultOnAppTopBannerClick (copy)
					var10(false)
					var12(appTopBannerTypeModule.None)
					var14(nil)
					var16(0)
					var18({ callback = defaultOnAppTopBannerClick })
				end)
			end)
		end
	}
end