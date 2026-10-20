local AppTopBanner = script:FindFirstAncestor("AppTopBanner")
local Parent = AppTopBanner.Parent
local SignalsModule = require(Parent.Signals)
local SignalsExperimentalModule = require(Parent.SignalsExperimental)
local SignalsUtilsModule = require(Parent.SignalsUtils)
local AppTopBannerTypeModule = require(AppTopBanner.Enums.AppTopBannerType)
local ConstantsModule = require(AppTopBanner.Constants)

local function defaultOnAppTopBannerClick() end

return function()
	-- upvalues: SignalsUtilsModule (copy), AppTopBannerTypeModule (copy), defaultOnAppTopBannerClick (copy), SignalsModule (copy), SignalsExperimentalModule (copy), ConstantsModule (copy)
	local SessionScopedSignal, SessionScopedSignal2 = SignalsUtilsModule.createSessionScopedSignal(true)
	local SessionScopedSignal1, SessionScopedSignal2_1 = SignalsUtilsModule.createSessionScopedSignal(false)
	local SessionScopedSignal3, SessionScopedSignal2_2 = SignalsUtilsModule.createSessionScopedSignal(AppTopBannerTypeModule.None)
	local SessionScopedSignal4, SessionScopedSignal2_3 = SignalsUtilsModule.createSessionScopedSignal(nil)
	local SessionScopedSignal5, SessionScopedSignal2_4 = SignalsUtilsModule.createSessionScopedSignal(0)
	local SessionScopedSignal6, SessionScopedSignal2_5 = SignalsUtilsModule.createSessionScopedSignal({ callback = defaultOnAppTopBannerClick }, function(p1, p2): boolean
		return p1.callback == p2.callback
	end)
	
	local function _()
		-- upvalues: SignalsExperimentalModule (upval), SessionScopedSignal2_1 (copy), SessionScopedSignal2_2 (copy), AppTopBannerTypeModule (upval), SessionScopedSignal2_3 (copy), SessionScopedSignal2_4 (copy), SessionScopedSignal2_5 (copy), defaultOnAppTopBannerClick (upval)
		SignalsExperimentalModule.batch(function()
			-- upvalues: SessionScopedSignal2_1 (upval), SessionScopedSignal2_2 (upval), AppTopBannerTypeModule (upval), SessionScopedSignal2_3 (upval), SessionScopedSignal2_4 (upval), SessionScopedSignal2_5 (upval), defaultOnAppTopBannerClick (upval)
			SessionScopedSignal2_1(false)
			SessionScopedSignal2_2(AppTopBannerTypeModule.None)
			SessionScopedSignal2_3(nil)
			SessionScopedSignal2_4(0)
			SessionScopedSignal2_5({ callback = defaultOnAppTopBannerClick })
		end)
	end
	
	return {
		getIsDisabled = SessionScopedSignal,
		getExpanded = SessionScopedSignal1,
		getAppTopBannerType = SessionScopedSignal3,
		getAppTopBannerContentProps = SessionScopedSignal4,
		getAppTopBannerContentHeight = SessionScopedSignal5,
		getOnAppTopBannerClick = SessionScopedSignal6,
		getIsVisible = SignalsModule.createComputed(function(p1): boolean
			-- upvalues: SessionScopedSignal1 (copy), SessionScopedSignal (copy)
			return SessionScopedSignal1(p1) and not SessionScopedSignal(p1)
		end),
		setAppTopBanner = function(p1, p2, p3, Callback, p4)
			-- upvalues: SignalsExperimentalModule (upval), SessionScopedSignal2_1 (copy), SessionScopedSignal2_2 (copy), SessionScopedSignal2_3 (copy), SessionScopedSignal2_5 (copy), SessionScopedSignal2_4 (copy), ConstantsModule (upval), SessionScopedSignal1 (copy), AppTopBannerTypeModule (upval), defaultOnAppTopBannerClick (upval)
			if p1 then
				SignalsExperimentalModule.batch(function()
					-- upvalues: SessionScopedSignal2_1 (upval), p1 (copy), p2 (copy), SessionScopedSignal2_2 (upval), p3 (copy), SessionScopedSignal2_3 (upval), Callback (copy), SessionScopedSignal2_5 (upval), SessionScopedSignal2_4 (upval), p4 (copy), ConstantsModule (upval)
					SessionScopedSignal2_1(p1)
					
					if p2 ~= nil then
						SessionScopedSignal2_2(p2)
					end
					if p3 ~= nil then
						SessionScopedSignal2_3(p3)
					end
					if Callback ~= nil then
						SessionScopedSignal2_5({ callback = Callback })
					end
					SessionScopedSignal2_4(p4 or ConstantsModule.CONTENT_HEIGHT)
				end)
				
				return
			end
			if SessionScopedSignal1(false) ~= p1 then
				SignalsExperimentalModule.batch(function()
					-- upvalues: SessionScopedSignal2_1 (upval), SessionScopedSignal2_2 (upval), AppTopBannerTypeModule (upval), SessionScopedSignal2_3 (upval), SessionScopedSignal2_4 (upval), SessionScopedSignal2_5 (upval), defaultOnAppTopBannerClick (upval)
					SessionScopedSignal2_1(false)
					SessionScopedSignal2_2(AppTopBannerTypeModule.None)
					SessionScopedSignal2_3(nil)
					SessionScopedSignal2_4(0)
					SessionScopedSignal2_5({ callback = defaultOnAppTopBannerClick })
				end)
			end
		end,
		disableAppTopBanner = function(p1)
			-- upvalues: SessionScopedSignal (copy), SessionScopedSignal2 (copy)
			if SessionScopedSignal(false) ~= p1 then
				SessionScopedSignal2(p1)
			end
		end,
		reset = function()
			-- upvalues: SignalsExperimentalModule (upval), SessionScopedSignal2 (copy), SessionScopedSignal2_1 (copy), SessionScopedSignal2_2 (copy), AppTopBannerTypeModule (upval), SessionScopedSignal2_3 (copy), SessionScopedSignal2_4 (copy), SessionScopedSignal2_5 (copy), defaultOnAppTopBannerClick (upval)
			SignalsExperimentalModule.batch(function()
				-- upvalues: SessionScopedSignal2 (upval), SignalsExperimentalModule (upval), SessionScopedSignal2_1 (upval), SessionScopedSignal2_2 (upval), AppTopBannerTypeModule (upval), SessionScopedSignal2_3 (upval), SessionScopedSignal2_4 (upval), SessionScopedSignal2_5 (upval), defaultOnAppTopBannerClick (upval)
				SessionScopedSignal2(true)
				SignalsExperimentalModule.batch(function()
					-- upvalues: SessionScopedSignal2_1 (upval), SessionScopedSignal2_2 (upval), AppTopBannerTypeModule (upval), SessionScopedSignal2_3 (upval), SessionScopedSignal2_4 (upval), SessionScopedSignal2_5 (upval), defaultOnAppTopBannerClick (upval)
					SessionScopedSignal2_1(false)
					SessionScopedSignal2_2(AppTopBannerTypeModule.None)
					SessionScopedSignal2_3(nil)
					SessionScopedSignal2_4(0)
					SessionScopedSignal2_5({ callback = defaultOnAppTopBannerClick })
				end)
			end)
		end
	}
end