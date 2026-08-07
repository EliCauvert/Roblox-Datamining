local socialExperienceJoin = script:FindFirstAncestor("SocialExperienceJoin")
local parent = socialExperienceJoin.Parent
local reactModule = require(parent.React)
local roactUtilsModule = require(parent.RoactUtils)
local navigationModule = require(parent.Navigation)
local robloxAppNavigationModule = require(parent.RobloxAppNavigation)
local robloxAppHooksModule = require(parent.RobloxAppHooks)
local promiseModule = require(parent.Promise)
local purchaseExperienceModalModule = require(script.Parent.PurchaseExperienceModal)
local purchaseProductByIdModule = require(socialExperienceJoin.Networking.PurchaseProductById)
local constantsModule = require(socialExperienceJoin.Common.Constants)
local initializeSocialExperienceJoinAnalyticsModule = require(socialExperienceJoin.Analytics.initializeSocialExperienceJoinAnalytics)
local eventNamesModule = require(socialExperienceJoin.Analytics.EventNames)
local RODUX_KEY = constantsModule.RODUX_KEY
local useNavigation = navigationModule.useNavigation
local useNavigationProps = robloxAppNavigationModule.useNavigationProps
local useDispatch = roactUtilsModule.Hooks.RoactRodux.useDispatch
local useSelector = roactUtilsModule.Hooks.RoactRodux.useSelector
local useScreenSize = robloxAppHooksModule.useScreenSize
local purchaseExperienceStatusModule = require(socialExperienceJoin.Analytics.PurchaseExperienceStatus)

