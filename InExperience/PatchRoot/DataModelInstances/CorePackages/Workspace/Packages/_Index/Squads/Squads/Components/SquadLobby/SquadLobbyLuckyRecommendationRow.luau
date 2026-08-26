local httpService = game:GetService("HttpService")
local squads = script:FindFirstAncestor("Squads")
local parent = squads.Parent
local dependenciesModule = require(squads.dependencies)
local react = dependenciesModule.React
local foundation = dependenciesModule.Foundation
local useEffectOnce = dependenciesModule.Hooks.useEffectOnce
local useLocalization = dependenciesModule.Hooks.useLocalization
local icon = foundation.Icon
local text = foundation.Text
local view = foundation.View
local iconSize = foundation.Enums.IconSize
local useTokens = foundation.Hooks.useTokens
local useLocalUserId = require(parent.RobloxAppHooks).useLocalUserId
local squadExternalContractContext = require(parent.SquadsCore.SquadExternalContractProvider).SquadExternalContractContext
local useCurrentSquadMembers = require(parent.SquadsCore.Hooks).useCurrentSquadMembers
local eventNamesModule = require(parent.SquadsCore.EventNames)
local squadLobbyLuckyRecommendationModalModule = require(script.Parent.SquadLobbyLuckyRecommendationModal)

return function(_)
	-- upvalues: useTokens (ref), react (ref), useLocalization (ref), useLocalUserId (ref), squadExternalContractContext (ref), useCurrentSquadMembers (ref), useEffectOnce (ref), eventNamesModule (ref), httpService (ref), view (ref), text (ref), icon (ref), iconSize (ref), squadLobbyLuckyRecommendationModalModule (ref)
	local var1 = useTokens()
	local var2, var3 = react.useState(false)
	local var4 = useLocalization({
		title = "Feature.Squads.Label.LuckyRecommendationRow",
		body = "Feature.Squads.Description.LuckyRecommendationRow"
	})
	local var5 = tonumber(useLocalUserId()) or 0
	local var6 = react.useContext(squadExternalContractContext)
	local var7 = useCurrentSquadMembers()
	local var8 = react.useRef(var7)
	var8.current = var7
	local var9 = react.useRef("")
	useEffectOnce(function()
		-- upvalues: var6 (ref), eventNamesModule (copy), var5 (ref)
		var6.fireSquadAnalytics(eventNamesModule.LuckyRecommendationRowImpression, { localUserId = var5, clientTimestamp = os.time() })
	end, true)
	
	return react.createElement(react.Fragment, nil, {
		Row = react.createElement(view, { tag = "size-full-0 auto-y padding-x-xlarge" }, {
			Card = react.createElement(view, {
				tag = "row align-y-center gap-medium size-full-0 auto-y stroke-standard stroke-position-inner stroke-default radius-medium bg-surface-0 gui-object-defaults",
				padding = {
					left = UDim.new(0, var1.Padding.XLarge),
					right = UDim.new(0, var1.Padding.Medium),
					top = UDim.new(0, var1.Padding.Large),
					bottom = UDim.new(0, var1.Padding.Large)
				},
				onActivated = react.useCallback(function()
					-- upvalues: httpService (copy), var9 (ref), var8 (ref), var6 (ref), eventNamesModule (copy), var5 (ref), var3 (ref)
					local var10 = httpService:GenerateGUID(false)
					var9.current = var10
					local current = var8.current
					var6.fireSquadAnalytics(eventNamesModule.LuckyRecommendationInvoked, {
						luckyRecommendationSessionId = var10,
						localUserId = var5,
						squadMemberCount = if current then #current else 0,
						clientTimestamp = os.time()
					})
					var3(true)
				end, { var5, var6 })
			}, {
				Content = react.createElement(view, { tag = "col fill gap-xsmall auto-y", LayoutOrder = 1 }, {
					Title = react.createElement(text, {
						tag = "size-full-0 auto-y text-title-medium text-no-wrap text-align-x-left text-truncate-end content-emphasis",
						LayoutOrder = 1,
						Text = var4.title
					}),
					Body = react.createElement(text, {
						tag = "size-full-0 auto-y text-body-medium text-no-wrap text-align-x-left text-truncate-end content-default",
						LayoutOrder = 2,
						Text = var4.body
					})
				}),
				Chevron = react.createElement(icon, {
					LayoutOrder = 2,
					name = "chevron-large-right",
					size = iconSize.Small
				})
			})
		}),
		Modal = if var2 then react.createElement(squadLobbyLuckyRecommendationModalModule, {
			onClose = react.useCallback(function()
				-- upvalues: var3 (ref)
				var3(false)
			end, {}),
			sessionId = var9.current
		}) else nil
	})
end