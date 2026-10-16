local SocialExperienceJoin = script:FindFirstAncestor("SocialExperienceJoin")
local Parent = SocialExperienceJoin.Parent
local ReactModule = require(Parent.React)
local RoactUtilsModule = require(Parent.RoactUtils)
local PromiseModule = require(Parent.Promise)
local PurchaseExperienceModalModule = require(script.Parent.PurchaseExperienceModal)
local PurchaseProductByIdModule = require(SocialExperienceJoin.Networking.PurchaseProductById)
local ConstantsModule = require(SocialExperienceJoin.Common.Constants)
local InitializeSocialExperienceJoinAnalyticsModule = require(SocialExperienceJoin.Analytics.initializeSocialExperienceJoinAnalytics)
local EventNamesModule = require(SocialExperienceJoin.Analytics.EventNames)
local RODUXKEY = ConstantsModule.RODUX_KEY
local UseNavigationFunction = require(Parent.Navigation).useNavigation
local UseNavigationPropsFunction = require(Parent.RobloxAppNavigation).useNavigationProps
local UseDispatchFunction = RoactUtilsModule.Hooks.RoactRodux.useDispatch
local UseSelectorFunction = RoactUtilsModule.Hooks.RoactRodux.useSelector
local UseScreenSizeFunction = require(Parent.RobloxAppHooks).useScreenSize
local PurchaseExperienceStatusModule = require(SocialExperienceJoin.Analytics.PurchaseExperienceStatus)