return function() --[[ line: 38 ]]
	-- upvalues: useNavigation (ref), useDispatch (ref), useNavigationProps (ref), useScreenSize (ref), reactModule (ref), initializeSocialExperienceJoinAnalyticsModule (ref), useSelector (ref), RODUX_KEY (ref), eventNamesModule (ref), purchaseExperienceStatusModule (ref), purchaseProductByIdModule (ref), constantsModule (ref), promiseModule (ref), purchaseExperienceModalModule (ref)
	local var13 = useNavigation()
	local var14 = useDispatch()
	local var15 = useNavigationProps(function(p0, p1) --[[ line: 41 ]]
		return {
			universeId = p0,
			userId = p1.userId,
			openGameDetailsPeekView = p1.openGameDetailsPeekView,
			analyticProps = p1.analyticProps
		}
	end)
	local var16 = useScreenSize()
	local var17 = reactModule.useMemo(function() --[[ line: 51 ]]
		-- upvalues: initializeSocialExperienceJoinAnalyticsModule (copy), var15 (ref)
		return initializeSocialExperienceJoinAnalyticsModule(var15.analyticProps)
	end, { var15.analyticProps })
	local var18 = useSelector(function(p2) --[[ line: 56 ]]
		-- upvalues: RODUX_KEY (copy), var15 (ref)
		return p2[RODUX_KEY].Games.productInfoByGameId[var15.universeId]
	end)
	local var19 = useSelector(function(p3) --[[ line: 59 ]]
		-- upvalues: RODUX_KEY (copy), var15 (ref)
		return p3[RODUX_KEY].Games.byGameId[var15.universeId]
	end)
	
	local _ = function() --[[ line: 63 ]]
		-- upvalues: var17 (ref), eventNamesModule (copy), purchaseExperienceStatusModule (copy), var15 (ref)
		var17.fireAnalyticsEvent(eventNamesModule.PurchaseExperienceAttempt, {
			status = purchaseExperienceStatusModule.Success,
			universeId = var15.universeId,
			profileUserId = var15.userId
		})
	end
	
	local _ = function(_) --[[ line: 72 ]]
		-- upvalues: var17 (ref), eventNamesModule (copy), purchaseExperienceStatusModule (copy), var15 (ref)
		var17.fireAnalyticsEvent(eventNamesModule.PurchaseExperienceAttempt, {
			status = purchaseExperienceStatusModule.PurchaseError,
			universeId = var15.universeId,
			profileUserId = var15.userId
		})
	end
	
	local _ = function(_) --[[ line: 81 ]]
		-- upvalues: var17 (ref), eventNamesModule (copy), purchaseExperienceStatusModule (copy), var15 (ref)
		var17.fireAnalyticsEvent(eventNamesModule.PurchaseExperienceAttempt, {
			status = purchaseExperienceStatusModule.NetworkError,
			universeId = var15.universeId,
			profileUserId = var15.userId
		})
	end
	
	local var20 = reactModule.useCallback(function() --[[ line: 90 ]]
		-- upvalues: var13 (ref)
		var13.pop()
	end, { var13 })
	
	return reactModule.createElement(purchaseExperienceModalModule, {
		cancelPurchase = reactModule.useCallback(function() --[[ line: 94 ]]
			-- upvalues: var17 (ref), eventNamesModule (copy), var15 (ref), var20 (ref)
			var17.fireAnalyticsEvent(eventNamesModule.CancelPurchaseExperience, {
				universeId = var15.universeId,
				profileUserId = var15.userId
			})
			var20()
		end, { var20, var17, var15.universeId }),
		experienceName = var19.name,
		price = var18.price,
		purchaseExperience = reactModule.useCallback(function() --[[ line: 103 ]]
			-- upvalues: var17 (ref), eventNamesModule (copy), var15 (ref), var14 (ref), purchaseProductByIdModule (copy), var18 (ref), constantsModule (copy), promiseModule (copy), var20 (ref), purchaseExperienceStatusModule (copy)
			var17.fireAnalyticsEvent(eventNamesModule.PurchaseExperience, {
				universeId = var15.universeId,
				profileUserId = var15.userId
			})
			
			local _ = function() --[[ line: 109 ]]
				-- upvalues: var14 (copy), purchaseProductByIdModule (copy), var18 (copy), constantsModule (copy)
				return var14(purchaseProductByIdModule.API(var18.productId, {
					expectedCurrency = constantsModule.RobuxCurrency,
					expectedPrice = var18.price,
					expectedSellerId = var18.sellerId
				}))
			end
			
			var14(purchaseProductByIdModule.API(var18.productId, {
				expectedCurrency = constantsModule.RobuxCurrency,
				expectedPrice = var18.price,
				expectedSellerId = var18.sellerId
			})):andThen(function(p5) --[[ line: 118 ]]
				-- upvalues: promiseModule (copy)
				local responseBody = p5.responseBody
				
				return if type(responseBody) == "table" then responseBody else promiseModule.reject()
			end):andThen(function(p4) --[[ line: 122 ]]
				-- upvalues: var20 (copy), var17 (copy), eventNamesModule (copy), purchaseExperienceStatusModule (copy), var15 (copy)
				var20()
				
				if p4.purchased then
					var17.fireAnalyticsEvent(eventNamesModule.PurchaseExperienceAttempt, {
						status = purchaseExperienceStatusModule.Success,
						universeId = var15.universeId,
						profileUserId = var15.userId
					})
					
					return
				end
				var17.fireAnalyticsEvent(eventNamesModule.PurchaseExperienceAttempt, {
					status = purchaseExperienceStatusModule.PurchaseError,
					universeId = var15.universeId,
					profileUserId = var15.userId
				})
			end):catch(function(_) --[[ line: 131 ]]
				-- upvalues: var20 (copy), var17 (copy), eventNamesModule (copy), purchaseExperienceStatusModule (copy), var15 (copy)
				var20()
				var17.fireAnalyticsEvent(eventNamesModule.PurchaseExperienceAttempt, {
					status = purchaseExperienceStatusModule.NetworkError,
					universeId = var15.universeId,
					profileUserId = var15.userId
				})
			end)
		end, {
			var14,
			var18.productId,
			var18.price,
			var18.sellerId,
			var20
		}),
		screenSize = var16
	})
end