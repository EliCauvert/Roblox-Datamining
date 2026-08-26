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

return function()
	-- upvalues: useNavigation (ref), useDispatch (ref), useNavigationProps (ref), useScreenSize (ref), reactModule (ref), initializeSocialExperienceJoinAnalyticsModule (ref), useSelector (ref), RODUX_KEY (ref), eventNamesModule (ref), purchaseExperienceStatusModule (ref), purchaseProductByIdModule (ref), constantsModule (ref), promiseModule (ref), purchaseExperienceModalModule (ref)
	local var1 = useNavigation()
	local var2 = useDispatch()
	local var3 = useNavigationProps(function(p1, p2)
		return {
			universeId = p1,
			userId = p2.userId,
			openGameDetailsPeekView = p2.openGameDetailsPeekView,
			analyticProps = p2.analyticProps
		}
	end)
	local var4 = useScreenSize()
	local var5 = reactModule.useMemo(function()
		-- upvalues: initializeSocialExperienceJoinAnalyticsModule (copy), var3 (ref)
		return initializeSocialExperienceJoinAnalyticsModule(var3.analyticProps)
	end, { var3.analyticProps })
	local var6 = useSelector(function(p1)
		-- upvalues: RODUX_KEY (copy), var3 (ref)
		return p1[RODUX_KEY].Games.productInfoByGameId[var3.universeId]
	end)
	local var7 = useSelector(function(p1)
		-- upvalues: RODUX_KEY (copy), var3 (ref)
		return p1[RODUX_KEY].Games.byGameId[var3.universeId]
	end)
	
	local _ = function()
		-- upvalues: var5 (ref), eventNamesModule (copy), purchaseExperienceStatusModule (copy), var3 (ref)
		var5.fireAnalyticsEvent(eventNamesModule.PurchaseExperienceAttempt, {
			status = purchaseExperienceStatusModule.Success,
			universeId = var3.universeId,
			profileUserId = var3.userId
		})
	end
	
	local _ = function(_)
		-- upvalues: var5 (ref), eventNamesModule (copy), purchaseExperienceStatusModule (copy), var3 (ref)
		var5.fireAnalyticsEvent(eventNamesModule.PurchaseExperienceAttempt, {
			status = purchaseExperienceStatusModule.PurchaseError,
			universeId = var3.universeId,
			profileUserId = var3.userId
		})
	end
	
	local _ = function(_)
		-- upvalues: var5 (ref), eventNamesModule (copy), purchaseExperienceStatusModule (copy), var3 (ref)
		var5.fireAnalyticsEvent(eventNamesModule.PurchaseExperienceAttempt, {
			status = purchaseExperienceStatusModule.NetworkError,
			universeId = var3.universeId,
			profileUserId = var3.userId
		})
	end
	
	local var8 = reactModule.useCallback(function()
		-- upvalues: var1 (ref)
		var1.pop()
	end, { var1 })
	
	return reactModule.createElement(purchaseExperienceModalModule, {
		cancelPurchase = reactModule.useCallback(function()
			-- upvalues: var5 (ref), eventNamesModule (copy), var3 (ref), var8 (ref)
			var5.fireAnalyticsEvent(eventNamesModule.CancelPurchaseExperience, {
				universeId = var3.universeId,
				profileUserId = var3.userId
			})
			var8()
		end, { var8, var5, var3.universeId }),
		experienceName = var7.name,
		price = var6.price,
		purchaseExperience = reactModule.useCallback(function()
			-- upvalues: var5 (ref), eventNamesModule (copy), var3 (ref), var2 (ref), purchaseProductByIdModule (copy), var6 (ref), constantsModule (copy), promiseModule (copy), var8 (ref), purchaseExperienceStatusModule (copy)
			var5.fireAnalyticsEvent(eventNamesModule.PurchaseExperience, {
				universeId = var3.universeId,
				profileUserId = var3.userId
			})
			
			local _ = function()
				-- upvalues: var2 (copy), purchaseProductByIdModule (copy), var6 (copy), constantsModule (copy)
				return var2(purchaseProductByIdModule.API(var6.productId, {
					expectedCurrency = constantsModule.RobuxCurrency,
					expectedPrice = var6.price,
					expectedSellerId = var6.sellerId
				}))
			end
			
			var2(purchaseProductByIdModule.API(var6.productId, {
				expectedCurrency = constantsModule.RobuxCurrency,
				expectedPrice = var6.price,
				expectedSellerId = var6.sellerId
			})):andThen(function(p1)
				-- upvalues: promiseModule (copy)
				local responseBody = p1.responseBody
				
				return if type(responseBody) == "table" then responseBody else promiseModule.reject()
			end):andThen(function(p1)
				-- upvalues: var8 (copy), var5 (copy), eventNamesModule (copy), purchaseExperienceStatusModule (copy), var3 (copy)
				var8()
				
				if p1.purchased then
					var5.fireAnalyticsEvent(eventNamesModule.PurchaseExperienceAttempt, {
						status = purchaseExperienceStatusModule.Success,
						universeId = var3.universeId,
						profileUserId = var3.userId
					})
					
					return
				end
				var5.fireAnalyticsEvent(eventNamesModule.PurchaseExperienceAttempt, {
					status = purchaseExperienceStatusModule.PurchaseError,
					universeId = var3.universeId,
					profileUserId = var3.userId
				})
			end):catch(function(_)
				-- upvalues: var8 (copy), var5 (copy), eventNamesModule (copy), purchaseExperienceStatusModule (copy), var3 (copy)
				var8()
				var5.fireAnalyticsEvent(eventNamesModule.PurchaseExperienceAttempt, {
					status = purchaseExperienceStatusModule.NetworkError,
					universeId = var3.universeId,
					profileUserId = var3.userId
				})
			end)
		end, {
			var2,
			var6.productId,
			var6.price,
			var6.sellerId,
			var8
		}),
		screenSize = var4
	})
end