return function() --[[ Line: 38 ]]
	-- upvalues: UseNavigationFunction (copy), UseDispatchFunction (copy), UseNavigationPropsFunction (copy), UseScreenSizeFunction (copy), ReactModule (copy), InitializeSocialExperienceJoinAnalyticsModule (copy), UseSelectorFunction (copy), RODUXKEY (copy), EventNamesModule (copy), PurchaseExperienceStatusModule (copy), PurchaseProductByIdModule (copy), ConstantsModule (copy), PromiseModule (copy), PurchaseExperienceModalModule (copy)
	local UseNavigationResult = UseNavigationFunction()
	local UseDispatchResult = UseDispatchFunction()
	local UseNavigationPropsResult = UseNavigationPropsFunction(function(UniverseId, p1) --[[ Line: 41 ]]
		return {
			universeId = UniverseId,
			userId = p1.userId,
			openGameDetailsPeekView = p1.openGameDetailsPeekView,
			analyticProps = p1.analyticProps
		}
	end)
	local UseScreenSizeResult = UseScreenSizeFunction()
	local UseMemoResult = ReactModule.useMemo(function() --[[ Line: 51 ]]
		-- upvalues: InitializeSocialExperienceJoinAnalyticsModule (upval), UseNavigationPropsResult (copy)
		return InitializeSocialExperienceJoinAnalyticsModule(UseNavigationPropsResult.analyticProps)
	end, { UseNavigationPropsResult.analyticProps })
	local UseSelectorResult = UseSelectorFunction(function(p1) --[[ Line: 56 ]]
		-- upvalues: RODUXKEY (upval), UseNavigationPropsResult (copy)
		return p1[RODUXKEY].Games.productInfoByGameId[UseNavigationPropsResult.universeId]
	end)
	
	local function _() --[[ Line: 63 ]]
		-- upvalues: UseMemoResult (copy), EventNamesModule (upval), PurchaseExperienceStatusModule (upval), UseNavigationPropsResult (copy)
		UseMemoResult.fireAnalyticsEvent(EventNamesModule.PurchaseExperienceAttempt, {
			status = PurchaseExperienceStatusModule.Success,
			universeId = UseNavigationPropsResult.universeId,
			profileUserId = UseNavigationPropsResult.userId
		})
	end
	
	local _ = function(_) --[[ Line: 72 ]]
		-- upvalues: UseMemoResult (copy), EventNamesModule (upval), PurchaseExperienceStatusModule (upval), UseNavigationPropsResult (copy)
		UseMemoResult.fireAnalyticsEvent(EventNamesModule.PurchaseExperienceAttempt, {
			status = PurchaseExperienceStatusModule.PurchaseError,
			universeId = UseNavigationPropsResult.universeId,
			profileUserId = UseNavigationPropsResult.userId
		})
	end
	
	local _ = function(_) --[[ Line: 81 ]]
		-- upvalues: UseMemoResult (copy), EventNamesModule (upval), PurchaseExperienceStatusModule (upval), UseNavigationPropsResult (copy)
		UseMemoResult.fireAnalyticsEvent(EventNamesModule.PurchaseExperienceAttempt, {
			status = PurchaseExperienceStatusModule.NetworkError,
			universeId = UseNavigationPropsResult.universeId,
			profileUserId = UseNavigationPropsResult.userId
		})
	end
	
	local UseResult = ReactModule.useCallback(function() --[[ Line: 90 ]]
		-- upvalues: UseNavigationResult (copy)
		UseNavigationResult.pop()
	end, { UseNavigationResult })
	
	return ReactModule.createElement(PurchaseExperienceModalModule, {
		cancelPurchase = ReactModule.useCallback(function() --[[ Line: 94 ]]
			-- upvalues: UseMemoResult (copy), EventNamesModule (upval), UseNavigationPropsResult (copy), UseResult (copy)
			UseMemoResult.fireAnalyticsEvent(EventNamesModule.CancelPurchaseExperience, {
				universeId = UseNavigationPropsResult.universeId,
				profileUserId = UseNavigationPropsResult.userId
			})
			UseResult()
		end, {
			UseResult,
			UseMemoResult,
			UseNavigationPropsResult.universeId
		}),
		experienceName = UseSelectorFunction(function(p1) --[[ Line: 59 ]]
			-- upvalues: RODUXKEY (upval), UseNavigationPropsResult (copy)
			return p1[RODUXKEY].Games.byGameId[UseNavigationPropsResult.universeId]
		end).name,
		price = UseSelectorResult.price,
		purchaseExperience = ReactModule.useCallback(function() --[[ Line: 103 ]]
			-- upvalues: UseMemoResult (copy), EventNamesModule (upval), UseNavigationPropsResult (copy), UseDispatchResult (copy), PurchaseProductByIdModule (upval), UseSelectorResult (copy), ConstantsModule (upval), PromiseModule (upval), UseResult (copy), PurchaseExperienceStatusModule (upval)
			UseMemoResult.fireAnalyticsEvent(EventNamesModule.PurchaseExperience, {
				universeId = UseNavigationPropsResult.universeId,
				profileUserId = UseNavigationPropsResult.userId
			})
			
			local function _() --[[ Line: 109 ]]
				-- upvalues: UseDispatchResult (upval), PurchaseProductByIdModule (upval), UseSelectorResult (upval), ConstantsModule (upval)
				return UseDispatchResult(PurchaseProductByIdModule.API(UseSelectorResult.productId, {
					expectedCurrency = ConstantsModule.RobuxCurrency,
					expectedPrice = UseSelectorResult.price,
					expectedSellerId = UseSelectorResult.sellerId
				}))
			end
			
			UseDispatchResult(PurchaseProductByIdModule.API(UseSelectorResult.productId, {
				expectedCurrency = ConstantsModule.RobuxCurrency,
				expectedPrice = UseSelectorResult.price,
				expectedSellerId = UseSelectorResult.sellerId
			})):andThen(function(Result) --[[ Line: 118 ]]
				-- upvalues: PromiseModule (upval)
				local ResponseBody = Result.responseBody
				
				return type(ResponseBody) == "table" and ResponseBody or PromiseModule.reject()
			end):andThen(function(Result) --[[ Line: 122 ]]
				-- upvalues: UseResult (upval), UseMemoResult (upval), EventNamesModule (upval), PurchaseExperienceStatusModule (upval), UseNavigationPropsResult (upval)
				UseResult()
				
				if Result.purchased then
					UseMemoResult.fireAnalyticsEvent(EventNamesModule.PurchaseExperienceAttempt, {
						status = PurchaseExperienceStatusModule.Success,
						universeId = UseNavigationPropsResult.universeId,
						profileUserId = UseNavigationPropsResult.userId
					})
					
					return
				else
					UseMemoResult.fireAnalyticsEvent(EventNamesModule.PurchaseExperienceAttempt, {
						status = PurchaseExperienceStatusModule.PurchaseError,
						universeId = UseNavigationPropsResult.universeId,
						profileUserId = UseNavigationPropsResult.userId
					})
				end
			end):catch(function(_) --[[ Line: 131 ]]
				-- upvalues: UseResult (upval), UseMemoResult (upval), EventNamesModule (upval), PurchaseExperienceStatusModule (upval), UseNavigationPropsResult (upval)
				UseResult()
				UseMemoResult.fireAnalyticsEvent(EventNamesModule.PurchaseExperienceAttempt, {
					status = PurchaseExperienceStatusModule.NetworkError,
					universeId = UseNavigationPropsResult.universeId,
					profileUserId = UseNavigationPropsResult.userId
				})
			end)
		end, {
			UseDispatchResult,
			UseSelectorResult.productId,
			UseSelectorResult.price,
			UseSelectorResult.sellerId,
			UseResult
		}),
		screenSize = UseScreenSizeResult
	})
end